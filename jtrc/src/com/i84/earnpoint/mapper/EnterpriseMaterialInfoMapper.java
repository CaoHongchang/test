package com.i84.earnpoint.mapper;

import java.util.List;

import com.i84.earnpoint.model.EnterpriseMaterialInfo;

public interface EnterpriseMaterialInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	int insert(EnterpriseMaterialInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	int insertSelective(EnterpriseMaterialInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	EnterpriseMaterialInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(EnterpriseMaterialInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table enterprise_material_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(EnterpriseMaterialInfo record);
	
	List<EnterpriseMaterialInfo> selectBySelective(EnterpriseMaterialInfo enterpriseMaterialInfo);
	
	int updateIsValid(String [] array);
}