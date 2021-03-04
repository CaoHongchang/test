package com.i84.earnpoint.gdcl.service.impl;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.gdcl.service.ArchivesKhInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesMaterialInfoService;
import com.i84.earnpoint.mapper.ArchivesMaterialInfoMapper;
import com.i84.earnpoint.mapper.ArchivesMaterialOtherInfoMapper;
import com.i84.earnpoint.mapper.UserMgInfoMapper;
import com.i84.earnpoint.model.ArchivesMaterialInfo;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;

@Service
public class ArchivesMaterialInfoServiceImpl implements
ArchivesMaterialInfoService {
	private static Logger logger = Logger.getLogger(ArchivesMaterialInfoService.class);
    @Autowired
    private ArchivesMaterialInfoMapper archivesMaterialInfoMapper;
    @Autowired
    private ArchivesMaterialOtherInfoMapper archivesMaterialOtherInfoMapper;
    @Autowired
    private UserMgInfoMapper userMgInfoMapper;
    @Override
    public int insertArchivesMaterialInfoSelective(ArchivesMaterialInfo record,String fjparam,String ptype) throws Exception{
    	
        //为新增材料添加排序字段sort的数值，因原有数据没有sort字段故而有可能出现为空值的情况。
        Map<String,Object> map=new HashMap<String, Object>();
        map.put("pno", record.getpNo());
        Integer sort;
        if(archivesMaterialInfoMapper.getsort(map)!=null&&archivesMaterialInfoMapper.getsort(map).get("sort")!=null&&!archivesMaterialInfoMapper.getsort(map).get("sort").equals("")) {
            sort =Integer.valueOf(archivesMaterialInfoMapper.getsort(map).get("sort").toString())+1;
        }
        else {
            sort=0;
        }
        record.setSort(sort);

        int c= archivesMaterialInfoMapper.insertSelective(record);
        if(c>0){
            //新增附件列表
            ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
            //附件操作
            if(StringUtils.isNotEmpty(fjparam)){
                JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
                int iSize = jsonArray.size();
                for (int i = 0; i < iSize; i++) {
                    JSONObject jsonObj = jsonArray.getJSONObject(i);

                    a.setAddDate(new Date());
                    a.setAid(record.getId());
                    a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
                    a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
                    a.setStuff(record.getStuff());
                    if(StringUtils.isNotEmpty(ptype))
                    {
                        a.setFileType(Integer.valueOf(ptype));//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
                    }
                    archivesMaterialOtherInfoMapper.insertSelective(a);
                }
            }


        }
        return c;

    }
    @Override
    public List<Map<String,Object>>selectByClFjList(Map<String, Object>m) {
        return archivesMaterialOtherInfoMapper.selectByClFjList(m);
    }

    @Override
    public ArchivesMaterialOtherInfo selectByPrimaryKey(Integer id){
        return archivesMaterialOtherInfoMapper.selectByPrimaryKey(id);


    }
    @Override
    @Transactional
    public int updateArchivesMaterialInfoSelective(ArchivesMaterialInfo record,String fjparam,String ptype)throws Exception {
    	logger.info("====开始做修改操作，修改的参数为：record"+record+"fjparam="+fjparam+"ptype="+ptype);
        int c= archivesMaterialInfoMapper.updateByPrimaryKeySelective(record);
        if(c>0){
            ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
            if(StringUtils.isNotEmpty(ptype))
            {
                a.setFileType(Integer.valueOf(ptype));//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
            }
            a.setDelDate(new Date());
            a.setAid(record.getId());
            archivesMaterialOtherInfoMapper.deletegdcl(a);
            a=new ArchivesMaterialOtherInfo();
            logger.info("修改文件的id:"+a.getAid()+"==============");
            JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
            logger.info("jsonArray的大小:"+jsonArray.size());
            int iSize = jsonArray.size();
            for (int i = 0; i < iSize; i++) {
                JSONObject jsonObj = jsonArray.getJSONObject(i);
                if(StringUtils.isNotEmpty(ptype)) {
                    a.setFileType(Integer.valueOf(ptype));
                }
                logger.info("保存新的图片id："+record.getId());
                a.setAddDate(new Date());
                a.setAid(record.getId());
                a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
                a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
                a.setStuff(record.getStuff());
                archivesMaterialOtherInfoMapper.insertSelective(a);
            }
            logger.info("=====修改保存结束=====");
        }
        return c;
    }

    @Override
    public List<Map<String, Object>> listArchivesMaterialInfos(
            ArchivesMaterialInfo record) {

        return archivesMaterialInfoMapper.selectByPno(record);
    }


    @Override
    public void exportMaterialList(String pnos, HttpServletResponse response) throws Exception {
        Map<String, Object> userInfo = userMgInfoMapper.getUserInfoByDpno(pnos);
        if (userInfo == null) {
            userInfo = new HashMap<String, Object>();
            userInfo.put("dpno", "");
            userInfo.put("name", "");
            userInfo.put("sex", "");
            userInfo.put("pnum", "");
        }

        String[] pnoArray = pnos.split(",");
        String[] materials = { "履历材料", "自传材料", "鉴定考核考察材料", "学历及评聘专业技术情况材料",
                "学历学位材料", "技术职务材料", "科研学术材料", "培训材料",
                "政审材料", "党团材料", "奖励材料", "处分材料", "工资、任免、出国、代表大会等材料",
                "工资材料", "任免材料", "出国材料", "会议材料",
        "其他材料" };
        String[] serial_number = { "一",
                "二",
                "三",
                "四",
                "4-1",
                "4-2",
                "4-3",
                "4-4",
                "五",
                "六",
                "七",
                "八",
                "九",
                "9-1",
                "9-2",
                "9-3",
                "9-4",
        "十" };

        List<Map<String, Object>> llist = new ArrayList<Map<String, Object>>();
        for (String pno : pnoArray) {
            if (pno.isEmpty()) {
                continue;
            }
            List<Map<String, Object>> list = archivesMaterialInfoMapper.selectAllGdMaterialsByPno(pno);
            //String[] materials = { "履历材料", "自传材料", "鉴定考核考察材料", "学历及评聘专业技术情况材料", "政审材料", "党团材料", "奖励材料", "处分材料", "工资、任免、出国、代表大会等材料", "其他材料" };
            //String [] secondType1={"学历学位材料", "技术职务材料","科研学术材料","培训材料"};
            //String [] secondType2={"工资材料","任免材料","出国材料","会议材料"};

            for (int i = 0; i < list.size(); i++)
            {
                llist.add(list.get(i));
            }

        }
        userInfo.put("materials", materials);
        userInfo.put("serial_number", serial_number);
        userInfo.put("catalog_list", llist);
        response.setCharacterEncoding("UTF-8");
        response.setHeader("Content-Type", "application/force-download;");
        String filename = "档案目录" + userInfo.get("dpno").toString() + userInfo.get("name").toString() + ".xls";
        response.setHeader("Content-disposition", "attachment;filename=" + new String(filename.getBytes("GBK"), "ISO-8859-1"));
        response.setContentType("application/ms-excel");
        OutputStream out = response.getOutputStream();

        ExcelExport<Object> ex = new ExcelExport<Object>();
        ex.exportExcelbyftl(ResultConstant.getWEB_ROOTPath() + "temp/gdcl/", "mr.ftl", userInfo, out);
    }

    private Map<String, Object> get_in_list(List<Map<String, Object>> list, String material) {
        for (int j = 0; j < list.size(); j++) {
            Map<String, Object> materialInfo = list.get(j);
            if (materialInfo != null) {
                String ptype = materialInfo.get("ptype") + "";
                if (material.equals(ptype)) { return materialInfo; }
            }
        }
        return null;
    }

    public void exportMaterialList_old(String pnos, HttpServletResponse response)
            throws Exception {
        // 多份的档案列出材料清单
        if (pnos != null && !pnos.trim().isEmpty()) {

            HSSFWorkbook workbook = new HSSFWorkbook();
            String [] materials ={"履历材料","自传材料","鉴定考核考察材料","学历及评聘专业技术情况材料","政审材料","党团材料","奖励材料","处分材料","工资、任免、出国、代表大会等材料","其他材料"};
            String [] numbers={"一","二","三","四","五","六","七","八","九","十"};
            String [] secondType1={"学历学位材料", "技术职务材料","科研学术材料","培训材料"};
            String [] secondType2={"工资材料","任免材料","出国材料","会议材料"};
            Map<String,Object> userInfo=userMgInfoMapper.getUserInfoByDpno(pnos);
            if(userInfo==null){
                userInfo=new HashMap<String, Object>();
                userInfo.put("dpno", "");
                userInfo.put("name", "");
                userInfo.put("sex", "");
                userInfo.put("pnum", "");
            }
            HSSFSheet sheet = workbook.createSheet("材料清单");

            sheet.setColumnWidth(0, 1300);
            sheet.setColumnWidth(1, 8400);
            sheet.setColumnWidth(2, 2000);
            sheet.setColumnWidth(3, 2000);
            sheet.setColumnWidth(4, 2000);
            sheet.setColumnWidth(5, 2000);
            sheet.setColumnWidth(6, 5000);

            HSSFRow title = sheet.createRow(0);// 标题栏
            sheet.addMergedRegion(new CellRangeAddress(0, 0, 0, 6));// 合并6列

            HSSFCellStyle titleCellStyle = workbook.createCellStyle();

            // 设置字体样式
            HSSFFont boldFont = workbook.createFont();// 加粗字体
            boldFont.setFontHeightInPoints((short)22);
            boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            // 设置居中，字体加粗
            titleCellStyle.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
            titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            titleCellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            titleCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            titleCellStyle.setFont(boldFont);
            title.setHeight((short) 1500);
            HSSFCell cell = title.createCell(0);// 创建单元格
            cell.setCellStyle(titleCellStyle);// 设置标题栏样式加粗并居中

            cell.setCellValue("人事档案目录");

            HSSFCellStyle headCellStyle = workbook.createCellStyle();// 居中样式
            headCellStyle.setWrapText(true);

            // 设置边框
            //			headCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
            //			headCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            //			headCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            //			headCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
            headCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            headCellStyle.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
            headCellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            headCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            HSSFFont font=workbook.createFont();
            font.setFontHeightInPoints((short)14);
            headCellStyle.setFont(font);
            /**
             * 
             * 序号 材料名称 材料制成时间 页数 备注
             *           年 月 日
             * 
             */


            //			//第二行
            //			sheet.addMergedRegion(new CellRangeAddress(1,1,0,6));
            //			//第二行
            //			sheet.addMergedRegion(new CellRangeAddress(2,2,5,6));
            //
            //			//第三行 第四行
            //			sheet.addMergedRegion(new CellRangeAddress(3, 3, 2, 4));
            //			sheet.addMergedRegion(new CellRangeAddress(3, 4, 0, 0));
            //			sheet.addMergedRegion(new CellRangeAddress(3, 4, 1, 1));
            //			sheet.addMergedRegion(new CellRangeAddress(3, 4, 5, 5));
            //			sheet.addMergedRegion(new CellRangeAddress(3, 4, 6, 6));
            sheet.createFreezePane( 0,5,0,5);
            //第二行
            sheet.addMergedRegion(new CellRangeAddress(1,1,0,2));
            //第二行
            sheet.addMergedRegion(new CellRangeAddress(1,1,3,4));
            sheet.addMergedRegion(new CellRangeAddress(1,1,5,6));
            //第三行 第四行
            sheet.addMergedRegion(new CellRangeAddress(2, 2, 0, 2));
            sheet.addMergedRegion(new CellRangeAddress(2, 2, 3, 3));
            sheet.addMergedRegion(new CellRangeAddress(2, 2, 4,4));
            sheet.addMergedRegion(new CellRangeAddress(2, 2, 5,5));
            sheet.addMergedRegion(new CellRangeAddress(2, 2, 6,6));

            sheet.addMergedRegion(new CellRangeAddress(3, 4, 0, 0));
            sheet.addMergedRegion(new CellRangeAddress(3, 4, 1, 1));

            sheet.addMergedRegion(new CellRangeAddress(3, 4, 5, 5));
            sheet.addMergedRegion(new CellRangeAddress(3, 4, 6, 6));
            sheet.addMergedRegion(new CellRangeAddress(3, 3, 2, 4));

            //			sheet.addMergedRegion(new CellRangeAddress(4, 4, 2, 2));
            //			sheet.addMergedRegion(new CellRangeAddress(4, 4, 3, 3));
            //			sheet.addMergedRegion(new CellRangeAddress(4, 4, 4, 4));

            HSSFCellStyle alignLeft = workbook.createCellStyle();
            alignLeft.setWrapText(true);
            alignLeft.setAlignment(HSSFCellStyle.ALIGN_LEFT);
            alignLeft.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            alignLeft.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            HSSFFont alignLeft_font1=workbook.createFont();
            alignLeft_font1=workbook.createFont();
            alignLeft_font1.setFontHeightInPoints((short)12);
            alignLeft.setFont(alignLeft_font1);
            HSSFRow tableRow1 = sheet.createRow(1);// 表头
            tableRow1.setHeight((short) 350);
            cell=tableRow1.createCell(0);
            cell.setCellValue("姓名:"+userInfo.get("name"));
            cell.setCellStyle(alignLeft);

            cell=tableRow1.createCell(3);
            cell.setCellValue("档案编号：");
            cell.setCellStyle(alignLeft);

            cell=tableRow1.createCell(5);
            cell.setCellValue(userInfo.get("dpno")+"");
            cell.setCellStyle(alignLeft);

            HSSFRow tableRow2 = sheet.createRow(2);
            tableRow2.setHeight((short) 350);
            cell=tableRow2.createCell(0);
            cell.setCellValue("身份证号："+userInfo.get("pnum"));
            cell.setCellStyle(alignLeft);


            // 设置边框
            headCellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
            headCellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            headCellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            headCellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);

            headCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            headCellStyle.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
            headCellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            headCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);

            HSSFCellStyle headCellStyle_border = workbook.createCellStyle();
            //			headCellStyle_border.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            //			headCellStyle_border.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
            //			headCellStyle_border.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            //			headCellStyle_border.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            headCellStyle_border.setWrapText(true);
            headCellStyle_border.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直
            headCellStyle_border.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 水平

            headCellStyle_border.setBorderTop(HSSFCellStyle.BORDER_THIN);
            headCellStyle_border.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            headCellStyle_border.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            headCellStyle_border.setBorderRight(HSSFCellStyle.BORDER_THIN);




            HSSFFont font1=workbook.createFont();
            font1=workbook.createFont();
            font1.setFontHeightInPoints((short)14);
            font1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            headCellStyle_border.setFont(font1);


            HSSFRow tableRow3 = sheet.createRow(3);
            title.setHeight((short) 800);
            cell = tableRow3.createCell(0);
            cell.setCellValue("序号");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow3.createCell(1);
            cell.setCellValue("材料名称");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow3.createCell(2);
            cell.setCellValue("材料形成时间");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow3.createCell(5);
            cell.setCellValue("页数");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow3.createCell(6);
            cell.setCellValue("备注");
            cell.setCellStyle(headCellStyle_border);

            cell = tableRow3.createCell(3);
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow3.createCell(4);
            cell.setCellStyle(headCellStyle_border);




            HSSFRow tableRow4 = sheet.createRow(4);// 表头
            cell = tableRow4.createCell(2);
            cell.setCellValue("年");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow4.createCell(3);
            cell.setCellValue("月");
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow4.createCell(4);
            cell.setCellValue("日");
            cell.setCellStyle(headCellStyle_border);

            cell = tableRow4.createCell(0);
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow4.createCell(1);
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow4.createCell(5);
            cell.setCellStyle(headCellStyle_border);
            cell = tableRow4.createCell(6);
            cell.setCellStyle(headCellStyle_border);


            //			CellRangeAddress region=new CellRangeAddress(3,3,2,4);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    region=new CellRangeAddress(3, 4, 0, 0);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    region=new CellRangeAddress(3, 4, 1, 1);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    region=new CellRangeAddress(3, 4, 5, 5);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    region=new CellRangeAddress(3, 4, 6, 6);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            ////
            //		    region=new CellRangeAddress(0, 0, 0, 6);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);

            //		    region=new CellRangeAddress(2,2,5,6);
            //		    RegionUtil.setBorderBottom(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderLeft(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderTop(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);
            //		    RegionUtil.setBorderRight(HSSFCellStyle.BORDER_THIN,region ,sheet , workbook);

            HSSFCellStyle cellStyle = workbook.createCellStyle();
            cellStyle.setWrapText(true);
            cellStyle.setBorderTop(HSSFCellStyle.BORDER_THIN);
            cellStyle.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            cellStyle.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            cellStyle.setBorderRight(HSSFCellStyle.BORDER_THIN);
            font=workbook.createFont();
            font.setFontHeightInPoints((short)12);
            cellStyle.setAlignment(HSSFCellStyle.ALIGN_LEFT);
            cellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            cellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            cellStyle.setFont(font);


            HSSFCellStyle cellStyle1 = workbook.createCellStyle();
            cellStyle1.setBorderTop(HSSFCellStyle.BORDER_THIN);
            cellStyle1.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            cellStyle1.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            cellStyle1.setBorderRight(HSSFCellStyle.BORDER_THIN);
            font1=workbook.createFont();
            font1.setFontHeightInPoints((short)14);
            font1.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
            cellStyle1.setWrapText(true);
            cellStyle1.setAlignment(HSSFCellStyle.ALIGN_LEFT);
            cellStyle1.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            cellStyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            cellStyle1.setFont(font1);


            HSSFCellStyle cellStyle2 = workbook.createCellStyle();
            cellStyle2.setBorderTop(HSSFCellStyle.BORDER_THIN);
            cellStyle2.setBorderBottom(HSSFCellStyle.BORDER_THIN);
            cellStyle2.setBorderLeft(HSSFCellStyle.BORDER_THIN);
            cellStyle2.setBorderRight(HSSFCellStyle.BORDER_THIN);
            cellStyle2.setWrapText(true);
            cellStyle2.setAlignment(HSSFCellStyle.ALIGN_CENTER);
            cellStyle2.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
            cellStyle2.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
            font1=workbook.createFont();
            font1.setFontHeightInPoints((short)12);
            cellStyle2.setFont(font1);


            String[] pnoArray = pnos.split(",");
            int currentIndex=4;
            for(String pno:pnoArray){
                if(pno.isEmpty()){
                    continue;
                }
                List<Map<String,Object>> list=archivesMaterialInfoMapper.selectAllGdMaterialsByPno(pno);
                for(int i=0;i<materials.length;i++){
                    String material = materials[i];
                    int seq=1;
                    currentIndex=currentIndex+1;
                    HSSFRow row=sheet.createRow(currentIndex);
                    row.setHeight((short) 800);
                    cell=row.createCell(0);
                    cell.setCellValue(numbers[i]);
                    cell.setCellStyle(cellStyle1);


                    cell=row.createCell(1);
                    cell.setCellValue(material);
                    cell.setCellStyle(cellStyle1);

                    row.createCell(2).setCellStyle(cellStyle1);
                    row.createCell(3).setCellStyle(cellStyle1);
                    row.createCell(4).setCellStyle(cellStyle1);
                    row.createCell(5).setCellStyle(cellStyle1);
                    row.createCell(6).setCellStyle(cellStyle1);
                    //sheet.addMergedRegion(new CellRangeAddress(currentIndex, currentIndex, 0, 6));
                    if(i==3){
                        currentIndex=secondTypeLoop(list, secondType1, i, currentIndex, sheet, cellStyle1,cellStyle,cellStyle2);
                    }else if(i==8){
                        currentIndex=secondTypeLoop(list, secondType2, i, currentIndex, sheet, cellStyle1,cellStyle,cellStyle2);
                    }else{
                        for(int j=0;j<list.size();j++){
                            Map<String,Object> materialInfo=list.get(j);
                            if(materialInfo!=null){
                                String ptype=materialInfo.get("ptype")+"";
                                if(material.equals(ptype)){
                                    currentIndex=currentIndex+1;
                                    row=sheet.createRow(currentIndex);
                                    row.setHeight((short) 800);
                                    cell=row.createCell(0);cell.setCellValue((seq++));cell.setCellStyle(cellStyle2);
                                    cell=row.createCell(1);cell.setCellValue((String)materialInfo.get("p_name"));cell.setCellStyle(cellStyle);
                                    cell=row.createCell(2);cell.setCellValue((String)materialInfo.get("pyear"));cell.setCellStyle(cellStyle2);
                                    cell=row.createCell(3);cell.setCellValue((String)materialInfo.get("pmonth"));cell.setCellStyle(cellStyle2);
                                    cell=row.createCell(4);cell.setCellValue((String)materialInfo.get("pday"));cell.setCellStyle(cellStyle2);
                                    cell=row.createCell(5);cell.setCellValue(TextUtil.getInt(materialInfo.get("page_num")));cell.setCellStyle(cellStyle2);
                                    cell=row.createCell(6);cell.setCellValue((String)materialInfo.get("remark"));cell.setCellStyle(cellStyle);
                                    materialInfo=null;
                                }
                            }

                        }
                        //if(list.size()==0){

                        //								for(int j=0;j<5;j++){
                        //
                        //									currentIndex=currentIndex+1;
                        //									row=sheet.createRow(currentIndex);
                        //									row.setHeight((short) 800);
                        //									//cell=row.createCell(0);cell.setCellValue((i+1)+"-"+(seq++));cell.setCellStyle(cellStyle);
                        //									cell=row.createCell(0);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(1);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(2);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(3);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(4);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(5);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //					                cell=row.createCell(6);cell.setCellValue("");cell.setCellStyle(cellStyle);
                        //
                        //								}

                        //}
                    }

                }
            }
            response.setHeader("Content-Type", "application/force-download;");
            //			String filename="档案材料清单"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+".xls";
            String filename=userInfo.get("dpno").toString()+userInfo.get("name").toString()+".xls";
            response.setHeader("Content-disposition", "attachment;filename="+new String(filename.getBytes("GBK"),"ISO-8859-1"));
            response.setContentType("application/ms-excel");
            OutputStream out=response.getOutputStream();
            workbook.write(out);//写到响应流里面
            out.flush();
            out.close();


        }
    }
    //	private String dnum(int i){
    //
    //		if(i==1)
    //			return "一";
    //		else if(i==2)
    //			return "二";
    //			else if(i==3)
    //				return "三";
    //			else if(i==4)
    //				return "四";
    //			else if(i==5)
    //				return "五";
    //			else if(i==6)
    //				return "六";
    //			else if(i==7)
    //				return "七";
    //			else if(i==8)
    //				return "八";
    //			else if(i==9)
    //				return "九";
    //		return "";
    //	}
    private int secondTypeLoop(List<Map<String,Object>> list,String [] materials,int  firstTypeIndex,int currentIndex,HSSFSheet sheet,HSSFCellStyle cellStyle1,HSSFCellStyle cellStyle,HSSFCellStyle cellStyle2){
        for(int i=0;i<materials.length;i++){
            String material = materials[i];
            int seq=1;
            currentIndex=currentIndex+1;
            HSSFRow row=sheet.createRow(currentIndex);
            row.setHeight((short) 800);
            HSSFCell cell;
            cell=row.createCell(0);
            cell.setCellValue((firstTypeIndex+1)+"-"+(i+1));
            cell.setCellStyle(cellStyle1);

            cell=row.createCell(1);
            cell.setCellValue(material);
            cell.setCellStyle(cellStyle1);

            row.createCell(2).setCellStyle(cellStyle1);
            row.createCell(3).setCellStyle(cellStyle1);
            row.createCell(4).setCellStyle(cellStyle1);
            row.createCell(5).setCellStyle(cellStyle1);
            row.createCell(6).setCellStyle(cellStyle1);
            //sheet.addMergedRegion(new CellRangeAddress(currentIndex, currentIndex, 0, 6));

            for(int j=0;j<list.size();j++){
                Map<String,Object> materialInfo=list.get(j);
                if(materialInfo!=null){
                    String ptype=String.valueOf(materialInfo.get("ptype")+"");
                    if(material.equals(ptype)){
                        currentIndex=currentIndex+1;
                        row=sheet.createRow(currentIndex);
                        row.setHeight((short) 800);
                        cell=row.createCell(0);cell.setCellValue((seq++));cell.setCellStyle(cellStyle2);
                        cell=row.createCell(1);cell.setCellValue((String)materialInfo.get("p_name"));cell.setCellStyle(cellStyle);
                        cell=row.createCell(2);cell.setCellValue((String)materialInfo.get("pyear"));cell.setCellStyle(cellStyle2);
                        cell=row.createCell(3);cell.setCellValue((String)materialInfo.get("pmonth"));cell.setCellStyle(cellStyle2);
                        cell=row.createCell(4);cell.setCellValue((String)materialInfo.get("pday"));cell.setCellStyle(cellStyle2);
                        cell=row.createCell(5);cell.setCellValue(TextUtil.getInt(materialInfo.get("page_num")));cell.setCellStyle(cellStyle2);
                        cell=row.createCell(6);cell.setCellValue((String)materialInfo.get("remark"));cell.setCellStyle(cellStyle);
                        materialInfo=null;
                    }
                }
            }
            /* if(("工资材料".equals(material))){

				for(int j=0;j<5;j++){
				currentIndex=currentIndex+1;
				row=sheet.createRow(currentIndex);
				row.setHeight((short) 800);
				//cell=row.createCell(0);cell.setCellValue((firstTypeIndex+1)+"-"+(i+1)+"-"+(seq++));cell.setCellStyle(cellStyle);
				cell=row.createCell(0);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(1);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(2);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(3);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(4);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(5);cell.setCellValue("");cell.setCellStyle(cellStyle);
                cell=row.createCell(6);cell.setCellValue("");cell.setCellStyle(cellStyle);
				}
			}else{
				for(int j=0;j<5;j++){
					currentIndex=currentIndex+1;
					row=sheet.createRow(currentIndex);
					row.setHeight((short) 800);
					//cell=row.createCell(0);cell.setCellValue((firstTypeIndex+1)+"-"+(i+1)+"-"+(seq++));cell.setCellStyle(cellStyle);
					cell=row.createCell(0);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(1);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(2);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(3);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(4);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(5);cell.setCellValue("");cell.setCellStyle(cellStyle);
	                cell=row.createCell(6);cell.setCellValue("");cell.setCellStyle(cellStyle);
					}
			}*/
        }
        return currentIndex;
    }

}
