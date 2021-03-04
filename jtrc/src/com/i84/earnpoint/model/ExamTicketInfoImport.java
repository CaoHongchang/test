package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class ExamTicketInfoImport {
	@ExcelAnnotation(exportName = "班级编号")
	private String classNum;
	@ExcelAnnotation(exportName = "身份证号")
	private String cardId;
	@ExcelAnnotation(exportName = "姓名")
	private String userName;
	@ExcelAnnotation(exportName = "考试类型")
	private String examType;
	@ExcelAnnotation(exportName = "考试名称")
	private String projectName;
	@ExcelAnnotation(exportName = "考试日期")
	private String examDate;
	@ExcelAnnotation(exportName = "考试时间")
	private String examTime;
	@ExcelAnnotation(exportName = "座位号")
	private String seatNum;
	@ExcelAnnotation(exportName = "考试地点")
	private String examAddress;
	private String errMsg;// 错误提示

	public String getCardId() {
		return cardId;
	}

	public void setCardId(String cardId) {
		this.cardId = cardId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getExamType() {
		return examType;
	}

	public void setExamType(String examType) {
		this.examType = examType;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public String getExamDate() {
		return examDate;
	}

	public void setExamDate(String examDate) {
		this.examDate = examDate;
	}

	public String getExamTime() {
		return examTime;
	}

	public void setExamTime(String examTime) {
		this.examTime = examTime;
	}

	public String getSeatNum() {
		return seatNum;
	}

	public void setSeatNum(String seatNum) {
		this.seatNum = seatNum;
	}

	public String getExamAddress() {
		return examAddress;
	}

	public void setExamAddress(String examAddress) {
		this.examAddress = examAddress;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}

}
