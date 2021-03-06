package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;


import com.i84.earnpoint.model.PartyMoneyInfo;

public interface PartyMoneyInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	int insert(PartyMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	int insertSelective(PartyMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	PartyMoneyInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(PartyMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table party_money_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(PartyMoneyInfo record);

	List<Map<String,Object>> selectPartyMoneyByMap(Map<String,Object> record);
//	List<PartyMoneyInfo> selectBySelective(PartyMoneyInfo record);
	
    Float selectUserPartyMoneySum(String pnum);
    /**
     * 根据付款交易号查询党员缴费信息
     * @param orderNo
     * @return
     */
    PartyMoneyInfo selectPartyMoneyInfoByOrderNo(String orderNo);
    
    int deletePartyMoneyInfoByIds(String []array);
}