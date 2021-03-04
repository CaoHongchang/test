package com.i84.earnpoint.zyzgksgl.controller;

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
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.ExamClassInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamClassInfoService;
import com.i84.earnpoint.zyzgksgl.service.ExamClassProjectService;

/**
 * @author bianql
 * 班级信息
 */
@Controller
@RequestMapping("/examClassInfo")
public class ExamClassInfoController extends ResultConstant{
	@Autowired
	private ExamClassInfoService examClassInfoService;
	@Autowired
	private ExamClassProjectService examClassProjectService;
	
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
		ExamClassInfo record = new ExamClassInfo();
		Map<String,Object> params = ResultConstant.paramSet(request);
		if(params.containsKey("classNum")){
			record.setClassNum("%"+String.valueOf(params.get("classNum"))+"%");
		}
		if(params.containsKey("projectName")){
			record.setProjectName("%"+String.valueOf(params.get("projectName"))+"%");
		}
		if(params.containsKey("className")){
			record.setClassName("%"+String.valueOf(params.get("className"))+"%");
		}
		if(params.containsKey("classSum")){
			record.setClassSum(StringUtils.isNotBlank(String.valueOf(params.get("classSum")))?Integer.parseInt(String.valueOf(params.get("classSum"))):null);
		}
		if(params.containsKey("openTime")){
			record.setOpenTime(StringUtils.isNotBlank(String.valueOf(params.get("openTime")))?DateUtil.getDate(DateUtil.OYYYY_MM_DD, String.valueOf(params.get("openTime"))):null);
		}
		record.setPage(page);
		record.setRows(rows);
		List<Map<String,Object>> list = examClassInfoService.queryList(record);
		PageInfo<Map<String,Object>> pageinfo=new PageInfo<Map<String,Object>>(list);
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
			String seqNo = examClassInfoService.getMaxNo();
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
	
	@RequestMapping("/save")
	public void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			String classNum = param.get("classNum").toString();
			String projectId = param.get("projectId").toString();
			String className = param.get("className").toString();
			String classSum = param.get("classSum").toString();
			String openTime = param.get("openTime").toString();
			/*初始化新增对象*/
			ExamClassInfo examClassInfo = new ExamClassInfo();
			examClassInfo.setClassNum(classNum);
			examClassInfo.setProjectId(Integer.parseInt(projectId));
			examClassInfo.setClassName(className);
			examClassInfo.setClassSum(Integer.parseInt(classSum));
			examClassInfo.setOpenTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, openTime));
			examClassInfo.setStatus("1");
			examClassInfo.setCreateTime(new Date());
			/*加入到表里去*/
			examClassInfoService.insertExamClassInfo(examClassInfo);
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/detail")
	@ResponseBody
	public  ExamClassInfo detail(HttpServletResponse response,HttpServletRequest request){
		String id = request.getParameter("id");
		if(StringUtils.isNotBlank(id))
			return examClassInfoService.getExamClassInfo(Integer.parseInt(id));
		else
			return null;
	}
	
	/**
	 * 自动分配学员
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/setStudent")
	public void setStudent(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(",");
			for(String id : idArray){
				Map<String,Object> map = examClassInfoService.getExamClass(Integer.parseInt(id));
				int count = Integer.parseInt(map.get("class_sum").toString())-Integer.parseInt(map.get("class_count").toString());
				if(count>0){
					List<Map<String,Object>> list = examClassProjectService.getCanAssign((Integer)map.get("project_id"));
					if(list.size()>0){
						examClassInfoService.setStudent(Integer.parseInt(id), count);
						resObject.put("flag", "0");
					}else{
						resObject.put("flag", "2");
					}
				}else{
					resObject.put("flag", "1");
				}
			}
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	@RequestMapping("/update")
	public void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			String className = param.get("className").toString();
			String classSum = param.get("classSum").toString();//班级人数上限
			String openTime = param.get("openTime").toString();
			String classId = param.get("classId").toString();
			//判断班级人数上限需要大于或等于当前班级人数
			Map<String,Object> m=examClassInfoService.getExamClass(Integer.parseInt(classId));
			if(m!=null && m.get("class_count")!=null){
				if(Integer.valueOf(classSum)<Integer.valueOf(m.get("class_count").toString())){
					resObject.put("flag", "-1");
					resObject.put("errorMsg", "班级人数上限需要大于或等于当前班级人数!");
					ResultConstant.write(response, resObject);
					return;
				}
			}
			ExamClassInfo examClassInfo = new ExamClassInfo();
			examClassInfo.setClassName(className);
			examClassInfo.setClassSum(Integer.parseInt(classSum));
			examClassInfo.setOpenTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD, openTime));
			examClassInfo.setClassId(Integer.parseInt(classId));
			examClassInfoService.updateByPrimaryKeySelective(examClassInfo);
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
	
	@RequestMapping("/del")
	public void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try{
			Map<String, Object> map = new HashMap<String, Object>();
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(",");
			for(String id : idArray){
				map.put("id", id);
				examClassInfoService.deleteExamClassInfo(Integer.parseInt(id));
			}
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}
}
