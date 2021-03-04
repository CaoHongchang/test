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
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.ExamClassInfo;
import com.i84.earnpoint.model.ExamClassProject;
import com.i84.earnpoint.model.ExamProjectInfo;
import com.i84.earnpoint.model.ExamResultInfo;
import com.i84.earnpoint.model.ExamResultInfoImport;
import com.i84.earnpoint.model.ExamStudentImport;
import com.i84.earnpoint.model.ExamTicketInfo;
import com.i84.earnpoint.model.ExamTicketInfoImport;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.service.UserInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamClassInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamClassProjectService;
import com.i84.earnpoint.zyzgksgl.service.ExamProjectInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamResultInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamTicketInfoService;

/**
 * @author bianql
 * 学员信息管理
 */
@Controller
@RequestMapping("/examStudent")
public class ExamStudentController extends ResultConstant{
	@Autowired
	private ExamClassInfoService examClassInfoService;
	@Autowired
	private ExamResultInfoService examResultInfoService;
	@Autowired
	private ExamTicketInfoService examTicketInfoService;
	@Autowired
	private ExamClassProjectService examClassProjectService;
	@Autowired
	private ExamProjectInfoService examProjectInfoService;
	@Autowired
	private UserInfoService userInfoService;
	
	/**
	 * 班级列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryClassList")
	@ResponseBody
	public  Map<String, Object> queryClassList(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		ExamClassInfo record = new ExamClassInfo();
		record.setPage(page);
		record.setRows(rows);
		List<Map<String,Object>> list = examClassInfoService.queryList(record);
		PageInfo<Map<String,Object>> pageinfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 学员列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getStudentList")
	@ResponseBody
	public  Map<String, Object> getStudentList(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		ExamClassProject record = new ExamClassProject();
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			record.setClassId(Integer.parseInt(id));
		}
		Map<String,Object> params = ResultConstant.paramSet(request);
		if(params.containsKey("projectName")){
			record.setProjectName("%"+String.valueOf(params.get("projectName"))+"%");
		}
		if(params.containsKey("examType")){
			record.setExamType(String.valueOf(params.get("examType")));
		}
		if(params.containsKey("userName")){
			record.setUserName("%"+String.valueOf(params.get("userName"))+"%");
		}
		if(params.containsKey("pnum")){
			record.setPnum("%"+String.valueOf(params.get("pnum"))+"%");
		}
		record.setStatus("1");
		record.setPage(page);
		record.setRows(rows);
		List<Map<String,Object>> list = examClassProjectService.queryStudent(record);
		PageInfo<Map<String,Object>> pageinfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public  Map<String, Object> detail(HttpServletResponse response,HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id))
			return examClassProjectService.getStudentDetail(Integer.parseInt(id));
		else
			return null;
	}
	
	/**
	 * 导出成绩模板
	 * 
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/exportResult")
	public String exportResult(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("templates/result.xlsx");
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(path));
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();
			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "成绩模板.xlsx");
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
	 * 导入成绩
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importResult")
	public @ResponseBody void importResult(HttpServletRequest request, HttpServletResponse response)throws Exception {
		String cause="";
        boolean dataFlag = true;
        boolean flag = true;
        boolean repeatFlag = false;
        List<ExamResultInfoImport> resList = new ArrayList<ExamResultInfoImport>(); 
		try {
			String newFileName = ResultConstant.getRandNum(32)+".xlsx";
			File newFile = ResultConstant.fileupload(request, response, "temp/zyzgksgl/upload/",newFileName);
			if(newFile!=null){ 
	        	ImportExcel<ExamResultInfoImport> excelUtil = new ImportExcel<ExamResultInfoImport>(ExamResultInfoImport.class);
				List<ExamResultInfoImport> results = (List<ExamResultInfoImport>) excelUtil.importExcel(newFile); 
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
					for (ExamResultInfoImport tempVo : results) {
						errMsg = "";
						if(StringUtils.isBlank(tempVo.getClassNum())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "班级编码不能为空";
							}else{
								dataFlag = false;
								errMsg += ",班级编码不能为空";
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
							if(examResultInfoService.getExamResultInfo(tempVo.getClassNum(), tempVo.getCardId())!=null){
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
						if(StringUtils.isBlank(tempVo.getResultScore())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "成绩不能为空";
							}else{
								dataFlag = false;
								errMsg += ",成绩不能为空";
							}
						}else{
							Float score = Float.parseFloat(tempVo.getResultScore());
							if (score > 100 || score < 0) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "成绩只能是0-100之间的数值";
								}else{
									dataFlag = false;
									errMsg += ",成绩只能是0-100之间的数值";
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
	 * 保存成绩
	 * @param list
	 */
	@RequestMapping("/saveResult")
	@ResponseBody
	public Map<String, Object> saveResult(@RequestBody List<ExamResultInfoImport> list){
		boolean flag=false;
		String cause="";
		try {
			List<ExamResultInfo> data = new ArrayList<ExamResultInfo>();
			for(ExamResultInfoImport info:list){
				ExamResultInfo examResultInfo = new ExamResultInfo();
				examResultInfo.setClassNum(info.getClassNum());
				examResultInfo.setClassName(info.getClassName());
				examResultInfo.setCardId(info.getCardId());
				examResultInfo.setCreateTime(new Date());
				examResultInfo.setUserName(info.getUserName());
				examResultInfo.setResultScore(info.getResultScore());
				examResultInfo.setStatus("1");
				data.add(examResultInfo);
			}
			examResultInfoService.insertList(data);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);
	}
	
