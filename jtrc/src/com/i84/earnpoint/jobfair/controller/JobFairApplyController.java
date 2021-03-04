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
import com.i84.earnpoint.jobfair.service.JobFairApplyService;
import com.i84.earnpoint.mapper.EnterpriseInfoDetailMapper;
import com.i84.earnpoint.mapper.JobFairApplyMapper;
import com.i84.earnpoint.mapper.JobFairAreaMapper;
import com.i84.earnpoint.model.JobFairApply;
/**
 * 
 * 专场招聘会申请管理
 *
 * @author Cary Huang
 * @created 2016年10月15日 下午2:02:49
 */
@Controller
@RequestMapping("/jobFairApply")
public class JobFairApplyController extends ResultConstant{

	@Autowired
	private JobFairApplyService jobFairApplyService;
    @Autowired
    private JobFairApplyMapper jobFairApplyMapper;
    @Autowired
    private JobFairAreaMapper jobFairAreaMapper;//展区
    @Autowired
    private EnterpriseInfoDetailMapper enterpriseInfoDetailMapper;//企业信息
    /**
     * 展位变更
     * @param response
     * @param request
     * @throws Exception
     */
    @RequestMapping("/changeArea")
    public void changeArea(HttpServletResponse response,HttpServletRequest request) throws Exception{
        JSONObject object = new JSONObject();
        
        String areaid = request.getParameter("areaid");//展区号
        String positionNo = request.getParameter("positionno");//展位号
        String id = request.getParameter("id");//企业申请的ID
        String fairId = request.getParameter("fairid");//招聘会ID
        // 判断展区,展位号是否存在
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("id", Integer.parseInt(fairId));
        map.put("areaId", Integer.parseInt(areaid));
        List<Map<String, Object>> areaList = jobFairAreaMapper.getJobFairAreaByMap(map);
        if(areaList.size()<=0){
            object.put("flag", false);
            object.put("msg", "区数不存在,请重新填写!");
            write(response, object);
            return;
        }
        Map<String, Object> area = areaList.get(0);
        if((Integer.parseInt(area.get("positioncount").toString())) < (Integer.parseInt(positionNo))){
            object.put("flag", false);
            object.put("msg", "展位号超出,请输入"+area.get("positioncount").toString()+"及以内的编号!");
            write(response, object);
            return;
        }
        // 判断展位号是否已经被占用
        map.remove("id");
        map.put("positionno", positionNo);
        map.put("fairid", fairId);
        areaList.clear();
        areaList = jobFairApplyMapper.getJobFairApplyByMap(map);
        if(areaList.size()>0){
            object.put("flag", false);
            object.put("msg", "对不起,该展区此展位已被占用!");
            write(response, object);
            return;
        }
        // 更新展位
        JobFairApply obj = new JobFairApply();
        obj.setId(Integer.parseInt(id));//
        obj.setAreaId(areaid);
        obj.setPositionNo(positionNo);
        jobFairApplyMapper.updateByPrimaryKeySelective(obj);
        object.put("flag", true);
        object.put("msg", "展位变更成功");
        write(response, object);
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
        String areaid = request.getParameter("areaid");
        mv.addObject("enterprise", enterpriseInfoDetailMapper.selectByEnterpriseId(Integer.parseInt(enterpriseId)));
        mv.addObject("area", jobFairApplyMapper.selectForMap(Integer.parseInt(request.getParameter("fairapplyid"))));
        Map<String, Object> map =  new HashMap<String, Object>();
        map.put("fairid", Integer.parseInt(fairId));
        map.put("enterpriseid", Integer.parseInt(enterpriseId));
        mv.addObject("jobname", jobFairApplyMapper.getJobNameByMap(map));
       
        Map<String, Object> obj = new HashMap<String, Object>();
        obj.put("id", Integer.parseInt(fairId));
        obj.put("areaId", Integer.parseInt(areaid));
        if("1".equals(type)){//查看
            mv.setViewName("jobfair/specialmanage/detail");
        }else{//跳到审核页
            mv.setViewName("jobfair/specialmanage/edit");
        }
        return mv;
    }
    
    /**
     * 
     * 描述
     *
     * @author Cary Huang
     * @created 2016年10月19日 下午3:36:11
     * @param ids
     * @return
     */
    protected String toSql(String ids) {
        if (null == ids || ids.isEmpty()) {
            return "";
        }
        String[] idsArr = ids.split(",");
        StringBuilder sqlSb = new StringBuilder();
        int length = idsArr.length;
        for (int i = 0, size = length - 1; i < size; i++) {
            sqlSb.append(" '").append(idsArr[i]).append("', ");
        }
        if (length != 0) {
            sqlSb.append(" '").append(idsArr[length - 1]).append("' ");
        }
        return sqlSb.toString();
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
        obj.put("fairtype", new int[]{1,2});//招聘会ID
        if(StringUtils.isNotBlank(request.getParameter("starttime"))){
            obj.put("starttime", request.getParameter("starttime"));//开始时间
        }
        if(StringUtils.isNotBlank(request.getParameter("endtime"))){
            obj.put("endtime", request.getParameter("endtime"));//结束时间
        }
        List<Map<String,Object>> list= jobFairApplyService.queryJobFair(obj);
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
	
}
