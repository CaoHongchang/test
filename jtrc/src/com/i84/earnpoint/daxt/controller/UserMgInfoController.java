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
import java.util.Calendar;
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

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.daxt.service.ArchivesBaseInfoService;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.daxt.service.UserMgInfoService;
import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyImportInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * 人才管理信息
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/userMgInfoTrol")
public class UserMgInfoController   extends ResultConstant{

	@Autowired 
	public ResidenceGetoutInfoService residenceGetoutInfoService;
	
	@Autowired 
	public ArchivesBaseInfoService archivesBaseInfoService;
	
	@Autowired 
	public UserMgInfoService userMgInfoService;
	
	
	
	/**
     * 	资料操作日志列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryuserLogList")
	public  @ResponseBody Map<String, Object> queryuserLogList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
				
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)page = 1;	
		int rows = TextUtil.getInt(request.getParameter("rows"));
		if (rows == 0)rows = 10;	
		params.put("page", page);
		params.put("rows", rows);
		PageHelper.startPage(page, rows);
		String dpno=request.getParameter("dpno");
		params.put("dpno", dpno);
		//System.out.println(dpno);
		List<Map<String, Object>> list = userMgInfoService.queryuserLogList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);	 
	}
	
	
	/**查询最大的流水号
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/maxDpno")
	public  @ResponseBody Map<String, Object> maxDpno(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String dtype=request.getParameter("dtype");
		 Calendar calendar=Calendar.getInstance();
		 String year=calendar.get(Calendar.YEAR)+"";
		Map<String, Object> m=new HashMap<String, Object>();
        m.put("dtype",dtype);
		m= userMgInfoService.selectmaxDpno(m);
		if(m!=null){
			String da_dpno=m.get("maxDpno")==null?null:m.get("maxDpno").toString();
			if(StringUtils.isNotBlank(da_dpno)){
				da_dpno=dtype+String.valueOf(Long.valueOf(da_dpno.substring(1, da_dpno.length()))+1);
				da_dpno=dtype+year+da_dpno.substring(5);
				m.put("da_dpno", da_dpno);
			}else{
				year=year+"0000001";
				 m=new HashMap<String, Object>();
				 m.put("da_dpno", dtype+year);
		
			}
			
		}else{
			year=year+"0000001";
			 m=new HashMap<String, Object>();
			 m.put("da_dpno", dtype+year);
	
		}
		return ResultConstant.resultMap(m,true,"");

	}
	/**
     * 	人才管理信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryuserMgInfoList")
	public  @ResponseBody Map<String, Object> queryuserMgInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String key = request.getParameter("key");
		String isState = request.getParameter("isState");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if(StringUtils.isNotBlank(key)){
			params.put("dpno", key);
		}
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(age)){
			params.put("age", age);
		}
		if(StringUtils.isBlank(isState)){
			params.put("isState", "1");
		}
		if(StringUtils.isNotBlank(start)){
			params.put("start", start);
		}
		if(StringUtils.isNotBlank(end)){
			params.put("end",end);
		}
		PageHelper.startPage(page, rows);
		List<Map<String, Object>> list = userMgInfoService.queryResidenceQsInfoList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/getNextDpno")
	public void getNextDpno(HttpServletResponse response,HttpServletRequest request,String s) throws Exception{
		String date = DateUtil.getFormatDate("yyyy", new Date());

		String dpno = userMgInfoService.getNextDpno(date,s); //getNextDpno
		ResultConstant.write(response,date + dpno);
	}
	
	@RequestMapping("/getNextPno")
	public void getNextPno(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String date = DateUtil.getFormatDate("yyyy", new Date());
		String pno = userMgInfoService.getNextPno(date);
		ResultConstant.write(response,date + pno);
	}
	
	/**档案信息导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/daExport")  
	@ResponseBody
	public void daExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			userMgInfoService.daExport(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
	/**档案信息批量导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/daAllExport")  
	@ResponseBody
	public void daAllExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			userMgInfoService.daAllExport(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	/**
	 * 检查系统中是否存在该身份证号码，并返回对应的档案号
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/checkIsPnumExist")
    public @ResponseBody Map<String,Object> checkIsPnumExist(HttpServletResponse response,HttpServletRequest request)throws Exception{
		String pnum=request.getParameter("pnum");
		return userMgInfoService.checkIsPnumExistInSystem(pnum);
    }

}
