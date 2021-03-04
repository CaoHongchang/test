package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.JobFairApply;

/**
 * 
 * 招聘会申请管理
 *  
 * @author Cary Huang
 * @created 2016年10月18日 下午3:19:16
 */
public interface JobFairApplyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(JobFairApply record);

    int insertSelective(JobFairApply record);

    Map<String, Object> selectForMap(Integer id);
    
    JobFairApply selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(JobFairApply record);

    int updateByPrimaryKey(JobFairApply record);
    
    List<Map<String, Object>> getJobFairApplyByMap(Map<String, Object> map);
    
    String getJobNameByMap(Map<String, Object> map);
    
}