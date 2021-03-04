package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ResumeJobIntension;

public interface ResumeJobIntensionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ResumeJobIntension record);

    int insertSelective(ResumeJobIntension record);

    ResumeJobIntension selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ResumeJobIntension record);

    int updateByPrimaryKey(ResumeJobIntension record);
    
    List<ResumeJobIntension> selectBySelective(Map<String, Object> map);
}