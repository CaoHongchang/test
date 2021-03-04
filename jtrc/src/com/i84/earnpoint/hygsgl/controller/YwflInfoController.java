package com.i84.earnpoint.hygsgl.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.hygsgl.service.GzInfoService;
import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.hygsgl.service.YwflInfoService;
import com.i84.earnpoint.model.YgImportVo;



/**
 * 业务分类
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/ywfl")
public class YwflInfoController {
	@Autowired 
	private YwflInfoService ywflInfoService;
	/**业务分类新增
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addYwfl")  
	public  @ResponseBody Map<String, Object> addYwfl(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			//String param=request.getParameter("param");
			//System.out.println(param);
			int c=0;
			Map<String, Object> m=ResultConstant.paramSetAdd(request);
			if(m.get("id")!=null){//修改
				c=ywflInfoService.editYwfl(m);
			}
			else{//新增
			c=ywflInfoService.addYwfl(m);
			}
			if(c>0)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**删除
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delFuc")  
	public  @ResponseBody Map<String, Object> delFuc(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			
			String id=request.getParameter("id");
			//删除业务分类时，需要判断该业务分类下是否已有业务，有就不能删除
			Map<String, Object> map=new HashMap<String, Object>();
			map.put("typeId", id);
			map=ywflInfoService.selectIsExist(map);
			if(map!=null){
				Long total=map.get("total")==null?null:(Long)map.get("total");
				if(total>0){
				return ResultConstant.resultMap(flag,"该业务分类下存在业务，无法删除！"); 
				}

			}
			int c=0;
			Map<String,Object>m=new HashMap<String, Object>();
			m.put("id", id);
			m.put("delDate", new Date());
			c=ywflInfoService.editYwfl(m);
			if(c>0){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	/** 业务列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywflView")  
	public  @ResponseBody Map<String, Object> ywflView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=null;
		try {
			
			list=ywflInfoService.selectYwflList(ResultConstant.paramSet(request));
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}

	
	/** 业务列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywflData")  
	public  @ResponseBody List<Map<String,Object>> ywflData(HttpServletResponse response,HttpServletRequest request){  
		String isTree=request.getParameter("isTree");
		List<Map<String,Object>> list=null;
		try {
			list=ywflInfoService.selectYwflList(ResultConstant.paramSet(request));		

			if(isTree.equals("true")){
				List<Map<String,Object>> list2=new ArrayList<Map<String,Object>>();

				if(list!=null && list.size()>0){
					for(int i=0;i<list.size();i++){
						Map<String,Object> m=list.get(i);
						Map<String,Object> m2=new HashMap<String, Object>();
						
						m2.put("id", m.get("id"));
						m2.put("text", m.get("name"));
						list2.add(m2);
					}
					Map<String,Object> m2=new HashMap<String, Object>();
					m2.put("id", "-1");
					m2.put("text", "业务分类");
					m2.put("children", list2);
					list2=new ArrayList<Map<String,Object>>();
					list2.add(m2);
					
					return list2;
				}
				
			}
			return list;

		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return list;

	}

	
}


