package com.i84.earnpoint.daxt.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.Statistical;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserInfo;


/**
 * 档案管理服务接口
 * @author zhengqr
 *
 */
public interface ArchivesBaseInfoService {
	
	/**
	 * 档案管理列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryArchivesBaseInfoList(Map<String, Object> record);
	
	/**
	 * 材料管理列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryArchivesBaseInfoList1(Map<String, Object> record);
	
	/**
	 * 新增档案管理信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addArchivesBaseInfo(ArchivesBaseInfo archivesBaseInfo, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改档案管理信息
	 * @param userExpertInfo
	 * @return
	 */
	public void updateArchivesBaseInfo(ArchivesBaseInfo archivesBaseInfo, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改档案管理信息
	 * @param userExpertInfo
	 * @return
	 */
	public void delArchivesBaseInfo(String ids,String pid, HttpServletResponse response) throws Exception;
	
	public List<Map<String, Object>> QueryBaseinfoList(
			Map<String, Object> record);
	
	public List<Map<String,Object>> QueryCheckBaseinfoList(Map<String, Object> record);
	/**
	 * 按年统计派遣
	 * @param userExpertInfo
	 * @return
	 */
	public List<Map<String, Object>> sendByYear(String year1,String year2,String timeType,String fileType);
	public List<Map<String, Object>> sjdasltj(String year1,String year2,String timeType);
	public List<Map<String, Object>> rswbtj(String year1,String year2,String timeType,String fileType);
	public List<Map<String, Object>> dwdltj(String year1,String year2,String timeType,String fileType);
	public List<Map<String, Object>> xbtj(String year1,String year2,String timeType,String fileType);
	public List<Map<String, Object>> sex(String year1,String year2,String fileType);
	public List<Map<String, Object>> birthDate(String year1,String year2,String timeType,String fileType);
	public List<Map<String, Object>> degree(String year1,String year2,String fileType);
	public List<Map<String, Object>> zzmm(String year1,String year2,String fileType);
	public List<Map<String, Object>> dtype(String year1,String year2,String fileType);

	
	
	
	
	/*public List<Statistical>sendByYear2(String year1,String year2);
	public List<Statistical>sendByYear3(String year1,String year2);*/
	/**
	 * 按月统计派遣
	 * @param userExpertInfo
	 * @return
	 */
	/*public List<Map<String, Object>> sendByMonth(String year1,String year2);
	public List<Map<String, Object>> sendByMonth1(String year1,String year2);*/
}