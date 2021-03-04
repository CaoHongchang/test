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
import com.i84.earnpoint.daxt.service.ResidenceService;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.zxxx.service.UserBgInfoService;

import freemarker.template.SimpleDate;

/**
 * 档案管理
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/residenceController")
public class ResidenceController extends ResultConstant{
	@Autowired 
	public ResidenceService residenceService;
	
	/**
     * 	获取档案流动列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryResidenceIoInfo")
	public  @ResponseBody Map<String, Object> queryResidenceIoInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String,Object> params = ResultConstant.paramSet(request);
		String key = request.getParameter("key");
		if(StringUtils.isNotBlank(key)){
			params.put("p_no", key);
			
		}
		String acceptDate=request.getParameter("acceptDate");
		String archiveNum=request.getParameter("archiveNum");
		String sender=request.getParameter("sender");
		String accepter=request.getParameter("accepter");
		if(StringUtils.isNotBlank(acceptDate)){
			params.put("acceptDate",acceptDate);
		}
		if(StringUtils.isNotBlank(archiveNum)){
			params.put("archiveNum",archiveNum);
		}
		if(StringUtils.isNotBlank(sender)){
			params.put("sender",sender);
		}
		if(StringUtils.isNotBlank(accepter)){
			params.put("accepter",accepter);
		}
		List<ResidenceIoInfo> list = residenceService.queryResidenceIoInfo(params);
		PageInfo<ResidenceIoInfo> pageinfo = new PageInfo<ResidenceIoInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	/**
	 * 新增档案流动信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/saveResidenceIoInfo")
	public void saveResidenceIoInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resObject = new JSONObject();
		try {
			Map<String,Object> param = ResultConstant.paramSetAdd(request);
			if(!param.containsKey("add_date")){
				resObject.put("flag", false);
				resObject.put("errorMsg", "请输入入录日期");
				ResultConstant.write(response, resObject);
				return;
			}
			if(!param.containsKey("sessionUserName")){
				resObject.put("flag", false);
				resObject.put("errorMsg", "请输入入录人");
				ResultConstant.write(response, resObject);
				return;
			}
			int a = residenceService.saveResidenceIoInfo(param);
			if(a==0){
				resObject.put("flag", false);
				resObject.put("errorMsg", "该编号档案不在档案库中！");
				ResultConstant.write(response, resObject);
				return;
			}
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	/**
	 * 更新档案流动信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateResidenceIoInfo")
	public void updateResidenceIoInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resObject = new JSONObject();
		try {
			Map<String,Object> param = ResultConstant.paramSetAdd(request);
			if(!param.containsKey("add_date")){
				resObject.put("flag", false);
				resObject.put("errorMsg", "请输入入录日期");
				ResultConstant.write(response, resObject);
				return;
			}
			if(!param.containsKey("sessionUserName")){
				resObject.put("flag", false);
				resObject.put("errorMsg", "请输入入录人");
				ResultConstant.write(response, resObject);
				return;
			}
			residenceService.updateResidenceIoInfo(param);
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 删除档案流动信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/delResidenceIoInfo")
	public void delResidenceIoInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		JSONObject resObject = new JSONObject();
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			residenceService.delResidenceIoInfo(id);
			resObject.put("flag", true);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
}
