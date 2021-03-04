package com.i84.earnpoint.model;

import java.util.Date;
import java.util.List;

import com.i84.earnpoint.model.Page;

public class RsBusinessInfo  extends Page{
    private Integer id;//主键

    private String pno;//受理编号

    private Integer businessId;//业务ID

    private Integer uid;//用户ID

    private String addDate;//发生时间

    private Integer sstate;//办理状态

    private String sDirect;//材料递送方向
    
    private String kpno;//快递单号
    
    private Integer parentId;//父ID
    
    private String userName;//用户名
    
    private String businessName;//业务名
    
    private String typeName;//业务类型名
    
    private String kDate;//快递递送时间
    
    private String kCompany;//快递公司
    
    private String remark;//其他说明
    
    private String sider;//审核意见
    
    private String pic1;//图片1
    
    private String pic2;//图片2
    
    private String pic3;//图片3
    
    private Integer typeId;//业务类型ID
    
    private String pnum;//身份证
    
    private String overTime;//办结时间
    
    private String beginTime;//查询开始时间
    
    private String endTime;//查询结束时间
    
    private String bjDate;//办结时间
    
	private String otherName;

	private Date delDate;
	
	private String tel;
	
	
	
	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

	public Integer getBusinessId() {
		return businessId;
	}

	public String getBjDate() {
		return bjDate;
	}

	public void setBjDate(String bjDate) {
		this.bjDate = bjDate;
	}

	public void setBusinessId(Integer businessId) {
		this.businessId = businessId;
	}

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}


	public String getAddDate() {
		return addDate;
	}

	public void setAddDate(String addDate) {
		this.addDate = addDate;
	}

	public Integer getSstate() {
		return sstate;
	}

	public void setSstate(Integer sstate) {
		this.sstate = sstate;
	}

	public String getsDirect() {
		return sDirect;
	}

	public void setsDirect(String sDirect) {
		this.sDirect = sDirect;
	}

	public String getKpno() {
		return kpno;
	}

	public void setKpno(String kpno) {
		this.kpno = kpno;
	}

	public Integer getParentId() {
		return parentId;
	}

	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBusinessName() {
		return businessName;
	}

	public void setBusinessName(String businessName) {
		this.businessName = businessName;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}


	public String getkDate() {
		return kDate;
	}

	public void setkDate(String kDate) {
		this.kDate = kDate;
	}

	public String getkCompany() {
		return kCompany;
	}

	public void setkCompany(String kCompany) {
		this.kCompany = kCompany;
	}

	public String getOverTime() {
		return overTime;
	}

	public void setOverTime(String overTime) {
		this.overTime = overTime;
	}

	public String getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(String beginTime) {
		this.beginTime = beginTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getSider() {
		return sider;
	}

	public void setSider(String sider) {
		this.sider = sider;
	}

	public String getPic1() {
		return pic1;
	}

	public void setPic1(String pic1) {
		this.pic1 = pic1;
	}

	public String getPic2() {
		return pic2;
	}

	public void setPic2(String pic2) {
		this.pic2 = pic2;
	}

	public String getPic3() {
		return pic3;
	}

	public void setPic3(String pic3) {
		this.pic3 = pic3;
	}

	public Integer getTypeId() {
		return typeId;
	}

	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	public String getPnum() {
		return pnum;
	}

	public void setPnum(String pnum) {
		this.pnum = pnum;
	}

	public String getOtherName() {
		return otherName;
	}

	public void setOtherName(String otherName) {
		this.otherName = otherName;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}


     
    
}