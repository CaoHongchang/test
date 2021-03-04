package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.StudentAchievement;
import com.i84.earnpoint.model.StudentSignup;
import com.i84.earnpoint.model.XyExportVo;

public interface StudentSignupMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StudentSignup record);

    int insertSelective(StudentSignup record);

    StudentSignup selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StudentSignup record);

    int updateByPrimaryKey(StudentSignup record);
    
    /**学员记录是否存在
     * @param record
     * @return
     */
    StudentSignup selectisExist(StudentSignup record);
    /**学员报名列表
     * @param m
     * @return
     */
    List<Map<String,Object>> selectStudentList(Map<String,Object> m);
    
    List<XyExportVo> selectStudentList2(Map<String,Object> m);
    
    Map<String,Object> selectStudentbyId(Map<String,Object> m);
	List<Map<String, Object>> selectListByBkzrs(Map<String, Object> params);
	List<Map<String, Object>> selectListByBklrr(Map<String, Object> params);

	
}