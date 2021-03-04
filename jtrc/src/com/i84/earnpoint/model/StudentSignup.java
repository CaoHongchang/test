package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * @author liu_quan
 * 导入学员
 *
 */
public class StudentSignup {
    private Integer id;
	@ExcelAnnotation(exportName="教育编号")
    private String educationNum;
	@ExcelAnnotation(exportName="姓名")
    private String name;
	@ExcelAnnotation(exportName="身份证")
    private String pnum;
	@ExcelAnnotation(exportName="出生年月")
	private String birthday1;
	
    private Date birthday;
	@ExcelAnnotation(exportName="身份证地址")
    private String address;
	@ExcelAnnotation(exportName="身份证地址邮编")
    private String pnumCode;
	@ExcelAnnotation(exportName="政治面貌")
    private String zzmm;
	@ExcelAnnotation(exportName="现居住地")
    private String placeResidence;
	@ExcelAnnotation(exportName="现工作单位")
    private String workUnit;
	@ExcelAnnotation(exportName="工作时间")
    private String workTime;
	@ExcelAnnotation(exportName="职务")
    private String post;
	@ExcelAnnotation(exportName="最高学历")
    private String highestDegree;
	@ExcelAnnotation(exportName="毕业院校")
    private String graduationSchool;
	@ExcelAnnotation(exportName="毕业证号")
    private String graduationNum;
	
	@ExcelAnnotation(exportName="毕业时间")
	private String graduationDate1;
	@ExcelAnnotation(exportName="性别")
	private String sex;
	private Date graduationDate;
	
	
	@ExcelAnnotation(exportName="电子邮箱")
    private String email;
	@ExcelAnnotation(exportName="固定电话")
    private String tel;
    @ExcelAnnotation(exportName="手机号码")
    private String phone;
    @ExcelAnnotation(exportName="通讯地址")
    private String postalAddress;
    @ExcelAnnotation(exportName="邮编")
    private String code;
    @ExcelAnnotation(exportName="QQ号")
    private String qq;
    @ExcelAnnotation(exportName="现有岗位或职业资格证")
    private String xyzsNum;
    @ExcelAnnotation(exportName="岗位或职业资格证说明")
    private String gwzsNum;
    @ExcelAnnotation(exportName="成考考区所在地")
    private String ckkqAddress;
    @ExcelAnnotation(exportName="考区地点")
    private String kqAddress;
                                   
    @ExcelAnnotation(exportName="民族")
    private String mz;
    @ExcelAnnotation(exportName="微信号")
    private String wxh;
    @ExcelAnnotation(exportName="职业类别")
    private String zylb;
    @ExcelAnnotation(exportName="招生类别")
    private String zslb;
    @ExcelAnnotation(exportName="报考科类")
    private String bkkm;
    	 			

    
    
    private Date delDate;

    private Date addDate;

    private Date updateDate;
    
    private Integer uid;
    
    private String remark;
    
    private String isPrint;
    
    private String cwts;
    
    /**考生籍贯*/
    private String jgName;
    /**考生特征*/
    private String ksTz;
    /**
     * 最后修改人
     */
    private String lastUid;
    /**
     * 信息来源为"内部导入""外部导入"
     */
    private String sourceType;
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

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getPnum() {
        return pnum;
    }

    public void setPnum(String pnum) {
        this.pnum = pnum == null ? null : pnum.trim();
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address == null ? null : address.trim();
    }

    public String getPnumCode() {
        return pnumCode;
    }

    public void setPnumCode(String pnumCode) {
        this.pnumCode = pnumCode == null ? null : pnumCode.trim();
    }

    public String getZzmm() {
        return zzmm;
    }

    public void setZzmm(String zzmm) {
        this.zzmm = zzmm == null ? null : zzmm.trim();
    }

    public String getPlaceResidence() {
        return placeResidence;
    }

    public void setPlaceResidence(String placeResidence) {
        this.placeResidence = placeResidence == null ? null : placeResidence.trim();
    }

    public String getWorkUnit() {
        return workUnit;
    }

