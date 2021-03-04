package com.i84.earnpoint.daxt.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
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
import com.i84.earnpoint.daxt.service.ArchivesBaseInfoService;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.daxt.service.ResidenceQsInfoService;
import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.ResidenceQsInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyImportInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * 档案缺失信息管理
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/residenceQsInfoTrol")
public class ResidenceQsInfoController   extends ResultConstant{

	@Autowired 
	public ResidenceQsInfoService residenceQsInfoService;
	
	@Autowired 
	public ArchivesBaseInfoService archivesBaseInfoService;
	
	/**
     * 	获取档案缺失信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryResidenceQsInfoList")
	public  @ResponseBody Map<String, Object> queryResidenceQsInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
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
				params.put("dpno", key);
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
		List<Map<String, Object>> list = residenceQsInfoService.queryResidenceQsInfoList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
     * 	新增档案缺失信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ResidenceQsInfo residenceQsInfo = new ResidenceQsInfo();
		String dId = request.getParameter("dId");
		String m1 = request.getParameter("m1");
		String m2 = request.getParameter("m2");
		String dNo = request.getParameter("dNo");
		String m3 = request.getParameter("m3");
		String remark = request.getParameter("remark");
		 String fjparam=request.getParameter("fjParam");
    	 Integer staff= (request.getSession().getAttribute("uid")==null?null: Integer.valueOf(request.getSession().getAttribute("uid").toString()));
		residenceQsInfo.setdNo(dNo);
		residenceQsInfo.setUid(staff);
		try{
			residenceQsInfo.setdId(Integer.parseInt(dId));
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "档案ID为空，请确认该档案数据!");
		}
		residenceQsInfo.setM1(m1);
		residenceQsInfo.setM2(m2);
		residenceQsInfo.setM3(m3);
		residenceQsInfo.setRemark(remark);
		residenceQsInfoService.addResidenceQsInfo(residenceQsInfo,fjparam, response);
	}
	
	/**
     * 	修改档案缺失信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ResidenceQsInfo residenceQsInfo = new ResidenceQsInfo();
		String id = request.getParameter("id");
		String dId = request.getParameter("d_id");
		String m1 = request.getParameter("m1");
		String m2 = request.getParameter("m2");
		String dNo = request.getParameter("d_no");
		String m3 = request.getParameter("m3");
		String remark = request.getParameter("remark");
		 String fjparam=request.getParameter("fjParam");
    	 Integer staff= (request.getSession().getAttribute("uid")==null?null: Integer.valueOf(request.getSession().getAttribute("uid").toString()));
    	 residenceQsInfo.setUid(staff);
    	 residenceQsInfo.setId(Integer.parseInt(id));
		residenceQsInfo.setdNo(dNo);
		residenceQsInfo.setdId(Integer.parseInt(dId));
		residenceQsInfo.setM1(m1);
		residenceQsInfo.setM2(m2);
		residenceQsInfo.setM3(m3);
		residenceQsInfo.setRemark(remark);
		residenceQsInfoService.updateResidenceQsInfo(residenceQsInfo,fjparam, response);
	}
	
	/**
     * 	获取档案缺失信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryResidenceQsInfoByDid")
	public  @ResponseBody Map<String, Object> queryResidenceQsInfoByDid(HttpServletResponse response,HttpServletRequest request) throws Exception{
	
		Map<String, Object> params = new HashMap<String, Object>();
		String d_id = request.getParameter("d_id");
		if(StringUtils.isNotBlank(d_id)){
			params.put("d_id", d_id);
		}
		List<Map<String, Object>> list = residenceQsInfoService.queryResidenceQsInfoByDid(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	@RequestMapping("/delete")
	public @ResponseBody void delete(HttpServletResponse response,@RequestParam("ids[]") String [] ids)throws Exception{
		residenceQsInfoService.deleteResidenceQsInfos(ids, response);
	}
	
}
