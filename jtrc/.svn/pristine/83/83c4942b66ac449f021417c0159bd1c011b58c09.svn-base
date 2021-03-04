package com.i84.earnpoint.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.service.ParameterService;

@Controller
@RequestMapping("/xxgl")
public class OptionManageController extends ResultConstant {
	@Autowired
	private ParameterService resourceService;

	/**
	 * 保存選項
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveOption")
	public void saveOption(@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Resource resource = new Resource();
		
		String type = String.valueOf(params.get("type"));
		String ext6 = "";
		int type_id =2;
		String maxCode="";

		
		if("xxnr".equals(type)){
			ext6="有效";
			type_id=3;
			resource.setExt1(3);
			 maxCode = resourceService.selectMaxCode(resource);
		if (maxCode == null) {
			maxCode = "XXNR001";
		} else {
			maxCode = "XXNR"
					+ String.format("%03d",
							Integer.valueOf(maxCode.substring(4)) + 1);
		}
		}else{
			resource.setExt1(2);
			 maxCode = resourceService.selectMaxCode(resource);
			if (maxCode == null) {
				maxCode = "XX001";
			} else {
				maxCode = "XX"
						+ String.format("%03d",
								Integer.valueOf(maxCode.substring(2)) + 1);
			}
		}
		int count = 0;
		String[] ext2s = request.getParameterValues("ext2");
		String[] ext3s = request.getParameterValues("ext3");
		if (ext2s != null) {

			for (int i = 0; i < ext2s.length; i++) {
				resource = new Resource();
				resource.setExt1(type_id);
				resource.setExt(maxCode);
				resource.setExt2(ext2s[i]);
				resource.setExt3(ext3s[i]);
				resource.setExt4(String.valueOf(params.get("zhmc2")));
				resource.setExt5(String.valueOf(params.get("zhmc3")));
				resource.setExt6(ext6);
				resource.setAddDate(new Date());
				count += resourceService.saveParameter(resource);
			}
		}
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
	}

	/**
	 * 修改選項
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateOption")
	public void updateOption(
			@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Resource resource = new Resource();
		String type = String.valueOf(params.get("type"));
		int type_id = 2;
		
		//选项内容ID
		if("xxnr".equals(type))
			type_id = 3;
		
		//失效选项无法修改
		Resource resource3 = new Resource();
		resource3.setExt(String.valueOf(params.get("zhmc1")));
		List<Resource> resources = resourceService.listResource(resource3);
		if(resources!=null&&resources.size()>0&&"失效".equals(resources.get(0).getExt6())){
		 	response.getWriter().write("3");
		}else{
		
		// 资源类型为2 表示选项资
		int count = 0;
		String[] ids = request.getParameterValues("id");
		String[] ext2s = request.getParameterValues("ext2");
		String[] ext3s = request.getParameterValues("ext3");
		String invaild = request.getParameter("invaild");
		String noExt2 = request.getParameter("noExt2");
		// 更新修改的
		int index = 0;
		if (ids != null && !"1".equals(invaild)) {
			if( !"1".equals(noExt2)){
			for (int i = 0; i < ids.length; i++) {
				resource = new Resource();
				resource.setId(Integer.valueOf(ids[i]));
				resource.setExt2(ext2s[i]);
				resource.setExt3(ext3s[i]);
				resource.setExt4(String.valueOf(params.get("zhmc2")));
				resource.setExt5(String.valueOf(params.get("zhmc3")));
				resource.setAddDate(new Date());
				count += resourceService.updateParameter(resource);
			}
			}
			index = ids.length;
			
			
			
		}
		//如果选项名称或备注更改，则同一选项编码的记录都做更改
		Resource resource2 = new Resource();
		resource2.setExt(String.valueOf(params.get("zhmc1")));
		resource2.setExt4(String.valueOf(params.get("zhmc2")));
		resource2.setExt5(String.valueOf(params.get("zhmc3")));
		count += resourceService.updateParameterByExt(resource2);
		//新增未添加的选项
		if( !"1".equals(noExt2)){  //非只有选项变更
		if (ext2s != null && !"1".equals(invaild)) {
			
			for (int i = index; i < ext2s.length; i++) {
				resource = new Resource();
				resource.setExt(String.valueOf(params.get("zhmc1")));
				resource.setExt1(type_id);
				resource.setExt2(ext2s[i]);
				resource.setExt3(ext3s[i]);
				resource.setExt4(String.valueOf(params.get("zhmc2")));
				resource.setExt5(String.valueOf(params.get("zhmc3")));
				if("xxnr".equals(type)){
					resource.setExt6("有效");	
				}
				resource.setAddDate(new Date());
				count += resourceService.saveParameter(resource);
			}
			}
		}
		if("1".equals(invaild)){
			resource = new Resource();
			resource.setExt(String.valueOf(request.getParameter("ext")));
			resource.setExt6("失效");
//		 	SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
//			String now = format.format(new Date());
//			resource.setExt3(now);
				
			count += resourceService.updateParameterByExt(resource);
		}
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("0");
		}
		}
	}

	/**
	 * 查詢選項
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryOptions")
	public @ResponseBody
	Map<String, Object> queryOptions(
			@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		String type = request.getParameter("type");
	    Resource resource=new Resource();
	    if("xxnr".equals(type)){
		    resource.setExt1(3);
	    }else{
	    //查询参数 资源表Ext1字段为2
	    resource.setExt1(2);
	    }
	    if(params.containsKey("code")){
	    	resource.setExt("%"+String.valueOf(params.get("code"))+"%");
	    }
	    if(params.containsKey("name")){
	    	resource.setExt4("%"+String.valueOf(params.get("name"))+"%");
	    }
	    if(params.containsKey("remark")){
	    	resource.setExt5("%"+String.valueOf(params.get("remark"))+"%");
	    }
	    PageHelper.startPage(page, rows);
	    List<Resource> resources=resourceService.listResource(resource);
	    PageInfo<Resource> pageInfo=new PageInfo<Resource>(resources);
	    
		return resultMap(resources, pageInfo.getTotal(), true, null);
	}
    /**
     * 通过选项编号查询选项信息
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryOptionsByCode")
	public @ResponseBody
	Map<String, Object> queryOptionsByCode(
			@RequestParam() Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String code = String.valueOf(params.get("code"));
		Resource resource = new Resource();
		resource.setExt(code);
		List<Resource> resources = resourceService.listResource(resource);
		return resultMap(resources, true, null);
	}

	@RequestMapping("/getCode")
	public void getCode(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Resource resource = new Resource();
		String type = request.getParameter("type");
		String maxCode="";
		if("xxnr".equals(type)){
		resource.setExt1(3);
		maxCode = resourceService.selectMaxCode(resource);
		if (maxCode == null) {
			maxCode = "XXNR001";
		} else {
			maxCode = "XXNR"
					+ String.format("%03d",
							Integer.valueOf(maxCode.substring(4)) + 1);
		}
		}else{
			resource.setExt1(2);
			maxCode = resourceService.selectMaxCode(resource);
			if (maxCode == null) {
				maxCode = "XX001";
			} else {
				maxCode = "XX"
						+ String.format("%03d",
								Integer.valueOf(maxCode.substring(2)) + 1);
			}
		}
		response.getWriter().write(maxCode);
		response.getWriter().flush();
	}
	
	@RequestMapping("/deleteOptions")
	public void deleteOptions(
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		String exts[]=request.getParameterValues("ext");
		int count=0;
		for(int i=0;i<exts.length;i++){
			Resource resource = new Resource();
			resource.setExt(exts[i]);
			count+=resourceService.deleteResource(resource);
		}
		
		if(count>0){
			response.getWriter().write("1");
		}
		else{
			response.getWriter().write("0");
		}
	}
}