    public void setWorkUnit(String workUnit) {
        this.workUnit = workUnit == null ? null : workUnit.trim();
    }

    public String getPost() {
        return post;
    }

    public void setPost(String post) {
        this.post = post == null ? null : post.trim();
    }

    public String getHighestDegree() {
        return highestDegree;
    }

    public void setHighestDegree(String highestDegree) {
        this.highestDegree = highestDegree == null ? null : highestDegree.trim();
    }

    public String getGraduationSchool() {
        return graduationSchool;
    }

    public void setGraduationSchool(String graduationSchool) {
        this.graduationSchool = graduationSchool == null ? null : graduationSchool.trim();
    }

    public String getGraduationNum() {
        return graduationNum;
    }

    public void setGraduationNum(String graduationNum) {
        this.graduationNum = graduationNum == null ? null : graduationNum.trim();
    }

    public Date getGraduationDate() {
        return graduationDate;
    }

    public void setGraduationDate(Date graduationDate) {
        this.graduationDate = graduationDate;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel == null ? null : tel.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public String getPostalAddress() {
        return postalAddress;
    }

    public void setPostalAddress(String postalAddress) {
        this.postalAddress = postalAddress == null ? null : postalAddress.trim();
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code == null ? null : code.trim();
    }

    public String getQq() {
        return qq;
    }

    public void setQq(String qq) {
        this.qq = qq == null ? null : qq.trim();
    }

    public String getXyzsNum() {
        return xyzsNum;
    }

    public void setXyzsNum(String xyzsNum) {
        this.xyzsNum = xyzsNum == null ? null : xyzsNum.trim();
    }

    public String getGwzsNum() {
        return gwzsNum;
    }

    public void setGwzsNum(String gwzsNum) {
        this.gwzsNum = gwzsNum == null ? null : gwzsNum.trim();
    }

    public String getCkkqAddress() {
        return ckkqAddress;
    }

    public void setCkkqAddress(String ckkqAddress) {
        this.ckkqAddress = ckkqAddress == null ? null : ckkqAddress.trim();
    }

    public String getKqAddress() {
        return kqAddress;
    }

    public void setKqAddress(String kqAddress) {
        this.kqAddress = kqAddress == null ? null : kqAddress.trim();
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

	public String getBirthday1() {
		return birthday1;
	}

	public void setBirthday1(String birthday1) {
		this.birthday1 = birthday1;
	}

	public String getGraduationDate1() {
		return graduationDate1;
	}

	public void setGraduationDate1(String graduationDate1) {
		this.graduationDate1 = graduationDate1;
	}

	public String getSourceType() {
		return sourceType;
	}

	public void setSourceType(String sourceType) {
		this.sourceType = sourceType;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public String getIsPrint() {
		return isPrint;
	}

	public void setIsPrint(String isPrint) {
		this.isPrint = isPrint;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getWorkTime() {
		return workTime;
	}

	public void setWorkTime(String workTime) {
		this.workTime = workTime;
	}

	public String getLastUid() {
		return lastUid;
	}

	public void setLastUid(String lastUid) {
		this.lastUid = lastUid;
	}

	public String getMz() {
		return mz;
	}

	public void setMz(String mz) {
		this.mz = mz;
	}

	public String getWxh() {
		return wxh;
	}

	public void setWxh(String wxh) {
		this.wxh = wxh;
	}

	public String getZylb() {
		return zylb;
	}

	public void setZylb(String zylb) {
		this.zylb = zylb;
	}

	public String getZslb() {
		return zslb;
	}

	public void setZslb(String zslb) {
		this.zslb = zslb;
	}

	public String getBkkm() {
		return bkkm;
	}

	public void setBkkm(String bkkm) {
		this.bkkm = bkkm;
	}

	public String getJgName() {
		return jgName;
	}

	public void setJgName(String jgName) {
		this.jgName = jgName;
	}

	public String getKsTz() {
		return ksTz;
	}

	public void setKsTz(String ksTz) {
		this.ksTz = ksTz;
	}

    
}