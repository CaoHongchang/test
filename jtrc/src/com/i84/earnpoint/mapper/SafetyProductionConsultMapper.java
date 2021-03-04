package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.SafetyProductionConsult;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;

public interface SafetyProductionConsultMapper {

	
	/**
	 * 安全生产标准化咨询列表
	 * @return
	 */
	List<Map<String, Object>> qrySafetyProductionConsultList(Map<String, Object> record);
	
	/**
	 * 修改安全生产标准化咨询
	 * @param updateObj
	 */
	int updateByPrimaryKeySelective(SafetyProductionConsult safetyProductionConsult);
	
	/**
	 * 根据年份统计
	 * @return
	 */
	List<Map<String, Object>> countByYear(Map<String, Object> record);
	
}