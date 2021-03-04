package com.i84.earnpoint.daxt.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ArchivesMoneyImportInfo;
import com.i84.earnpoint.model.ArchivesMoneyInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;


/**
 * 档案缴费信息服务接口
 * @author Wangsc
 *
 */
public interface ArchivesMoneyInfoService {
	/**
     * 	获取档案流动列表
     */
	List<ResidenceIoInfo> queryResidenceIoInfo(Map<String,Object> record);
	/**
	 * 新增档案流动信息
	 */
	void saveResidenceIoInfo(Map<String, Object> param) throws ParseException;
	/**
	 * 更新档案流动信息
	 * @param param
	 */
	void updateResidenceIoInfo(Map<String, Object> param);
	/**
	 * 删除档案流动信息
	 * @param id
	 */
	void delResidenceIoInfo(int id);
	/**
	 * 	查询档案缴费信息列表
	 * @param params
	 * @return
	 */
	List<ArchivesMoneyInfo> queryArchivesMoneyList(Map<String, Object> params);
	/**
	 * 添加缴费情况
	 * @param list
	 */
	void saveJf(List<ArchivesMoneyImportInfo> list); 
	/**
	 * 更新缴费信息
	 * @param record
	 */
	void updateJf(ArchivesMoneyInfo record)throws Exception;
	/**
	 * 删除缴费信息
	 * @param ids
	 * @param response
	 * @throws Exception
	 */
	void deleteJf(String [] ids,HttpServletResponse response)throws Exception;
	
	void addJf(ArchivesMoneyInfo archivesMoneyInfo)throws Exception;
}