package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesLog;

public interface ArchivesLogMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	int insert(ArchivesLog record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	int insertSelective(ArchivesLog record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	ArchivesLog selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(ArchivesLog record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_log
	 * @mbggenerated
	 */
	int updateByPrimaryKey(ArchivesLog record);

	List<Map<String, Object>> getList(Map<String, Object> params);
}