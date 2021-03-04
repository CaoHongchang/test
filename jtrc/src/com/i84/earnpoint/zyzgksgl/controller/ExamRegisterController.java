package com.i84.earnpoint.zyzgksgl.controller;

import java.util.Date;
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
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.ExamClassProject;
import com.i84.earnpoint.model.ExamProjectInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamClassProjectService;
import com.i84.earnpoint.zyzgksgl.service.ExamProjectInfoService;

/**
 * @author bianql
 * 报名信息管理
 */
@Controller
@RequestMapping("/examRegister")
public class ExamRegisterController extends ResultConstant{
	@Autowired
	private ExamProjectInfoService examProjectInfoService;
	@Autowired
	private ExamClassProjectService examClassProjectService;
	
	/**
	 * 查询培训项目
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getProjectList")
	@ResponseBody
	public  Map<String, Object> getProjectList(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		ExamProjectInfo record = new ExamProjectInfo();
		record.setStatus("1");
		String projectName = request.getParameter("projectName");
		if(StringUtils.isNotBlank(projectName)){
			record.setProjectName(projectName);
		}
		String projectNum = request.getParameter("projectNum");
		if(StringUtils.isNotBlank(projectNum)){
			record.setProjectNum(projectNum);
		}
		record.setPage(page);
		record.setRows(rows);
		List<ExamProjectInfo> list = examProjectInfoService.queryList(record);
		PageInfo<ExamProjectInfo> pageinfo=new PageInfo<ExamProjectInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 查询报名人员
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
		Map<String,Object> params = ResultConstant.paramSet(request);
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id)){
			record.setProjectId(Integer.parseInt(id));
		}
		if(params.containsKey("projectName")){
			record.setProjectName("%"+String.valueOf(params.get("projectName"))+"%");
		}
		if(params.containsKey("projectNum")){
			record.setProjectNum("%"+String.valueOf(params.get("projectNum"))+"%");
		}
		if(params.containsKey("examType")){
			record.setExamType(String.valueOf(params.get("examType")));
		}
		if(params.containsKey("name")){
			record.setUserName("%"+String.valueOf(params.get("name"))+"%");
		}
		if(params.containsKey("pnum")){
			record.setPnum("%"+String.valueOf(params.get("pnum"))+"%");
		}
		if(params.containsKey("tel")){
			record.setTel("%"+String.valueOf(params.get("tel"))+"%");
		}
		if(params.containsKey("auditStatus")){
			record.setAuditStatus(String.valueOf(params.get("auditStatus")));
		}
		record.setStatus("1");
		record.setPage(page);
		record.setRows(rows);
		List<Map<String,Object>> list = examClassProjectService.queryList(record);
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
			return examClassProjectService.getDetail(Integer.parseInt(id));
		else
			return null;
	}
	
	/**
	 * 审核
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/audit")
	public void audit(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		String userName = (String)request.getSession().getAttribute("realName");
		try{
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			String id = param.get("id").toString();
			if(StringUtils.isNotBlank(id)){
				String auditStatus = param.get("audit_status").toString();
				String auditOpinion = param.get("audit_opinion")!=null?param.get("audit_opinion").toString():null;
				ExamClassProject examClassProject = new ExamClassProject();
				examClassProject.setId(Integer.parseInt(id));
				examClassProject.setAuditStatus(auditStatus);
				examClassProject.setAuditOpinion(auditOpinion);
				examClassProject.setAuditTime(new Date());
				examClassProject.setAuditPerson(userName);
				examClassProjectService.audit(examClassProject);
				resObject.put("flag", "0");
			}else{
				resObject.put("flag", "-1");
			}
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
}
