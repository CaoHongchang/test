package com.i84.earnpoint.system.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.Role;
import com.i84.earnpoint.system.service.AuthService;
import com.i84.earnpoint.system.service.RoleService;

/**
 * 角色
 * @author liu_q
 *
 */
@Controller
@RequestMapping("/role")
public class RoleController extends ResultConstant{
	@Autowired 
	private AuthService authService;
	@Autowired 
	private RoleService roleService;
	
	@RequestMapping("/roleList")
	public  @ResponseBody Map<String, Object> roleList(@RequestParam Map<String,Object> params,HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Role record=new Role();
		record.setPage(page);
		record.setRows(rows);
		if(params.get("rolename")!=null&&!params.get("rolename").equals(""))
		record.setRolename(params.get("rolename").toString());
		if(params.get("roleState")!=null&&!params.get("roleState").equals(""))
		record.setRoleState(params.get("roleState").toString());
		List<Role> list=roleService.selectListByPrimary(record);
		PageInfo<Role> pageinfo=new PageInfo<Role>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
		
		
		
	}
	
	/**角色授权
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/roleAuth")
	public void roleAuth(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String authIds=request.getParameter("authIds");
		String roleid=request.getParameter("roleId")==null?"1":request.getParameter("roleId").toString();
		Role role=new Role();
		role.setAuthids(authIds);
		role.setRoleid(Integer.valueOf(roleid));
		int updateNums=roleService.updateByPrimaryKeySelective(role);
		JSONObject result=new JSONObject();
		 if(updateNums>0){
         	result.put("success", true);
		 }else{
		 	result.put("errorMsg", "授权失败");
		  }
		ResultConstant.write(response, result);
		
	}
	
	/**角色保存
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/save")
	public void save(HttpServletResponse response,HttpServletRequest request,Role role) throws Exception{
	 
		int updateNums = roleService.insert(role);
		JSONObject result=new JSONObject();
		 if(updateNums>0){
         	result.put("success", true);
		 }else{
		 		result.put("errorMsg", "执行失败");
		 }
		ResultConstant.write(response, result);
		
	}
	/**角色授权
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/roleUpdate")
	public void roleUpdate(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String roleState=request.getParameter("roleState");
		String roleid=request.getParameter("roleid").toString();
		Role role=new Role();
		role.setRoleState(roleState);
		role.setRoleid(Integer.valueOf(roleid));
		int updateNums=roleService.updateByPrimaryKeySelective(role);
		JSONObject result=new JSONObject();
		 if(updateNums>0){
         	result.put("success", true);
		 }else{
		 		result.put("errorMsg", "执行失败");
		  }
		ResultConstant.write(response, result);
		
	}
	
	
}