	/**
	 * 导出准考证模板
	 * 
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/exportTicket")
	public String exportTicket(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("templates/ticket.xlsx");
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(path));
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();
			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "准考证模板.xlsx");
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
	 * 导入准考证
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importTicket")
	public @ResponseBody void importTicket(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cause="";
        boolean dataFlag = true;
        boolean flag = true;
        boolean repeatFlag = false;
        List<ExamTicketInfoImport> resList = new ArrayList<ExamTicketInfoImport>(); 
		try {
			String newFileName = ResultConstant.getRandNum(32)+".xlsx";
			File newFile = ResultConstant.fileupload(request, response, "temp/zyzgksgl/upload/",newFileName);
			if(newFile!=null){ 
	        	ImportExcel<ExamTicketInfoImport> excelUtil = new ImportExcel<ExamTicketInfoImport>(ExamTicketInfoImport.class);
				List<ExamTicketInfoImport> results = (List<ExamTicketInfoImport>) excelUtil.importExcel(newFile); 
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
					for (ExamTicketInfoImport tempVo : results) {
						errMsg = "";
						if(StringUtils.isBlank(tempVo.getClassNum())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "班级编码不能为空";
							}else{
								dataFlag = false;
								errMsg += ",班级编码不能为空";
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
							if(examResultInfoService.getExamResultInfo(tempVo.getClassNum(), tempVo.getCardId())!=null){
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
						if(StringUtils.isBlank(tempVo.getExamType())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "考试类型不能为空";
							}else{
								dataFlag = false;
								errMsg += ",考试类型不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getProjectName())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "考试名称不能为空";
							}else{
								dataFlag = false;
								errMsg += ",考试名称不能为空";
							}
						}
						if(checkDate(tempVo.getExamDate()) != null){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "考试日期  " + tempVo.getExamDate();
							}else{
								errMsg += ",考试日期  " + tempVo.getExamDate();
							}
						}
						if(StringUtils.isNotBlank(tempVo.getExamDate())){
							try{
								formatter.parse(tempVo.getExamDate());
							}catch (Exception e) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "考试日期不为yyyy-MM-dd";
								}else{
									dataFlag = false;
									errMsg += ",考试日期不为yyyy-MM-dd";
								}
							}
						}
						if(StringUtils.isBlank(tempVo.getExamTime())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "考试时间不能为空";
							}else{
								dataFlag = false;
								errMsg += ",考试时间不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getSeatNum())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "座位号不能为空";
							}else{
								dataFlag = false;
								errMsg += ",座位号不能为空";
							}
						}
						if(StringUtils.isBlank(tempVo.getExamAddress())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "考试地点不能为空";
							}else{
								dataFlag = false;
								errMsg += ",考试地点不能为空";
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
	 * 保存准考证
	 * @param list
	 */
	@RequestMapping("/saveTicket") 
	@ResponseBody
	public Map<String, Object> saveTicket(@RequestBody List<ExamTicketInfoImport> list){
		boolean flag=false;
		String cause="";
		try {
			List<ExamTicketInfo> data = new ArrayList<ExamTicketInfo>();
			ExamClassInfo examClassInfo = null;
			for(ExamTicketInfoImport info:list){
				ExamTicketInfo examTicketInfo = new ExamTicketInfo();
				examClassInfo = examClassInfoService.getExamClassInfoByNum(info.getClassNum());
				if(examClassInfo!=null)
					examTicketInfo.setProjectId(examClassInfo.getProjectId());
				examTicketInfo.setCardId(info.getCardId());
				examTicketInfo.setCreateTime(new Date());
				examTicketInfo.setExamAddress(info.getExamAddress());
				examTicketInfo.setExamDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD, info.getExamDate()));
				examTicketInfo.setExamTime(info.getExamTime());
				examTicketInfo.setSeatNum(info.getSeatNum());
				examTicketInfo.setUserName(info.getUserName());
				examTicketInfo.setExamType(info.getExamType());
				examTicketInfo.setClassNum(info.getClassNum());
				examTicketInfo.setStatus("1");
				data.add(examTicketInfo);
			}
			examTicketInfoService.insertList(data);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);
	}
	
	/**
	 * 导出学员模板
	 * 
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/exportStudent")
	public String exportStudent(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String path = request.getSession().getServletContext().getRealPath("templates/student_info.xlsx");
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(path));
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();
			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "学员模板.xlsx");
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
	 * 导入学员
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importStudent")
	public @ResponseBody void importStudent(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String cause="";
        boolean dataFlag = true;
        boolean flag = true;
        boolean classFlag = true;
        boolean countFlag = true;
        boolean repeatFlag = true;
        List<ExamStudentImport> resList = new ArrayList<ExamStudentImport>(); 
		try {
			String newFileName = ResultConstant.getRandNum(32)+".xlsx";
			File newFile = ResultConstant.fileupload(request, response, "temp/zyzgksgl/upload/",newFileName);
			if(newFile!=null){ 
	        	ImportExcel<ExamStudentImport> excelUtil = new ImportExcel<ExamStudentImport>(ExamStudentImport.class);
				List<ExamStudentImport> results = (List<ExamStudentImport>) excelUtil.importExcel(newFile); 
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
					String errMsg,classNum = null;
					ExamClassInfo examClassInfo = null;
					UserInfo userInfo = null;
					ExamClassProject examClassProject = null;
					DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
					DateFormat formatter1 = new SimpleDateFormat("yyyy-MM");
					for (ExamStudentImport tempVo : results) {
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
							examClassInfo = examClassInfoService.getExamClassInfoByNum(tempVo.getClassNum());
							if(examClassInfo==null){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "班级编码不存在";
								}else{
									dataFlag = false;
									errMsg += ",班级编码不存在";
								}
							}else{
								if(StringUtils.isBlank(classNum)){
									classNum = tempVo.getClassNum();
								}else{
									if(!classNum.equals(tempVo.getClassNum()))
										classFlag = false;
								}
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
						}else{
							userInfo = userInfoService.getUserByPnum(tempVo.getCardId());
							if(userInfo!=null){
								if(!userInfo.getName().equals(tempVo.getUserName())){
									if(StringUtils.isBlank(errMsg)){
										dataFlag = false;
										errMsg = "姓名不符";
									}else{
										dataFlag = false;
										errMsg += ",姓名不符";
									}
								}
								examClassProject = new ExamClassProject();
								examClassProject.setProjectId(examClassInfo.getProjectId());
								examClassProject.setUserId(userInfo.getId());
								List<Map<String, Object>> list = examClassProjectService.queryList(examClassProject);
								if(list.size()>0){
									repeatFlag = false;
								}
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
						if(StringUtils.isBlank(tempVo.getSex())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "性别不能为空";
							}else{
								dataFlag = false;
								errMsg += ",性别不能为空";
							}
						}
						if(checkDates(tempVo.getBirthDate()) != null){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "出生年月不能为空";
							}else{
								errMsg += ",出生年月不能为空";
							}
						}
						/*if(StringUtils.isBlank(tempVo.getOrgCode())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "组织机构代码不能为空";
							}else{
								dataFlag = false;
								errMsg += ",组织机构代码不能为空";
							}
						}*/
						/*if(StringUtils.isBlank(tempVo.getWorkName())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "企业名称不能为空";
							}else{
								dataFlag = false;
								errMsg += ",企业名称不能为空";
							}
						}*/
						/*if(StringUtils.isBlank(tempVo.getApplyType())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "申请类别不能为空";
							}else{
								dataFlag = false;
								errMsg += ",申请类别不能为空";
							}*/
						//}else{
							/*if(!(tempVo.getApplyType().equals("A")||tempVo.getApplyType().equals("B")||tempVo.getApplyType().equals("C")||tempVo.getApplyType().equals("安全考评员"))){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "申请类别不是为A/B/C/安全考评员";
								}else{
									dataFlag = false;
									errMsg += ",申请类别不是为A/B/C/安全考评员";
								}
							}*/
						//}
						/*if(StringUtils.isBlank(tempVo.getDeclareType())){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "申报类型不能为空";
							}else{
								dataFlag = false;
								errMsg += ",申报类型不能为空";
							}
						}else{*/
							/*if(!(tempVo.getDeclareType().equals("首次申请")||tempVo.getDeclareType().equals("再次申请"))){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "申报类型不是首次申请/再次申请";
								}else{
									dataFlag = false;
									errMsg += ",申报类型不是首次申请/再次申请";
								}
							}*/
						//}
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
						if(StringUtils.isNotBlank(tempVo.getAppointment_time())){
							try{
								formatter1.parse(tempVo.getAppointment_time());
							}catch (Exception e) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "原职称聘任时间不为yyyy-MM";
								}else{
									dataFlag = false;
									errMsg += ",原职称聘任时间不为yyyy-MM";
								}
							}
						}
						
						/*if(StringUtils.isNotBlank(tempVo.getExpiryDate())){
							
						
							try{
								formatter.parse(tempVo.getExpiryDate());
							}catch (Exception e) {
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "到期时间不为yyyy-MM-dd";
								}else{
									dataFlag = false;
									errMsg += ",到期时间不为yyyy-MM-dd";
								}
							}
						}*/
						/*if(StringUtils.isNotBlank(tempVo.getContinueEdu())&&!(tempVo.getContinueEdu().equals("是")||tempVo.getContinueEdu().equals("否"))){
						
						
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "继续教育情况只能为是/否两种";
							}else{
								dataFlag = false;
								errMsg += ",继续教育情况只能为是/否两种";
							}
						}*/
						tempVo.setErrMsg(errMsg);
						resList.add(tempVo);
					}
					//验证导入学生数量
					if(classFlag&&examClassInfo!=null){
						Map<String,Object> map = examClassInfoService.getExamClass(examClassInfo.getClassId());
						if(Integer.parseInt(map.get("class_count").toString())>0){
							int count = Integer.parseInt(map.get("class_sum").toString())-Integer.parseInt(map.get("class_count").toString())-resList.size();
							if(count<0)
								countFlag = false;
						}else{
							int count = Integer.parseInt(map.get("class_sum").toString())-resList.size();
							if(count<0)
								countFlag = false;
						}
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
		jsonObject.put("classFlag", classFlag);//文件里的班级编号统一标识
		jsonObject.put("countFlag", countFlag);//班级人数上限标识
		jsonObject.put("repeatFlag", repeatFlag);//重复报名标识
		ResultConstant.write(response, jsonObject);
	}
	
	/**
	 * 保存学员
	 * @param list
	 */
	@RequestMapping("/saveStudent")
	@ResponseBody
	public Map<String, Object> saveStudent(@RequestBody List<ExamStudentImport> list,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		String userName = (String)request.getSession().getAttribute("realName");
		try {
			ExamClassProject examClassProject = null;
			ExamClassInfo examClassInfo = null;
			ExamProjectInfo examProjectInfo = null;
			ExamClassProject record = null;
			UserInfo userInfo = null;
			List<ExamClassProject> data = new ArrayList<ExamClassProject>();
			for(ExamStudentImport info : list){
				examClassInfo = examClassInfoService.getExamClassInfoByNum(info.getClassNum());
				if(examClassInfo!=null){
					record = new ExamClassProject();
					examProjectInfo = examProjectInfoService.getExamProjectInfo(examClassInfo.getProjectId());
					userInfo = userInfoService.getUserByPnum(info.getCardId());
					if(userInfo==null){
						userInfo=new UserInfo();
						userInfo.setPnum(info.getCardId());
						userInfo.setName(info.getUserName());
						userInfoService.insertUserInfo(userInfo);
						userInfo = userInfoService.getUserByPnum(info.getCardId());
					}
					record.setProjectId(examClassInfo.getProjectId());
					record.setUserId(userInfo.getId());
					examClassProject = examClassProjectService.getExamClassProject(record);
					if(examClassProject==null){
						examClassProject = new ExamClassProject();
					}
					if(examProjectInfo!=null){
						examClassProject.setExamType(examProjectInfo.getExamType());
						examClassProject.setProjectName(examProjectInfo.getProjectName());
						examClassProject.setProjectNum(examProjectInfo.getProjectNum());
					}
					
					examClassProject.setTitle(info.getTitle());
					examClassProject.setLearning_content(info.getLearning_content());
					examClassProject.setCumulative_hours(info.getCumulative_hours());
					examClassProject.setAppointment_time(info.getAppointment_time());
					examClassProject.setRegister_type(info.getRegister_type());
					
					examClassProject.setClassId(examClassInfo.getClassId());
					examClassProject.setProjectId(examClassInfo.getProjectId());
					examClassProject.setUserName(info.getUserName());
					examClassProject.setSex(info.getSex());
					examClassProject.setPnum(info.getCardId());
					examClassProject.setBirthDate(info.getBirthDate().substring(0, 3)+info.getBirthDate().substring(5));
					examClassProject.setCertificateNum(info.getCertificateNum());
					examClassProject.setCertificateTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, info.getCertificateTime()));
					examClassProject.setExpiryDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD, info.getExpiryDate()));
					examClassProject.setCity(info.getCity());
					examClassProject.setCompanyLevel(info.getCompanyLevel());
					examClassProject.setCompanyType(info.getCompanyType());
					examClassProject.setWorkName(info.getWorkName());
					examClassProject.setWorkYears(info.getWorkYears());
					examClassProject.setMajor(info.getMajor());
					examClassProject.setSchool(info.getSchool());
					examClassProject.setDegree(info.getDegree());
					examClassProject.setTel(info.getTel());
					examClassProject.setApplyType(info.getApplyType());
					examClassProject.setDeclareType(info.getDeclareType());
					examClassProject.setAuditStatus("审核通过");
					examClassProject.setAuditTime(new Date());
					examClassProject.setAuditPerson(userName);
					examClassProject.setCreateTime(new Date());
					examClassProject.setStatus("1");
					data.add(examClassProject);
				}
			}
			examClassProjectService.insertList(data);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);
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
	
	private String checkDates(String dateStr) {
		if (StringUtils.isBlank(dateStr)) {
			return "日期不能为空";
		}
		try {
			String[] dateStrGroup = dateStr.split("-");
			int month = Integer.parseInt(dateStrGroup[1]);
			if (month < 1 || month > 12) {
				return "错误的月份";
			}
			return null;
		} catch (Exception e) {
			return "日期格式不正确。 格式应为:YYYY-MM";
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
