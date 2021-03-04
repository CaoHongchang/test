package com.i84.earnpoint.system.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.SystemUtils;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.UserLoginLogMapper;
import com.i84.earnpoint.mapper.UserMapper;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.system.service.UserService;

/** 用户
 * @author liu_q
 *
 */
@Service
public class UserServiceImpl extends BaseService implements UserService {

    @Resource
    private UserMapper userMapper;

    @Resource
    private UserLoginLogMapper userLoginLogMapper;

    @Override
    public int deleteByPrimaryKey(Integer userid) {
        return 0;
    }

    @Override
    public int insert(User record) {
        return 0;
    }

    @Override
    public int insertSelective(User record) {
        return userMapper.insertSelective(record);
    }

    @Override
    public User selectByPrimaryKey(Integer userid) {
        return userMapper.selectByPrimaryKey(userid);
    }

    @Override
    public int updateByPrimaryKeySelective(User record) {

        return userMapper.updateByPrimaryKeySelective(record);
    }

    @Override
    public int updateByPrimaryKey(User record) {
        return 0;
    }

    @Override
    public String login(HttpSession session,User puser,HttpServletRequest request,String code) {

        //用户登录
        Map<String,Object> p1 = new HashMap<String,Object>();
        Map<String,Object> p = userMapper.login(puser);

        String sessionCode = session.getAttribute("code").toString();
        //防止绕过验证码
        session.removeAttribute("code");
        if (sessionCode == null) {
            p1.put("flag", 0);
            p1.put("userState", 2);
            return response(p1);
        }

        if (!(code.toLowerCase()).equals(sessionCode.toLowerCase())) {
            p1.put("flag",0);
            p1.put("userState", 2);
            return response(p1);
        }
        if(p==null || p.get("authIds")==null||TextUtil.getInt(p.get("userState"))==0){
            p1.put("flag",0);
            if(p!=null&&p.get("userState")!=null) {
                p1.put("userState", TextUtil.getInt(p.get("userState")));
            }
            else {
                p1.put("userState", 1);
            }
            return response(p1);
        }
        Map<String,Object> params=new HashMap<String,Object>();
        params.put("userId", p.get("id"));
        params.put("OS", SystemUtils.getRequestSystemInfo(request));
        params.put("browser", SystemUtils.getRequestBrowserInfo(request));
        params.put("type", 1);
        params.put("loginDate", new Date());
        userLoginLogMapper.insert(params);


        Map login = (HashMap)(request.getSession().getServletContext().getAttribute("LOGIN"));
        if(login==null){
            login=new HashMap();
            login.put(p.get("id")+"", request.getSession().getId());
            request.getSession().getServletContext().setAttribute("LOGIN", login);
        }else{
            if(!login.containsKey(p.get("id")+"")){
                login.put(p.get("id")+"", request.getSession().getId());
                request.getSession().getServletContext().setAttribute("LOGIN", login);
            }
        }

        if(login.containsKey( p.get("id")+"")&&!(""+login.get(p.get("id")+"")).equals(request.getSession().getId()+"")){
            p1.put("flag",2);
        }else{
            p1.put("flag",1);
        }

        List r = new ArrayList();
        String[] pis = (p.get("authIds")+"").split(",");
        for (int i = 0; i < pis.length; i++) {
            r.add(pis[i]);
        }
        session.setAttribute("qx",  (p.get("authIds")+""));
        session.setAttribute(SystemContant.PRIVILEGES, r);
        session.setAttribute("userName", p.get("userName")+"");
        session.setAttribute("uid",  p.get("id")+"");
        session.setAttribute("roleName",  p.get("roleName")+"");
        session.setAttribute("realName",  p.get("realName")+"");
        return response(p1);
    }

    @Override
    public User selectByUserName(String username) {

        return userMapper.selectByUserName(username);
    }

    @Override
    public List<Map<String, Object>> queryUsers(Map<String, Object> param) {

        return userMapper.selectUserBySelective(param);
    }

    @Override
    public Map<String, Object> selectUserAndDepartment(Integer userid) {

        return userMapper.selectUserAndDepartment(userid);
    }

    @Override
    public Map selectByUserNameAndPwd(User user) {

        return userMapper.login(user);
    }

    @Override
    public void loginout(HttpServletRequest request) {

        Map login = (HashMap)(request.getSession().getServletContext().getAttribute("LOGIN"));
        if(login==null){
            login=new HashMap();
        }
        String uid = request.getSession().getAttribute("uid")+"";
        login.remove(uid);
        request.getSession().removeAttribute("uid");
        request.getSession().getServletContext().setAttribute("LOGIN", login);
    }

}
