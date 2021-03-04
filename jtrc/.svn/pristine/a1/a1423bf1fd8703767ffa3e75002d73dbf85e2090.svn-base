package com.i84.earnpoint.zyzgksgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.ExamCertificateInfo;
import com.i84.earnpoint.model.ExamCertificateInfoImport;
import com.i84.earnpoint.model.ExamClassProject;
import com.i84.earnpoint.zyzgksgl.service.ExamCertificateInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamClassInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamClassProjectService;

/**
 * @author bianql 证书信息
 */
@Controller
@RequestMapping("/examCertificateInfo")
public class ExamCertificateInfoController extends ResultConstant {
	@Autowired
	private ExamCertificateInfoService examCertificateInfoService;
	@Autowired
	private ExamClassInfoService examClassInfoService;
	@Autowired
	private ExamClassProjectService examClassProjectService;

	/**
	 * 列表查询
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryList")
	@ResponseBody
	public Map<String, Object> queryList(HttpServletResponse response,
			HttpServletRequest request) {
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		ExamCertificateInfo record = new ExamCertificateInfo();
		Map<String,Object> params = ResultConstant.paramSet(request);
		if(params.containsKey("projectName")){
			record.setProjectName("%"+String.valueOf(params.get("projectName"))+"%");
		}
		if(params.containsKey("classNum")){
			record.setClassNum("%"+String.valueOf(params.get("classNum"))+"%");
		}
		if(params.containsKey("className")){
			record.setClassName("%"+String.valueOf(params.get("className"))+"%");
		}
		if(params.containsKey("cardId")){
			record.setCardId("%"+String.valueOf(params.get("cardId"))+"%");
		}
		if(params.containsKey("userName")){
			record.setUserName("%"+String.valueOf(params.get("userName"))+"%");
		}
		if(params.containsKey("certificateNum")){
			record.setCertificateNum("%"+String.valueOf(params.get("certificateNum"))+"%");
		}
		if(params.containsKey("certificateName")){
			record.setCertificateName("%"+String.valueOf(params.get("certificateName"))+"%");
		}
		if(params.containsKey("certificateType")){
			record.setCertificateType("%"+String.valueOf(params.get("certificateType"))+"%");
		}
		if(params.containsKey("certificateTimeBegin")){
			record.setCertificateTimeBegin(String.valueOf(params.get("certificateTimeBegin")));
		}
		if(params.containsKey("certificateTimeEnd")){
			record.setCertificateTimeEnd(String.valueOf(params.get("certificateTimeEnd")));
		}
		if(params.containsKey("expiryDateBegin")){
			record.setExpiryDateBegin(String.valueOf(params.get("expiryDateBegin")));
		}
		if(params.containsKey("expiryDateEnd")){
			record.setExpiryDateEnd(String.valueOf(params.get("expiryDateEnd")));
		}
		record.setPage(page);
		record.setRows(rows);
		List<Map<String, Object>> list = examCertificateInfoService.queryList(record);
		PageInfo<Map<String, Object>> pageinfo = new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}

	/**
	 * 删除
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/del")
	public void del(HttpServletResponse response, HttpServletRequest request)
			throws Exception {
		JSONObject resObject = new JSONObject();
		try {
			/* 获取查询条件 */
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(",");
			for (String id : idArray) {
				/* 删除 */
				examCertificateInfoService.delete(Integer.parseInt(id));
			}
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	/**
	 * 导出证书模板
	 * 
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/export")
	public String export(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("templates/certificate.xlsx");
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(path));
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();
			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "证书模板.xlsx");
			response.setHeader("Content-disposition", "attachment;" + finalFileName);
			response.setContentType("application/ms-excel");
			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 导入文件
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importExcel")
	@ResponseBody
	public void importExcel(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String cause="";
        boolean dataFlag = true;
        boolean flag = true;
        boolean repeatFlag = false;
        List<ExamCertificateInfoImport> resList = new ArrayList<ExamCertificateInfoImport>(); 
		try {
			String newFileName = ResultConstant.getRandNum(32)+".xlsx";
			File newFile = ResultConstant.fileupload(request, response, "temp/zyzgksgl/upload/",newFileName);
			if(newFile!=null){ 
	        	ImportExcel<ExamCertificateInfoImport> excelUtil = new ImportExcel<ExamCertificateInfoImport>(ExamCertificateInfoImport.class);
				List<ExamCertificateInfoImport> results = (List<ExamCertificateInfoImport>) excelUtil.importExcel(newFile); 
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
					String errMsg;
					ExamClassProject examClassProject = null;
					List<Map<String,Object>> list = null;
					DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					for (ExamCertificateInfoImport tempVo : results) {
						errMsg = "";
						if(StringUtils.isBlank(tempVo.getClassNum())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "班级编码不能为空";
							}else{
								dataFlag = false;
								errMsg += ",班级编码不能为空";
							}
						}else{
							if(examClassInfoService.getExamClassInfoByNum(tempVo.getClassNum())==null){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "班级编码不存在";
								}else{
									dataFlag = false;
									errMsg += ",班级编码不存在";
								}
							}
						}
						if(StringUtils.isBlank(tempVo.getClassName())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "班级名称不能为空";
							}else{
								dataFlag = false;
								errMsg += ",班级名称不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getCertificateName())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "证书名称不能为空";
							}else{
								dataFlag = false;
								errMsg += ",证书名称不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getCertificateType())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "证书类型不能为空";
							}else{
								dataFlag = false;
								errMsg += ",证书类型不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getCardId())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "身份证不能为空";
							}else{
								dataFlag = false;
								errMsg += ",身份证不能为空";
							}
						}
						if(StringUtils.isNotBlank(tempVo.getClassNum())&&StringUtils.isNotBlank(tempVo.getCardId())){
							examClassProject = new ExamClassProject();
							examClassProject.setPnum(tempVo.getCardId());
							examClassProject.setClassNum(tempVo.getClassNum());
							list = null;
							list = examClassProjectService.queryStudent(examClassProject);
							if(list.size()==0){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "此班级或人物不存在";
								}else{
									dataFlag = false;
									errMsg += ",此班级或人物不存在";
								}
							}
							if(examCertificateInfoService.getExamCertificateInfo(tempVo.getClassNum(), tempVo.getCardId())!=null){
								repeatFlag = true;
							}
						}
						if(StringUtils.isBlank(tempVo.getUserName())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "姓名不能为空";
							}else{
								dataFlag = false;
								errMsg += ",姓名不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getCertificateNum())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "证书编号不能为空";
							}else{
								dataFlag = false;
								errMsg += ",证书编号不能为空";
							}
						}
						if(checkDate(tempVo.getCertificateTime()) != null){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "发证时间不能为空";
							}else{
								errMsg += ",发证时间不能为空 ";
							}
						}
						if(StringUtils.isNotBlank(tempVo.getCertificateTime())){
							try{
								formatter.parse(tempVo.getCertificateTime());
							}catch (Exception e) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "发证时间不为yyyy-MM-dd";
								}else{
									dataFlag = false;
									errMsg += ",发证时间不为yyyy-MM-dd";
								}
							}
						}
						if(checkDate(tempVo.getExpiryDate()) != null){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "有效期至不能为空";
							}else{
								errMsg += ",有效期至不能为空";
							}
						}
						if(StringUtils.isNotBlank(tempVo.getExpiryDate())){
							try{
								formatter.parse(tempVo.getExpiryDate());
							}catch (Exception e) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "有效期至不为yyyy-MM-dd";
								}else{
									dataFlag = false;
									errMsg += ",有效期至不为yyyy-MM-dd";
								}
							}
						}
						tempVo.setErrMsg(errMsg);
						resList.add(tempVo);
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
		jsonObject.put("repeatFlag", repeatFlag);//数据重复标识
		ResultConstant.write(response, jsonObject);
	}
	
	/**
	 * 保存
	 * @param list
	 */
	@RequestMapping("/save")  
	public @ResponseBody Map<String, Object> save(@RequestBody List<ExamCertificateInfoImport> list){
		boolean flag=false;
		String cause="";
		try {
			List<ExamCertificateInfo> data = new ArrayList<ExamCertificateInfo>();
			for(ExamCertificateInfoImport info : list){
				ExamCertificateInfo examCertificateInfo = new ExamCertificateInfo();
				examCertificateInfo.setCardId(info.getCardId());
				examCertificateInfo.setClassNum(info.getClassNum());
				examCertificateInfo.setClassName(info.getClassName());
				examCertificateInfo.setUserName(info.getUserName());
				examCertificateInfo.setCertificateNum(info.getCertificateNum());
				examCertificateInfo.setCertificateTime(info.getCertificateTime());
				examCertificateInfo.setExpiryDate(info.getExpiryDate());
				examCertificateInfo.setCreateTime(new Date());
				examCertificateInfo.setCertificateName(info.getCertificateName());
				examCertificateInfo.setCertificateType(info.getCertificateType());
				examCertificateInfo.setStatus("1");
				data.add(examCertificateInfo);
			}
			examCertificateInfoService.insertList(data);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);
	}
	
