package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ExpertActivityInfo;

public interface ExpertActivityInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    int insert(ExpertActivityInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    int insertSelective(ExpertActivityInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    ExpertActivityInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ExpertActivityInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table expert_activity_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ExpertActivityInfo record);

    List<Map<String,Object>> listExpertActivityInfo(Map<String,Object> record);

    Map<String,Object> listExpertActivityInfo2(Map<String,Object> record);


    int deleteExpertActivityInfos(Map<String,Object> record);

    List<Map<String,Object>> listUserExpertInfoBySelective(Map<String,Object> record);

    List<Map<String, Object>> listUserExpertInfoBySelectiveAndVname(Map<String, Object> param);
}