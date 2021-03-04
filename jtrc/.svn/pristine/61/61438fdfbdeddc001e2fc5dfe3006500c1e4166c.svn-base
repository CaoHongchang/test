package com.i84.earnpoint.daxt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.ResidenceQsInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserInfo;


/**
 * 人才管理信息服务接口
 * @author zhengqr
 *
 */
public interface UserMgInfoService {
	
	/**
	 * 人才管理信息列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryResidenceQsInfoList(Map<String, Object> record);
	
	
	/**
	 * 统计人才管理信息列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countuResidenceQsInfoList(Map<String, Object> record);


	public List<Map<String, Object>> countuResidenceQsInfoListBySex(Map<String, Object> params);


	public List<Map<String, Object>> countuResidenceQsInfoListByBirthday(Map<String, Object> params);


	public List<Map<String, Object>> countuResidenceQsInfoListByDegree(
			Map<String, Object> params);


	public List<Map<String, Object>> countuResidenceQsInfoListByZzmm(
			Map<String, Object> params);


	public List<Map<String, Object>> countuResidenceQsInfoListByDtype(
			Map<String, Object> params);

	/**
	 * 获取档案编号
	 * @return
	 */
	public String getNextDpno(String date,String s);
	
	/**
	 * 获取系统编号
	 * @return
	 */
	public String getNextPno(String date);
	
	/**档案信息导出
	 * @param response
	 * @param request
	 */
	void daExport(HttpServletResponse response,HttpServletRequest request)throws Exception;
	
	void daAllExport(HttpServletResponse response,HttpServletRequest request)throws Exception;


	public List<Map<String, Object>> queryuserLogList(Map<String, Object> params);
	/**
	 * 检查系统中是否存在该身份证号码，并返回对应的档案号
	 * @param pnum
	 * @return
	 */
	public Map<String,Object> checkIsPnumExistInSystem(String pnum);
	Map<String,Object> selectmaxDpno(Map<String,Object> record);
	
	public void updatemaxPno();

 }