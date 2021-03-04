package com.i84.earnpoint.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.soap.Text;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.DispatchingManagement;
import com.i84.earnpoint.service.DispatchingManagementService;




@Controller
@RequestMapping("/pqgls")
public class DispatchingManagementController {

	@Autowired
	private DispatchingManagementService dispatchingManagementService;
	@RequestMapping("/list")
	public void listAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        page = page == 0 ? 1 : page;
        int rows=TextUtil.getInt(request.getParameter("rows"));
        String id =request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String type = request.getParameter("type");
        String url = request.getParameter("url");
        DispatchingManagement dispatchingManagement=new DispatchingManagement();
        dispatchingManagement.setId(id);
        dispatchingManagement.setTitle(title);
        dispatchingManagement.setContent(content);
        dispatchingManagement.setType(type);
        dispatchingManagement.setUrl(url);
        PageHelper.startPage(page, rows);
        List<DispatchingManagement> dispatchingManagements = dispatchingManagementService.listAdverInfo(dispatchingManagement);
        PageInfo<DispatchingManagement>  pageInfo=new PageInfo<DispatchingManagement>(dispatchingManagements);
        JSONObject objs = new JSONObject();
        JSONArray jArray = new JSONArray();
        for (int i = 0; i < dispatchingManagements.size(); i++) {
        	JSONObject jobj = new JSONObject();
        	DispatchingManagement mi = dispatchingManagements.get(i);
        	jobj.put("id", mi.getId());
            jobj.put("title", mi.getTitle());
            jobj.put("content", mi.getContent());
            jobj.put("type", mi.getType());
            jobj.put("url", mi.getUrl());
            jArray.add(jobj);
        }
        objs.put("rows", jArray);
        objs.put("total", pageInfo.getTotal());
        objs.put("flag", true);
        objs.put("cause", null);
        response.getWriter().write(objs.toString());
        
	}
	
	 @RequestMapping("/updateAdverInfo")
	    public void updateAdverInfo(HttpServletRequest request,
	            HttpServletResponse response) throws Exception {
		 
		  response.setCharacterEncoding("utf-8");
		  String id =request.getParameter("id");
	        String title = request.getParameter("title");
	        String content = request.getParameter("content");
	        String type = request.getParameter("type");
	        String url = request.getParameter("url");
	        try{
	            
	            
	        	DispatchingManagement dispatchingManagement = dispatchingManagementService.selectAdverInfoById(id);
	            if(dispatchingManagement==null){
	            	dispatchingManagement =new DispatchingManagement();
	            }
	            dispatchingManagement.setId(id);
	            dispatchingManagement.setTitle(title);
	            dispatchingManagement.setContent(content);
	            dispatchingManagement.setType(type);
	            dispatchingManagement.setUrl(url);
	            int count = dispatchingManagementService.updateAdverInfo(dispatchingManagement);
	            if (count > 0) {
	                response.getWriter().write("1");
	            } else {
	                response.getWriter().write("修改内容失败！");
	            }
	        }catch(Exception e){
	            response.getWriter().write(e.getMessage());
	        }
	 }
}				

