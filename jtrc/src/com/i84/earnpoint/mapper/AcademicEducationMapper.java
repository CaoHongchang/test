package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.AcademicEducation;

public interface AcademicEducationMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AcademicEducation record);

    int insertSelective(AcademicEducation record);

    AcademicEducation selectByPrimaryKey(Integer id);
    AcademicEducation selectMaxEducationNum(Integer id);

    int updateByPrimaryKeySelective(AcademicEducation record);

    int updateByPrimaryKey(AcademicEducation record);
    
    List<AcademicEducation>  selectAcademicList(Map<String,Object>m); 
    
	List<Map<String, Object>> selectListByBkcc(Map<String, Object> params);

    
}