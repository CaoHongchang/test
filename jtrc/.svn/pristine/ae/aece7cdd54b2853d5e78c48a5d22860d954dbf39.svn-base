package com.i84.earnpoint.daxt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyOut;


/**
 * 档案借阅管理服务接口
 * @author zhengqr
 *
 */
public interface ResidenceGetoutInfoService {
	
	/**
	 * 档案借阅列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryResidenceGetoutInfoList(Map<String, Object> record);
	
	/**
	 * 新增档案借阅信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addResidenceGetoutInfo(ResidenceGetoutInfo residenceGetoutInfo, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改档案借阅信息
	 * @param userExpertInfo
	 * @return
	 */
	public void updateResidenceGetoutInfo(ResidenceGetoutInfo residenceGetoutInfo, HttpServletResponse response) throws Exception;
	
	/**
	 * 归还档案借阅信息
	 * @param id
	 * @return
	 */
	public void backResidenceGetoutInfo(ResidenceGetoutInfo residenceGetoutInfo, HttpServletResponse response) throws Exception;

	/**
	 * 新增档案借阅信息列表
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addResidenceGetoutInfoList(List<ResidenceGetoutInfo> residenceGetoutInfoList, HttpServletResponse response) throws Exception;
}