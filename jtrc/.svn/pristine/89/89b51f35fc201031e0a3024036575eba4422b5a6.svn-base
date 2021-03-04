package com.i84.earnpoint.daxt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.ResidenceQsInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserInfo;


/**
 * 档案缺失信息服务接口
 * @author zhengqr
 *
 */
public interface ResidenceQsInfoService {
	
	/**
	 * 档案缺失信息列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryResidenceQsInfoList(Map<String, Object> record);
	
	/**
	 * 新增档案缺失信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addResidenceQsInfo(ResidenceQsInfo residenceQsInfo,String fjparam, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改档案缺失信息
	 * @param userExpertInfo
	 * @return
	 */
	public void updateResidenceQsInfo(ResidenceQsInfo residenceQsInfo,String fjparam, HttpServletResponse response) throws Exception;
	/**
	 * 根据档案id查询档案缺失列表
	 * @param record
	 * @return
	 */
	public List<Map<String,Object>> queryResidenceQsInfoByDid(Map<String,Object> record);
	/**
	 * 删除档案缺失信息
	 * @throws Exception
	 */
	public void deleteResidenceQsInfos(String [] ids,HttpServletResponse response)throws Exception;
	
}