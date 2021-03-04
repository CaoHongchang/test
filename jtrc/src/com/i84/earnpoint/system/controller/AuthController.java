package com.i84.earnpoint.system.controller;


import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.i84.earnpoint.common.BaseController;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.model.Auth;
import com.i84.earnpoint.model.Role;
import com.i84.earnpoint.system.service.AuthService;
import com.i84.earnpoint.system.service.RoleService;

/**
 * 菜单
 * @author liu_q
 *
 */
@Controller
@RequestMapping("/auth")
public class AuthController extends BaseController{
	@Autowired 
	private AuthService authService;
	@Autowired 
	private RoleService roleService;
	private String rs;
	
	@RequestMapping("/menu")
	public void menu(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String parentId=request.getParameter("parentId");//父id默认-1
		String roleid=request.getParameter("roleId")==null?"1":request.getParameter("roleId").toString();
		//角色默认为1
		//Role role=roleService.selectByPrimaryKey(Integer.valueOf(roleid));
		String authIds=request.getSession().getAttribute("qx")+"";//role.getAuthids();//此处对应登录用户能看到的菜单id
		
		Auth auth = new Auth();
		auth.setIsshow(0);long start=System.currentTimeMillis();
		List<Auth> authList=authService.selectListByPrimaryKey(auth);
		JSONArray jsonArray=getAuthsByParentId(authList,parentId,authIds);
		//JSONArray jsonArray=getListByParentId(parentId);
       long end=System.currentTimeMillis();
      
		ResultConstant.write(response,jsonArray);
		long spend = end-start;
		 System.out.println(spend + "耗时时间");
		
		
	}
	@RequestMapping("/menu1")
	public void menu1(HttpServletResponse response,HttpServletRequest request) throws Exception{
//		String parentId=request.getParameter("parentId");//鐖秈d榛樿-1
//		
//		Auth auth = new Auth();
//		auth.setIsshow(1);
//		List<Auth> authList=authService.selectListByPrimaryKeyAll(auth);
//		String authIds="";
//		for (int i = 0; i < authList.size(); i++) {
//			authIds+=authList.get(i).getAuthid()+",";
//		}
//	
//		JSONArray jsonArray=getAuthsByParentId2(authList,parentId,authIds);
//		ResultConstant.write(response,jsonArray);
		String parentId=request.getParameter("parentId");//鐖秈d榛樿-1
		String roleid=request.getParameter("roleId")==null?"-1":request.getParameter("roleId").toString();
		Auth auth = new Auth();
		auth.setIsshow(1);
		List<Auth> authList=authService.selectListByPrimaryKeyAll(auth);
		
		Role r=roleService.selectByPrimaryKey(Integer.valueOf(roleid));
		String authIds=r.getAuthids()==null?"":r.getAuthids();
		JSONArray jsonArray=getAuthsByParentId2(authList,parentId,authIds);
		ResultConstant.write(response,jsonArray);
		
		
	}
public JSONArray getAuthsByParentId2(List<Auth> authList,String parentId,String authIds)throws Exception{
		
		
		JSONArray jsonArray=this.getAuthByParentId2(authList,parentId,authIds);
		for(int i=0;i<jsonArray.size();i++){

			JSONObject jsonObject=jsonArray.getJSONObject(i);
			//当前节点已经是最小节点则不执行
//			if("open".equals(jsonObject.getString("state"))){
//				continue;
//			}else{
				//System.out.println("大小："+jsonArray.size()+" id:"+jsonObject.getString("id"));
				jsonObject.put("children", getAuthsByParentId2(authList,jsonObject.getString("id"),authIds));
//			}
		}
		return jsonArray;
	}
		
	
public JSONArray getAuthByParentId2(List<Auth> authLists,String parentId,String authIds)throws Exception{

		
    	JSONArray jsonArray=new JSONArray();		
	

        if(authLists!=null&&authLists.size()>0){
        	for(int i=0;i<authLists.size();i++){
        		Auth at=authLists.get(i);
        		
        			if(at.getParentid().toString().equals(parentId)){
        				
        		
		        		JSONObject jsonObject=new JSONObject();
		        		jsonObject.put("id", at.getAuthid());
		    			jsonObject.put("text", at.getAuthname());
		    			//没有子菜单则则为open
		    			if(!hasChildren(authLists,String.valueOf(at.getAuthid()), authIds)){
		    				jsonObject.put("state", "open");
		    			}else{
		    				jsonObject.put("state", at.getState());				
		    			}
		    			if(existStrArr(at.getAuthid()+"", authIds.split(","))){//菜单id是否存在对应的角色表中
		    				jsonObject.put("checked", true);
		    			}
		    			jsonObject.put("iconCls", at.getIconcls());
		    			JSONObject attributeObject=new JSONObject();
		    			attributeObject.put("authPath", at.getAuthpath());
		    			jsonObject.put("attributes", attributeObject);
		
		    			jsonArray.add(jsonObject);
		        	//}
        		}
    		}
        	
        }
        return  jsonArray;
		
	}
	
