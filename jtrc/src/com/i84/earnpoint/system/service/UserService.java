package com.i84.earnpoint.system.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.i84.earnpoint.model.User;


/**
 * 用户信息
 * @author liu_q
 *
 */
public interface UserService {
	
	// 登陆判断
	String login(HttpSession session, User puser,HttpServletRequest request,String code);
	
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    User selectByUserName(String username);
    
    List<Map<String,Object>> queryUsers(Map<String,Object> param);
    
    Map<String,Object> selectUserAndDepartment(Integer userid);
    Map selectByUserNameAndPwd(User user);
    
    void loginout(HttpServletRequest request);
}