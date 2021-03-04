package com.i84.earnpoint.hygsgl.controller;



import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.management.modelmbean.RequiredModelMBean;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.hygsgl.service.GzInfoService;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.GzImportQyVo;
import com.i84.earnpoint.model.GzImportSyVo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.service.EnterpriseInfoService;



/**
 * 工资管理
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/gzgl")
public class GzInfoController {
	@Autowired 
	private GzInfoService gzInfoService;
    @Autowired
    private EnterpriseInfoService enterpriseInfoService;
	/**工资新增（事业）
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addGzSy")  
	public  @ResponseBody Map<String, Object> addGzSy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//根据输入的身份证查询用户id
			String pnum=m.get("sfz")==null?null:m.get("sfz").toString();
			if(StringUtils.isNotBlank(pnum)){
				UserInfo u=new UserInfo();
				u.setPnum(pnum);
				u=gzInfoService.selectYg(u);
				
				if(u==null){
					return ResultConstant.resultMap(false,"身份证不存在，请重新选择");
				}else{
					m.put("uid", u.getId());
					 //校验用户对应的工资发放时间是否存在
					String gzffsj=m.get("salaryDate")==null?null:m.get("salaryDate").toString();
					Integer c=gzInfoService.isSyGz(gzffsj,u.getId().toString());
					if(c>0){
						return ResultConstant.resultMap(false,"该身份证用户对应的工资发放时间记录已经存在，请重新选择工资发放时间");
						
					}
				}
				
			}

			int c=gzInfoService.addGzSy(m);
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	
	/**工资新增（企业）
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addGzQy")  
	public  @ResponseBody Map<String, Object> addGzQy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//根据输入的身份证查询用户id
			String pnum=m.get("sfz")==null?null:m.get("sfz").toString();
			if(StringUtils.isNotBlank(pnum)){
				UserInfo u=new UserInfo();
				u.setPnum(pnum);
				u=gzInfoService.selectYg(u);
				
				if(u==null){
					return ResultConstant.resultMap(false,"身份证不存在，请重新选择");
				}else{
					m.put("uid", u.getId());
					 //校验用户对应的工资发放时间是否存在
					String gzffsj=m.get("salaryDate")==null?null:m.get("salaryDate").toString();
					Integer c=gzInfoService.isQyGz(gzffsj,u.getId().toString());
					if(c>0){
						return ResultConstant.resultMap(false,"该身份证用户对应的工资发放时间记录已经存在，请重新选择工资发放时间");
						
					}
				}
				
			}
			int c=gzInfoService.addGzQy(ResultConstant.paramSetAdd(request));
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**企业工资修改
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addQyGzEdit")  
	public  @ResponseBody Map<String, Object> addQyGzEdit(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//根据输入的身份证查询用户id
			String pnum=m.get("sfz")==null?null:m.get("sfz").toString();
			if(StringUtils.isNotBlank(pnum)){
				UserInfo u=new UserInfo();
				u.setPnum(pnum);
				u=gzInfoService.selectYg(u);
				
				if(u==null){
					return ResultConstant.resultMap(false,"身份证不存在，请重新选择");
				}else{
					m.put("uid", u.getId());
				}
				
			}
			int c=gzInfoService.updateBmoneyBySelective(ResultConstant.paramSetAdd(request));
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**事业工资修改
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addQySzEdit")  
	public  @ResponseBody Map<String, Object> addQySzEdit(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//根据输入的身份证查询用户id
			String pnum=m.get("sfz")==null?null:m.get("sfz").toString();
			if(StringUtils.isNotBlank(pnum)){
				UserInfo u=new UserInfo();
				u.setPnum(pnum);
				u=gzInfoService.selectYg(u);
				
				if(u==null){
					return ResultConstant.resultMap(false,"身份证不存在，请重新选择");
				}else{
					m.put("uid", u.getId());
				}
				
			}
			int c=gzInfoService.updateMoneyBySelective(ResultConstant.paramSetAdd(request));
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**删除工资
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delGzFuc")  
	public  @ResponseBody Map<String, Object> delGzFuc(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			
			String id=request.getParameter("id");
			String gzlxId=request.getParameter("gzlxId");
			int c=0;
			Map<String,Object>m=new HashMap<String, Object>();
			m.put("id", id);
			m.put("delDate", new Date());
			if(gzlxId.equals("1")){
			 c=gzInfoService.updateBmoneyBySelective(m);
			}else{
			 c=gzInfoService.updateMoneyBySelective(m);
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
	
	
	@RequestMapping("/queryGz")  
	public  @ResponseBody Map<String, Object> queryGz(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";
		Map<String,Object>gz=null;
		try {
			String id=request.getParameter("id");//工资表记录id
			String gzlxId=request.getParameter("gzlxId");//gzlxId 1:企业 2：事业
			String pnum=request.getParameter("pnum");//身份证
			String isGzzk=request.getParameter("isGzzk");//是否根据身份证管理工资状态信息
			gz=new HashMap<String, Object>();
			gz.put("id", id);
			gz.put("gzlxId", gzlxId);
			gz.put("pnum", pnum);
			gz.put("isGzzk", isGzzk);
			Map<String,Object> m=gzInfoService.selectQyOrSy(gz);
			ResultConstant.mapToDate(m, "salaryDate");
			return ResultConstant.resultMap(m,true,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常"; 
		}
		return ResultConstant.resultMap(gz,flag,cause);

	}
	
	/** 工资列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/gzView")  
	public  @ResponseBody Map<String, Object> gzView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> gzList=null;
		try {
			
			gzList=gzInfoService.selectGzglList(ResultConstant.paramSet(request));
			if(gzList!=null && gzList.size()>0){
				for(int i=0;i<gzList.size();i++){
				Map<String, Object> m=gzList.get(i);	
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "gzffsj");
			  }
			}
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(gzList);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(gzList,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常"; 
		}
		return ResultConstant.resultMap(gzList,total,flag, dateFlag,cause);

	}

	
	/**工资导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/gzExport")  
	@ResponseBody
	public void gzExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			gzInfoService.gzExport(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**工资模板下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/gzDownload")  
	@ResponseBody
	public void gzDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			String type=request.getParameter("type");
			String name="";
			String pname="";
			if(type.equals("0")){
//				name="事业工资导入模板.xlsx";
//				pname="gzdrmb.xlsx";
				name="事业工资导入模板.xls";
				pname="gzdrmb.xls";
			}else{
//				name="企业工资导入模板.xlsx";
//				pname="gzdrmb1.xlsx";
				name="企业工资导入模板.xls";
				pname="gzdrmb1.xls";
			}
			ResultConstant.fileDownload(request, response, "temp/hygsgl/down", pname,name);//员工导入模板

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**工资导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/gzUpload")  
	public  void gzUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		String type=request.getParameter("type");
		boolean flag=true;
		String dateFlag1="";
		String dateFlag2="";
		String cause="";
		List<GzImportSyVo> sylist=null;
		List<GzImportQyVo> qylist=null;
		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
		
		
				if(type.equals("0")){
				File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
				//读取导入的文件
				ImportExcel<GzImportSyVo> importExcel = new ImportExcel<GzImportSyVo>(GzImportSyVo.class);
				List<GzImportSyVo> results = (List<GzImportSyVo>) importExcel.importExcel(newFile,"0");
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

					sylist=new ArrayList<GzImportSyVo>();
					int i=0;
					for (GzImportSyVo gzImportSyVo : results) {
						//System.out.println(ygImportVo.getZzjjdm() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
						i=i+1;
						//身份证、组织机构代码不能为空，
						GzImportSyVo vo=gzImportSyVo;
						String sfz=ResultConstant.replaceTrim(gzImportSyVo.getSfz());
						String zzjgbm=ResultConstant.replaceTrim(gzImportSyVo.getZzjgbm());
						String gzffsj=ResultConstant.replaceTrim(gzImportSyVo.getGzffsj());

						String gzxd=ResultConstant.replaceTrim(gzImportSyVo.getGzxd());
						String gwjt=ResultConstant.replaceTrim(gzImportSyVo.getGwjt());
						String shbt=ResultConstant.replaceTrim(gzImportSyVo.getShbt());
						String jcjx=ResultConstant.replaceTrim(gzImportSyVo.getJcjx());
						String gcjx=ResultConstant.replaceTrim(gzImportSyVo.getGcjx());
						String blgz=ResultConstant.replaceTrim(gzImportSyVo.getBlgz());
						String qtgz=ResultConstant.replaceTrim(gzImportSyVo.getQtgz());
						String tzbt=ResultConstant.replaceTrim(gzImportSyVo.getTzbt());
						String qt=ResultConstant.replaceTrim(gzImportSyVo.getQt());
						String gzze=ResultConstant.replaceTrim(gzImportSyVo.getGzze());
						
						String cwts="";
						if(StringUtils.isEmpty(sfz)){
							cwts+=" 身份证不能为空";
							
						}else{
							//校验身份证是否合法
							   //boolean mark =ValidatorUtil.isIDCardValid(sfz); 
							   if(sfz.length()!=15&&sfz.length()!=18){
								   cwts+=" 身份证不合法;";
							   }
							   
							    UserInfo u=new UserInfo();
								u.setPnum(sfz);
								u=gzInfoService.selectYg(u);
								
								if(u==null){
									cwts+=" 该身份证对应的用户不存在;";
									
								}else{
									//用户id
									vo.setUid(u.getId()==null?null:u.getId().toString());
								}
								
								//校验组织机构是否存在
								EnterpriseInfo enterpriseInfo=new EnterpriseInfo ();
								enterpriseInfo.setcCode(zzjgbm);
								enterpriseInfo=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
								if(enterpriseInfo==null){
									cwts+=" 该组织机构编码对应的企业不存在;";
									
								}
								vo.setQyId(enterpriseInfo.getId()==null?null:enterpriseInfo.getId().toString());
							  
							    
						}
						
						if(!ResultConstant.isValidDate(gzffsj)){
							cwts+=" 工资发放时间格式有误，只能为yyyy-MM-dd";
							
						}else{
							  //校验用户对应的工资发放时间是否存在
							if(vo.getUid()!=null){
							Integer c=gzInfoService.isSyGz(gzffsj,vo.getUid());
							if(c>0){
								cwts+=" 该身份证用户对应的工资发放时间记录已经存在;";
								
							}
						}	
							
						}
						if(!ResultConstant.isNumberOrNull(gzxd)){
							cwts+=" 工资薪档只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(gwjt)){
							cwts+=" 岗位津贴只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(shbt)){
							cwts+=" 生活补贴只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(jcjx)){
							cwts+=" 基础绩效只能为数值或者为空";
						}
						
						if(!ResultConstant.isNumberOrNull(gcjx)){
							cwts+=" 高出绩效只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(blgz)){
							cwts+=" 保留工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(qtgz)){
							cwts+=" 其它工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(tzbt)){
							cwts+=" 提租补贴只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(qt)){
							cwts+=" 其它只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(gzze)){
							cwts+=" 工资总额只能为数值或者为空";
						}

						vo.setId(i+"");
						vo.setCwts(cwts);
						if(StringUtils.isNotBlank(cwts)){
							dateFlag1="true";
						}
						sylist.add(vo);
					}
					
				}
				}else{
					File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
				//读取导入的文件
				ImportExcel<GzImportQyVo> importExcel2 = new ImportExcel<GzImportQyVo>(GzImportQyVo.class);
				List<GzImportQyVo> results2 = (List<GzImportQyVo>) importExcel2.importExcel(newFile,"0");
				if(results2!=null&&results2.size()>0){
					//数量不能超过1000条
					if(results2.size()>1000){
						//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "导入的记录数最大不能超过1000条");
						ResultConstant.write(response, jsonObject);
						return;
					}
					//校验标题是否存在
					Map<String, String> lackMap=importExcel2.isTitle(newFile); 
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

					qylist=new ArrayList<GzImportQyVo>();
					int i=0;
					for (GzImportQyVo gzImportQyVo : results2) {
						//System.out.println(ygImportVo.getZzjjdm() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
						i=i+1;
						//身份证、不能为空，
						GzImportQyVo vo=gzImportQyVo;
						String sfz=ResultConstant.replaceTrim(gzImportQyVo.getSfz());
						String zzjgbm=ResultConstant.replaceTrim(gzImportQyVo.getZzjgbm());
						String gzffsj=ResultConstant.replaceTrim(gzImportQyVo.getGzffsj());
//						String qymc=ResultConstant.replaceTrim(gzImportQyVo.getQymc());
//						String qyxz=ResultConstant.replaceTrim(gzImportQyVo.getQyxz());
//						String xm=ResultConstant.replaceTrim(gzImportQyVo.getXm());
//						String xb=ResultConstant.replaceTrim(gzImportQyVo.getXb());
						
						
						
						String qt=ResultConstant.replaceTrim(gzImportQyVo.getQt());
						String gzze=ResultConstant.replaceTrim(gzImportQyVo.getGzze());
						String jbgz=ResultConstant.replaceTrim(gzImportQyVo.getJbgz());
						String glgz=ResultConstant.replaceTrim(gzImportQyVo.getGlgz());
						String jtbt=ResultConstant.replaceTrim(gzImportQyVo.getJtbt());
						String yjj=ResultConstant.replaceTrim(gzImportQyVo.getYjj());
						String jbgz2=ResultConstant.replaceTrim(gzImportQyVo.getJbgz2());
						String jxgz=ResultConstant.replaceTrim(gzImportQyVo.getJxgz());
						String qtgz1=ResultConstant.replaceTrim(gzImportQyVo.getQtgz1());
						String qtgz2=ResultConstant.replaceTrim(gzImportQyVo.getQtgz2());
						
						String cwts="";
						if(StringUtils.isEmpty(sfz)){
							cwts+=" 身份证不能为空";
							
						}else{
							//校验身份证是否合法
							   //boolean mark =ValidatorUtil.isIDCardValid(sfz); 
							   if(sfz.length()!=15&&sfz.length()!=18){
								   cwts+=" 身份证不合法;";
							   } 
							   UserInfo u=new UserInfo();
								u.setPnum(sfz);
								u=gzInfoService.selectYg(u);
								
								if(u==null){
									cwts+=" 该身份证对应的用户不存在;";
									
								}else{
									//用户id
									vo.setUid(u.getId()==null?null:u.getId().toString());
								}
								
								//校验组织机构是否存在
								EnterpriseInfo enterpriseInfo=new EnterpriseInfo ();
								enterpriseInfo.setcCode(zzjgbm);
								enterpriseInfo=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
								if(enterpriseInfo==null){
									cwts+=" 该组织机构编码对应的企业不存在;";
									
								}
								vo.setQyId(enterpriseInfo.getId()==null?null:enterpriseInfo.getId().toString());
								
								
							  
						}
						
						if(!ResultConstant.isValidDate(gzffsj)){
							cwts+=" 工资发放时间格式有误，只能为yyyy-MM-dd";
							
						}else{
							  //校验用户对应的工资发放时间是否存在
							if(vo.getUid()!=null){
							Integer c=gzInfoService.isQyGz(gzffsj,vo.getUid());
							if(c>0){
								cwts+=" 该身份证用户对应的工资发放时间记录已经存在;";
								
							}
							}	
							
						}
						
						
						if(!ResultConstant.isNumberOrNull(qt)){
							cwts+=" 其它只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(gzze)){
							cwts+=" 工资总额只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(jbgz)){
							cwts+=" 基本工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(glgz)){
							cwts+=" 工龄工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(jtbt)){
							cwts+=" 津贴补贴只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(yjj)){
							cwts+=" 月奖金只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(jbgz2)){
							cwts+=" 加班工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(jxgz)){
							cwts+=" 绩效工资只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(qtgz1)){
							cwts+=" 其它工资1只能为数值或者为空";
						}
						if(!ResultConstant.isNumberOrNull(qtgz2)){
							cwts+=" 其它工资2只能为数值或者为空";
						}
						

						vo.setId(i+"");
						vo.setCwts(cwts);
						if(StringUtils.isNotBlank(cwts)){
							dateFlag2="true";
						}
						qylist.add(vo);
					}
					
				}
				
				
				
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}

		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows1", sylist);
		jsonObject.put("rows2", qylist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag1", dateFlag1);//错误标识
		jsonObject.put("dateFlag2", dateFlag2);//错误标识
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);

	}
	/**添加工资
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addGzList")  
	public  @ResponseBody Map<String, Object> addGzList(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String syData=request.getParameter("syData");
			String qyData=request.getParameter("qyData");
			String sessionUserId=request.getParameter("sessionUserId");
			gzInfoService.addGz(syData, qyData, sessionUserId);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	@RequestMapping("/getDataItemValueByName")  
	public  @ResponseBody Map<String, Object> getDataItemValueByName(HttpServletResponse response,HttpServletRequest request){
		try {
			String attName=request.getParameter("attName");
			ResultConstant.getDataItemValueByName(attName);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		
		
	}
	
}
