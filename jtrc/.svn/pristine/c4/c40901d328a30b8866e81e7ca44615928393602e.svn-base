package com.i84.earnpoint.daxt.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
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
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.daxt.service.ArchivesMoneyInfoService;
import com.i84.earnpoint.daxt.service.ResidenceService;
import com.i84.earnpoint.model.ArchivesMoneyImportInfo;
import com.i84.earnpoint.model.ArchivesMoneyInfo;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.zxxx.service.UserBgInfoService;

import freemarker.template.SimpleDate;

/**
 * 档案缴费信息管理
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/archivesMoneyContr")
public class ArchivesMoneyInfoController extends ResultConstant{
	@Autowired
	public ArchivesMoneyInfoService archivesMoneyInfoService;
	
	/**
     * 	获取档案缴费信息列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryArchivesMoneyList")
	public  @ResponseBody Map<String, Object> queryArchivesMoneyList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String,Object> params = ResultConstant.paramSet(request);
		String ar_no = request.getParameter("ar_no");
		if(!"null".equals(ar_no) && !"".equals(ar_no)){
			params.put("ar_no", ar_no);
		}
		String pnum=request.getParameter("pnum");
		String name=request.getParameter("name");
		String sdate = request.getParameter("sdate");
		String edate = request.getParameter("edate");
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(sdate)){
			params.put("sdate", sdate);
		}
		if(StringUtils.isNotBlank(edate)){
			params.put("edate", edate);
		}
		List<ArchivesMoneyInfo> list = archivesMoneyInfoService.queryArchivesMoneyList(params);
		PageInfo<ArchivesMoneyInfo> pageinfo = new PageInfo<ArchivesMoneyInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	/**
	 * 导出模板
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportTemp")
	public String exportTemp(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String path = request.getSession().getServletContext().getRealPath("templates/jfxx.xlsx");
		 
		// 从请求参数获取附件ID并查询附件信息
		try{
			//InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
			InputStream is = new BufferedInputStream(new FileInputStream(path));

			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// 设置响应类型为
			response.reset();
			String finalFileName ="缴费信息模板.xlsx";// new String("缴费信息模板.xlsx".getBytes(), "ISO8859-1");
			response.setHeader("Content-Disposition","attachment; "+encodeFilename2(request,finalFileName));
			response.setContentType("application/octet-stream;charset=UTF-8");

			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	} 
	/**缴费导入
	 * @param response
	 * @param request
	 */
	@SuppressWarnings("static-access")
	@RequestMapping("/jfUpload") 
	 public @ResponseBody Map<String, Object> jfUpload(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,  
	            HttpServletRequest request, HttpServletResponse response)  
	            throws Exception {
	  	JSONObject resObject = new JSONObject();
	  	JSONArray array = new JSONArray();
	  	List<ArchivesMoneyImportInfo> yglist=null;
	  	boolean flag=false;
		String dateFlag="";
		String cause="";
		try {
			/*获取导入文件类型*/
			DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem(); 
	        File f = fi.getStoreLocation();/**/
	        if(f != null){
				//读取导入的文件
				ImportExcel<ArchivesMoneyImportInfo> importExcel = new ImportExcel<ArchivesMoneyImportInfo>(ArchivesMoneyImportInfo.class);
				List<ArchivesMoneyImportInfo> results = (List<ArchivesMoneyImportInfo>) importExcel.importExcel(f);
				
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					if(results.size()>1000){
						return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
					}
					Map<String,String> map1 = new HashMap<String,String>();
					yglist = new ArrayList<ArchivesMoneyImportInfo>();
					int i = 0;
					for (ArchivesMoneyImportInfo tempObj : results) {
						/*1.判断身份证号、缴费日期、缴费金额为必填项，否则错误提示"【字段】必须填写"
						2.身份证号必须在档案系统中存在，否则错误提示"身份证不存在"
						3.缴费金额必须＞0，否则错误提示"缴费金额必须大于0"*/
						 String errMsg = "";
						 String m = tempObj.getM();
						 if(StringUtils.isBlank(m)){
							 errMsg += ",缴费金额不能为空";
						 }
						 if(Float.parseFloat(m)<=0){
							 errMsg += ",缴费金额必须大于0";
						 }
						 
						 String jfDate = tempObj.getJfDate();
						 if(StringUtils.isBlank(jfDate)){
							 errMsg += ",缴费日期必填";
						 }
						 if(StringUtils.isNotBlank(jfDate)){
							 DateUtil dateUtil = new DateUtil();
							 if(!dateUtil.valid("yyyy-MM-dd", jfDate)){
								 errMsg += ",缴费日期格式出差，正确格式：yyyy-MM-dd";
							 } 
						 }
						 //暂时缺身份证不存在
						 if(errMsg.length() > 0){
							tempObj.setErrMsg(errMsg);
						 }
						 yglist.add(tempObj);
					 }
					return ResultConstant.resultMap(yglist, true, null);
				}else{
					return ResultConstant.resultMap(false,"文件中未上传任何数据");

				}
			}else{
				cause="数据上传异常";
			}

		} catch (Exception e) {
			e.printStackTrace();
			resObject.put("flag", "1");
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
		return resObject;
	  }	
	
	/**添加缴费情况
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveJf")  
	public  @ResponseBody Map<String, Object> saveJf(@RequestBody List<ArchivesMoneyImportInfo> list){
		boolean flag=false;
		String cause="";
		try {
			archivesMoneyInfoService.saveJf(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="新增缴费信息异常";
			
		}
		return ResultConstant.resultMap(flag,cause);  
	}
	/**报名导入兼容ie
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/jfUploadIe")  
	public  @ResponseBody void jfUploadIe(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		String cause="";
        boolean dataFlag = true;
        boolean flag = true;
        
        List<ArchivesMoneyImportInfo> resList = new ArrayList<ArchivesMoneyImportInfo>(); 
		
		try {
			String newFileName = ResultConstant.getRandNum(32)+".xlsx";
			File newFile = ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
			if(newFile!=null){ 

	        	ImportExcel<ArchivesMoneyImportInfo> excelUtil = new ImportExcel<ArchivesMoneyImportInfo>(ArchivesMoneyImportInfo.class);
				List<ArchivesMoneyImportInfo> results = (List<ArchivesMoneyImportInfo>) excelUtil.importExcel(newFile); 
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
					Map<String, String> lackMap= excelUtil.isTitle(newFile); 
					if(lackMap != null && lackMap.size() > 0){
						String title="";
						for(Map.Entry<String, String>  m : lackMap.entrySet()){
							title+=" "+m.getValue();
						}
						JSONObject jsonObject = new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "导入文件标题缺失："+title);
						ResultConstant.write(response, jsonObject);
						return;

					}
					
					for (ArchivesMoneyImportInfo tempObj : results) { 
						/*1.判断身份证号、缴费日期、缴费金额为必填项，否则错误提示"【字段】必须填写"
						2.身份证号必须在档案系统中存在，否则错误提示"身份证不存在"
						3.缴费金额必须＞0，否则错误提示"缴费金额必须大于0"*/
						 String errMsg = "";
						 String m = tempObj.getM();
						 try{
						 if(StringUtils.isBlank(m)){
							 errMsg += ",缴费金额不能为空";
						 }
						 if(Float.parseFloat(m)<=0){
							 errMsg += ",缴费金额必须大于0";
						 }
						 }catch(Exception e){
							 errMsg +="缴费金额必须为大于0的数字";
						 }
						 
						 String jfDate = tempObj.getJfDate();
						 if(StringUtils.isBlank(jfDate)){
							 errMsg += ",缴费日期必填";
						 }
						 if(StringUtils.isNotBlank(jfDate)){
							 DateUtil dateUtil = new DateUtil();
							 if(!dateUtil.valid("yyyy-MM-dd", jfDate)){
								 errMsg += ",缴费日期格式出错，正确格式：yyyy-MM-dd";
							 } 
						 }
						 //暂时缺身份证不存在
						 
						 if(errMsg.length() > 0){
							tempObj.setErrMsg(errMsg);
							dataFlag = false;
						 }
						 resList.add(tempObj);
					}
				}else{
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "文件中未上传任何数据");
					ResultConstant.write(response, jsonObject);
					return;
				}
			}else{
				cause="数据上传异常";
				flag = false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			cause =  e.getMessage();
			flag = false;
		}
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", resList);
		jsonObject.put("flag", flag);//错误标识
		jsonObject.put("cause", cause);
		jsonObject.put("dateFlag", dataFlag);//文件里的数据错误标识
		ResultConstant.write(response, jsonObject);
	}
	
	/**修改缴费情况
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/updateJf")  
	public  @ResponseBody Map<String, Object> updateJf(@RequestParam Map<String,Object> param,HttpServletResponse response){
		boolean flag=false;
		String cause="";
		try {
			ArchivesMoneyInfo record=new ArchivesMoneyInfo();
			record.setArNo(TextUtil.getString(param.get("arNo")));
			record.seteDate(TextUtil.getString(param.get("eDate")));
			record.setsDate(TextUtil.getString(param.get("sDate")));
			record.setJfDate(TextUtil.getString(param.get("jfDate")));
			if(param.containsKey("m")){
				String m=TextUtil.getString(param.get("m"));
			  record.setM(Float.valueOf(m));
			}
			record.setpNo(TextUtil.getString(param.get("pNo")));
			record.setJfName(TextUtil.getString(param.get("jfName")));
			record.setJfType(TextUtil.getString(param.get("jfType")));
			record.setProxyName(TextUtil.getString(param.get("proxyName")));
			record.setId(TextUtil.getInt(TextUtil.getString(param.get("id"))));
			archivesMoneyInfoService.updateJf(record);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据修改异常";
		}
		return ResultConstant.resultMap(flag,cause);  
	}
	
	@RequestMapping("/addJf")
	public  @ResponseBody Map<String, Object> addJf(@RequestParam Map<String,Object> param,HttpServletResponse response){
		boolean flag=false;
		String cause="";
		try {
			ArchivesMoneyInfo record=new ArchivesMoneyInfo();
			record.setArNo(TextUtil.getString(param.get("arNo")));
			record.seteDate(TextUtil.getString(param.get("eDate")));
			record.setsDate(TextUtil.getString(param.get("sDate")));
			record.setJfDate(TextUtil.getString(param.get("jfDate")));
			if(param.containsKey("m")){
				String m=TextUtil.getString(param.get("m"));
			  record.setM(Float.valueOf(m));
			}
			record.setpNo(TextUtil.getString(param.get("pNo")));
			record.setJfName(TextUtil.getString(param.get("jfName")));
			record.setJfType(TextUtil.getString(param.get("jfType")));
			record.setProxyName(TextUtil.getString(param.get("proxyName")));
			archivesMoneyInfoService.addJf(record);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			if(e.getMessage()!=null&&e.getMessage().contains("for key")){
				cause="新增缴费信息失败：新增的档案编号已经存在";
			}else{
			cause="新增缴费信息异常";
			}
			}
		return ResultConstant.resultMap(flag,cause);  
	}
	/**删除缴费情况
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/deleteJf")  
	public  @ResponseBody void deleteJf(@RequestParam("ids[]") String [] ids,HttpServletResponse response)throws Exception{
		archivesMoneyInfoService.deleteJf(ids, response);
	}
}
