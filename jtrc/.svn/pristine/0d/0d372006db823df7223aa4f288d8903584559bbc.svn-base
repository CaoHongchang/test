package com.i84.earnpoint.jobfair.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.ToolDateTime;
import com.i84.earnpoint.jobfair.service.OnlineJobFairService;
import com.i84.earnpoint.mapper.JobFairAreaMapper;
import com.i84.earnpoint.mapper.JobFairMapper;
import com.i84.earnpoint.model.JobFair;
/**
 * 
 * 网络招聘会
 *
 * @author Cary Huang
 * @created 2016年10月15日 下午2:02:49
 */
@Controller
@RequestMapping("/onlineJobFair")
public class OnlineJobFairController extends ResultConstant{

	@Autowired
	private OnlineJobFairService onlineJobFairService;
    @Autowired
    private JobFairAreaMapper jobFairAreaMapper;
    @Autowired
    private JobFairMapper jobFairMapper;
    /**
     * 
     * 更改状态
     *
     * @author Cary Huang
     * @created 2016年10月16日 下午11:32:38
     * @param response
     * @param request
     * @throws Exception
     */
    @RequestMapping("/eidtJobFairStatus")
    public void eidtJobFairStatus(HttpServletResponse response,HttpServletRequest request) throws Exception{
        
        JobFair job = jobFairMapper.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
        job.setStatus(Integer.valueOf(request.getParameter("status")));
        jobFairMapper.updateByPrimaryKey(job);
        
        JSONObject object = new JSONObject();
        object.put("flag", true);
        object.put("msg", "保存成功");
        
        write(response, object);
    }
    
    /**
     * 修改
     * @param response
     * @param request
     * @throws Exception
     */
    @RequestMapping("/editJobFair")
    public void editJobFair(HttpServletResponse response,HttpServletRequest request) throws Exception{
        
        String name = request.getParameter("name");
        String hold_time = request.getParameter("hold_time");
        
        JobFair jobFair = jobFairMapper.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
        jobFair.setName(name);
        jobFair.setHoldTime(ToolDateTime.parse(hold_time, ToolDateTime.PATTERN_YMD));
        jobFair.setUpdateTime(new Date());
        int flag = jobFairMapper.updateByPrimaryKeySelective(jobFair);
        
        JSONObject object = new JSONObject();
        object.put("flag", true);
        object.put("msg", "修改成功");
        
        write(response, object);
    }
    
    /**
     * 
     * 查看详细
     *
     * @author Cary Huang
     * @created 2016年10月16日 下午9:08:42
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/get")
    public @ResponseBody
    Map<String, Object> getById(HttpServletResponse response, HttpServletRequest request) {
        boolean flag = false;
        String cause = "";
        Map<String, Object> jobFairMap = null;
        try {
            String id = request.getParameter("id");//
            jobFairMap = new HashMap<String, Object>();
            jobFairMap.put("id", id);
            // 招聘会
            Map<String, Object> m = onlineJobFairService.getByMap(jobFairMap);
            ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD, m, "hold_time");
            
            Map<String, Object> resultMap = new HashMap<String, Object>();
            resultMap.put("jobfair", m);
            resultMap.put("flag", flag);
            resultMap.put("cause", cause);
            return resultMap;

        } catch (Exception e) {
            e.printStackTrace();
            flag = false;
            cause = "数据上传异常";
        }
        return ResultConstant.resultMap(jobFairMap, flag, cause);

    }
	   
	/**
	 * 
	 * 删除描述
	 *
	 * @author Cary Huang
	 * @created 2016年10月15日 下午9:38:21
	 * @param response
	 * @param request
	 * @return
	 */
   @RequestMapping("/delJobFair")  
    public  @ResponseBody Map<String, Object> delJobFair(HttpServletResponse response,HttpServletRequest request){
	        boolean flag=false;
	        String cause="";
	        try {
	            String uid = request.getSession().getAttribute("uid").toString();
	            String id = request.getParameter("id");
	            String[] ary = id.split(",");
	            for(String i : ary){
	                JobFair obj = jobFairMapper.selectByPrimaryKey(Integer.valueOf(i));
	                obj.setDeleteTime(new Date());
	                obj.setDeleteUid(Integer.valueOf(uid));
	                jobFairMapper.updateByPrimaryKeySelective(obj);
	            }
	            flag = true;
	            cause = "删除成功.";
	        } catch (Exception e) {
	            e.printStackTrace();
	            flag=false;
	            cause="操作异常";
	        }
	        return ResultConstant.resultMap(flag, cause);  
	    }
	/**
	 * 
	 * 查找 描述
	 *
	 * @author Cary Huang
	 * @created 2016年10月15日 下午9:27:51
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryJobFairs")
    public @ResponseBody Map<String,Object> queryJobFairs(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("name", request.getParameter("name"));
        String status =  request.getParameter("status");
        if(StringUtils.isNotBlank(status) && "2".equals(status)){
            params.remove("status");
        }
        params.put("type", new int[] {4});//
        params.put("starttime", request.getParameter("starttime"));
        params.put("endtime", request.getParameter("endtime"));
        List<Map<String,Object>> list= onlineJobFairService.queryJobFair(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
	
	/**
	 * 新增
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/saveJobFair")
	public void saveJobFair(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    JobFair jobFair = new JobFair();
        jobFair.setCreateTime(new Date());
        jobFair.setHoldTime(ToolDateTime.parse(request.getParameter("hold_time"), ToolDateTime.PATTERN_YMD));
        jobFair.setName(request.getParameter("name"));
        jobFair.setStatus(1);//生效
        jobFair.setType(4);//校园招聘
        Integer uid = Integer.valueOf(request.getSession().getAttribute("uid").toString());
        jobFair.setCreateUid(uid);
        int rs = jobFairMapper.insertSelective(jobFair);
        
        JSONObject object = new JSONObject();
        object.put("id", rs);
        object.put("flag", true);
        object.put("msg", "保存成功");
        write(response, object);
	}
	
	
}
