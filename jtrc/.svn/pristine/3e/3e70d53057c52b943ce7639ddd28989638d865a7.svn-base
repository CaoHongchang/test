package com.i84.earnpoint.jobfair.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.JobFairApplyMapper;

/**
 * 
 * 专场招聘会
 *
 * @author Cary Huang
 * @created 2016年10月17日 下午6:58:47
 */
@Service
public class JobFairApplyService {

	@Autowired
	private JobFairApplyMapper jobFairApplyMapper;
	
	/**
	 * 
	 * 查询列表
	 *
	 * @author Cary Huang
	 * @created 2016年10月18日 下午3:34:01
	 * @param params
	 * @return
	 */
    public List<Map<String, Object>> queryJobFair(Map<String, Object> params) {
        return jobFairApplyMapper.getJobFairApplyByMap(params);
    }



	
	
}
