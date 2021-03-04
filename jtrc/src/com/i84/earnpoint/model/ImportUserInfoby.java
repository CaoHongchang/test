package com.i84.earnpoint.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ImportUserInfoby {
	private String Dstate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date ZDate;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birthDate;
	private String dState;
	private String dpno;
	private String errMsg;
	private String errorMsg;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date graduationTime;
	private Integer id;
	private String major;
	private String name;
	private Integer page;
	private String pnum;
	private Integer rows;
	private String school;
	private String sex;
	private String value;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date zDate;

	
	public ImportUserInfoby() {
		
	}

	public String getDstate() {
		return Dstate;
	}

	public void setDstate(String dstate) {
		Dstate = dstate;
	}

	public String getdState() {
		return dState;
	}

	public void setdState(String dState) {
		this.dState = dState;
	}

	public String getDpno() {
		return dpno;
	}

	public void setDpno(String dpno) {
		this.dpno = dpno;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public Date getGraduationTime() {
		return graduationTime;
	}

	public void setGraduationTime(Date graduationTime) {
		this.graduationTime = graduationTime;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
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

	public Integer getPage() {
		return page;
	}

	public void setPage(Integer page) {
		this.page = page;
	}

	public Integer getRows() {
		return rows;
	}

	public void setRows(Integer rows) {
		this.rows = rows;
	}

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	public Date getZDate() {
		return ZDate;
	}

	public void setZDate(Date zDate) {
		ZDate = zDate;
	}

	public Date getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(Date birthDate) {
		this.birthDate = birthDate;
	}

	public Date getzDate() {
		return zDate;
	}

	public void setzDate(Date zDate) {
		this.zDate = zDate;
	}

}
