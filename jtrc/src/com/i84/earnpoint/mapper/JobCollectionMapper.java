package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.JobCollection;

public interface JobCollectionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JobCollection record);

    int insertSelective(JobCollection record);

    JobCollection selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobCollection record);

    int updateByPrimaryKey(JobCollection record);
}