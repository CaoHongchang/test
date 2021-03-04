package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.EnterpriseCheck;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;

public interface EnterpriseCheckMapper {

	/**
	 * 保存企业排查
	 * @param contractModel
	 */
	int insertSelective(EnterpriseCheck enterpriseCheck);
	
	/**
	 * 根据条件搜索企业排查
	 * @return
	 */
	List<Map<String, Object>> qryEnterpriseCheck(Map<String, Object> record);
	
	/**
	 * 修改企业排查
	 * @param updateObj
	 */
	int updateByPrimaryKeySelective(EnterpriseCheck enterpriseCheck);
}