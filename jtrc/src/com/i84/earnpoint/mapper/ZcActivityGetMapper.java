package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ZcActivityGet;

public interface ZcActivityGetMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	int insert(ZcActivityGet record);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	int insertSelective(ZcActivityGet record);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	ZcActivityGet selectByPrimaryKey(Integer id);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(ZcActivityGet record);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table zc_activity_get
	 * @mbggenerated
	 */
	int updateByPrimaryKey(ZcActivityGet record);
	List<Map<String,Object>> queryList(Map<String,Object> map);
	
	List<Map<String,Object>> queryListExcel(Map<String,Object> map);
	
	List<Map<String,Object>> queryListExcel1(Map<String,Object> map);
	
	List<Map<String,Object>> queryListExcel2(Map<String,Object> map);
	
	/**
	 * 查询职称评审基本信息
	 * @param params
	 * @return
	 */
	List<ZcActivityGet> selectZCPSBaseInfoList(ZcActivityGet params);
	
	/**
	 * 查询某个活动下某个人的申报信息
	 * @param record
	 * @return
	 */
	ZcActivityGet selectZcActivityGetByActivityIdAndUid(ZcActivityGet record);

	List<Map> selectZCPSBaseInfoList1(ZcActivityGet params);
	List<Map<String, Object>> selectZCPSBaseInfoList(Map<String, Object> param);
	
	int selectZCPSBaseInfoList2(ZcActivityGet params);
}