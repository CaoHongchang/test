package com.i84.earnpoint.gdcl.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.omg.CORBA.Request;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.gdcl.BO.SerchBO;
import com.i84.earnpoint.gdcl.service.SortService;


/**
 * 对材料进行排序的controller，添加人：邓祯。添加时间：2017年3月19日12:04:14
 */

@Controller
@RequestMapping("/clsort")
public class SortController {
	
	@Autowired
	private SortService service;
	
	@RequestMapping("/save")
	public @ResponseBody Map<String,Object> Save(HttpServletRequest request,HttpServletResponse response){
		String rows=request.getParameter("row");
		List<SerchBO> list =JsonUtil.getList4Json(rows, SerchBO.class);
		
		return service.Svae(list);
	}
	
	/**
	 * 材料的删除
	 * @author 邓祯
	 * 2017年3月26日18:06:34
	 */
	@RequestMapping("/delete")
	@ResponseBody
	public Map<String,Object> Delete(HttpServletRequest request,HttpServletResponse response){
		Integer id=TextUtil.getOInteger(request.getParameter("id"));
		Integer type=TextUtil.getOInteger(request.getParameter("type"));
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("id", id);
		map.put("type", type);
		map.put("time", new Date());
		return service.delete(map);
	}
	
	@RequestMapping("/updatePotho")
	@ResponseBody
	public Map<String,Object> updatePotho(HttpServletRequest request,HttpServletResponse response){
		String aid=request.getParameter("aid");
        String fileType=request.getParameter("fileType");
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("aid", aid);
		map.put("file_type", fileType);
		
		return service.updatePotho(map);
	}
	
	

}
