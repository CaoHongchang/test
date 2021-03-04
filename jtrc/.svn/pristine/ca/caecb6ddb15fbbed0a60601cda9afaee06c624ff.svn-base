package com.i84.earnpoint.hkxxgl.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.hkxxgl.service.HkxxService;
import com.i84.earnpoint.service.UserInfoService;

@Controller
@RequestMapping("/hkxx")
public class HkxxController {
	
	@Autowired
	private HkxxService hkxxService;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@RequestMapping("/gethkxxlist")
	@ResponseBody
	public Map<String,Object> GetHkxxList(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		//查询条件
		String key = request.getParameter("key");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
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
		PageHelper.startPage(page, rows);
		List<Map<String, Object>> list = hkxxService.GetHkxxList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return ResultConstant.resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	
	@RequestMapping("/addHkxx")
	@ResponseBody
	public Map<String,Object> AddHkxx(HttpServletResponse response,HttpServletRequest request){
		String hkxxdata=request.getParameter("hkxxdata");
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			Map<String,Object> params=ResultConstant.fmSeriDecodeToMap(hkxxdata);
			resultMap= hkxxService.AddHkxx(params);
		}catch (Exception e) {
			resultMap.put("flag", false);
			resultMap.put("message", "系统异常！");
			e.printStackTrace();
		}
		return resultMap;
	}
	
	
	@RequestMapping("/updateHkxx")
	@ResponseBody
	public Map<String,Object> UpdateHkxx(HttpServletResponse response,HttpServletRequest request){
		String hkxxdata=request.getParameter("hkxxdata");
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			Map<String,Object> params=ResultConstant.fmSeriDecodeToMap(hkxxdata);
			resultMap= hkxxService.UpdateHkxx(params);
		}catch (Exception e) {
			resultMap.put("flag", false);
			resultMap.put("message", "系统异常！");
			e.printStackTrace();
		}
		return resultMap;
	}
	
	
	
	@RequestMapping("/getuserBydpno")
	@ResponseBody
	public Map<String,Object> getuserBydpno(HttpServletResponse response,HttpServletRequest request){
		Map<String,Object> param=new HashMap<String, Object>();
		param.put("dpno", request.getParameter("dpno"));
		return userInfoService.getuserBydpno(param);
	}
	
	@RequestMapping("/gethkxxInformation")
	@ResponseBody
	public Map<String,Object> GetHkxxInformation(HttpServletResponse response,HttpServletRequest request){
		Integer id=Integer.valueOf(request.getParameter("id"));
		return hkxxService.GetHkxxInformation(id);
	}
	
	@RequestMapping("/hkjc")
	@ResponseBody
	public Map<String,Object> Hkjc(HttpServletResponse response,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			String hkjcdata=request.getParameter("hkjcdata");
			resultMap=hkxxService.Hkjc(hkjcdata);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("flag", false);
			resultMap.put("message", "系统异常！");
		}
		return resultMap;
	}
	
	@RequestMapping("/getlatestHkjc")
	@ResponseBody
	public Map<String,Object> GetLatestHkjc(HttpServletResponse response,HttpServletRequest request){
		Integer id=Integer.valueOf(request.getParameter("id"));
		return hkxxService.GetLatestHkjc(id);
	}
	
	
	@RequestMapping("/hkgh")
	@ResponseBody
	public Map<String,Object> Hkgh(HttpServletResponse response,HttpServletRequest request){
		Map<String,Object> resultMap = new HashMap<String, Object>();
		try {
			String hkghdata=request.getParameter("hkghdata");
			resultMap=hkxxService.Hkgh(hkghdata);
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("flag", false);
			resultMap.put("message", "系统异常！");
		}
		return resultMap;
	}
	
	@RequestMapping("/GetHkxxHisInformation")
	@ResponseBody
	public Map<String,Object> GetHkxxHisInformation(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		//查询条件
		String key = request.getParameter("key");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
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
		PageHelper.startPage(page, rows);
		List<Map<String, Object>> list = hkxxService.GetHkxxHisInformation(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return ResultConstant.resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/GetHkxxHisInformation1")
	@ResponseBody
	public Map<String,Object> GetHkxxHisInformation1(HttpServletResponse response,HttpServletRequest request){
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		//查询条件
		String key = request.getParameter("key");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
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
		PageHelper.startPage(page, rows);
		List<Map<String, Object>> list = hkxxService.GetHkxxHisInformation1(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return ResultConstant.resultMap(list, pageinfo.getTotal(), true, null);
	}
}
