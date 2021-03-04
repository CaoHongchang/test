package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class UserPartyInImport {

	private Integer id;
	
	@ExcelAnnotation(exportName="身份证")
	private String pnum;
	
	@ExcelAnnotation(exportName="转入时间")
	private String inDate;
	
	@ExcelAnnotation(exportName="组织关系介绍信编号")
	private String zpno;
	
	@ExcelAnnotation(exportName="转入地")
	private String inPlace;
	
	//党员ID
	private String party;
	
	private String errMsg;

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

	public String getInDate() {
		return inDate;
	}

	public void setInDate(String inDate) {
		this.inDate = inDate;
	}

	public String getZpno() {
		return zpno;
	}

	public void setZpno(String zpno) {
		this.zpno = zpno;
	}

	public String getInPlace() {
		return inPlace;
	}

	public void setInPlace(String inPlace) {
		this.inPlace = inPlace;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getParty() {
		return party;
	}

	public void setParty(String party) {
		this.party = party;
	}
	
	
}