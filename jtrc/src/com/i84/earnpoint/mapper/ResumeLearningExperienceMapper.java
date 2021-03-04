package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ResumeLearningExperience;

public interface ResumeLearningExperienceMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ResumeLearningExperience record);

    int insertSelective(ResumeLearningExperience record);

    ResumeLearningExperience selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ResumeLearningExperience record);

    int updateByPrimaryKey(ResumeLearningExperience record);
    
    List<ResumeLearningExperience> selectBySelective(Map<String, Object> map);
}