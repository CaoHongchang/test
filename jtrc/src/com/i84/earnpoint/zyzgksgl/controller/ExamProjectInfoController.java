package com.i84.earnpoint.zyzgksgl.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.ExamProjectInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamProjectInfoService;

/**
 * @author bianql
 * 项目培训信息
 */
@Controller
@RequestMapping("/examProjectInfo")
public class ExamProjectInfoController extends ResultConstant{

	@Autowired
	private ExamProjectInfoService examProjectInfoService;
	
	/**
	 * 列表查询
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/queryList")
	@ResponseBody
	public  Map<String, Object> queryList(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		ExamProjectInfo record = new ExamProjectInfo();
		Map<String,Object> params = ResultConstant.paramSet(request);
		if(params.containsKey("projectName")){
			record.setProjectName("%"+String.valueOf(params.get("projectName"))+"%");
		}
		if(params.containsKey("projectNum")){
			record.setProjectNum("%"+String.valueOf(params.get("projectNum"))+"%");
		}
		if(params.containsKey("hostUnit")){
			record.setHostUnit("%"+String.valueOf(params.get("hostUnit"))+"%");
		}
		if(params.containsKey("examObject")){
			record.setExamObject("%"+String.valueOf(params.get("examObject"))+"%");
		}
		if(params.containsKey("examContent")){
			record.setExamContent("%"+String.valueOf(params.get("examContent"))+"%");
		}
		if(params.containsKey("issueUnit")){
			record.setIssueUnit("%"+String.valueOf(params.get("issueUnit"))+"%");
		}
		if(params.containsKey("examType")){
			record.setExamType(String.valueOf(params.get("examType")));
		}
		if(params.containsKey("examTerm")){
			record.setExamTerm(StringUtils.isNotBlank(String.valueOf(params.get("examTerm")))?Integer.parseInt(String.valueOf(params.get("examTerm"))):null);
		}
		if(params.containsKey("status")){
			record.setStatus(String.valueOf(params.get("status")));
		}
		record.setPage(page);
		record.setRows(rows);
		List<ExamProjectInfo> list = examProjectInfoService.queryList(record);
		PageInfo<ExamProjectInfo> pageinfo=new PageInfo<ExamProjectInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 获取项目编号
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryNo")
	@ResponseBody
	public  Map<String, Object> queryNo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String, Object> resMap = new HashMap<String, Object>();
		try {
			String seqNo = examProjectInfoService.getMaxNo();
			if(StringUtils.isNotBlank(seqNo)){
				seqNo = seqNo.replaceAll("^(0+)", ""); 
				if((Integer.parseInt(seqNo)+1)/10 == 0){
					seqNo = "00000" + (Integer.parseInt(seqNo)+1);
				}else if((Integer.parseInt(seqNo)+1)/10 == 1){
					seqNo = "0000" + (Integer.parseInt(seqNo)+1);
				}else if((Integer.parseInt(seqNo)+1)/10 == 2){
					seqNo = "000" + (Integer.parseInt(seqNo)+1);
				}else if((Integer.parseInt(seqNo)+1)/10 == 3){
					seqNo = "00" + (Integer.parseInt(seqNo)+1);
				}else if((Integer.parseInt(seqNo)+1)/10 == 4){
					seqNo = "0" + (Integer.parseInt(seqNo)+1);
				}else if((Integer.parseInt(seqNo)+1)/10 == 5){
					seqNo = "" + (Integer.parseInt(seqNo)+1);
				}
			}else{
				seqNo = "000001";
			}
			 
			resMap.put("seqNo", seqNo);
			resMap.put("flag", true);
		} catch (Exception e) {
			e.printStackTrace();
			resMap.put("flag", false);
			resMap.put("cause", e.getMessage());
		}
		return resMap;
	}
	
	/**@RequestParam 
	 * 这里这里用的是MultipartFile[] myfiles参数,所以前台就要用<input type="file" name="myfiles"/>
	 * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
	 */
	@RequestMapping("/fileUpload")
	@ResponseBody
	public void fileUpload(@RequestParam MultipartFile idFile,HttpServletResponse response,HttpServletRequest request) throws Exception{
		//设置响应给前台内容的数据格式
		response.setContentType("text/plain; charset=UTF-8");
		//设置响应给前台内容的PrintWriter对象
		PrintWriter out = response.getWriter();
		String retxt=null;
		try {
			//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
			//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
			String realPath = new File(getClass().getClassLoader().getResource("")
					.getPath()).getParentFile().getParentFile().getPath()
					+ "/upload/examFile/";
			realPath = realPath.replace("%20", " ");
			//判断路径是否存在，不存在则创建
			File dir = new File(realPath);
			if(!dir.isDirectory())
			    dir.mkdir();
			//上传文件的原名(即上传前的文件名字)
			String originalFilename = null;
			String fileType = null;
			//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
			//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
			//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
			if(idFile.isEmpty()){
				retxt="1#请选择文件后上传";
			}else if(idFile.getSize() > 1024*1024*2){
				retxt="1#附件大小超过范围";
			}else{
				originalFilename = idFile.getOriginalFilename();
				fileType=originalFilename.indexOf(".")!=-1?originalFilename.substring(originalFilename.lastIndexOf(".")+1, originalFilename.length()):null;
				if(StringUtils.isBlank(fileType)){
					retxt="1#文件类型为空";
				}
				fileType = fileType.toLowerCase();
				if(!fileType.equals("rar")&&!fileType.equals("doc")&&!fileType.equals("docx")&&!fileType.equals("zip")){
					retxt="1#文件类型允许为DOC、DOCX、ZIP、RAR";
				}else{
					String url = realPath+"/"+originalFilename;
					try {
						//这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
						//此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
						BufferedInputStream in = new BufferedInputStream(idFile.getInputStream());//获得文件输入流
						FileOutputStream a = new FileOutputStream(new File(url));
						BufferedOutputStream output = new BufferedOutputStream(a);
						Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
					} catch (IOException e) {
						e.printStackTrace();
						retxt="1#文件上传失败，请重试！！";
					}
				}
			}
			if(StringUtils.isBlank(retxt)){
				response.setStatus(200);
				retxt = "0#" + realPath+"#"+originalFilename;
			}
			response.getWriter().print(retxt);
		} catch (Exception e) {
			e.printStackTrace();
			retxt="1#上传附件失败#" + e.getMessage();
			response.getWriter().print(retxt);
		}finally{
			out.close();
		}
	}
	
