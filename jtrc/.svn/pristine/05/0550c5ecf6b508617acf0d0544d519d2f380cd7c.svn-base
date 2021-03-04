package com.i84.earnpoint.common.excel;


import java.io.File;
import java.io.FileInputStream;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.lang.reflect.Type;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.Sheet;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.model.ClassActionImportInfo;
/**
 * @author liu_quan
 *导入excel
 * @param <T>
 */
public class ImportExcel<T> {
Class<T> clazz;
	
	public ImportExcel (Class<T> clazz) {
		this.clazz = clazz;
	}
	
	/**
	 * @param file:文件
	 * @param pattern：其它参数
	 * @return
	 */
	public Collection<T> importExcel(File file, String...pattern) {
		Collection<T> dist = new ArrayList<T>();
		try {
			/**
			 * 类反射得到调用方法
			 */
			// 得到目标目标类的所有的字段列表  
			Field[] fields = clazz.getDeclaredFields();
			// 将所有标有Annotation的字段，也就是允许导入数据的字段,放入到一个map中
			Map<String, Method> fieldMap = new HashMap<String, Method>();
			// 循环读取所有字段
			for (Field field : fields) {
				// 得到单个字段上的Annotation
				ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
				// 如果标识了Annotationd
				if (excelAnnotation != null) {
					String fieldName = field.getName();
					// 构造设置了Annotation的字段的Setter方法 toLowerCase toUpperCase
					String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
					// 构造调用的method
					Method setMethod = clazz.getMethod(setMethodName, new Class[] {field.getType()});
					// 将这个method以Annotaion的名字为key来存入
					fieldMap.put(excelAnnotation.exportName(), setMethod);
				}
			}
			
			/**
			 * excel的解析开始
			 */
			// 得到工作表
			Iterator<Row> row =null;
			try {//EXCEL2007
				// 将传入的File构造为FileInputStream;
				FileInputStream inputStream = new FileInputStream(file);
				Workbook book = new XSSFWorkbook(inputStream);
				 Sheet sheet=null; 
				if(pattern!=null&&pattern.length>0){
					 sheet=  book.getSheetAt(Integer.valueOf(pattern[0].toString()));
				}else{
	             sheet=  book.getSheetAt(0);
				}
	            //得到第一面的所有行
	            row = sheet.rowIterator();
	        } catch (Exception ex) {//EXCEL2003
	        	// 将传入的File构造为FileInputStream;
				FileInputStream inputStream = new FileInputStream(file);
				// 得到工作表
				HSSFWorkbook book = new HSSFWorkbook(inputStream);
				// 得到第一页
				HSSFSheet sheet = null;
				if(pattern!=null&&pattern.length>0){
					 sheet=  book.getSheetAt(Integer.valueOf(pattern[0].toString()));
				}else{
	             sheet=  book.getSheetAt(0);
				}
				
				// 得到第一面的所有行
				 row = sheet.rowIterator();
	        }
		
		
			
			/**
			 * 标题解析
			 */
			// 得到第一行，也就是标题行
			Row titleRow = row.next();
			// 得到第一行的所有列
			Iterator<Cell> cellTitle = titleRow.cellIterator();
			// 将标题的文字内容放入到一个map中
			Map<Integer, String> titleMap = new HashMap<Integer, String>();
			// 从标题第一列开始
			int i = 0;
			// 循环标题所有的列
			while (cellTitle.hasNext()) {
				Cell cell = (Cell) cellTitle.next();
				String value = cell.getStringCellValue();
				titleMap.put(i, value);
				i++;
			}
			/**
			 * 解析内容行
			 */
			while (row.hasNext()) {
				// 标题下的第一行
				Row rown = row.next();
				// 行的所有列
				Iterator<Cell> cellBody = rown.cellIterator();
				// 得到传入类的实例
				T tObject = clazz.newInstance();
				// 遍历一行的列
				int col = 0;
				while (cellBody.hasNext()) {
					Cell cell = (Cell) cellBody.next();
					// 这里得到此列的对应的标题
					String titleString = titleMap.get(cell.getColumnIndex());
					// 如果这一列的标题和类中的某一列的Annotation相同，那么则调用此类的的set方法，进行设值
					if (fieldMap.containsKey(titleString)) {
						Method setMethod = fieldMap.get(titleString);
						//得到setter方法的参数
						Type[] types = setMethod.getGenericParameterTypes();
						//只要一个参数
						String xclass = String.valueOf(types[0]);
						//System.out.println(xclass);
						//判断参数类型
						if ("class java.lang.String".equals(xclass)) {
					    	 cell.setCellType(Cell.CELL_TYPE_STRING);
					    	 setMethod.invoke(tObject, cell.getStringCellValue()+"");
//					        System.out.println(	cell.getCellType());
						    //System.out.println(cell.getStringCellValue().toString());
						} else if ("class java.util.Date".equals(xclass)) {
							setMethod.invoke(tObject, cell.getDateCellValue());
						} else if ("class java.lang.Boolean".equals(xclass)) {
							Boolean boolName = true;
							if ("否".equals(cell.getStringCellValue())) {
								boolName = false;
							}
							setMethod.invoke(tObject, boolName);
						} else if ("class java.lang.Integer".equals(xclass)) {
							setMethod.invoke(tObject, new Integer(String.valueOf((int)cell.getNumericCellValue())));
						} else if ("class java.lang.Long".equals(xclass)) {
							setMethod.invoke(tObject, new Long(cell.getStringCellValue()));
						} else {
							//
						}
					}
				}
				dist.add(tObject);
			}
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}
		 return dist;
	}
	
