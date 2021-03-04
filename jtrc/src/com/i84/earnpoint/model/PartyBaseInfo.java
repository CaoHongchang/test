package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class PartyBaseInfo {

	private Integer id;
	@ExcelAnnotation(exportName="身份证")
	private String pnum;
	@ExcelAnnotation(exportName="年份")
	private String pyear;
	@ExcelAnnotation(exportName="缴费基准")
	private String baseM;
	private String errM;
	private Date delDate;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getPyear() {
		return pyear;
	}
	public void setPyear(String pyear) {
		this.pyear = pyear;
	}
	public String getBaseM() {
		return baseM;
	}
	public void setBaseM(String baseM) {
		this.baseM = baseM;
	}
	public String getErrM() {
		return errM;
	}
	public void setErrM(String errM) {
		this.errM = errM;
	}
	public Date getDelDate() {
		return delDate;
	}
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
	
}
