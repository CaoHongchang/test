package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.model.UserScoreInfo;

public interface UserScoreInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	int insert(UserScoreInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	int insertSelective(UserScoreInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	UserScoreInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(UserScoreInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_score_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(UserScoreInfo record);

	//int qryIsExist(UserScoreImportInfo userScoreInfo);
}