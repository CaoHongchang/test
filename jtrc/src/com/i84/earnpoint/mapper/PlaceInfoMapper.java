package com.i84.earnpoint.mapper;

import java.util.List;

import com.i84.earnpoint.model.PlaceInfo;

public interface PlaceInfoMapper {
    /**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	int insert(PlaceInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	int insertSelective(PlaceInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	PlaceInfo selectByPrimaryKey(Integer id);
	
	PlaceInfo selectByPno(PlaceInfo record);
	PlaceInfo selectByPnoId(PlaceInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(PlaceInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table place_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(PlaceInfo record);

	List<PlaceInfo> selectPlaceInfoBySelective(PlaceInfo placeInfo);

	String selectMaxPno(Integer activityCode);
}