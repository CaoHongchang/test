package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.WorkCurInfo;

public interface WorkCurInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    int insert(WorkCurInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    int insertSelective(WorkCurInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    WorkCurInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(WorkCurInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table work_cur_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(WorkCurInfo record);
}