	/**
	 * 打印
	 * @param response
	 * @param request
	 */
	@RequestMapping("/printInfo")  
	public @ResponseBody Map<String, Object> printInfo(HttpServletResponse response, HttpServletRequest request){
		String id = request.getParameter("id");
		Map<String, Object> resMap = new HashMap<String, Object>();
		if(StringUtils.isBlank(id)){
			return resultMap(false, "获取不到证书信息");
		}else{
			resMap.put("info", examCertificateInfoService.getPrintInfo(Integer.parseInt(id)));
			resMap.put("flag", true);
		}
		return resMap;
	}
	
	private String checkDate(String dateStr) {
		if (StringUtils.isBlank(dateStr)) {
			return "日期不能为空";
		}
		try {
			String[] dateStrGroup = dateStr.split("-");
			int year = Integer.parseInt(dateStrGroup[0]);
			int month = Integer.parseInt(dateStrGroup[1]);
			int day = Integer.parseInt(dateStrGroup[2]);
			if (month < 1 || month > 12) {
				return "错误的月份";
			}
			if (day < 1 || day > getMaxMonthDay(year, month)) {
				return "错误的天数";
			}
			return null;
		} catch (Exception e) {
			return "日期格式不正确。 格式应为:YYYY-MM-DD";
		}
	}
	
	private int getMaxMonthDay(int year, int month) {
		if (month == 2) {
			if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
				// 闰年
				return 29;
			} else {
				// 非闰年
				return 28;
			}
		} else {
			int[] bigMonth = { 1, 3, 5, 7, 8, 10, 12 };// 二叉树查询必须先排续
			if (Arrays.binarySearch(bigMonth, month) > 0) {
				return 31;
			} else {
				return 30;
			}
		}
	}
}
