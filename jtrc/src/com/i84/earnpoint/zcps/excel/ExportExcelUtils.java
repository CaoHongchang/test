package com.i84.earnpoint.zcps.excel;

import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

/**
 * poi生成表格工具类,泛型成员变量类型必须是String,后面有需要再进行调整
 * 
 * @author Administrator
 *
 * @param <T>
 */
public class ExportExcelUtils<T> {
	private HSSFWorkbook workbook;
	private HSSFSheet sheet;
	
	
	public HSSFWorkbook getWorkbook() {
		return workbook;
	}

	public void setWorkbook(HSSFWorkbook workbook) {
		this.workbook = workbook;
	}
	
	public HSSFSheet getSheet() {
		return sheet;
	}

	public void setSheet(HSSFSheet sheet) {
		this.sheet = sheet;
	}
	
	/**
	 * 生产excel并输出到OutputStream
	 * @param sheetName 表格名称
	 * @param headers 表格标题行
	 * @param data 表格数据行
	 * @param out 输出的OutputStream
	 * @throws Exception
	 */
	public void createExcelFile(String fileName,String sheetName, String[] headers,List<T> data,HttpServletResponse response) throws Exception{  
       
		setResponse(fileName,response);//输出信息设置
		setWorkbook(new HSSFWorkbook());// 声明一个工作薄
		setSheet(sheetName);//生成一个表格
		sheet.autoSizeColumn(1);
		
		setHeaders(headers);//产生表格标题行
		
		setCell(data);//生产表格数据
	  
		this.workbook.write(response.getOutputStream());
    }
	/**
	 * 生产excel并输出到OutputStream
	 * @param sheetName 表格名称
	 * @param headers 表格标题行
	 * @param data 表格数据行
	 * @param cellList 合并的单元格
	 * @param out 输出的OutputStream
	 * @throws Exception
	 */
	public void createExcelFile(String fileName,String sheetName, String[] headers,List<T> data,List<CellRangeAddress> cellList,HttpServletResponse response) throws Exception{  
        setResponse(fileName,response);//输出信息设置
		setWorkbook(new HSSFWorkbook());// 声明一个工作薄
		setSheet(sheetName);//生成一个表格
		setHeaders(headers);//产生表格标题行
		setCell(data);//生产表格数据
		setMergerdCell(cellList);//合并单元格
		this.workbook.write(response.getOutputStream());
    }
	
	private void setMergerdCell(List<CellRangeAddress> rList){
		if(rList != null && !rList.isEmpty()){
			for (CellRangeAddress region : rList) {
				this.sheet.addMergedRegion(region);
			}
		}
	}
	
	/**
	 * 设置输出信息
	 * @param fileName
	 * @param response
	 * @throws Exception
	 */
	private void setResponse(String fileName,HttpServletResponse response) throws Exception{
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String reportName = fileName+dateFormat.format(new Date()) + ".xls";
        reportName=new String(reportName.getBytes("GBK"),"ISO8859-1");
        response.setHeader("Content-Type", "application/force-download;");  
        response.setHeader("Content-disposition", "attachment;filename="+reportName);  
        response.setContentType("application/ms-excel");
       
	}
	
	private void setSheet(String sheetName)throws Exception{
		
		setSheet(this.workbook.createSheet(sheetName));
	}
	/**
	 * 列名
	 * @param sheetName
	 * @param headers
	 * @return
	 */
	private void setHeaders(String[] headers)throws Exception{
		HSSFCellStyle setBorder = workbook.createCellStyle(); 
	    setBorder.setBorderBottom(HSSFCellStyle.BORDER_THIN); //下边框  
	    setBorder.setBorderLeft(HSSFCellStyle.BORDER_THIN);//左边框  
	    setBorder.setBorderTop(HSSFCellStyle.BORDER_THIN);//上边框  
	    setBorder.setBorderRight(HSSFCellStyle.BORDER_THIN);//右边框  
	    setBorder.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中  
		HSSFRow row = this.sheet.createRow(0);//产生表格标题行
		
		for (int i = 0; i < headers.length; i++) {
			HSSFCell cell = row.createCell(i);
			cell.setCellValue(headers[i]);
		}
	}
	
	/**
	 * 生成表格数据
	 * @param data
	 * @throws Exception
	 */
	private void setCell(List<T> data) throws Exception{
		//遍历集合数据，产生数据行
		Iterator<T> it = data.iterator();
		int index = 0;
		HSSFRow row;
		while (it.hasNext()) {
			index++;
			row = this.sheet.createRow(index);
			T t = it.next();
			//利用反射，根据javabean属性的先后顺序，动态调用getXxx()方法得到属性值
			Field[] fields = t.getClass().getDeclaredFields();
			for (int i = 0; i < fields.length; i++) {
				Field field = fields[i];
				String fieldName = field.getName();
			    String getMethodName = "get"
			              	+ fieldName.substring(0, 1).toUpperCase()
			                + fieldName.substring(1);
			    Method getMethod = t.getClass().getMethod(getMethodName,new Class[] {});
			    Object value = getMethod.invoke(t, new Object[] {});
			    HSSFCell cell = row.createCell(i);
			    if(value instanceof String){
			    	cell.setCellValue((String)value);
			    }else{
			    	throw new Exception("数据类型有误!");
			    }
			    
			}
		}
	}
}
