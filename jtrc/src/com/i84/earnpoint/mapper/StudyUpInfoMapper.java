package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.StudyUpInfo;

public interface StudyUpInfoMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	int insert(StudyUpInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	int insertSelective(StudyUpInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	StudyUpInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(StudyUpInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table study_up_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(StudyUpInfo record);

	/**
     * 	获取职业培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	List<Map<String, Object>> selectByUserId(int parseInt);
	
	List<StudyUpInfo> queryList(StudyUpInfo record);
}