package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class ExamResultInfoImport {
	@ExcelAnnotation(exportName = "班级编号")
	private String classNum;
	@ExcelAnnotation(exportName = "班级名称")
	private String className;
	@ExcelAnnotation(exportName = "身份证号")
	private String cardId;
	@ExcelAnnotation(exportName = "姓名")
	private String userName;
	@ExcelAnnotation(exportName = "成绩")
	private String resultScore;
	private String errMsg;// 错误提示

	public String getClassNum() {
		return classNum;
	}

	public void setClassNum(String classNum) {
		this.classNum = classNum;
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

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

	public String getResultScore() {
		return resultScore;
	}

	public void setResultScore(String resultScore) {
		this.resultScore = resultScore;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

}
