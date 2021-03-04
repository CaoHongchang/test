package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.JobBrowserLog;

public interface JobBrowserLogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JobBrowserLog record);

    int insertSelective(JobBrowserLog record);

    JobBrowserLog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobBrowserLog record);

    int updateByPrimaryKey(JobBrowserLog record);
}