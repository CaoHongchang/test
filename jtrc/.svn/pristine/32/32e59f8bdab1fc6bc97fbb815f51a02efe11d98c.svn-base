package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.StudentAchievement;

public interface StudentAchievementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StudentAchievement record);

    int insertSelective(StudentAchievement record);

    StudentAchievement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StudentAchievement record);

    int updateByPrimaryKey(StudentAchievement record);
    

    /**成绩记录是否存在
     * @param record
     * @return
     */
    StudentAchievement selectisExist(StudentAchievement record);
}