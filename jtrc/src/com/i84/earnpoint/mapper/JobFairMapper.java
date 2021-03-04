package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.JobFair;

public interface JobFairMapper {
    
    int deleteByPrimaryKey(Integer id);

    int insert(JobFair record);

    int insertSelective(JobFair record);

    JobFair selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobFair record);

    int updateByPrimaryKeyWithBLOBs(JobFair record);

    int updateByPrimaryKey(JobFair record);
    
    List<Map<String,Object>> selectBySelective(Map<String,Object> record);
    
    Map<String,Object> getByMap(Map<String,Object>obj);
    
}