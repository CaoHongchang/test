package com.i84.earnpoint.sydwzp.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.BgActivityUserScoreInfo;

public interface BgActivityUserScoreInfoService {

	BgActivityUserScoreInfo selectByPrimaryKey(Integer id);
	
	List<Map<String,Object>> activityPlaceList(Map<String,Object> param);
	
	List<Map<String,Object>> userScoreList(Map<String, Object> param);
	
	int updateByPrimaryKeySelective(BgActivityUserScoreInfo record);
	
	 List<Map<String,Object>> checkIn(Map<String,Object> record);
	 List<Map<String,Object>> checkIn3(Map<String,Object> record);
	 List<Map<String,Object>> checkIn2(Map<String,Object> record);
	 List<Map<String,Object>> checkIn4(Map<String,Object> record);
	 int queryUserId(String pnum);
	 int insertSelective(BgActivityUserScoreInfo record);
	 void deleteOrder(Integer id);
	 void exportOrder(Map<String, Object> param,HttpServletResponse response,HttpServletRequest request) throws Exception;
}
