package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.GzExportVo;
import com.i84.earnpoint.model.UserMoneyInfo;

public interface UserMoneyInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	int insert(UserMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	int insertSelective(UserMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	UserMoneyInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(UserMoneyInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_money_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(UserMoneyInfo record);

	int updateMoneyBySelective(Map<String,Object> obj);

	int insertUserMoney(Map<String,Object> obj);
	
	List<Map<String,Object>>selectGzglList(Map<String,Object> obj);
	List<GzExportVo>selectGzSyList(Map<String,Object>obj);


}