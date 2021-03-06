package com.i84.earnpoint.xljy.controller;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.hygsgl.service.GzInfoService;
import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.model.AcademicEducation;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.GzImportQyVo;
import com.i84.earnpoint.model.GzImportSyVo;
import com.i84.earnpoint.model.StudentAchievement;
import com.i84.earnpoint.model.StudentSignup;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.sjbb.model.SjExportVo;
import com.i84.earnpoint.xljy.service.XljyService;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 学历教育 修改
 * @author liu_quan
 *
 */
@Controller
@RequestMapping("/xljy")
public class XljyController extends ResultConstant {
	@Autowired 
	private XljyService xljyService;
	@Autowired 
	private YgInfoService ygInfoService;


	/**开设班级新增
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addKsbj")  
	public  @ResponseBody Map<String, Object> addKsbj(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String id=request.getParameter("id");

			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	

			if(StringUtils.isEmpty(uid)){
				return ResultConstant.resultMap(flag,"获取用户信息失败，请重新登录！");  

			}
			int c=0;
			if(StringUtils.isNotEmpty(id)){
				c=xljyService.editKsbj(ResultConstant.paramSetAdd(request));

			}else{
				c=xljyService.addKsbj(ResultConstant.paramSetAdd(request));
			}
			if(c>0){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**成绩下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/cjDownload")  
	@ResponseBody
	public void cjDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/xljygl/down", "cjdrmb.xlsx","成绩导入模板.xlsx");//成绩导入模板
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**成绩导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/cjUpload")  
	public  void cjUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=true;
		String dateFlag1="";
		String infoMsg="";//已存在身份证号+教育编号
		String cause="";
		List<StudentAchievement> slist=null;

		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";



			File newFile=ResultConstant.fileupload(request, response, "temp/xljygl/upload/",newFileName);
			//读取导入的文件
			ImportExcel<StudentAchievement> importExcel = new ImportExcel<StudentAchievement>(StudentAchievement.class);
			List<StudentAchievement> results = (List<StudentAchievement>) importExcel.importExcel(newFile,"0");
			if(results!=null&&results.size()>0){
				//数量不能超过1000条
				if(results.size()>1000){
					//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入的记录数最大不能超过1000条");
					ResultConstant.write(response, jsonObject);
					return;
				}
				//校验标题是否存在
				Map<String, String> lackMap=importExcel.isTitle(newFile); 
				if(lackMap!=null&&lackMap.size()>0){
					String title="";
					for(Map.Entry<String, String> m:lackMap.entrySet()){
						title+=" "+m.getValue();
					}
					//return ResultConstant.resultMap(false, "导入文件标题缺失："+title);

					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入文件标题缺失："+title);
					ResultConstant.write(response, jsonObject);
					return;
				}

				slist=new ArrayList<StudentAchievement>();
				int i=0;
				Map<String,String> map1=new HashMap<String,String>();
				for (StudentAchievement studentAchievement : results) {
					//System.out.println(ygImportVo.getZzjjdm() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
					i=i+1;
					//身份证、组织机构代码不能为空，
					StudentAchievement vo=studentAchievement;
					String sfz=ResultConstant.replaceTrim(studentAchievement.getPnum());
					String jybm=ResultConstant.replaceTrim(studentAchievement.getEducationNum());
					String isWant=ResultConstant.replaceTrim(studentAchievement.getIsWant());

					String cwts="";

					if(StringUtils.isEmpty(jybm)){
						cwts+=" 教育编号不能为空;";
					}
					if(StringUtils.isEmpty(isWant)){
						cwts+=" 是否录取不能为空;";
					}else{
						if(!isWant.equals("是")&&!isWant.equals("否")){
							cwts+=" 是否录取只能为“是”或者“否”;";
						}
					}
					
					
					if(StringUtils.isEmpty(sfz)){
						cwts+=" 身份证不能为空";

					}

					else{
						//校验身份证是否合法
						//boolean mark =ValidatorUtil.isIDCardValid(sfz); 
						if(sfz.length()!=15&&sfz.length()!=18){
							cwts+=" 身份证不合法;";
						}

						if(StringUtils.isEmpty(jybm)){
							cwts+=" 教育编号不能为空;";
						}

						//.保存时判断【身份证】+【教育编号】是否在报名列表中已存在；存在提示"【身份证】的记录已存在，是否覆盖保存？"选择是，则覆盖保存；
						StudentAchievement s=new StudentAchievement();
						s.setEducationNum(jybm);
						s.setPnum(sfz);
						if(xljyService.selectisExist(s)!=null){
							infoMsg+=sfz+";<br>";

						}
						//判断该学员是否对教育编码有报名过，未报名的学员不让导入成绩
						StudentSignup s1=new StudentSignup();
						s1.setEducationNum(jybm);
						s1.setPnum(sfz);
						if(xljyService.selectisExist(s1)==null){//JTYYHYRCGL-875
							// infoMsg+=sfz+";<br>";
							cwts+=" 【"+sfz+"】+【"+jybm+"】导入学员报名信息不存在，禁止导入;";
						}


						//							    UserInfo u=new UserInfo();
						//								u.setPnum(sfz);
						//								u=ygInfoService.selectYg(u);
						//								
						//								if(u==null){
						//									cwts+=" 该身份证对应的用户不存在;";
						//									
						//								}else{
						//									//用户id
						//									vo.setUid(u.getId()==null?null:u.getId());
						//								}

					}

					//【身份证】是否唯一
					if(vo.getCwts()==null){
						if(map1.get(sfz)!=null){
							cwts+=" 身份证【"+sfz+"】导入列表有多条;";  
						} 
						map1.put(sfz, sfz);
					}

					//
					try {
						if(Float.valueOf(vo.getYw())>0&&Float.valueOf(vo.getYw())<=100){
							//vo.setYw(Float.valueOf(vo.getYw1()));
						}else{
							//vo.setYw(Float.valueOf(vo.getYw1()));
							cwts+=" 语文成绩必须是大于0且小于100的值";
						}
					} catch (Exception e) {
						cwts+=" 语文成绩必须是大于0且小于100的值";
					}

					try {
						if(Float.valueOf(vo.getSx())>0&&Float.valueOf(vo.getSx())<=100){
							//vo.setSx(Float.valueOf(vo.getSx1()));
						}else{
							//vo.setSx(Float.valueOf(vo.getSx()));
							cwts+=" 数学成绩必须是大于0且小于100的值";
						}
					} catch (Exception e) {
						cwts+=" 数学成绩必须是大于0且小于100的值";
					}

					try {
						if(Float.valueOf(vo.getYy())>0&&Float.valueOf(vo.getYy())<=100){
							//vo.setYy(Float.valueOf(vo.getYy1()));
						}else{
							//vo.setYy(Float.valueOf(vo.getYy()));
							cwts+=" 英语成绩必须是大于0且小于100的值";
						}
					} catch (Exception e) {
						cwts+=" 英语成绩必须是大于0且小于100的值";
					}

					try {
						if(Float.valueOf(vo.getZz())>0&&Float.valueOf(vo.getZz())<=100){
							//vo.setZz(Float.valueOf(vo.getZz1()));
						}else{
							//vo.setZz(Float.valueOf(vo.getZz()));
							cwts+=" 政治成绩必须是大于0且小于100的值";
						}
					} catch (Exception e) {
						cwts+=" 政治成绩必须是大于0且小于100的值";
					}

					try {
						if(Float.valueOf(vo.getMf())>0&&Float.valueOf(vo.getMf())<=100){
							//vo.setMf(Float.valueOf(vo.getMf1()));
						}else{
							//vo.setMf(Float.valueOf(vo.getMf()));
							cwts+=" 民法成绩必须是大于0且小于100的值";
						}
					} catch (Exception e) {
						cwts+=" 民法成绩必须是大于0且小于100的值";
					}


					//						if(!ResultConstant.isValidDate(vo.getBirthday1()+"-01")){
					//							cwts+=" 出生年月格式有误，只能为yyyy-MM";
					//							
					//						}
					//						if(!ResultConstant.isValidDate(vo.getGraduationDate1())){
					//							cwts+=" 毕业时间格式有误，只能为yyyy-MM-dd";
					//							
					//						}


					vo.setId(i);
					vo.setCwts(cwts);
					if(StringUtils.isNotBlank(cwts)){
						dateFlag1="true";
					}
					slist.add(vo);
				}

			}





		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}

		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", slist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag1);//错误标识
		jsonObject.put("infoMsg", infoMsg);
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);

	}




	/**学员下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/xyDownload")  
	@ResponseBody
	public void xyDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/xljygl/down", "xydrmb.xlsx","学员报名导入模板.xlsx");//学员导入模板
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**学员导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/xyUpload")  
	public  void xyUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  

		boolean flag=true;
		String dateFlag1="";
		String infoMsg="";//已存在身份证号+教育编号
		String cause="";
		List<StudentSignup> slist=null;

		try {
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";			
			File newFile=ResultConstant.fileupload(request, response, "temp/xljygl/upload/",newFileName);
			//读取导入的文件
			ImportExcel<StudentSignup> importExcel = new ImportExcel<StudentSignup>(StudentSignup.class);
			List<StudentSignup> results = (List<StudentSignup>) importExcel.importExcel(newFile,"0");
			if(results!=null&&results.size()>0){
				//数量不能超过1000条
				if(results.size()>1000){
					//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入的记录数最大不能超过1000条");
					ResultConstant.write(response, jsonObject);
					return;
				}
				//校验标题是否存在
				Map<String, String> lackMap=importExcel.isTitle(newFile); 
				if(lackMap!=null&&lackMap.size()>0){
					String title="";
					for(Map.Entry<String, String> m:lackMap.entrySet()){
						title+=" "+m.getValue();
					}
					//return ResultConstant.resultMap(false, "导入文件标题缺失："+title);

					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入文件标题缺失："+title);
					ResultConstant.write(response, jsonObject);
					return;
				}

				slist=new ArrayList<StudentSignup>();
				int i=0;
				Map<String,String> map1=new HashMap<String,String>();
				for (StudentSignup studentSignup : results) {
					//System.out.println(ygImportVo.getZzjjdm() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
					i=i+1;
					//身份证、组织机构代码不能为空，
					StudentSignup vo=studentSignup;
					String sfz=ResultConstant.replaceTrim(studentSignup.getPnum());
					String jybm=ResultConstant.replaceTrim(studentSignup.getEducationNum());


					String cwts="";
					if(StringUtils.isEmpty(jybm)){
						cwts+=" 教育编号不能为空;";
					}
					if(StringUtils.isEmpty(sfz)){
						cwts+=" 身份证不能为空";

					}else{
						//校验身份证是否合法
						//boolean mark =ValidatorUtil.isIDCardValid(sfz); 
						if(sfz.length()!=15&&sfz.length()!=18){
							cwts+=" 身份证不合法;";
						}

						if(StringUtils.isEmpty(jybm)){
							cwts+=" 教育编号不能为空;";
						}

						//.保存时判断【身份证】+【教育编号】是否在报名列表中已存在；存在提示"【身份证】的记录已存在，是否覆盖保存？"选择是，则覆盖保存；


						StudentSignup s=new StudentSignup();
						s.setEducationNum(jybm);
						s.setPnum(sfz);
						if(xljyService.selectisExist(s)!=null){
							// infoMsg+=sfz+";<br>";
							cwts+=" 【"+sfz+"】+【"+jybm+"】已经存在系统中;";
						}
						Map<String,Object> m=new HashMap<String, Object>();
						m.put("educationNum1", jybm);
						List<AcademicEducation> list= xljyService.selectAcademicList1(m);
						if(list==null||list.size()<=0){
							cwts+=" 教育编号【"+jybm+"】不存在或已经失效;";
						}
						else{
							AcademicEducation a=list.get(0);
							if(a.getIsNoShow().equals("true"))
								cwts+=" 教育编号【"+jybm+"】已经失效;";

						}


						//							    UserInfo u=new UserInfo();
						//								u.setPnum(sfz);
						//								u=ygInfoService.selectYg(u);
						//								
						//								if(u==null){
						//									cwts+=" 该身份证对应的用户不存在;";
						//									
						//								}else{
						//									//用户id
						//									vo.setUid(u.getId()==null?null:u.getId());
						//								}



					}

					//【身份证】是否唯一
					if(vo.getCwts()==null){
						if(map1.get(sfz)!=null){
							cwts+=" 身份证【"+sfz+"】导入列表有多条;";  

						} 
						map1.put(sfz, sfz);
					}

					if(StringUtils.isNotBlank(vo.getBirthday1())){
						if(!ResultConstant.isValidDate(vo.getBirthday1()+"-01")){
							cwts+=" 出生年月格式有误，只能为yyyy-MM";

						}
					}
					if(StringUtils.isNotBlank(vo.getGraduationDate1())){
						if(!ResultConstant.isValidDate(vo.getGraduationDate1())){
							cwts+=" 毕业时间格式有误，只能为yyyy-MM-dd";

						}
					}
					if(StringUtils.isNotBlank(vo.getWorkTime())){
						if(!ResultConstant.isValidDate(vo.getWorkTime())){
							cwts+=" 工作时间格式有误，只能为yyyy-MM-dd";

						}
					}

					if(StringUtils.isNotEmpty(vo.getXyzsNum())){
						if(!vo.getXyzsNum().equals("有")&&!vo.getXyzsNum().equals("无")){
							cwts+=" 现有岗位或职业资格证必须为'有'或者'无'";
						}
					}
					vo.setId(i);
					vo.setCwts(cwts);
					vo.setUid(uid==null?null:Integer.valueOf(uid));
					if(StringUtils.isNotBlank(cwts)){
						dateFlag1="true";
					}
					slist.add(vo);
				}

			}





		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}

		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", slist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag1);//错误标识
		jsonObject.put("infoMsg", infoMsg);
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);

	}

	/**添加学员
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addXyList")  
	public  @ResponseBody Map<String, Object> addXyList(@RequestBody List<StudentSignup> ygList){
		boolean flag=false;
		String cause="";
		try {

			xljyService.insertXyList(ygList);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}

	/**学员报名修改
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/editXy")  
	public  @ResponseBody Map<String, Object> editXy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();
			m.put("uid", uid);
			int c=xljyService.updateXy(m);
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**修改学历教育
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/editXljy")  
	public  @ResponseBody Map<String, Object> editXljy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String status=request.getParameter("status");
			String  id=request.getParameter("id");
			AcademicEducation a=new AcademicEducation();
			if(status.equals("2")){
				a.setStatus("有效");
			}
			else{
				a.setStatus("失效");
			}
			a.setId(Integer.valueOf(id));
			xljyService.updateAcademicEducation(a);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/** 学历列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/xljyView")  
	public  @ResponseBody Map<String, Object> xljyView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<AcademicEducation> list=null;
		try {

			list=xljyService.selectAcademicList(ResultConstant.paramSet(request));
			PageInfo<AcademicEducation> pageinfo=new PageInfo<AcademicEducation>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}

	/** 学员报名列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/xybmView")  
	public  @ResponseBody Map<String, Object> xybmView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String, Object>> list=null;
		try {
			list=xljyService.selectStudentList(ResultConstant.paramSet(request));
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}


	/**删除学员报名
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delXybm")  
	public  @ResponseBody Map<String, Object> delXybm(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String  id=request.getParameter("id");
			StudentSignup a=new StudentSignup();
			a.setDelDate(new Date());
			a.setId(Integer.valueOf(id));
			xljyService.updateStudentSignup(a);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**删除学员报名
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delXljy")  
	public  @ResponseBody Map<String, Object> delXljy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String  id=request.getParameter("id");
			String educationNum=request.getParameter("educationNum");
			AcademicEducation a=new AcademicEducation();
			a.setDelDate(new Date());
			a.setId(Integer.valueOf(id));
			//a.setEducationNum(educationNum);
			StudentSignup s=new StudentSignup();
			s.setEducationNum(educationNum);
			StudentSignup sp=xljyService.selectisExist(s);
			if(sp!=null){
				flag=false;
				cause="该教育编码已有人报名,不能删除";
				return ResultConstant.resultMap(flag,cause);  
			}
			xljyService.updateAcademicEducation(a);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}




	/**打印状态修改
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/xydyStatus")  
	public  @ResponseBody Map<String, Object> xydyStatus(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String  id=request.getParameter("id");
			xljyService.updateStudentSignup(id);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}



	/** 学员查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/xybmMsg")  
	public  @ResponseBody Map<String, Object> xybmMsg(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";

		try {
			String id=request.getParameter("id");
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("id", id);
			Map<String, Object> m=xljyService.selectStudentbyId(map);
			ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,m, "addDate");
			ResultConstant.mapToDate(DateUtil.YYYY$MM$,m, "birthDate");
			ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "graduationTime");
			ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "workTime");
			m.put("updateDate", new Date());//修改时间
			ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,m, "updateDate");

			return ResultConstant.resultMap(m,true,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(flag,cause);

	}


	/** 课程查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/kcMsg")  
	public  @ResponseBody Map<String, Object> kcMsg(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";

		try {
			String id=request.getParameter("id");
			AcademicEducation academicEducation=xljyService.selectAcademicEducationById(Integer.valueOf(id));
			return ResultConstant.resultMap(academicEducation,true,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(flag,cause);

	}

	/**添加成绩
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addCjList")  
	public  @ResponseBody Map<String, Object> addCjList(HttpServletResponse response,HttpServletRequest request,@RequestBody List<StudentAchievement> cjList){
		boolean flag=false;
		String cause="";
		try {
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			xljyService.insertCjList(cjList,uid);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}


	/**导出excel
	 * @param response
	 * @param request
	 */
	@RequestMapping("/xyExport")  
	@ResponseBody
	public void xyExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			xljyService.xyExport(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**报表导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/bbExport")  
	public  void bbExport(HttpServletResponse response,HttpServletRequest request){  


		try {
			String id=request.getParameter("id");//
			Configuration configuration= new Configuration();  
			configuration.setDefaultEncoding("UTF-8"); 
			//生成的临时文件保存目录
			String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/xljygl/upload/";
			File tmpFile = new File(tempPath);
			if (!tmpFile.exists()) {//不存在则创建
				//创建目录
				tmpFile.mkdir();

			}

			configuration.setDirectoryForTemplateLoading(new File(ResultConstant.getWEB_ROOTPath() +"temp/xljygl/down/" ));  //FTL文件模板所在的位置  
			Template t = configuration.getTemplate("xybm.ftl"); //学员报名模板   文件名  
			String fileName=ResultConstant.getRandNum(32)+".doc";
			File outFile = new File(tempPath+fileName);  
			Writer out = null;
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8")); 
			Map<String,Object> dataMap=new HashMap<String,Object>();  
			if(StringUtils.isNotEmpty(id)){
				dataMap=getData(id);
			}
			t.process(dataMap, out);  
			//关闭流
			out.flush();
			out.close();
			//文件下载
			ResultConstant.fileDownload(request, response, "temp/xljygl/upload/", fileName,"福建省成人高等学校招生考试报名表.doc");
			//删除零时文件
			outFile.delete();

		} catch (Exception e) {
			e.printStackTrace();

		}


	}

	/**报表打印
	 * @param response
	 * @param request
	 */
	@RequestMapping("/bbPrinter")  
	public  ModelAndView bbPrinter(HttpServletResponse response,HttpServletRequest request){  
		ModelAndView mav=new ModelAndView("xljygl/xydyView");
		try {
			String id=request.getParameter("id");
			if(StringUtils.isNotEmpty(id)){
				List<Map<String,Object>> dataMap=new ArrayList<Map<String,Object>>(); 
				dataMap=getData2(id);
				mav = new ModelAndView("xljygl/xydyView")
				.addObject("bmList", dataMap);
				return mav;
			}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return mav;


		/*try {
			String id=request.getParameter("id");//
			Configuration configuration= new Configuration();  
			configuration.setDefaultEncoding("UTF-8"); 
			//生成的临时文件保存目录
			String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/xljygl/upload/";
			File tmpFile = new File(tempPath);
			if (!tmpFile.exists()) {//不存在则创建
				//创建目录
				tmpFile.mkdir();
			}
			configuration.setDirectoryForTemplateLoading(new File(ResultConstant.getWEB_ROOTPath() +"temp/xljygl/down/" ));  //FTL文件模板所在的位置  
			Template t = configuration.getTemplate("xybm.ftl"); //学员报名模板   文件名  
			String fileName=ResultConstant.getRandNum(32)+".doc";
			File outFile = new File(tempPath+fileName);  
			Writer out = null;
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8")); 
			Map<String,Object> dataMap=new HashMap<String,Object>();  
			if(StringUtils.isNotEmpty(id)){
				dataMap=getData(id);
			}
			t.process(dataMap, out);  
			//关闭流
			out.flush();
			out.close();
			ResultConstant.printer(tempPath+fileName);

			//修改打印为“是”
			xljyService.updateStudentSignup(id);

			//删除零时文件
			outFile.delete();

		} catch (Exception e) {
			e.printStackTrace();

		}*/


	}



	private Map<String, Object> getData(String studentId) {
		Map<String, Object> pramMap=new HashMap<String, Object>();
		Map<String, Object> m2=new HashMap<String, Object>();
		List<Map<String,Object>> bmlist=new ArrayList<Map<String,Object>>();
		try {
			String[] s=studentId.split(",");
			for(int i=0;i<s.length;i++){
				pramMap.put("id", s[i].toString());
				Map<String, Object> m=xljyService.selectStudentbyId(pramMap);
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,m, "addDate");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "workTime");
				ResultConstant.mapToDate(DateUtil.YYYY$MM$,m, "birthDate");
				for (Map.Entry<String, Object> entry : m.entrySet()) {  
					System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
					if(entry.getValue()==null){
						m.put(entry.getKey(), "");
					}
				}  
				bmlist.add(m);
			}
			m2.put("bmList", bmlist);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return m2;

	}

	private List<Map<String, Object>> getData2(String studentId) {
		Map<String, Object> pramMap=new HashMap<String, Object>();
		Map<String, Object> m2=new HashMap<String, Object>();
		List<Map<String,Object>> bmlist=new ArrayList<Map<String,Object>>();
		try {
			String[] s=studentId.split(",");
			for(int i=0;i<s.length;i++){
				pramMap.put("id", s[i].toString());
				Map<String, Object> m=xljyService.selectStudentbyId(pramMap);
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,m, "addDate");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "workTime");
				ResultConstant.mapToDate(DateUtil.YYYY$MM$,m, "birthDate");
				for (Map.Entry<String, Object> entry : m.entrySet()) {  
					System.out.println("Key = " + entry.getKey() + ", Value = " + entry.getValue());  
					if(entry.getValue()==null){
						m.put(entry.getKey(), "");
					}
				}  
				bmlist.add(m);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return bmlist;

	}


	@RequestMapping("/getDataItemValueByName")  
	public   @ResponseBody List<Map<String,Object>> getDataItemValueByName(HttpServletResponse response,HttpServletRequest request){
		List<Map<String,Object>> list=null;
		try {

			String attName=request.getParameter("attName");
			list=ResultConstant.getDataItemValueByName(attName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;


	}

	//统计报表
	@RequestMapping("/tjbb")
	public  @ResponseBody Map<String,Object> pqtj(HttpServletResponse response,HttpServletRequest request) throws Exception{	
		List<Map<String, Object>> list = getDBData(request);  
		return this.resultMap(list,true,"");
	}
	private String tempxlsname = null;

	//获取服务器数据
	private List<Map<String, Object>> getDBData(HttpServletRequest request) throws Exception
	{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		Map<String, Object> params = this.set_params(request);
		//哪个页面
		String page_type = TextUtil.getString(request.getParameter("page_type")) ; 
		params.put("type", page_type);

		if(page_type.equals("bkzrs")){
			tempxlsname = "templates/zzt_tj.xls";
			list = xljyService.selectListByBkzrs(params);
			if(list!=null&&list.size()>0){
				for(int i=0;i<list.size();i++){
					Map m=list.get(i);
					ResultConstant.mapToDate(DateUtil.YYYY,m, "name");

				}

			}
		}
		else if(page_type.equals("bklrr")){
			tempxlsname = "templates/bzt_tj.xls";
			list = xljyService.selectListByBklrr(params);

		}
		else{
			//报考层次、学习形式、报考院校
			tempxlsname = "templates/bzt_tj.xls";
			list = xljyService.selectListByBkcc(params);
		}
		return list;
	}
	//设置参数
	private Map<String, Object> set_params(HttpServletRequest request)
	{
		Map<String, Object> params = new HashMap<String, Object>();	

		String time_type = TextUtil.getString(request.getParameter("time_type")) ; //按年统计还按月统计

		String file_type = TextUtil.getString(request.getParameter("file_type")) ; //档案状态
		String t_start_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_start")),"yyyy-MM-dd HH:mm")); //起始时间

		String t_end_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_end")),"yyyy-MM-dd HH:mm")); //结束时间

		String page_type = TextUtil.getString(request.getParameter("page_type")) ; 

		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));

		params.put("page", page);
		params.put("rows", rows);

		params.put("page_type", page_type);

		params.put("time_type", time_type);
		params.put("file_type", file_type);
		params.put("t_start", t_start_str);
		params.put("t_end", t_end_str);

		return params;
	}



	/**统计导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/tjExport")  
	@ResponseBody
	public void gzExport(HttpServletResponse response,HttpServletRequest request){  
		try {

			String fileName = "统计导出.xls";

			OutputStream output = ResultConstant.outputStream(request, response, fileName);

			List<Map<String, Object>> list = getDBData(request);
			if(tempxlsname != null)
			{	
				List<SjExportVo> listVo = new ArrayList<SjExportVo>();

				for(int i = 0; i < list.size(); i++)
				{
					Map<String, Object> _map = list.get(i);
					SjExportVo vo = new SjExportVo();

					String name_str = "";
					String _month = "";
					if  (_map.get("month")!=null)
					{
						_month =  "-" + _map.get("month");
					}						
					name_str = _map.get("name") + _month;

					int num  = 0;
					if  (_map.get("num")!=null)
					{
						num =  Integer.parseInt(_map.get("num").toString()) ;
					}

					vo.setIndex((i+1)+"");
					vo.setName(name_str);
					vo.setNum(num);
					listVo.add(vo);
				}

				String tempPath = request.getSession().getServletContext().getRealPath(tempxlsname);

				ExcelExport<SjExportVo> ex = new ExcelExport<SjExportVo>();

				ex.exportExcelByTemp(tempPath, listVo,output);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
