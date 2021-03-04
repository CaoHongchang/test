package com.i84.earnpoint.common.excel;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFClientAnchor;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPatriarch;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.hssf.util.Region;
import org.apache.poi.ss.usermodel.Workbook;
import org.springframework.util.CollectionUtils;

import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * @author liu_quan
 *导出excel
 * @param <T>
 */
public class ExcelExport<T> {
    //格式化日期
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

    /**
     * @param title 工作簿名称
     * @param dataset 导出的数据集
     * @param out 输出流
     */
    @SuppressWarnings("unchecked")
    public void exportExcel(String title, Collection<T> dataset, OutputStream out) {
        // 声明一个工作薄
        try {
            //首先检查数据看是否是正确的
            Iterator<T> iterator = dataset.iterator();
            if (dataset == null || !iterator.hasNext() || title == null || out == null) {
                throw new Exception("传入的数据不对！");
            }
            //取得实际泛型类
            T tObject = iterator.next();
            Class<T> clazz = (Class<T>) tObject.getClass();

            HSSFWorkbook workbook = new HSSFWorkbook();
            // 生成一个表格
            HSSFSheet sheet = workbook.createSheet(title);
            // 设置表格默认列宽度为20个字节
            sheet.setDefaultColumnWidth(20);
            sheet.autoSizeColumn(0);
            // 生成一个样式
            HSSFCellStyle style = workbook.createCellStyle();
            // 设置标题样式
            style = ExcelStyle.setHeadStyle(workbook, style);


            // 得到所有字段
            Field filed[] = tObject.getClass().getDeclaredFields();

            // 标题
            List<String> exportfieldtile = new ArrayList<String>();
            // 导出的字段的get方法
            List<Method> methodObj = new ArrayList<Method>();
            // 遍历整个filed
            for (int i = 0; i < filed.length; i++) {
                sheet.autoSizeColumn(i);
                Field field = filed[i];
                ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
                // 如果设置了annottion
                if (excelAnnotation != null) {
                    String exprot = excelAnnotation.exportName();
                    // 添加到标题
                    exportfieldtile.add(exprot);
                    // 添加到需要导出的字段的方法
                    String fieldname = field.getName();
                    String getMethodName = "get" + fieldname.substring(0, 1).toUpperCase() + fieldname.substring(1);
                    Method getMethod = clazz.getMethod(getMethodName, new Class[] {});
                    methodObj.add(getMethod);
                }
            }

            // 产生表格标题行
            HSSFRow row = sheet.createRow(0);
            for (int i = 0; i < exportfieldtile.size(); i++) {
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(style);
                HSSFRichTextString text = new HSSFRichTextString(exportfieldtile.get(i));
                cell.setCellValue(text);
            }

            // 循环整个集合
            int index = 0;
            iterator = dataset.iterator();
            while (iterator.hasNext()) {
                //从第二行开始写，第一行是标题
                index++;
                row = sheet.createRow(index);
                T t = iterator.next();
                for (int k = 0; k < methodObj.size(); k++) {
                    HSSFCell cell = row.createCell(k);
                    Method getMethod = methodObj.get(k);
                    Object value = getMethod.invoke(t, new Object[] {});
                    String textValue = getValue(value);
                    cell.setCellValue(textValue);
                }
            }
            out.flush();
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成多个标签页
     * 
     * @param ftlpath
     *            模板路径
     * @param ftlname
     *            模板名称
     * @param title
     *            工作簿名称，标签页名称：多个标签名称不能重复
     * @param dataset
     *            导出的数据集
     * @deleteTitle 删除不需要的标题， key=1则为删除第一个标签页的标题
     * @param out
     *            输出流
     */
    @SuppressWarnings("unchecked")
    public void exportExcelbyftl(String ftlpath, String ftlname, Map<String, Object> dataMap, OutputStream out) {

        try {
            Configuration configuration = new Configuration();
            configuration.setDefaultEncoding("UTF-8");
            System.out.println(ftlpath);
            configuration.setDirectoryForTemplateLoading(new File(ftlpath)); //FTL文件模板所在的位置
            Template t = configuration.getTemplate(ftlname); //模板   文件名
            Writer wout = new OutputStreamWriter(out, "utf-8"); // 字节流变为字符流   ;
            t.process(dataMap, wout);
            wout.flush();
            out.flush();
            wout.close();
            out.close();
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

    }

    /**生成多个标签页
     * @param title 工作簿名称，标签页名称：多个标签名称不能重复
     * @param dataset 导出的数据集
     * @deleteTitle 删除不需要的标题， key=1则为删除第一个标签页的标题
     * @param out 输出流
     */
    @SuppressWarnings("unchecked")
    public void exportExcel2(List<String> title, List<Collection<T>> list, Map<String,Object>deleteTitle, OutputStream out) {
        // 声明一个工作薄
        try {

            if(list==null){
                throw new Exception("导出的数据有误！");
            }
            HSSFWorkbook workbook = new HSSFWorkbook();
            for(int j=0;j<list.size();j++){
                Collection<T> dataset=list.get(j);
                //首先检查数据看是否是正确的
                Iterator<T> iterator = dataset.iterator();
                if (dataset == null || !iterator.hasNext() || title == null || out == null) {
                    throw new Exception("传入的数据不对！");
                }
                //取得实际泛型类
                T tObject = iterator.next();
                Class<T> clazz = (Class<T>) tObject.getClass();

                //
                // 生成一个表格
                HSSFSheet sheet = workbook.createSheet(title.get(j));
                // 设置表格默认列宽度为20个字节
                sheet.setDefaultColumnWidth(20);
                // 生成一个样式
                HSSFCellStyle style = workbook.createCellStyle();
                // 设置标题样式
                style = ExcelStyle.setHeadStyle(workbook, style);
                // 得到所有字段
                Field filed[] = tObject.getClass().getDeclaredFields();

                // 标题
                List<String> exportfieldtile = new ArrayList<String>();
                // 导出的字段的get方法
                List<Method> methodObj = new ArrayList<Method>();
                // 遍历整个filed
                for (int i = 0; i < filed.length; i++) {
                    Field field = filed[i];
                    ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
                    // 如果设置了annottion
                    if (excelAnnotation != null) {
                        String exprot = excelAnnotation.exportName();

                        boolean isDel=false;
                        //System.out.println(deleteTitle.size()+" "+j+1);
                        if(deleteTitle!=null){//不予生成的标题
                            String key=String.valueOf(j+1);
                            String del=(String) deleteTitle.get(key);
                            if(del!=null){
                                String[] s=del.split(",");

                                for(int ii=0;ii<s.length;ii++){
                                    //System.out.println(s[ii]);
                                    if(s[ii].toString().equals(exprot.toString())){
                                        isDel=true;
                                        break;

                                    }
                                }
                            }

                        }
                        if(!isDel){//System.out.println(exprot+" "+j);
                            // 添加到标题
                            exportfieldtile.add(exprot);//控值不需要的值
                            // 添加到需要导出的字段的方法
                            String fieldname = field.getName();
                            String getMethodName = "get" + fieldname.substring(0, 1).toUpperCase() + fieldname.substring(1);
                            Method getMethod = clazz.getMethod(getMethodName, new Class[] {});
                            methodObj.add(getMethod);//控制不需要的值
                        }
                    }
                }

                // 产生表格标题行
                HSSFRow row = sheet.createRow(0);
                for (int i = 0; i < exportfieldtile.size(); i++) {
                    HSSFCell cell = row.createCell(i);
                    cell.setCellStyle(style);
                    HSSFRichTextString text = new HSSFRichTextString(exportfieldtile.get(i));

                    cell.setCellValue(text);
                }

                // 循环整个集合
                int index = 0;
                iterator = dataset.iterator();
                while (iterator.hasNext()) {
                    //从第二行开始写，第一行是标题
                    index++;
                    row = sheet.createRow(index);
                    T t = iterator.next();
                    for (int k = 0; k < methodObj.size(); k++) {
                        HSSFCell cell = row.createCell(k);
                        Method getMethod = methodObj.get(k);
                        Object value = getMethod.invoke(t, new Object[] {});
                        String textValue = getValue(value);
                        cell.setCellValue(textValue);
                    }
                }

            }
            out.flush();
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * <p>
     * getValue方法-cell值处理.
     * </p>
     * @param value
     * @return
     */
    public String getValue(Object value) {
        String textValue = "";
        if (value == null) {
            return textValue;
        }
        if (value instanceof Boolean) {
            boolean bValue = (Boolean) value;
            textValue = "是";
            if (!bValue) {
                textValue = "否";
            }
        } else if (value instanceof Date) {
            Date date = (Date) value;
            textValue = sdf.format(date);

        } else {
            textValue = value.toString();
        }
        return textValue;
    }
    
    
    /**生成多个标签页
     * @param title 工作簿名称，标签页名称：多个标签名称不能重复
     * @param dataset 导出的数据集
     * @deleteTitle 删除不需要的标题， key=1则为删除第一个标签页的标题
     * @param out 输出流
     */
    @SuppressWarnings("unchecked")
    public void exportExcel3(List<String> title, List<Collection<T>> list, Map<String,Object>deleteTitle, OutputStream out) {
        // 声明一个工作薄
        try {

            if(list==null){
                throw new Exception("导出的数据有误！");
            }
            
            HSSFWorkbook workbook = new HSSFWorkbook();
            for(int j=0;j<list.size();j++){
                Collection<T> dataset=list.get(j);
                //首先检查数据看是否是正确的
                Iterator<T> iterator = dataset.iterator();
                if (dataset == null || !iterator.hasNext() || title == null || out == null) {
                    throw new Exception("传入的数据不对！");
                }
                //取得实际泛型类
                T tObject = iterator.next();
                Class<T> clazz = (Class<T>) tObject.getClass();

                //
                // 生成一个表格
                HSSFSheet sheet = workbook.createSheet(title.get(j));
                // 设置表格默认列宽度为20个字节
                sheet.setDefaultColumnWidth(20);
                // 生成一个样式
                HSSFCellStyle style = workbook.createCellStyle();
                // 设置标题样式
                style = ExcelStyle.setHeadStyle(workbook, style);
                // 得到所有字段
                Field filed[] = tObject.getClass().getDeclaredFields();

                // 标题
                List<String> exportfieldtile = new ArrayList<String>();
                // 导出的字段的get方法
                List<Method> methodObj = new ArrayList<Method>();
                // 遍历整个filed
                for (int i = 0; i < filed.length; i++) {
                    Field field = filed[i];
                    ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
                    // 如果设置了annottion
                    if (excelAnnotation != null) {
                        String exprot = excelAnnotation.exportName();

                        boolean isDel=false;
                        //System.out.println(deleteTitle.size()+" "+j+1);
                        if(deleteTitle!=null){//不予生成的标题
                            String key=String.valueOf(j+1);
                            String del=(String) deleteTitle.get(key);
                            if(del!=null){
                                String[] s=del.split(",");

                                for(int ii=0;ii<s.length;ii++){
                                    //System.out.println(s[ii]);
                                    if(s[ii].toString().equals(exprot.toString())){
                                        isDel=true;
                                        break;

                                    }
                                }
                            }

                        }
                        if(!isDel){//System.out.println(exprot+" "+j);
                            // 添加到标题
                            exportfieldtile.add(exprot);//控值不需要的值
                            // 添加到需要导出的字段的方法
                            String fieldname = field.getName();
                            String getMethodName = "get" + fieldname.substring(0, 1).toUpperCase() + fieldname.substring(1);
                            Method getMethod = clazz.getMethod(getMethodName, new Class[] {});
                            methodObj.add(getMethod);//控制不需要的值
                        }
                    }
                }

                // 产生表格标题行
                HSSFRow row = sheet.createRow(0);
                for (int i = 0; i < exportfieldtile.size(); i++) {
                    HSSFCell cell = row.createCell(i);
                    cell.setCellStyle(style);
                    HSSFRichTextString text = new HSSFRichTextString(exportfieldtile.get(i));

                    cell.setCellValue(text);
                }

                // 循环整个集合
                int index = 0;
                iterator = dataset.iterator();
                while (iterator.hasNext()) {
                    //从第二行开始写，第一行是标题
                    index++;
                    row = sheet.createRow(index);
                    T t = iterator.next();
                    for (int k = 0; k < methodObj.size(); k++) {
                        HSSFCell cell = row.createCell(k);
                        Method getMethod = methodObj.get(k);
                        Object value = getMethod.invoke(t, new Object[] {});
                        String textValue = getValue(value);
                        cell.setCellValue(textValue);
                    }
                }

            }
            out.flush();
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    /**
     * <p>
     * getValue方法-cell值处理.
     * </p>
     * @param value
     * @return
     */
    public String[] getValueByType(Object value) {
        String[] textValue = {"",""};
        if (value == null) {
            return textValue;
        }
        if (value instanceof Integer ) {
            textValue[0] = "Integer";
            textValue[1] = getValue(value);
        } else {
            textValue[0] = "other";
            textValue[1] = getValue(value);
        }
        return textValue;
    }



    /**
     * 根据模板 创建数据
     * @param tempPath 模板路径
     * @param dataset 导出的数据集
     * @param out 输出流
     */
    @SuppressWarnings("unchecked")
    public void exportExcelByTemp(String tempPath, Collection<T> dataset, OutputStream out) {
        // 声明一个工作薄
        try {
            //首先检查数据看是否是正确的
            Iterator<T> iterator = dataset.iterator();
            if (tempPath == null || dataset == null || !iterator.hasNext() || out == null) {
                throw new Exception("传入的数据不对！");
            }
            //取得实际泛型类
            T tObject = iterator.next();
            Class<T> clazz = (Class<T>) tObject.getClass();

            HSSFWorkbook workbook = new HSSFWorkbook(new FileInputStream(new File(tempPath)));
            // 生成一个表格
            HSSFSheet sheet = workbook.getSheetAt(1);
            // 设置表格默认列宽度为20个字节
            sheet.setDefaultColumnWidth(20);
            // 生成一个样式
            HSSFCellStyle style = workbook.createCellStyle();
            // 设置标题样式
            style = ExcelStyle.setHeadStyle(workbook, style);
            // 得到所有字段
            Field filed[] = tObject.getClass().getDeclaredFields();

            // 标题
            List<String> exportfieldtile = new ArrayList<String>();
            // 导出的字段的get方法
            List<Method> methodObj = new ArrayList<Method>();
            // 遍历整个filed
            for (int i = 0; i < filed.length; i++) {
                Field field = filed[i];
                ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
                // 如果设置了annottion
                if (excelAnnotation != null) {
                    String exprot = excelAnnotation.exportName();
                    // 添加到标题
                    exportfieldtile.add(exprot);
                    // 添加到需要导出的字段的方法
                    String fieldname = field.getName();
                    String getMethodName = "get" + fieldname.substring(0, 1).toUpperCase() + fieldname.substring(1);
                    Method getMethod = clazz.getMethod(getMethodName, new Class[] {});
                    methodObj.add(getMethod);
                }
            }

            // 产生表格标题行
            HSSFRow row = sheet.createRow(0);
            for (int i = 0; i < exportfieldtile.size(); i++) {
                HSSFCell cell = row.createCell(i);
                cell.setCellStyle(style);
                HSSFRichTextString text = new HSSFRichTextString(exportfieldtile.get(i));
                cell.setCellValue(text);
            }

            // 循环整个集合
            int index = 0;
            iterator = dataset.iterator();
            while (iterator.hasNext()) {
                //从第二行开始写，第一行是标题
                index++;
                row = sheet.createRow(index);
                T t = iterator.next();
                for (int k = 0; k < methodObj.size(); k++) {
                    HSSFCell cell = row.createCell(k);
                    style=ExcelStyle.setbodyStyle(workbook, style);
                    cell.setCellStyle(style);
                    Method getMethod = methodObj.get(k);
                    Object value = getMethod.invoke(t, new Object[] {});

                    String[] vals = getValueByType(value);

                    if(vals.length>1){
                        String type_str = vals[0];
                        String textValue = vals[1];
                        if("Integer".equals(type_str)){
                            int i_v = Integer.parseInt(textValue);
                            cell.setCellValue(i_v);
                        }else{
                            cell.setCellValue(textValue);
                        }
                    }
                }
            }
            out.flush();
            workbook.write(out);
            out.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    //每次设置导出数量  
    public static int  NUM=10000;  
    public static String title="";  
     
    /**  
     * 导出Excel的方法  
     * @param title excel中的sheet名称  
     * @param headers 表头  
     * @param result 结果集  
     * @param out 输出流  
     * @param pattern 时间格式  
     * @throws Exception  
     */     
    public void exportExcel( String[] headers,String[] columns, List<T> result, OutputStream out,HttpServletRequest request, String pattern) throws Exception{     
          
        File zip = new File("E:/dadcwenjian" + "/" +getFileName() + ".zip");// 压缩文件  
          
        int n=0;  
        if (!CollectionUtils.isEmpty(result)) {  
            if (result.size() % NUM == 0) {  
                n = result.size() / NUM;  
            } else {  
                n = result.size() / NUM + 1;  
            }  
        }else{  
            n=1;  
        }  
        List<String> fileNames = new ArrayList();// 用于存放生成的文件名称s  
        //文件流用于转存文件  
          
        for (int j = 0; j < n; j++) {  
            Collection<T> result1=null;  
        //切取每10000为一个导出单位，存储一个文件  
        //对不足10000做处理；  
            if (!CollectionUtils.isEmpty(result)) {  
                if (j == n - 1) {  
                    if (result.size() % NUM == 0) {  
                        result1 = result.subList(10000 * j, 10000 * (j + 1));  
                    } else {  
                        result1 = result.subList(10000 * j,  
                                10000 * j + result.size() % NUM);  
                    }  
                } else {  
                	 result1 = result.subList(10000 * j, 10000 * (j + 1));   
                }  
            }  
        // 声明一个工作薄     
            Workbook workbook = new HSSFWorkbook();  
        // 生成一个表格     
        HSSFSheet sheet = (HSSFSheet) workbook.createSheet(title);     
        // 设置表格默认列宽度为18个字节     
        sheet.setDefaultColumnWidth((short)20);     
             
          
        String file = "E:/dadcwenjian" + "/" + getFileName() + "-" +j+ ".xls";  
  
        fileNames.add(file);  
          
        FileOutputStream o = new FileOutputStream(file);  
             
        // 生成一个样式     
        HSSFCellStyle style = (HSSFCellStyle) workbook.createCellStyle();     
        // 设置这些样式     
        style.setFillForegroundColor(HSSFColor.GOLD.index);     
        style.setFillPattern(HSSFCellStyle.SOLID_FOREGROUND);     
        style.setBorderBottom(HSSFCellStyle.BORDER_THIN);     
        style.setBorderLeft(HSSFCellStyle.BORDER_THIN);     
        style.setBorderRight(HSSFCellStyle.BORDER_THIN);     
        style.setBorderTop(HSSFCellStyle.BORDER_THIN);     
        style.setAlignment(HSSFCellStyle.ALIGN_CENTER);     
        // 生成一个字体     
        HSSFFont font = (HSSFFont) workbook.createFont();     
        font.setColor(HSSFColor.VIOLET.index);     
        //font.setFontHeightInPoints((short) 12);     
        font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);     
        // 把字体应用到当前的样式     
        style.setFont(font);     
             
        // 指定当单元格内容显示不下时自动换行     
        style.setWrapText(true);     
           
        // 声明一个画图的顶级管理器    
        HSSFPatriarch patriarch = sheet.createDrawingPatriarch();   
        
        // 产生表格标题行     
        //表头的样式   
        HSSFCellStyle titleStyle = (HSSFCellStyle) workbook.createCellStyle();// 创建样式对象   
        titleStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER_SELECTION);// 水平居中   
        titleStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 垂直居中   
        // 设置字体   
        HSSFFont titleFont = (HSSFFont) workbook.createFont(); // 创建字体对象   
        titleFont.setFontHeightInPoints((short) 15); // 设置字体大小   
        titleFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 设置粗体   
      //  titleFont.setFontName("黑体"); // 设置为黑体字   
        titleStyle.setFont(titleFont);   
        sheet.addMergedRegion(new Region(0,(short)0,0,(short)(headers.length-1)));//指定合并区域    
        HSSFRow rowHeader = sheet.createRow(0);     
        HSSFCell cellHeader = rowHeader.createCell((short)0);   //只能往第一格子写数据，然后应用样式，就可以水平垂直居中   
        HSSFRichTextString textHeader = new HSSFRichTextString(title);     
        cellHeader.setCellStyle(titleStyle);   
        cellHeader.setCellValue(textHeader);   
           
        HSSFRow row = sheet.createRow(1);     
        for (int i = 0; i < headers.length; i++) {     
            HSSFCell cell = row.createCell((short)i);     
            cell.setCellStyle(style);     
            HSSFRichTextString text = new HSSFRichTextString(headers[i]);     
            cell.setCellValue(text);     
         }     
         // 遍历集合数据，产生数据行     
         if(result1 != null){     
             int index = 2;     
             for(T t:result1){    
                 row = sheet.createRow(index);     
                 index++;   
                 for(short i = 0; i < columns.length; i++) {   
                     HSSFCell cell = row.createCell(i);   
                     String fieldName = columns[i];   
                     String getMethodName = "get"   
                         + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);   
                     Class tCls = t.getClass();   
                     Method getMethod = tCls.getMethod(getMethodName, new Class[]{});   
                     Object value = getMethod.invoke(t, new Class[]{});   
                     String textValue = null;   
                     if(value == null) {   
                         textValue = "";   
                     }else if (value instanceof Date) {   
                         Date date = (Date) value;   
                         SimpleDateFormat sdf = new SimpleDateFormat(pattern);   
                          textValue = sdf.format(date);   
                      }  else if (value instanceof byte[]) {   
                         // 有图片时，设置行高为60px;   
                         row.setHeightInPoints(60);   
                         // 设置图片所在列宽度为80px,注意这里单位的一个换算   
                         sheet.setColumnWidth(i, (short) (35.7 * 80));   
                         byte[] bsValue = (byte[]) value;   
                         HSSFClientAnchor anchor = new HSSFClientAnchor(0, 0,   
                               1023, 255, (short) 6, index, (short) 6, index);   
                         anchor.setAnchorType(2);   
                         patriarch.createPicture(anchor, workbook.addPicture(   
                               bsValue, HSSFWorkbook.PICTURE_TYPE_JPEG));   
                      } else{   
                         //其它数据类型都当作字符串简单处理   
                         textValue = value.toString();   
                      }   
                        
                     if(textValue!= null){   
                         Pattern p = Pattern.compile("^//d+(//.//d+)?$");     
                         Matcher matcher = p.matcher(textValue);   
                         if(matcher.matches()){   
                            //是数字当作double处理   
                            cell.setCellValue(Double.parseDouble(textValue));   
                         }else{   
                            HSSFRichTextString richString = new HSSFRichTextString(textValue);   
                            cell.setCellValue(richString);   
                         }   
                      }   
                 }   
             }        
         }     
         workbook.write(o);    
         File srcfile[] = new File[fileNames.size()];  
        for (int i = 0, n1 = fileNames.size(); i < n1; i++) {  
            srcfile[i] = new File(fileNames.get(i));  
        }  
        ZipFiles(srcfile, zip);  
        FileInputStream inStream = new FileInputStream(zip);  
        byte[] buf = new byte[4096];  
        int readLength;  
        while (((readLength = inStream.read(buf)) != -1)) {  
            out.write(buf, 0, readLength);  
        }  
        inStream.close();  
        }  
     }     
    //获取文件名字  
    public static String getFileName(){  
        // 文件名获取  
        Date date = new Date();  
        SimpleDateFormat format = new SimpleDateFormat("yyyyMMddHHmmss");  
        String f = title + format.format(date);  
        return f;  
    }  
    //压缩文件  
    public static void ZipFiles(java.io.File[] srcfile, java.io.File zipfile) {  
        byte[] buf = new byte[1024];  
        try {  
            ZipOutputStream out = new ZipOutputStream(new FileOutputStream(  
                    zipfile));  
            for (int i = 0; i < srcfile.length; i++) {  
                FileInputStream in = new FileInputStream(srcfile[i]);  
                out.putNextEntry(new ZipEntry(srcfile[i].getName()));  
                int len;  
                while ((len = in.read(buf)) > 0) {  
                    out.write(buf, 0, len);  
                }  
                out.closeEntry();  
                in.close();  
            }  
            out.close();  
        } catch (IOException e) {  
            e.printStackTrace();  
        }  
    }  
      
    /** 设置响应头 */  
    public void setResponseHeader(HttpServletResponse response,String fileName) {  
        try {  
            this.title=fileName;  
            response.reset();// 清空输出流  
            response.setContentType("application/octet-stream;charset=UTF-8");  
            response.setHeader("Content-Disposition", "attachment;filename="  
                    +new String(this.title.getBytes("GB2312"), "8859_1")  
                    + ".zip");  
            response.addHeader("Pargam", "no-cache");  
            response.addHeader("Cache-Control", "no-cache");  
        } catch (Exception ex) {  
            ex.printStackTrace();  
        }  
    }  
    

}
