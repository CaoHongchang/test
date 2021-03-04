package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.BgActivityArgInfo;

public interface BgActivityArgInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    int insert(BgActivityArgInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    int insertSelective(BgActivityArgInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    BgActivityArgInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(BgActivityArgInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_arg_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(BgActivityArgInfo record);
    
    //获取列表
    List<BgActivityArgInfo> queryBgActivityArgInfo4List(BgActivityArgInfo bgActivityArgInfo);
    
    Map<String, Object> queryBgActivityArgInfo4Bean(Map<String,Object> param);
    
    List<Map<String,Object>> selectListBySelective(Map<String,Object> record);
    
    BgActivityArgInfo selectByActivityId(Integer activityId);
}