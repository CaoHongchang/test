package com.i84.earnpoint.system.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
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
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.Role;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.system.service.RoleService;
import com.i84.earnpoint.system.service.UserService;

/**
 * 角色
 * @author liu_q
 *
 */
@Controller
@RequestMapping("/users")
public class UsersController extends ResultConstant{
    @Autowired
    private UserService userService;
    @Autowired
    private RoleService roleService;
    private String rs = "";

    // 用户登录
    @RequestMapping("/login")
    public void login(User puser, HttpServletResponse response,
            HttpServletRequest hr,String code) throws IOException {

        //System.out.println(MD5.GetMD5Code(MD5.GetMD5Code(puser.getPassword())));
        puser.setPassword(MD5.GetMD5Code(MD5.GetMD5Code(puser.getPassword())));
        rs = userService.login(hr.getSession(), puser,hr,code);
        result(rs, response);
    }
    @RequestMapping("/isUserNameExist")
    public @ResponseBody Map<String,Object> isUserNameExist(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String username=request.getParameter("username");
        try{
            User user=userService.selectByUserName(username);
            if(user!=null){
                return resultMap(true, "用户名已经存在");
            }else{
                return resultMap(false, " ");
            }
        }catch(Exception e){
            return resultMap(false,e.getMessage());
        }
    }
    @RequestMapping("/loginout")
    public void loginout(HttpServletRequest request, HttpServletResponse response) throws Exception {
        userService.loginout(request);
        result(rs, response);
    }
    /**
     * 新增用户
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveUser")
    public @ResponseBody Map<String,Object> saveUser(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        try{

            User user=new User();
            if(params.containsKey("username")){
                user.setUsername((String)params.get("username"));
            }
            if(params.containsKey("password")){
                user.setPassword(MD5.GetMD5Code(MD5.GetMD5Code(((String)params.get("password")).trim())));
            }
            if(params.containsKey("departmentId")){
                user.setDepartmentId(TextUtil.getInt(params.get("departmentId")));
            }
            if(params.containsKey("realName")){
                user.setRealName((String)params.get("realName"));
            }
            if(params.containsKey("roleId")){
                user.setRoleid((String)params.get("roleId"));
            }
            if(params.containsKey("enterpriseId")){
                user.setEnterpriseId(TextUtil.getInt(params.get("enterpriseId")));
            }
            user.setUserState("1");//1:有效
            int count=  userService.insertSelective(user);
            return count>0?resultMap(true, "success"):resultMap(false, "fail");
        }catch(Exception e){
            e.printStackTrace();
            return resultMap(false, e.getMessage());
        }
    }
    /**
     * 查询用户
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryUsers")
    public @ResponseBody Map<String,Object> queryUsers(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        List<Map<String,Object>> list=userService.queryUsers(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }


    /**
     * 修改密码
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/changePwd")
    public @ResponseBody Map<String,Object> changePwd(HttpServletRequest request,HttpServletResponse response)throws Exception{
        Map map=new HashMap();
        try{
            String id=(String) request.getSession().getAttribute("uid");
            if(id==null){
                map.put("flag", 3);
                return map;
            }
            String userName=(String) request.getSession().getAttribute("userName");
            String newpassword=request.getParameter("newpassword");
            String oldpassword=request.getParameter("oldpassword");
            User user=new User();
            user.setUsername(userName);
            user.setPassword(MD5.GetMD5Code(MD5.GetMD5Code(oldpassword.trim())));
            Map userMap=userService.selectByUserNameAndPwd(user);
            if(userMap==null){
                map.put("flag", 2);
                return map;
            }
            if(newpassword!=null&&!newpassword.trim().isEmpty()) {
                user.setPassword(MD5.GetMD5Code(MD5.GetMD5Code(newpassword.trim())));
            }
            else{
                map.put("flag", 5);
                return map;
            }

            user.setUserid(TextUtil.getInt(id));
            int count=userService.updateByPrimaryKeySelective(user);
            if(count>0) {
                map.put("flag", 1);
            }
            return map;
        }catch(Exception e){
            e.printStackTrace();
            map.put("flag", 4);
            return map;
        }
    }

    /**
     * 删除用户
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/deleteUser")
    public @ResponseBody Map<String,Object> deleteUser(HttpServletRequest request,HttpServletResponse response)throws Exception{
        try{
            String ids=request.getParameter("ids");
            String idArray[]=ids.split(",");
            int count= 0;
            for (int i = 0; i < idArray.length; i++) {
                User user=new User();
                user.setDelDate(new Date());
                user.setUserid(TextUtil.getInt(idArray[i]));
                count=userService.updateByPrimaryKeySelective(user);
            }

            return count>0?resultMap(true, "success"):resultMap(false,"fail");
        }catch(Exception e){
            e.printStackTrace();
            return resultMap(false, e.getMessage());
        }
    }

    /**
     * 有效
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/editUserValid")
    public @ResponseBody Map<String,Object> editUserValid(HttpServletRequest request,HttpServletResponse response)throws Exception{
        try{

            String ids=request.getParameter("ids");
            String userState=request.getParameter("userState");
            String idArray[]=ids.split(",");
            int count= 0;
            for (int i = 0; i < idArray.length; i++) {
                User user=new User();
                user.setUserState(userState);
                user.setUserid(TextUtil.getInt(idArray[i]));
                count=userService.updateByPrimaryKeySelective(user);
            }

            return count>0?resultMap(true, "success"):resultMap(false,"fail");
        }catch(Exception e){
            e.printStackTrace();
            return resultMap(false, e.getMessage());
        }
    }

    @RequestMapping("/onLoadUser")
    public @ResponseBody Map<String,Object> onLoadUser(HttpServletRequest request,HttpServletResponse response)throws Exception{
        String userid=request.getParameter("userId");
        Map<String,Object> user=userService.selectUserAndDepartment(TextUtil.getInt(userid));
        if(user!=null&&user.get("userName")!=null){
            String roleId=(String) user.get("roleId");
            List<Role> roles=roleService.selectAllRoleList(new Role());
            String roleIdArray[]=roleId.split(",");
            List<Map<String,Object>> roleList=new ArrayList<Map<String,Object>>();
            for(Role role:roles){
                Map<String,Object> roleMap=new HashMap<String, Object>();
                roleMap.put("roleid", role.getRoleid());
                roleMap.put("rolename",role.getRolename());
                roleMap.put("roledescription", role.getRoledescription());
                roleMap.put("uid", '2');
                for(int i=0;i<roleIdArray.length;i++){
                    if(!roleIdArray[i].equals("")&&role.getRoleid()==Integer.valueOf(roleIdArray[i])){
                        roleMap.put("uid", '1');
                        break;
                    }
                }
                roleList.add(roleMap);
            }
            user.put("roleList", roleList);
        }
        return user;
    }

    /**
     * 新增用户
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/updateUser")
    public @ResponseBody Map<String,Object> updateUser(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        try{

            User user=new User();
            String userId=request.getParameter("userId");
            System.out.println(userId);
            if(userId!=null&&!userId.trim().isEmpty()){
                user.setUserid(TextUtil.getInt(userId));
            }
            if(params.containsKey("username")){
                user.setUsername((String)params.get("username"));
            }
            if(params.containsKey("departmentId")){
                user.setDepartmentId(TextUtil.getInt(params.get("departmentId")));
            }
            if(params.containsKey("realName")){
                user.setRealName((String)params.get("realName"));
            }
            if(params.containsKey("roleId")){
                user.setRoleid((String)params.get("roleId"));
            }

            int count=  userService.updateByPrimaryKeySelective(user);
            return count>0?resultMap(true, "success"):resultMap(false, "fail");
        }catch(Exception e){
            e.printStackTrace();
            return resultMap(false, e.getMessage());
        }
    }
    /**
     * 修改密码
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/changePwdRet")
    public @ResponseBody Map<String,Object> changePwdRet(HttpServletRequest request,HttpServletResponse response,String userId)throws Exception{
        Map map=new HashMap();
        try{
            String id=(String) request.getSession().getAttribute("uid");
            if(id==null){
                map.put("flag", 3);
                return map;
            }
            String userName=(String) request.getSession().getAttribute("userName");
            String newpassword=request.getParameter("newpassword");
          
            User userMap=userService.selectByPrimaryKey(TextUtil.getOInteger(userId));
            if(userMap==null){
                map.put("flag", 2);
                return map;
            }
            if(newpassword!=null&&!newpassword.trim().isEmpty()) {
            	userMap.setPassword(MD5.GetMD5Code(MD5.GetMD5Code(newpassword.trim())));
            }
            else{
                map.put("flag", 5);
                return map;
            }
            int count=userService.updateByPrimaryKeySelective(userMap);
            if(count>0) {
                map.put("flag", 1);
            }
            return map;
        }catch(Exception e){
            e.printStackTrace();
            map.put("flag", 4);
            return map;
        }
    }
}
