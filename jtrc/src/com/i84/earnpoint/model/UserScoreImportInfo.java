package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class UserScoreImportInfo {
    
	public Integer uid;

    @ExcelAnnotation(exportName="成绩")
    public String score;
 
    public Integer seq;
   
    public String remark;
    
    @ExcelAnnotation(exportName="学时")
    public String stime;
    
    @ExcelAnnotation(exportName="身份证号")
	public String pnum;
    
    @ExcelAnnotation(exportName="班级编码")
	public String classId;

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}

	public String getScore() {
		return score;
	}

	public void setScore(String score) {
		this.score = score;
	}

	public Integer getSeq() {
		return seq;
	}

	public void setSeq(Integer seq) {
		this.seq = seq;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getStime() {
		return stime;
	}

	public void setStime(String stime) {
		this.stime = stime;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getClassId() {
		return classId;
	}

	public void setClassId(String classId) {
		this.classId = classId;
	}
     
    
}