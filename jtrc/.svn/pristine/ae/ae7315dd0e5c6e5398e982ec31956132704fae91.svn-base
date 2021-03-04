package com.i84.earnpoint.jobfair.controller;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
import com.i84.earnpoint.common.ToolDateTime;
import com.i84.earnpoint.mapper.ResumeInfoMapper;
import com.i84.earnpoint.mapper.ResumeJobIntensionMapper;
import com.i84.earnpoint.mapper.ResumeLearningExperienceMapper;
import com.i84.earnpoint.mapper.ResumeWorkExperienceMapper;
import com.i84.earnpoint.model.ResumeInfo;
import com.i84.earnpoint.model.ResumeJobIntension;
import com.i84.earnpoint.model.ResumeLearningExperience;
import com.i84.earnpoint.model.ResumeWorkExperience;

@Controller
@RequestMapping("/jobfair/resumeinfo")
public class ResumeInfoController  extends ResultConstant{
    
    @Autowired 
    public ResumeInfoMapper resumeInfoMapper;//个人简历
    @Autowired
    public ResumeLearningExperienceMapper resumeLearningExperienceMapper;//学习经历
    @Autowired
    public ResumeWorkExperienceMapper resumeWorkExperienceMapper;//工作经历
    @Autowired
    public ResumeJobIntensionMapper resumeJobIntensionMapper;//求职意向
    
    /**
     * 
     * 伪删除
     * 
     * @author Cary Huang
     * @created 2016年10月15日 下午9:38:21
     * @param response
     * @param request
     * @return
     */
    @RequestMapping("/delStatus")
    public @ResponseBody Map<String,Object> delStatus(HttpServletResponse response, HttpServletRequest request) {
        String id = request.getParameter("id");
        String[] ary = id.split(",");
        for (String i : ary) {
            ResumeInfo obj = resumeInfoMapper.selectByPrimaryKey(Integer.valueOf(i));
            obj.setDeleteTime(new Date());
            String uid = request.getSession().getAttribute("uid").toString();
            obj.setDeleteUid(Integer.valueOf(uid));
            resumeInfoMapper.updateByPrimaryKeySelective(obj);
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("flag", true);
        resultMap.put("msg", "删除成功");
        return resultMap;
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
        params.put("name", request.getParameter("name"));
        params.put("starttime", request.getParameter("starttime"));
        params.put("endtime", request.getParameter("endtime"));
        List<Map<String,Object>> list= resumeInfoMapper.selectByMap(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    /**
     * 
     * 用户的简历列表
     *
     * @author Cary Huang
     * @created 2016年12月22日 下午9:48:18
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryResumeByUid")
    public @ResponseBody Map<String,Object> queryResumeByUid(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("uid", request.getParameter("uid"));//用户id
        List<Map<String,Object>> list= resumeInfoMapper.selectResumeByUid(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    /**
     * 
     * 个人简历查看
     *
     * @author Cary Huang
     * @created 2016年11月5日 下午2:25:45
     * @param request
     * @param response
     * @param mv
     * @return
     */
    @RequestMapping("/get")
    public ModelAndView get(HttpServletRequest request, HttpServletResponse response, ModelAndView mv) {
        String id = request.getParameter("id");
        mv.addObject("resumeInfo", resumeInfoMapper.selectByPrimaryKey(Integer.parseInt(id)));
//        Map<String, Object> obj = new HashMap<String, Object>();
//        obj.put("id", Integer.parseInt(id));
        mv.addObject("id", Integer.parseInt(id));
        mv.setViewName("jobfair/user/detail");
        return mv;
    }
    
    /**
     * 
     * 学习经历
     *
     * @author Cary Huang
     * @created 2016年11月5日 下午3:20:59
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryLearn")
    public @ResponseBody Map<String,Object> queryLearn(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("resumeId", request.getParameter("resumeid"));
        List<ResumeLearningExperience> list= resumeLearningExperienceMapper.selectBySelective(params);
        PageInfo<ResumeLearningExperience> pageInfo=new PageInfo<ResumeLearningExperience>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    /**
     * 
     * 工作经历
     *
     * @author Cary Huang
     * @created 2016年11月5日 下午3:25:54
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryWork")
    public @ResponseBody Map<String,Object> queryWork(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("resumeId", request.getParameter("resumeid"));
        List<ResumeWorkExperience> list= resumeWorkExperienceMapper.selectBySelective(params);
        PageInfo<ResumeWorkExperience> pageInfo=new PageInfo<ResumeWorkExperience>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    /**
     * 
     * 求职意向
     *
     * @author Cary Huang
     * @created 2016年11月5日 下午3:25:40
     * @param params
     * @param request
     * @param response
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryJobIntension")
    public @ResponseBody Map<String,Object> queryJobIntension(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("resumeId", request.getParameter("resumeid"));
        List<ResumeJobIntension> list= resumeJobIntensionMapper.selectBySelective(params);
        PageInfo<ResumeJobIntension> pageInfo=new PageInfo<ResumeJobIntension>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
    
    
    
}

