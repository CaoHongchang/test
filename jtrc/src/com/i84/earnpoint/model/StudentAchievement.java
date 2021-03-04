package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class StudentAchievement {
    private Integer id;
	@ExcelAnnotation(exportName="教育编号")
    private String educationNum;
	@ExcelAnnotation(exportName="身份证")
    private String pnum;
	@ExcelAnnotation(exportName="语文")
    private String yw;
	@ExcelAnnotation(exportName="数学")
    private String sx;
	@ExcelAnnotation(exportName="英语")
    private String yy;
	@ExcelAnnotation(exportName="政治")
    private String zz;
	@ExcelAnnotation(exportName="民法")
    private String mf;
	@ExcelAnnotation(exportName="是否录取")
    private String isWant;
	
	
  
    private Date delDate;

    private Date addDate;

    private Integer uid;

    private String cwts;
    
    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getEducationNum() {
        return educationNum;
    }

    public void setEducationNum(String educationNum) {
        this.educationNum = educationNum == null ? null : educationNum.trim();
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum == null ? null : pnum.trim();
    }

   
    public Date getDelDate() {
        return delDate;
    }

    public void setDelDate(Date delDate) {
        this.delDate = delDate;
    }

    public Date getAddDate() {
        return addDate;
    }

    public void setAddDate(Date addDate) {
        this.addDate = addDate;
    }

    public Integer getUid() {
        return uid;
    }

    public void setUid(Integer uid) {
        this.uid = uid;
    }

	public String getCwts() {
		return cwts;
	}

	public void setCwts(String cwts) {
		this.cwts = cwts;
	}

	public String getYw() {
		return yw;
	}

	public void setYw(String yw) {
		this.yw = yw;
	}

	public String getSx() {
		return sx;
	}

	public void setSx(String sx) {
		this.sx = sx;
	}

	public String getYy() {
		return yy;
	}

	public void setYy(String yy) {
		this.yy = yy;
	}

	public String getZz() {
		return zz;
	}

	public void setZz(String zz) {
		this.zz = zz;
	}

	public String getMf() {
		return mf;
	}

	public void setMf(String mf) {
		this.mf = mf;
	}

	public String getIsWant() {
		return isWant;
	}

	public void setIsWant(String isWant) {
		this.isWant = isWant;
	}

	
    
}