package com.i84.earnpoint.zcps.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.search.FromStringTerm;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.jsqlparser.statement.update.Update;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.ImpEnterpriseInfo;
import com.i84.earnpoint.model.ImpZjInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;
import com.i84.earnpoint.model.ZcActivityInfo;
import com.i84.earnpoint.rygl.service.RyglService;
import com.i84.earnpoint.zcps.service.ExpertActivityInfoService;
import com.i84.earnpoint.zcps.service.ZcActivityInfoService;
/**
 * 专家组管理
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/zcsb")
public class ExpertActivityInfoController extends ResultConstant{
	@Autowired 
	public RyglService ryglService;
	@Autowired
	private ExpertActivityInfoService expertActivityInfoService;
	@Autowired
	private ZcActivityInfoService zcActivityInfoService;
	/**
	 * 新增某活动内的专家
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/saveExpertActivityInfos")
	public void saveExpertActivityInfos(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String rs=expertActivityInfoService.saveExpertAtivityInfos(request);
		write(response,rs);
	}
	
	/**
	 * 查询活动专家
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryExpertActivityInfos")
	public @ResponseBody Map<String,Object> queryExpertActivityInfos(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
		
		int page=TextUtil.getInt(params.get("page"));
		page=page==0?1:page;
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		System.out.println(params.get("activityId"));
		List<Map<String,Object>> list=expertActivityInfoService.queryExpertActivitys(params);
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageInfo.getTotal(), true, "");
	}
	/**
	 * 删除活动专家
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/deleteExpertActivitys")
	public void deleteExpertActivitys(HttpServletRequest request,HttpServletResponse response)throws Exception{
		write(response,expertActivityInfoService.deleteExpertActivityInfos(request));
	}
	/**
	 * 初始化所有专家评审时长
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/initExpertReviewTime")
	public void initExpertReviewTime(HttpServletRequest request,HttpServletResponse response)throws Exception{
	    response.setCharacterEncoding("utf-8");
		write( response,expertActivityInfoService.initExpertReviewTime(request));
	}
	
	/**
	 * 设置评审时长
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	 @RequestMapping("/setReviewTime")
     public void setReviewTime(HttpServletRequest request,HttpServletResponse response)throws Exception{
		    response.setCharacterEncoding("utf-8");
			write(response,expertActivityInfoService.setReviewTime(request));
      }
	 
		/**
		 * 设置全部专家的评审时长
		 * @param request
		 * @param response
		 * @throws Exception
		 */
		 @RequestMapping("/setReviewTimeAll")
	     public void setReviewTimeAll(HttpServletRequest request,HttpServletResponse response)throws Exception{
			 	
			    response.setCharacterEncoding("utf-8");
				write(response,expertActivityInfoService.setReviewTimeAll(request));
	      }
	 
	 
	 @RequestMapping("/getuserExpertInfo")
	 public  @ResponseBody UserExpertInfo getuserExpertInfo(HttpServletRequest request,HttpServletResponse response){
		 System.out.println("-->>");
		 Integer id=TextUtil.getOInteger(request.getParameter("id"));
		 return  expertActivityInfoService.getExpertInfo(id);
	 }
	 
	 /**导出企业模板
		 * @param response
		 * @param request
		 */
		@RequestMapping("/zjDownload")  
		@ResponseBody
		public void qyDownload(HttpServletResponse response,HttpServletRequest request){  
			try {
				ResultConstant.fileDownload(request, response, "temp/zcsbgl/down", "zjdrmb.xlsx","专家导入模板.xlsx");//专家导入模板
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		/**专家导入
		 * @param response
		 * @param request
		 * @throws Exception 
		 */
		@RequestMapping("/zjUpload")  
		public  void zjUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
			boolean flag=true;
			String dateFlag1="";
			String infoMsg="";//已存在身份证号+专家
			String cause="";
			List<ImpZjInfo> slist=null;

			try {
				String newFileName=ResultConstant.getRandNum(32)+".xlsx";
				File newFile=ResultConstant.fileupload(request, response, "temp/zcsbgl/upload/",newFileName);
				//读取导入的文件
				ImportExcel<ImpZjInfo> importExcel = new ImportExcel<ImpZjInfo>(ImpZjInfo.class);
				List<ImpZjInfo> results = (List<ImpZjInfo>) importExcel.importExcel(newFile,"0");
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					if(results.size()>1000){
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
						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "导入文件标题缺失："+title);
						ResultConstant.write(response, jsonObject);
						return;
					}

					slist=new ArrayList<ImpZjInfo>();
					int i=0;
					for (ImpZjInfo impInfo : results) {
						i=i+1;
						String name=ResultConstant.replaceTrim(impInfo.getName());
						String pnum=ResultConstant.replaceTrim(impInfo.getPnum());
						String businessId=ResultConstant.replaceTrim(impInfo.getBusinessId());
					
						String cwts="";

						if(StringUtils.isEmpty(name)){
							cwts+=" 专家姓名不能为空;";
						}
						if(StringUtils.isEmpty(pnum)){
							cwts+=" 身份证不能为空;";
						}
						if(StringUtils.isEmpty(businessId)){
							cwts+=" 活动编码不能为空;";
						}else{
							ZcActivityInfo z=new ZcActivityInfo();
							z.setBusinessId(Integer.valueOf(businessId));
							List<ZcActivityInfo> zList=zcActivityInfoService.queryList(z);
							if(zList==null || zList.size()<=0){
								cwts+=" 活动编码不存在数据库中;";
							}else{
								//判断活动是否结束
								//评审结束标记
								if(zList.get(0).gethEnddate()!=null&&DateUtil.isDateBefore(DateUtil.convDateToString(zList.get(0).gethEnddate(), DateUtil.OYYYY_MM_DD_HH_MI_SS),DateUtil.getNowTime())){
									cwts+=" 该活动已经结束;";
								}
								
							}		
							
						}
						
						//身份证+专家需要在人员管理-专家列表中存在，否则【错误提示】”专家信息错误"
						Map<String, Object> params = new HashMap<String, Object>();
						params.put("name2", name);
						params.put("pnum2", pnum);
						List<Map<String, Object>> rylist = ryglService.queryExpertUserList2(params);
						if(rylist==null || rylist.size()<=0){
							cwts+=" 专家信息错误;";
						}
						
						//身份证+专家存在，要判断当前加入的职称申报管理-专家组中是否已有相同专家，已有该专家时，在提交数据时，提示是否覆盖保存
						params.put("business_id", businessId);
						params.put("isCount", true);//是否统计总数
						Map<String,Object> act=expertActivityInfoService.queryExpertActivitys2(params);
						if(act!=null && Integer.valueOf(act.get("total").toString())>0){
							infoMsg="该活动已存在相同专家，是否覆盖保存";
						}
						
						impInfo.setId(i);
						impInfo.setCwts(cwts);
						if(StringUtils.isNotBlank(cwts)){
							dateFlag1="true";
						}
						slist.add(impInfo);
					}

				}
			}
			catch (Exception e) {
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

		
		/**添加专家
		 * @param response
		 * @param request
		 * @return
		 */
		@RequestMapping("/addZjList")  
		public  @ResponseBody Map<String, Object> addZjList(HttpServletResponse response,HttpServletRequest request,@RequestBody List<ImpZjInfo> zjList){
			boolean flag=false;
			String cause="";
			try {
				//用户id
				HttpSession session = request.getSession();
				//登录用户id
				String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
				expertActivityInfoService.insertZjList(zjList,uid);
				flag=true;

			} catch (Exception e) {
				e.printStackTrace();
				flag=false;
				cause="数据上传异常";
			}
			return ResultConstant.resultMap(flag,cause);  


		}
		
		
		/**
		 * 抽取专家并导出
		 * @param params
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/randomExpertActivityInfos")
		public @ResponseBody Map<String,Object> randomExpertActivityInfos(HttpServletRequest request,HttpServletResponse response)throws Exception{
			
			Map<String,Object> params=ResultConstant.paramSet(request);
			List<Map<String, Object>> rylist = ryglService.queryExpertUserList2(params);
			if(rylist!=null && rylist.size()>0)
			    rylist=ResultConstant.createRandomList(rylist, Integer.valueOf(params.get("amount").toString()));
			else
				rylist=new ArrayList<Map<String,Object>>();
			
			return resultMap(rylist, Long.valueOf(10), true, "");
		}
		
		/**导出excel
		 * @param response
		 * @param request
		 */
		@RequestMapping("/zjszExport")  
		@ResponseBody
		public void zjszExport(HttpServletResponse response,HttpServletRequest request){  
			try {
				expertActivityInfoService.qyZjszExport(response, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		
		
		
		/**
		 * 新的抽取专家并导出
		 * @param params
		 * @param request
		 * @param response
		 * @return
		 * @throws Exception
		 */
		@RequestMapping("/newRandomExpertActivityInfos")
		public @ResponseBody Map<String,Object> newRandomExpertActivityInfos(HttpServletRequest request,HttpServletResponse response)throws Exception{
			int flagOfRandom = 1;
			Map<String,Object> params=ResultConstant.paramSet(request);
			String pro_type = params.get("pro_type2").toString();
			int m = Integer.parseInt(params.get("amount").toString());
			int n = Integer.parseInt(params.get("times").toString());
			int x=0;
			if(params.get("number")!=null){
			x = Integer.parseInt(params.get("number").toString());
			}
			if(SystemContant.directorAll.equals(pro_type)||SystemContant.transportationAll.equals(pro_type))
			{
				flagOfRandom=0;
			}
			
			List<String> company = ryglService.queryCompanyByPro_type(pro_type);
			List<Map<String,Object>> rylist = ryglService.queryExpertUserListByPro_Type(pro_type);
			
			if(m*n>rylist.size())
			{
				ryglService.updateSelectedToFalse();
				/*for(int i=0;i<rylist.size();i++)
				{
					ryglService.updateSelectedToTrue(Integer.parseInt(rylist.get(i).get("uid").toString()));
				}*/
				return resultMap(ryglService.queryExpertUserListByPro_Type(pro_type), Long.valueOf(10), true, "人数不足,无法抽取");
			}

			if(rylist!=null && rylist.size()>0)
			{
				if(flagOfRandom==1)
				{
			    rylist=ResultConstant.createRandomListExpert(rylist, company, m, n, x);
				ryglService.updateSelectedToFalse();
				}
				else {
					rylist=ResultConstant.createRandomListNormal(rylist,n,m);
					ryglService.updateSelectedToFalse();
				}
			}
			else
				rylist=new ArrayList<Map<String,Object>>();
			
			if(rylist.size()<m*n)
			{
				ryglService.updateSelectedToFalse();
				//for(int i=0;i<rylist.size();i++)
				//{
				//	ryglService.updateSelectedToTrue(Integer.parseInt(rylist.get(i).get("uid").toString()));
				//}
				return resultMap(rylist, Long.valueOf(10), true, "人数不足,无法抽取");
				
			}
			if(rylist.size()>m*n)
			{
				ryglService.updateSelectedToFalse();
				/*for(int i=0;i<rylist.size();i++)
				{
					ryglService.updateSelectedToTrue(Integer.parseInt(rylist.get(i).get("uid").toString()));
				}*/
				int flagn = rylist.size();
				for(int i=0;i<flagn-m*n;i++)
				{
				rylist.remove(i);
				}
				
			}
			/*for(int i=0;i<rylist.size();i++)
			{
				ryglService.updateSelectedToTrue(Integer.parseInt(rylist.get(i).get("uid").toString()));
			}*/
			
			return resultMap(rylist, Long.valueOf(10), true, "");
		}
		

		/**标记专家
		 * @param response
		 * @param request
		 */
		@RequestMapping("/markExpert")  
		@ResponseBody
		public void markExpert(HttpServletResponse response,HttpServletRequest request){  
			try {
				expertActivityInfoService.markExpert(response, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		/**取消标记专家
		 * @param response
		 * @param request
		 */
		@RequestMapping("/cancelMark")  
		@ResponseBody
		public void cancelMark(HttpServletResponse response,HttpServletRequest request){  
			try {
				expertActivityInfoService.cancelMark(response, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		/**取消选中专家
		 * @param response
		 * @param request
		 */
		@RequestMapping("/cancelSelected")  
		@ResponseBody
		public void cancelSelected(HttpServletResponse response,HttpServletRequest request){  
			try {
				ryglService.updateSelectedToFalse();
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		
		/**导出excel
		 * @param response
		 * @param request
		 */
		@RequestMapping("/zjszExportByPro_Type")  
		@ResponseBody
		public void zjszExportByPro_Type(HttpServletResponse response,HttpServletRequest request){  
			try {
				expertActivityInfoService.qyZjszExportByPro_type(response, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}
		
		/**获取专家分组
		 * 
		 * 
		 */
		 
		@RequestMapping(value = "/queryPro_type")
		@ResponseBody
		public  List<Map<String,Object>>  queryPro_type(){
				List<Map<String,Object>> list = new ArrayList<>();
				list =ryglService.quertyPro_type();
			return list;
		}

}