	/**
	 * 保存
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			String project_num = param.get("project_num").toString();
			String project_name = param.get("project_name").toString();
			String exam_type = param.get("exam_type").toString();
			String exam_object = param.get("exam_object").toString();
			String host_unit = param.get("host_unit").toString();
			String exam_content = param.get("exam_content").toString();
			String issue_unit = param.get("issue_unit").toString();
			String exam_term = param.get("exam_term").toString();
			String begin_time = param.get("begin_time").toString();
			String end_time = param.get("end_time").toString();
			String file_url = request.getParameter("file_url").toString();
			/*初始化新增对象*/
			ExamProjectInfo examProjectInfo = new ExamProjectInfo();
			examProjectInfo.setProjectNum(project_num);
			examProjectInfo.setProjectName(project_name);
			examProjectInfo.setExamType(exam_type);
			examProjectInfo.setExamObject(exam_object);
			examProjectInfo.setHostUnit(host_unit);
			examProjectInfo.setExamContent(exam_content);
			examProjectInfo.setIssueUnit(issue_unit);
			examProjectInfo.setExamTerm(StringUtils.isNotBlank(exam_term)?Integer.parseInt(exam_term):null);
			examProjectInfo.setBeginTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, begin_time));
			examProjectInfo.setEndTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, end_time));
			examProjectInfo.setStatus("1");
			examProjectInfo.setCreateTime(new Date());
			if(StringUtils.isNotBlank(file_url)){
				examProjectInfo.setFileUrl(file_url);	 
			}
			/*加入到表里去*/
			examProjectInfoService.insertExamProjectInfo(examProjectInfo);
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 修改
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/update")
	public void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			/*获取编辑对象值*/
			String projectNum = request.getParameter("projectNum");
			String projectName = request.getParameter("projectName");
			String examType = request.getParameter("examType");
			String examObject = request.getParameter("examObject");
			String hostUnit = request.getParameter("hostUnit");
			String examContent = request.getParameter("examContent");
			String issueUnit = request.getParameter("issueUnit");
			String examTerm = request.getParameter("examTerm");
			String beginTime = request.getParameter("beginTime");
			String endTime = request.getParameter("endTime");
			String fileUrl = request.getParameter("fileUrl");
			String id = request.getParameter("id");
			String projectAddress = request.getParameter("projectAddress");
			/*初始化编辑对象*/
			ExamProjectInfo examProjectInfo = new ExamProjectInfo();
			examProjectInfo.setId(Integer.parseInt(id));
			examProjectInfo.setProjectNum(projectNum);
			examProjectInfo.setProjectName(projectName);
			examProjectInfo.setExamType(examType);
			examProjectInfo.setExamObject(examObject);
			examProjectInfo.setHostUnit(hostUnit);
			examProjectInfo.setExamContent(examContent);
			examProjectInfo.setIssueUnit(issueUnit);
			examProjectInfo.setExamTerm(StringUtils.isNotBlank(examTerm)?Integer.parseInt(examTerm):null);
			examProjectInfo.setBeginTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, beginTime));
			examProjectInfo.setEndTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, endTime));
			examProjectInfo.setProjectAddress(projectAddress);
			if(StringUtils.isNotBlank(fileUrl)){
				examProjectInfo.setFileUrl(fileUrl);	 
			}
			/*更新到到表里去*/
			examProjectInfoService.updateExamProjectInfo(examProjectInfo);
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 删除
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/del")
	public void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			/*获取查询条件*/
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(",");
			for(String id : idArray){
				/*删除*/
				examProjectInfoService.deleteExamProjectInfo(Integer.parseInt(id));
			}
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 设置有效性
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/setStatus")
	public void setStatus(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			String ids = request.getParameter("ids");
			String status = request.getParameter("status");
			ExamProjectInfo examProjectInfo = null;
			String[] idArray = ids.split(",");
			for(String id : idArray){
				examProjectInfo = new ExamProjectInfo();
				examProjectInfo.setStatus(status);
				examProjectInfo.setId(Integer.parseInt(id));
				examProjectInfoService.setStatus(examProjectInfo);
			}
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	@RequestMapping("/getAll")
	@ResponseBody
	public List<ExamProjectInfo> getAll(HttpServletResponse response,HttpServletRequest request){
		return examProjectInfoService.getAll();
	}
}
