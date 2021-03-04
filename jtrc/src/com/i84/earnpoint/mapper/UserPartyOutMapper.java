package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.UserPartyOut;

public interface UserPartyOutMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	int insert(UserPartyOut record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	int insertSelective(UserPartyOut record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	UserPartyOut selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(UserPartyOut record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_party_out
	 * @mbggenerated
	 */
	int updateByPrimaryKey(UserPartyOut record);
	
	/**
	 * 根据党员信息更新党员转出信息
	 * @param record
	 * @return
	 */
	int updateByPrimaryKeySelectiveForParty(UserPartyOut record);
	
	/**
	 * 根据党员ID获取党员转出信息
	 * @param party
	 * @return
	 */
	List<Map<String, Object>> selectByPrimaryKeyForParty(Map<String, Object> party);
	
	
}