	/**列表查看
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/treeGridMenu")
	public void treeGridMenu(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String parentId=request.getParameter("parentId");
		JSONArray jsonArray=getListByParentId(parentId);
		ResultConstant.write(response,jsonArray);
		
	}
	
	@RequestMapping("/deleteMenu")
	public void deleteMenu(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String authId=request.getParameter("authId");
		String parentId=request.getParameter("parentId");
		Auth auth=new Auth();
		auth.setAuthid(Integer.valueOf(authId));
		auth.setParentid(Integer.valueOf(parentId));
		authService.deleteMunu(auth,response);
	}
	
	
	@RequestMapping("/saveMenu")
	public void saveMenu(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String authId=request.getParameter("authId");
		String authName=request.getParameter("authName");
		String authPath=request.getParameter("authPath");
		String parentId =request.getParameter("parentId");
		String authDescription=request.getParameter("authDescription");
		String iconCls=request.getParameter("iconCls");
		String seq=request.getParameter("seq");

		Auth auth=new Auth();
		auth.setAuthid(authId==null?null:Integer.valueOf(authId));
		auth.setAuthname(authName);
		auth.setAuthpath(authPath);
		auth.setParentid(parentId==null?null:Integer.valueOf(parentId));
		auth.setAuthdescription(authDescription);
		auth.setIconcls(iconCls);
		auth.setSeq(seq==null?null:Integer.valueOf(seq));
		
		authService.saveMunu(auth,response);
	}
	
	public JSONArray getListByParentId(String parentId)throws Exception{
		
		JSONArray jsonArray=this.getTreeGridAuthByParentId(parentId);
		for(int i=0;i<jsonArray.size();i++){
			JSONObject jsonObject=jsonArray.getJSONObject(i);
			//if("open".equals(jsonObject.getString("state"))){
			//	continue;
			//}else{
				jsonObject.put("children", getListByParentId(jsonObject.getString("id")));
			//}
		}
		return jsonArray;
	}
	public JSONArray getTreeGridAuthByParentId(String parentId)throws Exception{
		JSONArray jsonArray=new JSONArray();
		Auth at=new Auth();
		at.setParentid(Integer.valueOf(parentId));
		at.setIsshow(0);
		List<Auth> authList=authService.selectListByPrimaryKey(at);
        if(authList!=null&&authList.size()>0){
        	for(int i=0;i<authList.size();i++){
        	Auth auth=authList.get(i);
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("id", auth.getAuthid());
			jsonObject.put("text", auth.getAuthname());
			jsonObject.put("state", auth.getState());
			jsonObject.put("iconCls", auth.getIconcls());
			jsonObject.put("authName", auth.getAuthname());
			jsonObject.put("authPath",auth.getAuthpath());
			jsonObject.put("authDescription", auth.getAuthdescription());
			jsonObject.put("seq", auth.getSeq());

			jsonArray.add(jsonObject);
        	}
		}
		return jsonArray;
	}
	
	public JSONArray getAuthByParentId(List<Auth> authLists,String parentId,String authIds)throws Exception{

		
    	JSONArray jsonArray=new JSONArray();		
	

        if(authLists!=null&&authLists.size()>0){
        	for(int i=0;i<authLists.size();i++){
        		Auth at=authLists.get(i);
        		String[] s=authIds.split(",");
        		for(int ii=0;ii<s.length;ii++){
        			String authid=s[ii].toString();
        			if(at.getAuthid().toString().equals(authid)&&at.getParentid().toString().equals(parentId)){
        				
        		
		        		JSONObject jsonObject=new JSONObject();
		        		jsonObject.put("id", at.getAuthid());
		    			jsonObject.put("text", at.getAuthname());
		    			//没有子菜单则则为open
		    			if(!hasChildren(authLists,String.valueOf(at.getAuthid()), authIds)){
		    				jsonObject.put("state", "open");
		    			}else{
		    				jsonObject.put("state", at.getState());				
		    			}
		    			if(existStrArr(at.getAuthid()+"", authIds.split(","))){//菜单id是否存在对应的角色表中
		    				jsonObject.put("checked", true);
		    			}
		    			jsonObject.put("iconCls", at.getIconcls());
		    			JSONObject attributeObject=new JSONObject();
		    			attributeObject.put("authPath", at.getAuthpath());
		    			jsonObject.put("attributes", attributeObject);
		
		    			jsonArray.add(jsonObject);
		        	}
        		}
    		}
        	
        }
        return  jsonArray;
		
	}

	
	public static boolean existStrArr(String str,String []strArr){
		for(int i=0;i<strArr.length;i++){
			if(strArr[i].equals(str)){
				return true;
			}
		}
		return false;
	}
	
	public JSONArray getAuthsByParentId(List<Auth> authList,String parentId,String authIds)throws Exception{
		
		
		JSONArray jsonArray=this.getAuthByParentId(authList,parentId,authIds);
		for(int i=0;i<jsonArray.size();i++){

			JSONObject jsonObject=jsonArray.getJSONObject(i);
			//当前节点已经是最小节点则不执行
//			if("open".equals(jsonObject.getString("state"))){
//				continue;
//			}else{
				//System.out.println("大小："+jsonArray.size()+" id:"+jsonObject.getString("id"));
				jsonObject.put("children", getAuthsByParentId(authList,jsonObject.getString("id"),authIds));
//			}
		}
		return jsonArray;
	}
	
	/**是否存在子节点
	 * @param parentId
	 * @param authIds
	 * @return
	 * @throws Exception
	 */
	private boolean hasChildren(List<Auth> authLists,String parentId,String authIds)throws Exception{
		//Auth auth=new Auth();
		List<Auth> authList=new ArrayList<Auth>();
		String[] s=authIds.split(",");
		for(int i=0;i<s.length;i++){
			String authid=s[i].toString();
			//listIds.add(authid);
			for(int j=0;j<authLists.size();j++){
				Auth auth=authLists.get(j);
				if(auth.getAuthid().toString().equals(authid)&&auth.getParentid().toString().equals(parentId)){
					
					return true;
				}
			}
			
		}
		//auth.setAuthids(listIds);
		//auth.setParentid(Integer.valueOf(parentId));
		//List<Auth> authList=authService.selectListByPrimaryKey(auth);
		//if(authList!=null && authList.size()>0){
		//	return true;
		//}
		return false;
	}
	@RequestMapping("/check")
	public void check(HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		rs = authService.check(request);
		result(rs, response);
	}
	
}
