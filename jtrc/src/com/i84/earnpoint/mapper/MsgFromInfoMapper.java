package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.MsgFromInfo;

public interface MsgFromInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	int insert(MsgFromInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	int insertSelective(MsgFromInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	MsgFromInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(MsgFromInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table msg_from_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(MsgFromInfo record);

	void updateIsState(Map<String, Object> params);
	
	

}