package com.i84.earnpoint.service;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * 论文鉴定成绩管理
 * @author chenb
 *
 */
public interface PaperScoreService {

    /**
     * 论文成绩列表
     * @param record
     * @return
     */
    public  List<Map<String, Object>> queryPaperScoreList(Map<String, Object> record);




    /**论文成绩导出
     * @param response
     * @param request
     */
    void ScoreExport(HttpServletResponse response,HttpServletRequest request)throws Exception;


    public void ScoreExportAll(HttpServletResponse response, HttpServletRequest request) throws Exception;

    public void ExportAppraisal(HttpServletResponse response, HttpServletRequest request);

}
