package com.i84.earnpoint.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.UserInfo;

public interface UserInfoService  {
	/**
	 * 根据主键或唯一键查询用户
	 * @param userInfo
	 * @return
	 */
	List<UserInfo> selectUserInfoBySelective(UserInfo userInfo);

	UserInfo selectById(Integer id);
	
	UserInfo getUserByPnum(String pnum);
	
	int insertUserInfo(UserInfo userInfo);
	
	int updateUserInfo(UserInfo userInfo);
	
	void ufcheck(HttpServletRequest request,String dNo,int orgUid,Object  uf1,Object  uf2);
	List<UserInfo> selectUserInfoBySelective1(UserInfo userInfo);
	
	List<Map<String,Object>> getxltjlist(Map<String,Object> param);

	void ExportXltjList(HttpServletResponse response);
	
	Map<String,Object> getuserBydpno(Map<String,Object> param);

	Map<String,Object> getUserById(Integer id);
}
