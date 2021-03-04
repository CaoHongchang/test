package com.i84.earnpoint.sjbb.model;

 
import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 统计数据导出
 * @author liu_quan
 *
 */
public class SjExportVo {
	@ExcelAnnotation(exportName="序号")
	private String index;
	@ExcelAnnotation(exportName="类别")
	private String name;
	@ExcelAnnotation(exportName="数量")
	private int num;
	
	public String getIndex() {
		return this.index;
	}
	public void setIndex(String index) {
		this.index = index;
	}
	public String getName() {
		return this.name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return this.num;
	}
	public void setNum(int num) {
		this.num = num;
	}
}