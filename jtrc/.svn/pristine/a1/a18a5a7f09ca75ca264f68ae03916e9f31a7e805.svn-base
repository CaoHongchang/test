package com.i84.earnpoint.zcps.controller;

import java.io.File;
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

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.ValidatorUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.model.ProfessorBakInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.model.ZyImportVo;
import com.i84.earnpoint.model.ZyImportVo;
import com.i84.earnpoint.zcps.service.ZyjsService;

/**
 * 专业技术职务任职资格
 * @author liu_quan
 *
 */
@Controller
@RequestMapping("/zyjs")
public class ZyjsController {
	@Autowired
	private ZyjsService zyjsService;
	@Autowired 
	private YgInfoService ygInfoService;
	/**模板下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/zyjsDownload")  
	@ResponseBody
	public void fileDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/zcsbgl/down", "zyjszw.xlsx","专业技术职务任职资格证书备案.xlsx");//专业技术职务任职资格证书备案模板
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**证书导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/zsUpload")  
	public  void zsUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=false;
		String dateFlag="";
		String infoMsg="";//已存在身份证号
		String cause="";
		List<ZyImportVo> zylist=null;
		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
			File newFile=ResultConstant.fileupload(request, response, "temp/zcsbgl/upload/",newFileName);
			if(newFile!=null){
				//读取导入的文件
				ImportExcel<ZyImportVo> importExcel = new ImportExcel<ZyImportVo>(ZyImportVo.class);
				List<ZyImportVo> results = (List<ZyImportVo>) importExcel.importExcel(newFile);
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

					Map<String,String> map1=new HashMap<String,String>();
					zylist=new ArrayList<ZyImportVo>();
					int i=0;
					for (ZyImportVo zyImportVo : results) {
						i=i+1;
						//身份证、活动编码不能为空，
						ZyImportVo vo=zyImportVo;
						String pnum=ResultConstant.replaceTrim(vo.getPnum());//身份证
						String businessId=ResultConstant.replaceTrim(vo.getBusinessId());//活动编码
						String cwts="";
						if(StringUtils.isEmpty(pnum)){
							cwts+=" 身份证不能为空";

						}else{
							//校验身份证是否合法
							boolean mark = ValidatorUtil.isIDCard(pnum); 
							if(!mark){
								cwts+=" 身份证不合法;";

							}
						}




						if(map1.get(pnum+businessId)!=null){
							cwts+=" 导入的身份证【"+pnum+"】、活动编码【"+businessId+"】重复;";  

						} 
						map1.put(pnum+businessId, pnum+businessId);

						//是否领取必须是"是/否
						String isGet=vo.getIsget()==null?"":vo.getIsget().trim();
						if(!isGet.equals("是")&&!isGet.equals("否")){
							cwts+=" 是否领取只能是是和否;";
						}
						//级别判断
						String level=vo.getLevel()==null?"":vo.getLevel().trim();
						if(!level.equals("技术师")
								&&!level.equals("助理工程师")
								&&!level.equals("工程师")
								&&!level.equals("高级工程师")
								&&!level.equals("教授级工程师")){
							cwts+=" 级别只能输入技术师/助理工程师/工程师/高级工程师/教授级工程师;";

						}
						//审批时间
						String sdate=vo.getSdate()==null?"":vo.getSdate().trim();
						boolean isTime= ResultConstant.isValidDate(sdate);
						if(isTime==false){
							cwts+=" 审批时间格式必须是YYYY-MM-DD格式;";
						}

						//保存时判断活动编号+身份证的组合在系统中存在才可以写入
						if(StringUtils.isEmpty(cwts)){
							Map<String, Object> map=new HashMap<String, Object>();
							map.put("businessId", businessId);
							map.put("pnum", pnum);
							List<Map<String, Object>> list=zyjsService.selectYgList3(map);
							if(list==null||list.size()<=0){
								cwts+="活动编码【"+businessId+"】+身份证【"+pnum+"】在系统中不存在，请重新填写活动编码对应的身份证"+";";							

							}else{
								Map<String, Object> m3=list.get(0);
								vo.setXm(m3.get("xm")==null?null:m3.get("xm").toString());
								vo.setUid(m3.get("uid")==null?null:m3.get("uid").toString());
								list=zyjsService.queryBusinessList(map);
								if(list!=null&&list.size()>0){
									m3=list.get(0);
									vo.setActivityId(m3.get("id").toString());
								}else{
									cwts+="活动编码有误，查找不到对应的活动ID";
								}
								//关联的用户id为空
								if(StringUtils.isEmpty(vo.getUid())){
									cwts+="活动编码【"+businessId+"】+身份证【"+pnum+"】在系统中匹配不到对应的用户;";
									
								}else{
									m3.put("uid", vo.getUid());
									m3.put("activityId", vo.getActivityId());
									m3 = zyjsService.selectIsExistByUid(m3);
									if(m3!=null&&(Long)m3.get("total")>=1){
										infoMsg+="已存在保存的记录"+";<br>";  
									}
									
								}
							}

						}

						vo.setId(i+"");
						vo.setCwts(cwts);
						if(StringUtils.isNotBlank(cwts)){
							dateFlag="true";
						}
						zylist.add(vo);
					}
					flag=true;
				}else{
					//return ResultConstant.resultMap(false,"文件中未上传任何数据");
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "文件中未上传任何数据");
					ResultConstant.write(response, jsonObject);
					return;
				}
			}else{
				cause="数据上传异常";
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//		resultMap.put("rows", zylist);
//		resultMap.put("flag", flag);
//		resultMap.put("dateFlag", dateFlag);//错误标识
//		resultMap.put("infoMsg", infoMsg);//提示信息
//		resultMap.put("cause", cause);
//		return resultMap;
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", zylist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag);//错误标识
		jsonObject.put("infoMsg", infoMsg);//提示信息
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);
	}
	/**专业技术职务任职资格证书备案
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getZyjsList")  
	public  @ResponseBody Map<String, Object> getZyjsList(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		Long total=null;
		List<Map<String,Object>> zyList=null;
		try {
			zyList=zyjsService.selectZyjsList(ResultConstant.paramSet(request));
			if(zyList!=null&&zyList.size()>0){
				for(int i=0;i<zyList.size();i++){
					Map<String,Object> map=zyList.get(i);
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,map, "spsj");
				}
			}
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(zyList);
			total=pageinfo.getTotal();
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常"; 
		}
		return ResultConstant.resultMap(zyList,total,flag,cause);
	}

	/**是否存在用户
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/isExistByUid")  
	public  @ResponseBody Map<String, Object> isExistByUid(HttpServletResponse response,HttpServletRequest request){
		String uid=request.getParameter("uid");
		String activityId=request.getParameter("activityId");
		//判断身份证+活动编码关联的用户是否已经添加过资格证书备案
		Map<String,Object> m=new HashMap<String, Object>();
		m.put("uid", uid);
		m.put("activityId", activityId);
		Map<String, Object> rs=null;
		try {
			rs = zyjsService.selectIsExistByUid(m);
			if(rs!=null&&(Long)rs.get("total")>=1){
				return ResultConstant.resultMap(true,"");  
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return ResultConstant.resultMap(false,"");  		

	}
	/**单个新增
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addzy")  
	public  @ResponseBody Map<String, Object> addzy(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String param=request.getParameter("param");
			System.out.println(param);
			if(StringUtils.isNotEmpty(param)){
				Map<String,Object> m=ResultConstant.paramSetAdd(request);

				HttpSession session = request.getSession();
				//登录用户id
				String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
				m.put("stuff", uid);
				m.put("addDate", new Date());
				//保存时判断活动编号+身份证的组合在系统中存在才可以写入
				String businessId=m.get("businessId")==null?null:m.get("businessId").toString();
				String pnum=m.get("pnum")==null?null:m.get("pnum").toString();
				Map<String, Object> map=new HashMap<String, Object>();
				map.put("businessId", businessId);
				map.put("pnum", pnum);

				List<Map<String, Object>> list=zyjsService.selectYgList3(map);
				if(list==null||list.size()<=0){
					return ResultConstant.resultMap(flag,"活动编码+身份证在系统中不存在，请重新选择活动编码对应的身份证。");  
				}
				String userId=m.get("uid")==null?null:m.get("uid").toString();
				if(StringUtils.isEmpty(userId)){
					return ResultConstant.resultMap(flag,"活动编码+身份证在系统中不存在，请重新选择活动编码对应的身份证。");  
				}

				String isEdit=request.getParameter("isEdit");
				//修改
				if(StringUtils.isNotBlank(isEdit)){
					String activityId2=m.get("activityId2")==null?null:m.get("activityId2").toString();
					if(StringUtils.isNotEmpty(activityId2)){
						m.put("activityId", activityId2);
					}
					int c=zyjsService.editZy(m);
					if(c>0)
						return ResultConstant.resultMap(true,"");
				}
				//新增
				else{
					int c=zyjsService.addzy(m);
					if(c>0)
						return ResultConstant.resultMap(true,"");

				}
			}

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}


	/**批量添加
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addZyList")  
	public  @ResponseBody Map<String, Object> addZyList(HttpServletRequest request,@RequestBody List<ZyImportVo> ygList){
		boolean flag=false;
		String cause="";
		try {
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			zyjsService.insertZyList(ygList,uid);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}


	/** 活动编号下拉框
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/hdbhList")  
	public  @ResponseBody List<Map<String, Object>> hdbhList(HttpServletResponse response,HttpServletRequest request){  

		List<Map<String,Object>> hdList=null;
		try {
			hdList=zyjsService.queryBusinessList(null);
			if(hdList!=null&&hdList.size()>0){
				for(int i=0;i<hdList.size();i++){
					Map<String,Object> m=hdList.get(i);
					if(m.get("businessId")!=null)
						m.put("businessId",TextUtil.getSNumber(TextUtil.getInt(m.get("businessId")), 6));
				}
			}
			return hdList;

		}catch (Exception e) {
			e.printStackTrace();
		}
		return hdList;

	}

	/** 身份证下拉框
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/sfzList")  
	public  @ResponseBody List<Map<String, Object>> sfzList(HttpServletResponse response,HttpServletRequest request){  
		String activityId=request.getParameter("activityId");//活动id
		List<Map<String,Object>> sfzList=null;
		try {
			Map<String,Object>m=new HashMap<String, Object>();
			m.put("activityId", activityId);
			sfzList=zyjsService.selectYgList3(m);
			return sfzList;

		}catch (Exception e) {
			e.printStackTrace();
		}
		return sfzList;

	}
	
	
	/**删除用户
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delZyFuc")  
	public  @ResponseBody Map<String, Object> delZyFuc(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			
			String id=request.getParameter("id");
			ProfessorBakInfo p=new ProfessorBakInfo();
			p.setId(Integer.valueOf(id));
			p.setDelDate(new Date());
			int c=zyjsService.updateZySelective(p);
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
	/**证书查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getZyMsg")  
	public  @ResponseBody Map<String, Object> getZyMsg(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
		
			String id=request.getParameter("id")==null?"":request.getParameter("id").toString();
			System.out.println("查询参数id"+id);
			if(StringUtils.isNotBlank(id)){
				ProfessorBakInfo p=zyjsService.selectZyMsg(Integer.valueOf(id));
				UserInfo u=new UserInfo();
				u.setId(p.getUid());
				u=ygInfoService.selectYg(u);
				Map<String,Object> m=new HashMap<String, Object>();
				m.put("user", u);
				m.put("level", p.getLevel());
				m.put("qualificationName", p.getQualificationName());
				m.put("zNo", p.getzNo());
				m.put("pzNo", p.getPzNo());
				m.put("sPart", p.getsPart());
				m.put("pro", p.getPro());
				m.put("sDate", p.getsDate());
				m.put("isGet", p.getIsGet());
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,m, "sDate");
				return ResultConstant.resultMap(m,true,cause);
			}
          
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据加载异常";
		}
		return ResultConstant.resultMap(null,flag,cause);


	}
}
