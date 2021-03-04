package com.i84.earnpoint.service.impl;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.ZcDissertationScoreMapper;
import com.i84.earnpoint.model.ScoreExportVo;
import com.i84.earnpoint.service.PaperScoreService;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * 论文鉴定成绩管理实现类
 * @author chenb
 *
 */
@Service
public class PaperScoreServiceImpl implements PaperScoreService{

    @Autowired
    private ZcDissertationScoreMapper zcDissertationScoreMapper;

    @Override
    public List<Map<String, Object>> queryPaperScoreList(Map<String, Object> record) {
        if(null != record.get("page")){
            PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
        }
        return zcDissertationScoreMapper.selectDissertationScoreJDList(record);
    }

    @Override
    public void ScoreExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
        String record = request.getParameter("ids");
        String[] idArray = record.split(",");
        try {

            List<ScoreExportVo> da=zcDissertationScoreMapper.exportScoreList(idArray);
            ExcelExport<ScoreExportVo> ex = new ExcelExport<ScoreExportVo>();
            List resultList=new ArrayList();
            resultList.add(da);

            String fileName = "论文鉴定成绩导出.xls";
            OutputStream output =ResultConstant.outputStream(request, response, fileName);
            List<String> titleList=new ArrayList<String>();
            titleList.add("论文鉴定成绩");
            String syDelTitle="";

            Map<String,Object>title=new HashMap<String, Object>();
            title.put("1", syDelTitle);


            ex.exportExcel2(titleList, resultList, title,output);



        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void ScoreExportAll(HttpServletResponse response, HttpServletRequest request) throws Exception {
        String aid = request.getParameter("aid");

        try {

            List<ScoreExportVo> da = zcDissertationScoreMapper.exportScoreAllListByAction(aid);
            ExcelExport<ScoreExportVo> ex = new ExcelExport<ScoreExportVo>();
            List resultList = new ArrayList();
            resultList.add(da);

            String fileName = "论文鉴定成绩导出.xls";
            OutputStream output = ResultConstant.outputStream(request, response, fileName);
            List<String> titleList = new ArrayList<String>();
            titleList.add("论文鉴定成绩");
            String syDelTitle = "";

            Map<String, Object> title = new HashMap<String, Object>();
            title.put("1", syDelTitle);

            ex.exportExcel2(titleList, resultList, title, output);

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Override
    public void ExportAppraisal(HttpServletResponse response, HttpServletRequest request) {
        String aid = request.getParameter("aid");

        try {

            List<ScoreExportVo> da = zcDissertationScoreMapper.exportAppraisalByAction(aid);

            String dowfileName = "专家鉴定意见.doc";

            Configuration configuration = new Configuration();
            configuration.setDefaultEncoding("UTF-8");
            //生成的临时文件保存目录
            String tempPath = ResultConstant.getWEB_ROOTPath() + "temp/zcsbgl/upload/";
            File tmpFile = new File(tempPath);
            if (!tmpFile.exists()) {//不存在则创建
                //创建目录
                tmpFile.mkdir();

            }

            configuration.setDirectoryForTemplateLoading(new File(ResultConstant.getWEB_ROOTPath() + "temp/zcsbgl/down/")); //FTL文件模板所在的位置
            Template t = configuration.getTemplate("zjjd.ftl"); //专家鉴定意见模板   文件名
            String fileName = ResultConstant.getRandNum(32) + ".doc";
            File outFile = new File(tempPath + fileName);
            Writer out = null;
            out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile), "UTF-8"));
            Map<String, Object> dataMap = new HashMap<String, Object>();
            dataMap.put("list", da);
            t.process(dataMap, out);
            //关闭流
            out.flush();
            out.close();
            //文件下载
            ResultConstant.fileDownload(request, response, "temp/zcsbgl/upload/", fileName, dowfileName);
            //删除零时文件
            outFile.delete();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
