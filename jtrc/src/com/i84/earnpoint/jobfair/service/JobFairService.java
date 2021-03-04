package com.i84.earnpoint.jobfair.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.ToolDateTime;
import com.i84.earnpoint.mapper.JobFairMapper;
import com.i84.earnpoint.model.JobFair;

/**
 * 
 * 普通专场招聘会
 *
 * @author Cary Huang
 * @created 2016年10月17日 下午6:58:47
 */
@Service
public class JobFairService {

	@Autowired
	private JobFairMapper jobFairMapper;
	    
	/**
	 * 
	 * 修改
	 *
	 * @author Cary Huang
	 * @created 2016年10月16日 下午11:15:25
	 * @param request
	 * @return
	 */
	   public String editJobFair(HttpServletRequest request) {

	        String name = request.getParameter("name");
	        String hold_time = request.getParameter("hold_time");
	        String hold_place = request.getParameter("hold_place");
	        String type = request.getParameter("type");
	        
	        JobFair jobFair=new JobFair();
	        jobFair.setName(name);
	        jobFair.setContent(request.getParameter("content"));
	        jobFair.setExplainContent(request.getParameter("explainContent"));
	        jobFair.setId(Integer.valueOf(request.getParameter("id")));
	        jobFair.setHoldTime(ToolDateTime.parse(hold_time, ToolDateTime.PATTERN_YMD));
	        jobFair.setHoldPlace(hold_place);
	        jobFair.setType(Integer.valueOf(type));
	        jobFair.setStatus(1);
	        jobFair.setUpdateTime(new Date());
	        int flag = jobFairMapper.updateByPrimaryKeySelective(jobFair);
	        
	        return String.valueOf(jobFair.getId());
	    }
	   
	/**
	 * 
	 * 保存
	 *
	 * @author Cary Huang
	 * @created 2016年10月16日 下午8:38:36
	 * @param request
	 * @return
	 */
	public String saveJobFair(HttpServletRequest request) {

		String name = request.getParameter("name");
		String hold_time = request.getParameter("hold_time");
		String hold_place = request.getParameter("hold_place");
		String type = request.getParameter("type");
		
		JobFair jobFair=new JobFair();
		jobFair.setName(name);
		jobFair.setContent(request.getParameter("content"));
		jobFair.setExplainContent(request.getParameter("explainContent"));
        jobFair.setHoldTime(ToolDateTime.parse(hold_time, ToolDateTime.PATTERN_YMD));
		jobFair.setHoldPlace(hold_place);
		jobFair.setType(Integer.valueOf(type));
		jobFair.setStatus(1);
		jobFair.setCreateTime(new Date());
		String uid = request.getSession().getAttribute("uid").toString();
		jobFair.setCreateUid(Integer.valueOf(uid));//新增的操作员ID
		int flag = jobFairMapper.insert(jobFair);
		
		return String.valueOf(jobFair.getId());
	}

    
    public List<Map<String, Object>> queryJobFair(Map<String, Object> params) {
        // TODO Auto-generated method stub
        return jobFairMapper.selectBySelective(params);
    }

    
    public int deleteByJobFair(Map<String, Object> obj) throws Exception {
        // TODO Auto-generated method stub
        return jobFairMapper.deleteByPrimaryKey(Integer.valueOf(obj.get("id").toString()));
    }


    /**
     * 
     * 查看详细
     *
     * @author Cary Huang
     * @created 2016年10月16日 下午8:38:55
     * @param obj
     * @return
     */
    public Map<String, Object> getByMap(Map<String, Object> obj) {
        return  jobFairMapper.getByMap(obj);
    }

	
	
}
