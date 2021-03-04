package com.i84.earnpoint.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.service.ParameterService;

@Controller
@RequestMapping("/csgl")
public class ParameterManageController extends ResultConstant {
	@Autowired
	private ParameterService resourceService;

	/**
	 * 保存参数
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveParameter")
	public void saveParameter(@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Resource resource = new Resource();
		// 资源类型为1 表示参数资源
		resource.setExt1(1);
		if(params.containsKey("zhmc1")){
			resource.setExt(String.valueOf(params.get("zhmc1")));
		}
		if (params.containsKey("zhmc2")) {
			resource.setExt2(String.valueOf(params.get("zhmc2")));
		}
		if (params.containsKey("zhmc3")) {
			resource.setExt3(String.valueOf(params.get("zhmc3")));
		}
		if (params.containsKey("zhmc4")) {
			resource.setExt4(String.valueOf(params.get("zhmc4")));
		}
		// 设置有效性为1
		resource.setExt5("1");
		resource.setAddDate(new Date());
		int count = resourceService.saveParameter(resource);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}

	}

	/**
	 * 修改参数
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateParameter")
	public void updateParameter(@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		Resource resource = new Resource();
		// 资源类型为1 表示参数资源
		if (params.containsKey("id")) {
			resource.setId(TextUtil.getInt(String.valueOf(params.get("id"))));
		}
		if(params.containsKey("zhmc11")){
			resource.setExt(String.valueOf(params.get("zhmc11")));
		}
		if (params.containsKey("zhmc21")) {
			resource.setExt2(String.valueOf(params.get("zhmc21")));
		}
		if (params.containsKey("zhmc31")) {
			resource.setExt3(String.valueOf(params.get("zhmc31")));
		}
		if (params.containsKey("zhmc41")) {
			resource.setExt4(String.valueOf(params.get("zhmc41")));
		}
		int count = resourceService.updateParameter(resource);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}

	}

	/**
	 * 查詢參數
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryParameters")
	public @ResponseBody
	Map<String, Object> queryParameters(
			@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(params.get("page"));
		int rows = TextUtil.getInt(params.get("rows"));
		
		Resource resource = new Resource();
		if(params.containsKey("code")){
			resource.setExt("%"+String.valueOf(params.get("code"))+"%");
		}
		if(params.containsKey("name")){
			resource.setExt2("%"+String.valueOf(params.get("name"))+"%");
		}
		if(params.containsKey("value")){
			resource.setExt3("%"+String.valueOf(params.get("value"))+"%");
		}
		if(params.containsKey("describe")){
			resource.setExt4("%"+String.valueOf(params.get("describe"))+"%");
		}
		// 查询参数 资源表Ext1字段为1
		resource.setExt1(1);
		PageHelper.startPage(page, rows);
		List<Resource> resources = resourceService.listResource(resource);
		PageInfo<Resource> pageInfo = new PageInfo<Resource>(resources);
		response.setContentType("text/html;charset=utf-8");
		return resultMap(resources, pageInfo.getTotal(), true, null);
	}

	@RequestMapping("/getCode")
	public void getCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Resource resource = new Resource();
		String ext=request.getParameter("ext");
		resource.setExt1(1);
		if(ext!=null&&!ext.trim().isEmpty()){
			resource.setExt(ext);
		}
		JSONObject obj=new JSONObject();
		String maxCode = resourceService.selectMaxCode(resource);
		System.out.println(maxCode);
		if (maxCode == null) {
			obj.put("flag", true);
			
		} else {
			obj.put("flag", false);
		}
		ResultConstant.result(obj.toString(), response);
	}

	@RequestMapping("/deleteParams")
	public void deleteParams(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String exts[] = request.getParameterValues("ext");
		int count = 0;
		for (int i = 0; i < exts.length; i++) {
			Resource resource = new Resource();
			resource.setExt(exts[i]);
			count += resourceService.deleteResource(resource);
		}

		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}

	@RequestMapping("/invalidParams")
	public void invalidParams(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String ids[] = request.getParameterValues("id");
		String type = request.getParameter("type");
		int count = 0;
		for (int i = 0; i < ids.length; i++) {
			Resource resource = new Resource();
			resource.setId(Integer.valueOf(ids[i]));
			if (type.equals("1")) {
				resource.setExt5("0");
			} else
				resource.setExt5("1");
			count += resourceService.updateParameter(resource);
		}

		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}
}
