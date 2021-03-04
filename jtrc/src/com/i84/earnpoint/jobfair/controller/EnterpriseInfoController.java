package com.i84.earnpoint.jobfair.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.FileUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.EnterpriseInfoDetailMapper;
import com.i84.earnpoint.mapper.EnterpriseInfoMapper;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.EnterpriseInfoDetail;
import com.i84.earnpoint.service.EnterpriseInfoService;
/**
 * 
 * 招聘企业管理
 *
 * @author Cary Huang
 * @created 2016年10月15日 下午2:02:49
 */
@Controller
@RequestMapping("/enterpriseInfoJob")
public class EnterpriseInfoController extends ResultConstant{

	@Autowired
	private EnterpriseInfoService enterpriseInfoService;
	@Autowired
	private EnterpriseInfoMapper enterpriseInfoMapper;
	@Autowired
	private EnterpriseInfoDetailMapper enterpriseInfoDetailMapper;//企业详细信息
	
	@RequestMapping("/update")
    public @ResponseBody Map<String,Object>  update(@RequestParam(value="file_upload", required=false) MultipartFile file, 
            HttpServletRequest request, HttpServletResponse response, EnterpriseInfoDetail enterpriseInfo) throws IOException{
	    
	    if(file != null){
	        String path = FileUtil.savePicture(file, request);//保存图片
	        enterpriseInfo.setLogoUrl(path);
	    }
//        EnterpriseInfoDetail enterpriseInfo = enterpriseInfoDetailMapper.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
        enterpriseInfoDetailMapper.updateByPrimaryKeySelective(enterpriseInfo);
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("flag", true);
        resultMap.put("msg", "修改成功");
        return resultMap;
    }
	
    /**
     * 
     * 审核
     *
     * @author Cary Huang
     * @created 2016年10月16日 下午11:32:38
     * @param response
     * @param request
     * @throws Exception
     */
    @RequestMapping("/review")
    public @ResponseBody Map<String,Object> review(HttpServletResponse response,HttpServletRequest request) throws Exception{
        
        EnterpriseInfoDetail enterpriseInfo = enterpriseInfoDetailMapper.selectByPrimaryKey(Integer.valueOf(request.getParameter("id")));
        enterpriseInfo.setStatus(Integer.valueOf(request.getParameter("status")));
        enterpriseInfo.setReason(request.getParameter("reason"));
        enterpriseInfoDetailMapper.updateByPrimaryKeySelective(enterpriseInfo);
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("flag", true);
        resultMap.put("msg", "保存成功");
        return resultMap;
    }
    
    
    /**
     * 
     * 根据ID获取详细信息
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
        String id = request.getParameter("id");
        mv.addObject("enterprise",  enterpriseInfoDetailMapper.selectByPrimaryKey(Integer.parseInt(id)));//enterprise_info_detail
        String enterpriseId = request.getParameter("enterpriseid");
        EnterpriseInfo obj = new EnterpriseInfo();
        obj.setId(Integer.valueOf(enterpriseId));
        mv.addObject("enterpriseinfos", enterpriseInfoMapper.selectBySelective(obj));//enterprise_info
        if("1".equals(type)){//查看
            mv.setViewName("jobfair/enterprise/detail");
        }else if("2".equals(type)){//修改页
            mv.setViewName("jobfair/enterprise/update");
        }
        else{//跳到审核页
            mv.setViewName("jobfair/enterprise/edit");
        }
        return mv;
    }
	   
    
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
        Integer uid = Integer.valueOf(request.getSession().getAttribute("uid").toString());
        
        for (String i : ary) {
            EnterpriseInfoDetail obj = enterpriseInfoDetailMapper.selectByPrimaryKey(Integer.valueOf(i));
            obj.setDeleteTime(new Date());
            enterpriseInfoDetailMapper.updateByPrimaryKeySelective(obj);
            enterpriseInfoDetailMapper.deleteByenterpriseId(obj.getEnterpriceId());
           
        }
       
        Map<String, Object> resultMap = new HashMap<String, Object>();
        resultMap.put("flag", true);
        resultMap.put("msg", "删除成功");
        return resultMap;
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
	@RequestMapping("/query")
    public @ResponseBody Map<String,Object> query(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("name", request.getParameter("name"));
        String status =  request.getParameter("status");
        if(StringUtils.isNotBlank(status)){
            params.put("status", status.split(","));
        }
        params.put("starttime", request.getParameter("starttime"));
        params.put("endtime", request.getParameter("endtime"));
        List<Map<String,Object>> list= enterpriseInfoDetailMapper.queryEnterprise(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }
	
	
}
