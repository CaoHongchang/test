package com.i84.earnpoint.model;

import java.io.Serializable;
import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public  class ImportUserInfo extends Page implements Serializable{

	private static final long serialVersionUID = 1L;
	//姓名
	@ExcelAnnotation(exportName="姓名")
	private String name;
	//身份证号码
	@ExcelAnnotation(exportName="身份证号码")
	private String pnum;
 
	//性别
	@ExcelAnnotation(exportName="性别")
	private String sex;

	
	//毕业学校
	@ExcelAnnotation(exportName="毕业学校")
	private String school;
    //毕业时间
	@ExcelAnnotation(exportName="毕业时间")
	private String graduationTime;
	//所属专业
	@ExcelAnnotation(exportName="所属专业")
	private String major;
	//出生年月
	@ExcelAnnotation(exportName="出生年月")
	private String birthDate;
	
	@ExcelAnnotation(exportName="档案号")
	private String dpno;
	
	@ExcelAnnotation(exportName="档案状态")
    private  String dState;
	
	private String errMsg; 
	@ExcelAnnotation(exportName="转入时间")
	private String zDate;
	private String errorMsg;
	
	private Integer id;

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

	public String getSchool() {
		return school;
	}

	public void setSchool(String school) {
		this.school = school;
	}

	public String getGraduationTime() {
		return graduationTime;
	}

	public void setGraduationTime(String graduationTime) {
		this.graduationTime = graduationTime;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	public String getBirthDate() {
		return birthDate;
	}

	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}

	public String getDpno() {
		return dpno;
	}

	public void setDpno(String dpno) {
		this.dpno = dpno;
	}

	public String getDState() {
		return dState;
	}

	public void setDState(String dState) {
		this.dState = dState;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getZDate() {
		return zDate;
	}

	public void setZDate(String zDate) {
		this.zDate = zDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String getErrorMsg() {
		return errorMsg;
	}

	public void setErrorMsg(String errorMsg) {
		this.errorMsg = errorMsg;
	}

	public String getdState() {
		return dState;
	}

	public void setdState(String dState) {
		this.dState = dState;
	}

	public String getzDate() {
		return zDate;
	}

	public void setzDate(String zDate) {
		this.zDate = zDate;
	}
	
	
	
}