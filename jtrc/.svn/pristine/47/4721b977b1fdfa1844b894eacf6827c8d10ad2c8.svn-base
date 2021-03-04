package com.i84.earnpoint.zcps.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ImpEnterpriseInfo;
import com.i84.earnpoint.model.ImpZjInfo;
import com.i84.earnpoint.model.UserExpertInfo;

public interface ExpertActivityInfoService {
	
	String saveExpertAtivityInfos(HttpServletRequest request);
	
	List<Map<String,Object>> queryExpertActivitys(Map<String,Object> params);
	Map<String,Object> queryExpertActivitys2(Map<String,Object> params);

	
	String deleteExpertActivityInfos(HttpServletRequest request);
	
	String initExpertReviewTime(HttpServletRequest request);
	
	String setReviewTime(HttpServletRequest request);
	
	 UserExpertInfo getExpertInfo(Integer id);
	 
	void insertZjList( List<ImpZjInfo> qyList,String uid)throws Exception;
	void qyZjszExport(HttpServletResponse response,HttpServletRequest request)throws Exception;
	
	void qyZjszExportByPro_type(HttpServletResponse response,HttpServletRequest request)throws Exception;//抽专家
	void markExpert(HttpServletResponse response,HttpServletRequest request)throws Exception;//标记专家
	
	void cancelMark(HttpServletResponse response,HttpServletRequest request)throws Exception;//标记专家
	
	public String setReviewTimeAll(HttpServletRequest request);

}
