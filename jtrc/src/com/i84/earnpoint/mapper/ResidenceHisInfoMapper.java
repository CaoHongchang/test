package com.i84.earnpoint.mapper;

import java.util.Map;

import com.i84.earnpoint.model.ResidenceHisInfo;

public interface ResidenceHisInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    int insert(ResidenceHisInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    int insertSelective(ResidenceHisInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    ResidenceHisInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ResidenceHisInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_his_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ResidenceHisInfo record);

	void insertintohis(Map<String, Object> insertMap);

	void hkgh(Map<String, Object> insertMap);
}