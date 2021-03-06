package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ResidenceIoInfo;

public interface ResidenceIoInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	int insert(ResidenceIoInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	int insertSelective(ResidenceIoInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	ResidenceIoInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(ResidenceIoInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table residence_io_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(ResidenceIoInfo record);

	List<ResidenceIoInfo> queryResidenceIoInfo(Map<String, Object> record);
}