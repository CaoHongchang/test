package com.i84.earnpoint.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.PartyMoneyInfo;

public interface PartyMoneyInfoService {
	/**
	 * 查询党费信息
	 * @param record
	 * @return
	 */
	List<Map<String,Object>> queryPartyMoneyInfos(Map<String,Object> record);
//	List<PartyMoneyInfo> queryPartyMoneyInfos(PartyMoneyInfo record);

	/**
	 * 更新用户党费信息
	 * @param pnum
	 */
	void updateUserPartyInfo(String pnum);
	
	/**
	 * 保存党员缴费信息
	 * @param partyMoneyInfo
	 * @param msgFromInfo
	 * @return
	 */
	 int savePartyMoneyInfo(PartyMoneyInfo partyMoneyInfo);
	 /**
	  * 查询付款交易号是否存在
	  * @param orderNo
	  * @param response
	  * @throws Exception
	  */
	void checkIsOrderNoExist(String orderNo,HttpServletResponse response)throws Exception;
	
	/**
	 * 更新党员缴费信息与数据来源信息
	 * @param partyMoneyInfo
	 * @param msgFromInfo
	 * @return
	 */
	int updatePartyMoneyInfo(PartyMoneyInfo partyMoneyInfo);
	
	
	void deletePartyMoneyInfos(String [] array,HttpServletResponse response )throws Exception;
	
}
