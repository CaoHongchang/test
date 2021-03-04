package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class UserExpertImportInfo {

	private Integer id;
	private Integer uid;
	@ExcelAnnotation(exportName="姓名")
	private String name;
	@ExcelAnnotation(exportName="身份证号")
	private String pnum;
	@ExcelAnnotation(exportName="性别")
	private String sex;
	@ExcelAnnotation(exportName="联系电话")
	private String tel;
	@ExcelAnnotation(exportName="工作单位")
	private String company;
	@ExcelAnnotation(exportName="专家编号")
	private String zpno;
	@ExcelAnnotation(exportName="专业类别")
	private String proType;
	@ExcelAnnotation(exportName="资格级别")
	private String zgLevel;
	private Integer staff;
	private Date addDate;
	private Date delDate;
	
	private Integer loginTimes;
	
	private Integer initTime;
	
	private Integer otherTime;
	
	private Date loginDate;
	
	private String errMsg;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
	}

	public String getZpno() {
		return zpno;
	}

	public void setZpno(String zpno) {
		this.zpno = zpno;
	}

	public String getProType() {
		return proType;
	}

	public void setProType(String proType) {
		this.proType = proType;
	}

	public String getZgLevel() {
		return zgLevel;
	}

	public void setZgLevel(String zgLevel) {
		this.zgLevel = zgLevel;
	}

	public Integer getStaff() {
		return staff;
	}

	public void setStaff(Integer staff) {
		this.staff = staff;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Integer getLoginTimes() {
		return loginTimes;
	}

	public void setLoginTimes(Integer loginTimes) {
		this.loginTimes = loginTimes;
	}

	public Integer getInitTime() {
		return initTime;
	}

	public void setInitTime(Integer initTime) {
		this.initTime = initTime;
	}

	public Integer getOtherTime() {
		return otherTime;
	}

	public void setOtherTime(Integer otherTime) {
		this.otherTime = otherTime;
	}

	public Date getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Date loginDate) {
		this.loginDate = loginDate;
	}

	
}