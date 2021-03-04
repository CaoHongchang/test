package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ResumeInfo;

public interface ResumeInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ResumeInfo record);

    int insertSelective(ResumeInfo record);

    ResumeInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ResumeInfo record);

    int updateByPrimaryKey(ResumeInfo record);
    
    List<Map<String,Object>> selectByMap(Map<String, Object> map);
    
    List<Map<String,Object>> selectResumeByUid(Map<String, Object> map);
}