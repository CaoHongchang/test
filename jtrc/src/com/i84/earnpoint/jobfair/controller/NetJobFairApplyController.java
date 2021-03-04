package com.i84.earnpoint.jobfair.controller;

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
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.jobfair.service.NetJobFairApplyService;
import com.i84.earnpoint.mapper.EnterpriseInfoDetailMapper;
import com.i84.earnpoint.mapper.JobFairApplyMapper;
import com.i84.earnpoint.mapper.JobFairAreaMapper;
import com.i84.earnpoint.mapper.JobFairMapper;
import com.i84.earnpoint.model.JobFairApply;
/**
 * 
 * 网络招聘会申请管理
 *
 * @author Cary Huang
 * @created 2016年10月15日 下午2:02:49
 */
@Controller
@RequestMapping("/netJobFairApply")
public class NetJobFairApplyController extends ResultConstant{

	@Autowired
	private NetJobFairApplyService netJobFairApplyService;
    @Autowired
    private JobFairApplyMapper jobFairApplyMapper;
    @Autowired
    private JobFairAreaMapper jobFairAreaMapper;//展区
    @Autowired
    private EnterpriseInfoDetailMapper enterpriseInfoDetailMapper;//企业信息
    @Autowired
    private JobFairMapper jobFairMapper;
    /**
     * 
     * 查找网络招聘会列表
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
        params.put("type",  new int[] {3, 4});//
        params.put("starttime", request.getParameter("starttime"));
        params.put("endtime", request.getParameter("endtime"));
        List<Map<String,Object>> list= jobFairMapper.selectBySelective(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    /**
     * 
     * 查看
     *
     * @author Cary Huang
     * @created 2016年10月16日 下午9:08:42
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/get")
    public ModelAndView get(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
        
        String type = request.getParameter("type");//编辑类型
        String enterpriseId = request.getParameter("enterpriseid");
        String fairId = request.getParameter("fairid");
        mv.addObject("enterprise", enterpriseInfoDetailMapper.selectByEnterpriseId(Integer.parseInt(enterpriseId)));
        mv.addObject("area", jobFairApplyMapper.selectForMap(Integer.parseInt(request.getParameter("fairapplyid"))));
        Map<String, Object> map =  new HashMap<String, Object>();
        map.put("fairid", Integer.parseInt(fairId));
        map.put("enterpriseid", Integer.parseInt(enterpriseId));
        mv.addObject("jobname", jobFairApplyMapper.getJobNameByMap(map));
        if("1".equals(type)){//查看
            mv.setViewName("jobfair/onlinemanage/detail");
        }else{//跳到审核页
            mv.setViewName("jobfair/onlinemanage/edit");
        }
        return mv;
    }
    
	/**
	 * 
	 * 查找 
	 *
	 * @author Cary Huang
	 * @created 2016年10月15日 下午9:27:51
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/query")
    public @ResponseBody Map<String,Object> query(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        
        Map<String,Object> obj = new HashMap<String, Object>();
        if(StringUtils.isNotBlank(request.getParameter("name"))){
            obj.put("name", TextUtil.getString(params.get("name")));//名称
        }
        String status =  request.getParameter("status");//审核状态
        if(StringUtils.isNotBlank(status)){
            String [] arr = status.split(",");
            obj.put("status", arr);
        }
        if(StringUtils.isNotBlank(request.getParameter("fairid"))){
            obj.put("fairid", request.getParameter("fairid"));//招聘会ID
        }
        obj.put("isShow", true);
        obj.put("fairtype", new int[]{3,4});//招聘会ID
        if(StringUtils.isNotBlank(request.getParameter("starttime"))){
            obj.put("starttime", request.getParameter("starttime"));//开始时间
        }
        if(StringUtils.isNotBlank(request.getParameter("endtime"))){
            obj.put("endtime", request.getParameter("endtime"));//结束时间
        }
        List<Map<String,Object>> list= netJobFairApplyService.queryJobFair(obj);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
	
	
	/**
	 * 审核
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/review")
	public void review(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    
	    JobFairApply obj = new JobFairApply();
	    obj.setId(Integer.valueOf(request.getParameter("id")));
	    obj.setStatus(Integer.parseInt(request.getParameter("status")));
	    obj.setReason(request.getParameter("reason"));
        jobFairApplyMapper.updateByPrimaryKeySelective(obj);
        
        JSONObject object = new JSONObject();
        object.put("flag", true);
        object.put("msg", "保存成功");
        write(response, object);
	}
	
	/**
	 * 
	 * 根据展会获取展位展区
	 *
	 * @author Cary Huang
	 * @created 2016年12月21日 下午8:58:53
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/getFairAreaByFairid")
    public void getFairAreaByFairid(HttpServletResponse response,HttpServletRequest request) throws Exception{
        
	    Map<String, Object> jobFairMap = null;
        String id = request.getParameter("fairid");
        jobFairMap = new HashMap<String, Object>();
        jobFairMap.put("id", id);
        List<Map<String,Object>> s = jobFairAreaMapper.getJobFairAreaByMap(jobFairMap);
        
        JSONObject object = new JSONObject();
        object.put("flag", true);
        object.put("list", s);
        object.put("msg", "保存成功");
        write(response, object);
    }
	
	
	
}
