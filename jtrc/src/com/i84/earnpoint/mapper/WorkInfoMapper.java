package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.WorkCurInfo;
import com.i84.earnpoint.model.WorkInfo;

public interface WorkInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	int insert(WorkInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	int insertSelective(WorkInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	WorkInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(WorkInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table work_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(WorkInfo record);

	/**
	 * 根据用户身份证查询对应的工作�?��列表
	 * @param pnum
	 * @return
	 */
	List<WorkInfo> selectByUserId(int userId);
	
	List<WorkInfo> queryList(WorkInfo record);

	int updateByPrimaryKeySelective(WorkCurInfo sf);
}