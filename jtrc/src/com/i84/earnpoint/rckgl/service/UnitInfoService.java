package com.i84.earnpoint.rckgl.service;

import java.util.List;
import com.i84.earnpoint.model.UnitInfo;

/**
 * 人才库管理Service
 * @author Administrator
 *
 */
public interface UnitInfoService {
	
	/**
	 * 查询单位列表
	 * @param unitInfo
	 * @return
	 */
	List<UnitInfo> queryUnitList(UnitInfo unitInfo);
	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	int insert(UnitInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	int insertSelective(UnitInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	UnitInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	int updateByPrimaryKeySelective(UnitInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table unit_info
	 * @mbggenerated  Sat Oct 22 11:01:08 CST 2016
	 */
	int updateByPrimaryKey(UnitInfo record);
}
