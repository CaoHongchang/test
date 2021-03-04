package com.i84.earnpoint.daxt.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.daxt.service.ResidenceInfoService;
import com.i84.earnpoint.model.Page;
import com.i84.earnpoint.model.ResidenceInfo;
import com.i84.earnpoint.model.ResidenceIntInfo;

/**
 * 户口信息管理
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/residenceInfoContr")
public class ResidenceInfoController extends ResultConstant{
	@Autowired
	public ResidenceInfoService residenceInfoService;
	
	/**
     * 	获取户口信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryResidencaInfoList")
	public  @ResponseBody Map<String, Object> qryResidencaInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String dept = request.getParameter("dept");
		if(StringUtils.isNotBlank(dept)){
			String key = request.getParameter("key");
			if("daNum".equals(dept) && StringUtils.isNotBlank(key)){
				params.put("p_no", key);
			}
		}
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(age)){
			params.put("age", age);
		}
		List< Map<String, Object>> list = residenceInfoService.qryResidencaInfoList(params);
		PageInfo< Map<String, Object>> pageinfo = new PageInfo< Map<String, Object>>(list);
		
		System.out.println(pageinfo.getTotal());
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	/**
	 * 借出户口新增
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/saveResidenceIntInfo")
	public void saveResidenceIntInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			String ryData = request.getParameter("param");
			String paramsTrans = new String(ryData.getBytes("ISO-8859-1"),"UTF-8");
			String deParams = java.net.URLDecoder.decode(paramsTrans , "UTF-8");
			Map<String, Object> paramMap = new HashMap<String, Object>();
			//解析前端新增参数
			if(StringUtils.isNotBlank(deParams)){
				List<Page> list=JsonUtil.getList4Json(deParams, Page.class);
				if(list!=null &&  list.size()>0){
					for(int i=0;i<list.size();i++){
						Page p= list.get(i);
						if(StringUtils.isNotBlank(p.getValue()))
						paramMap.put(p.getName(), p.getValue());
					}
				}
			}
			// Map<String,Object> paramMap = ResultConstant.paramSetAdd(request);
			 if(!paramMap.isEmpty()){
				 
				 String outDate=null;
				 String outUse=null;
				 String outName=null;
				 String backDate=null;
				 String signName=null;
				 String uid=null;
				 String rid=null;
				   if(paramMap.containsKey("out_date"))
					 outDate = paramMap.get("out_date").toString();
				   if(paramMap.containsKey("out_use"))
					 outUse = paramMap.get("out_use").toString();
				   if(paramMap.containsKey("out_name"))
					 outName = paramMap.get("out_name").toString();
				   if(paramMap.containsKey("back_date"))
					 backDate = paramMap.get("back_date").toString();
				   if(paramMap.containsKey("sign_name"))
					 signName = paramMap.get("sign_name").toString();
				
					 uid = request.getParameter("uid");
					 rid = request.getParameter("rid");
					paramMap.put("uid", uid);
					//paramMap.put("rid", rid);
					ResidenceInfo residenceInfo = residenceInfoService.qryResidenceInfo(paramMap);
					if(residenceInfo != null){
						/*初始化新增对象*/
						SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
						ResidenceIntInfo residenceIntInfo = new ResidenceIntInfo();
						if(outDate!=null)
						residenceIntInfo.setOutDate(format.parse(outDate));
						if(outUse!=null)
						residenceIntInfo.setOutUse(outUse);
						if(outName!=null)
						residenceIntInfo.setOutName(outName);
						if(backDate!=null)
						residenceIntInfo.setBackDate(format.parse(backDate));
						if(signName!=null)
						residenceIntInfo.setSignName(signName);
						
						residenceIntInfo.setResidenceId(residenceInfo.getId());
					
						residenceInfoService.saveResidenceIntInfo(residenceIntInfo,TextUtil.getInt(rid));
						resObject.put("flag", true);
					}else{
						resObject.put("flag", false);
						resObject.put("errorMsg", "查询不到该用户的户口信息，无法进行借出操作");
					}
			 }else{
				 
				 resObject.put("flag", true);
			 }
		
			
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 户口信息新增
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/saveResidenceInfo")
	public void saveResidenceInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			String ryData = request.getParameter("param");
			String uid = request.getParameter("uid");
			String id=request.getParameter("id");
			String paramsTrans = new String(ryData.getBytes("ISO-8859-1"),"UTF-8");
			String deParams = java.net.URLDecoder.decode(paramsTrans , "UTF-8");
			Map<String, Object> paramMap = new HashMap<String, Object>();
			//解析前端新增参数
			if(StringUtils.isNotBlank(deParams)){
				List<Page> list=JsonUtil.getList4Json(deParams, Page.class);
				if(list!=null &&  list.size()>0){
					for(int i=0;i<list.size();i++){
						Page p= list.get(i);
						if(StringUtils.isNotBlank(p.getValue()))
						paramMap.put(p.getName(), p.getValue());
					}
				}
			}
			String rel_name = "";
			String residence_no = "";
			String other_adr ="";
			String blood = "";
			String stature = "";
			String xy_name = "";
			String by_state = "";
			String service_adr = "";
			String pro_name ="";
			String h_pro = "";
			String police = "";
			String r_date = "";
			String r_adr = "";
			String org_adr = "";
			String q_date ="";
			String q_adr = "";
			String c_name = "";
			String add_date = "";
			int t=0;
			/*初始化新增对象*/
			ResidenceInfo residenceInfo = new ResidenceInfo();
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			if(paramMap.containsKey("relName")){
				
					t=1;
					rel_name = paramMap.get("relName").toString();
					residenceInfo.setRelName(rel_name);
			}
		
			if(paramMap.containsKey("residenceNo")){
						
					t=1;
					residence_no = paramMap.get("residenceNo").toString();
					residenceInfo.setResidenceNo(residence_no);
			}
			if(paramMap.containsKey("otherAdr")){
				
				t=1;
				other_adr =  paramMap.get("otherAdr").toString();
				residenceInfo.setOtherAdr(other_adr);
			}
			if(paramMap.containsKey("blood")){
				
				t=1;
				blood = paramMap.get("blood").toString();
				residenceInfo.setBlood(blood);
			}
			if(paramMap.containsKey("stature")){
				
				t=1;
				stature = paramMap.get("stature").toString();
				residenceInfo.setStature(Integer.parseInt(stature));
			}
			if(paramMap.containsKey("xyName")){
				
				t=1;
				xy_name = paramMap.get("xyName").toString();
				residenceInfo.setXyName(xy_name);
			}
			if(paramMap.containsKey("byState")){
				
				t=1;
				by_state = paramMap.get("byState").toString();
				residenceInfo.setByState(by_state);
			}
			if(paramMap.containsKey("serviceAdr")){
				
				t=1;
				service_adr = paramMap.get("serviceAdr").toString();
				residenceInfo.setServiceAdr(service_adr);
			}
			if(paramMap.containsKey("proName")){
				
				t=1;
				pro_name = paramMap.get("proName").toString();
				residenceInfo.setProName(pro_name);
			}
			if(paramMap.containsKey("hPro")){
				
				t=1;
				h_pro = paramMap.get("hPro").toString();
				residenceInfo.sethPro(h_pro);
			}
			if(paramMap.containsKey("police")){
				
				t=1;
				police = paramMap.get("police").toString();
				residenceInfo.setPolice(police);
			}
			if(paramMap.containsKey("r_date")){
				
				t=1;
				r_date = paramMap.get("r_date").toString();

				residenceInfo.setrDate(format.parse(r_date));
			}
			if(paramMap.containsKey("rAdr")){
				
				t=1;
				r_adr = paramMap.get("rAdr").toString();
				residenceInfo.setrAdr(r_adr);
			}
			if(paramMap.containsKey("orgAdr")){
				
				t=1;
				org_adr = paramMap.get("orgAdr").toString();
				residenceInfo.setOrgAdr(org_adr);
			}
			if(paramMap.containsKey("q_date")){
				
				t=1;
				q_date = paramMap.get("q_date").toString();
				residenceInfo.setqDate(format.parse(q_date));
			}
			if(paramMap.containsKey("qAdr")){
				
				t=1;
				q_adr = paramMap.get("qAdr").toString();
				
	            residenceInfo.setqAdr(q_adr);
			}
			if(paramMap.containsKey("cName")){
				
				t=1;
				c_name = paramMap.get("cName").toString();

	            residenceInfo.setcName(c_name);
			}
			if(paramMap.containsKey("addDate")){
				
				t=1;
				add_date = paramMap.get("addDate").toString();

	            residenceInfo.setAddDate(format.parse(add_date));
			}
			if(t==0){
				resObject.put("flag", false);
			    ResultConstant.write(response, resObject);
			    return;
			}
			 
			residenceInfo.setUid(Integer.parseInt(uid));

            if(!"".equals(id)&&!"null".equals(id)){
            	residenceInfo.setId(TextUtil.getInt(id));
            	residenceInfoService.updateResidenceInfo(residenceInfo);
            }else{
            	residenceInfoService.saveResidenceInfo(residenceInfo);
            }
		
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
	}
	/**
     * 	获取户口信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryResidenceInfo")
	public  @ResponseBody Map<String, Object> qryResidenceInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取对象值*/
			String uid = request.getParameter("uid");
            Map<String, Object> param = new HashMap<String, Object>();
            param.put("uid", uid);
            ResidenceInfo row =  residenceInfoService.qryResidenceInfo(param);
            if(row != null){
            	
            	row.setQ_date(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD,row.getqDate()));
            	row.setR_date(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD,row.getrDate()));
            	return resultMap(row, 1L, true, "1");
            }else{
            	row = new ResidenceInfo();
            	row.setAddDate(new Date());
            	//row.setId(0);
            	return resultMap(row, 0L, true, "0");
            }
			
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
			return resultMap(false,e.getMessage());
		}
	}
	/**
     * 	获取户口接触借入信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryResidenceIntInfo")
	public  @ResponseBody Map<String, Object> qryResidenceIntInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取对象值*/
			String uid = request.getParameter("uid");
           String rid = request.getParameter("rid");
			ResidenceIntInfo row =  residenceInfoService.qryResidenceIntInfo(TextUtil.getInt(uid),TextUtil.getInt(rid));
            if(row != null){
            	
            	row.setBackDate1(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD,row.getBackDate()));
            	row.setOutDate1(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD,row.getOutDate()));
            	return resultMap(row, 1L, true, "1");
            }else{
            	row = new ResidenceIntInfo();
            	
            	return resultMap(row, 0L, true, "0");
            }
			
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
			return resultMap(false,e.getMessage());
		}
	}
}
