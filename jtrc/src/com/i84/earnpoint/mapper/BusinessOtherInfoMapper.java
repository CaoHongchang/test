package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.BusinessOtherInfo;

public interface BusinessOtherInfoMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	int insert(BusinessOtherInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	int insertSelective(BusinessOtherInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	BusinessOtherInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(BusinessOtherInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table business_other_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(BusinessOtherInfo record);

	int insertBusinessOtherInfo(Map<String,Object>map);

    List<Map<String,Object>> selectByfjList(Map<String,Object>map);
    int deleteByFj(Map<String,Object>map);

}