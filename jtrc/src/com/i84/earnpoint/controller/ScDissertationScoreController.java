package com.i84.earnpoint.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.service.PaperScoreService;

/**
 * 论文鉴定成绩管理
 * @author chenb
 *
 */
@Controller
@RequestMapping("/DissScoreTrol")
public class ScDissertationScoreController extends ResultConstant {

    @Autowired
    public PaperScoreService paperScoreService;

    /**
     * 	论文鉴定成绩列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/queryPaperScoreList")
    public  @ResponseBody Map<String, Object> queryPaperScoreList(HttpServletResponse response,HttpServletRequest request) throws Exception{
        int page = TextUtil.getInt(request.getParameter("page"));
        if (page == 0) {
            page = 1;
        }
        int rows = TextUtil.getInt(request.getParameter("rows"));
        Map<String, Object> params = new HashMap<String, Object>();
        params.put("page", page);
        params.put("rows", rows);
        String name = request.getParameter("name");
        String pnum = request.getParameter("pnum");
        String title = request.getParameter("title");
        String score = request.getParameter("score");
        String activityid = request.getParameter("activityId");
        if(StringUtils.isNotBlank(name)) {
            params.put("name", name);
        }
        if(StringUtils.isNotBlank(pnum)) {
            params.put("pnum", pnum);
        }
        if(StringUtils.isNotBlank(title)) {
            params.put("title", title);
        }
        if(StringUtils.isNotBlank(score)) {
            params.put("score", score);
        }
        if(StringUtils.isNotBlank(activityid)){
        	params.put("activityid", activityid);
        }
        /*
		String dept = request.getParameter("dept");
		if(StringUtils.isNotBlank(dept)){
			String key = request.getParameter("key");
			if("daNum".equals(dept) && StringUtils.isNotBlank(key)){
				params.put("dpno", key);
			}
		}
         */
        List<Map<String, Object>> list = paperScoreService.queryPaperScoreList(params);
        PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
        return resultMap(list, pageinfo.getTotal(), true, null);
    }



    /**论文成绩导出
     * @param response
     * @param request
     */
    @RequestMapping("/PaperScoreExport")
    @ResponseBody
    public void PaperScoreExport(HttpServletResponse response,HttpServletRequest request){
        try {
            paperScoreService.ScoreExport(response, request);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

    /**
     * 论文成绩导出
     * 
     * @param response
     * @param request
     */
    @RequestMapping("/PaperScoreExportAll")
    @ResponseBody
    public void PaperScoreExportAll(HttpServletResponse response, HttpServletRequest request) {
        try {
            paperScoreService.ScoreExportAll(response, request);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }


    /**
     * 论文成绩导出
     * 
     * @param response
     * @param request
     */
    @RequestMapping("/ExportAppraisal")
    @ResponseBody
    public void ExportAppraisal(HttpServletResponse response, HttpServletRequest request) {
        try {
            paperScoreService.ExportAppraisal(response, request);
        } catch (Exception e) {
            e.printStackTrace();
        }

    }

}
