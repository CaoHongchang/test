package com.i84.earnpoint.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.AdverInfo;
import com.i84.earnpoint.model.CenterIntroduction;
import com.i84.earnpoint.service.CenterIntroductionService;

@Controller
@RequestMapping("/zxjjgl")
public class CenterIntroductionController {
	@Autowired
	private CenterIntroductionService centerIntroductionService;
	
	@RequestMapping("/list")
	public void listAdverInfo(HttpServletRequest request,
            HttpServletResponse response) throws Exception {
        response.setCharacterEncoding("utf-8");
        int page = TextUtil.getInt(request.getParameter("page"));
        page = page == 0 ? 1 : page;
        int rows=TextUtil.getInt(request.getParameter("rows"));
        Integer id =TextUtil.getInt(request.getParameter("id"));
        String name = request.getParameter("name");
        String url = request.getParameter("url");
        String content = request.getParameter("content");
        String title = request.getParameter("title");
        CenterIntroduction centerIntroduction=new CenterIntroduction();
        centerIntroduction.setId(id);
        centerIntroduction.setName(name);
        centerIntroduction.setUrl(url);
        centerIntroduction.setContent(content);
        centerIntroduction.setTitle(title);
        PageHelper.startPage(page, rows);
        List<CenterIntroduction> centerIntroductions = centerIntroductionService.listAdverInfo(centerIntroduction);
        PageInfo<CenterIntroduction>  pageInfo=new PageInfo<CenterIntroduction>(centerIntroductions);
        JSONObject objs = new JSONObject();
        JSONArray jArray = new JSONArray();
        for (int i = 0; i < centerIntroductions.size(); i++) {
        	JSONObject jobj = new JSONObject();
        	CenterIntroduction mi = centerIntroductions.get(i);
        	jobj.put("id", mi.getId());
            jobj.put("name", mi.getName());
            jobj.put("url", mi.getUrl());
            jobj.put("content", mi.getContent());
            jobj.put("title", mi.getTitle());
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
		  Integer id =TextUtil.getInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        String url = request.getParameter("url");
	        String content = request.getParameter("content");
	        String title = request.getParameter("title");
	        try{
	            
	            
	            CenterIntroduction centerIntroduction = centerIntroductionService.selectAdverInfoById(id);
	            if(centerIntroduction==null){
	            	centerIntroduction =new CenterIntroduction();
	            }
	            centerIntroduction.setId(id);
	            centerIntroduction.setName(name);
	            centerIntroduction.setUrl(url);
	            centerIntroduction.setContent(content);
	            centerIntroduction.setTitle(title);
	            int count = centerIntroductionService.updateAdverInfo(centerIntroduction);
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
