package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;

public interface ContractModelMapper {

	/**
	 * 保存合同模板
	 * @param contractModel
	 */
	int insertSelective(ContractModel contractModel);
	
	/**
	 * 根据条件搜索合同模板
	 * @return
	 */
	List<Map<String, Object>> qryContractModel(Map<String, Object> record);
	
	/**
	 * 修改合同模板
	 * @param updateObj
	 */
	int updateByPrimaryKeySelective(ContractModel contractModel);
	/**
	 * 获取下一编号
	 * @return
	 */
	public String getNextMid();
}