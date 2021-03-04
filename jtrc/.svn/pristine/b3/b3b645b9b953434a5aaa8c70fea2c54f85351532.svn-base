package com.i84.earnpoint.daxt.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.daxt.service.ArchivesInfoService;
import com.i84.earnpoint.daxt.service.ResidenceService;
import com.i84.earnpoint.model.ArchivesInfo;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ResidenceIntInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.zxxx.service.UserBgInfoService;

import freemarker.template.SimpleDate;

/**
 * 档案存放信息管理
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/archivesInfoContr")
public class ArchivesInfoController extends ResultConstant{
	@Autowired 
	public ArchivesInfoService archivesInfoService;
	
	/**
     * 	获取 档案存放信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryArchivesInfoList")
	public  @ResponseBody Map<String, Object> qryArchivesInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String,Object> params = ResultConstant.paramSet(request);
		String dpno=request.getParameter("dpno");
		if(StringUtils.isNotEmpty(dpno)){
			params.put("dpno", dpno);
		}
		String orgno=request.getParameter("orgno");
		if(StringUtils.isNotEmpty(orgno)){
			params.put("orgno", orgno);
		}
		String orgname=request.getParameter("orgname");
		if(StringUtils.isNotEmpty(orgname)){
			params.put("orgname", orgname);
		}
		String syear=request.getParameter("syear");
		if(StringUtils.isNotEmpty(syear)){
			params.put("syear", syear);
		}
	
		List<Map<String, Object>> list = archivesInfoService.qryArchivesInfoList(params);
		
		PageInfo<Map<String, Object>> pageinfo = new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 更新档案存放位置
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/updateArchivesInfo")
	public void updateArchivesInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			Map<String,Object> paramMap = ResultConstant.paramSetAdd(request);
			String org_no = paramMap.get("orgNo").toString();
			String org_name = paramMap.get("orgName").toString();
			String s_year = paramMap.get("sYear").toString();
			String aj_type = paramMap.get("ajType").toString();
			String position = paramMap.get("position").toString();
			String p_uid = paramMap.get("pUid").toString();
			String add_date = paramMap.get("addDate").toString();
			String dpno = request.getParameter("dpno");
			String id = request.getParameter("id");
			String staffname = request.getParameter("staffname");
			/*初始化新增对象*/
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			ArchivesInfo archivesInfo = new ArchivesInfo();
			archivesInfo.setId(Integer.parseInt(id));
			archivesInfo.setArNo(dpno);
			archivesInfo.setOrgNo(org_no);
			archivesInfo.setOrgName(org_name);
			archivesInfo.setsYear(s_year);
			archivesInfo.setAjType(aj_type);
			archivesInfo.setPosition(position);
			archivesInfo.setpUid(Integer.parseInt(p_uid));
			archivesInfo.setAddDate(format.parse(add_date));
			archivesInfo.setStaffname(staffname);
			if(paramMap.containsKey("remark")){
				archivesInfo.setRemark(paramMap.get("remark").toString());
			}
			
			archivesInfoService.updateArchivesInfo(archivesInfo);
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
	}
	/**
	 * 新增档案存放位置
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/saveArchivesInfo")
	public void saveArchivesInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			Map<String,Object> paramMap = ResultConstant.paramSetAdd(request);
		 	String org_no = TextUtil.getString( paramMap.get("orgNo"))  ;
			String org_name = TextUtil.getString( paramMap.get("orgName") ) ;
			String s_year =  TextUtil.getString(paramMap.get("sYear") ) ;
			String aj_type =  TextUtil.getString(paramMap.get("ajType") ) ;
			String position =  TextUtil.getString(paramMap.get("position") ) ;
			String p_uid =  TextUtil.getString(paramMap.get("pUid") ) ;
			String add_date =  TextUtil.getString(paramMap.get("addDate") ) ;
			String dpno =  TextUtil.getString(request.getParameter("dpno")) ;
			String staffname =  TextUtil.getString(request.getParameter("staffname"));
			/*初始化新增对象*/
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			ArchivesInfo archivesInfo = new ArchivesInfo();
			archivesInfo.setArNo(dpno);
			archivesInfo.setOrgNo(org_no);
			archivesInfo.setOrgName(org_name);
			archivesInfo.setsYear(s_year);
			archivesInfo.setAjType(aj_type);
			archivesInfo.setPosition(position);
			archivesInfo.setpUid(TextUtil.getInt(p_uid));
			archivesInfo.setAddDate(format.parse(add_date));
			archivesInfo.setStaffname(staffname);
			if(paramMap.containsKey("remark")){
				archivesInfo.setRemark(paramMap.get("remark").toString());
			}
			archivesInfoService.saveArchivesInfo(archivesInfo);
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
	}
	
	/**
     * 	获取 档案存放信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryArchivesInfoBean")
	public  @ResponseBody Map<String, Object> qryArchivesInfoBean(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String,Object> params = ResultConstant.paramSet(request);
		String dpno = request.getParameter("dpno");
		params.put("dpno", dpno);
		ArchivesInfo obj = archivesInfoService.qryArchivesInfoBean(params);
		
		return resultMap(obj, true, null);
	}
}