	/**标题匹配校验
	 * @param file:文件
	 * @param pattern：其它参数
	 * @return
	 * @throws Exception 
	 */
	public Map<String, String> isTitle(File file,String...pattern) throws Exception {
		try {
			/**
			 * 类反射得到调用方法
			 */
			// 得到目标目标类的所有的字段列表  
			Field[] fields = clazz.getDeclaredFields();
			// 将所有标有Annotation的字段，也就是允许导入数据的字段,放入到一个map中
			Map<String, String> fieldMap = new HashMap<String, String>();
			// 循环读取所有字段
			for (Field field : fields) {
				// 得到单个字段上的Annotation
				ExcelAnnotation excelAnnotation = field.getAnnotation(ExcelAnnotation.class);
				// 如果标识了Annotationd
				if (excelAnnotation != null) {
					String fieldName = field.getName();
					// 构造设置了Annotation的字段的Setter方法
					String setMethodName = "set" + fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
					// 构造调用的method
					//Method setMethod = clazz.getMethod(setMethodName, new Class[] {field.getType()});
					// 将这个method以Annotaion的名字为key来存入
					//System.out.println(excelAnnotation.exportName()+" "+excelAnnotation.exportName());
					fieldMap.put(excelAnnotation.exportName(), excelAnnotation.exportName());
				}
			}
			
			/**
			 * excel的解析开始
			 */
			// 得到工作表
			Iterator<Row> row =null;
			try {//EXCEL2007
				// 将传入的File构造为FileInputStream;
				FileInputStream inputStream = new FileInputStream(file);
				Workbook book = new XSSFWorkbook(inputStream);
	            Sheet sheet=  book.getSheetAt(0);
	            //得到第一面的所有行
	            row = sheet.rowIterator();
	        } catch (Exception ex) {//EXCEL2003
	        	// 将传入的File构造为FileInputStream;
				FileInputStream inputStream = new FileInputStream(file);
				// 得到工作表
				HSSFWorkbook book = new HSSFWorkbook(inputStream);
				// 得到第一页
				HSSFSheet sheet = book.getSheetAt(0);
				// 得到第一面的所有行
				 row = sheet.rowIterator();
	        }
		
		
			
			/**
			 * 标题解析
			 */
			List<String> titleList =new ArrayList<String>();
			// 得到第一行，也就是标题行
			Row titleRow = row.next();
			// 得到第一行的所有列
			Iterator<Cell> cellTitle = titleRow.cellIterator();
			// 将标题的文字内容放入到一个map中
			Map<String, String> titleMap = new HashMap<String, String>();
			// 从标题第一列开始
			int i = 0;
			// 循环标题所有的列
			while (cellTitle.hasNext()) {
				Cell cell = (Cell) cellTitle.next();
				String value = cell.getStringCellValue();
				value=ResultConstant.replaceTrim(value);
				//System.out.println(value);
				titleMap.put(value, value);
				i++;
			}

				for(Map.Entry<String,String> m :titleMap.entrySet()){
					String key=m.getKey();
					if(fieldMap.get(key)!=null){
						fieldMap.remove(key);
					}  
				}
				
			
			return fieldMap;
			
			
		} catch (Exception e) {
			e.printStackTrace();
			throw e;
		}
		 
	}
	
	public static void main(String[] args) throws Exception {
		ImportExcel<ClassActionImportInfo> test = new ImportExcel<ClassActionImportInfo>(ClassActionImportInfo.class);
		File file = new File("C:/Users/Administrator/Desktop/执行情况模板.xlsx");
		List<ClassActionImportInfo> results = (List<ClassActionImportInfo>)test.importExcel(file); 
		
		Map<String, String> lackMap= test.isTitle(file); 
		if(lackMap != null && lackMap.size() > 0){
			String title="";
			for(Map.Entry<String, String>  m : lackMap.entrySet()){
				title+=" "+m.getValue();
			}
			System.err.println("导入文件标题缺失");

		}
	}
}
class TestVo {

	@ExcelAnnotation(exportName="姓名")
	private String name;
	
	@ExcelAnnotation(exportName="性别")
	private String sex;
	
	@ExcelAnnotation(exportName="出生年月")
	private String brith;

	/**
	 * @return 返回 name
	 */
	public String getName() {
		return name;
	}

	/**
	 * @param name 设置 name
	 */
	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getBrith() {
		return brith;
	}

	public void setBrith(String brith) {
		this.brith = brith;
	}
	
}