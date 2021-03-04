package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

public class ImpEnterpriseInfo {
	@ExcelAnnotation(exportName="主企业")
    private String mainOrgName;
	@ExcelAnnotation(exportName="企业代码")
	 private String enterpriseCode;
	@ExcelAnnotation(exportName="管理类型")
	 private String manageType;
	@ExcelAnnotation(exportName="是否签约企业")
	 private String isSignOrg;
	@ExcelAnnotation(exportName="组织机构代码")
	 private String orgCode;
	@ExcelAnnotation(exportName="单位名称")
	 private String orgName;
	@ExcelAnnotation(exportName="企业性质")
	 private String orgNature;
	@ExcelAnnotation(exportName="法人代表")
	 private String legalPerson;
	@ExcelAnnotation(exportName="单位所在行政区划")
	 private String orgArea;
	@ExcelAnnotation(exportName="填报单位类型")
	 private String orgType;
	@ExcelAnnotation(exportName="层次")
	 private String orgLevel;
	@ExcelAnnotation(exportName="机构类型")
	 private String type;
	@ExcelAnnotation(exportName="注册经济类型")
	 private String registerType;
	@ExcelAnnotation(exportName="单位主管业务区域")
	 private String businessArea;
	@ExcelAnnotation(exportName="联系电话")
	 private String phone;
	@ExcelAnnotation(exportName="邮箱号码")
	 private String email;
	@ExcelAnnotation(exportName="上级单位报出日期")
	 private String sendTime;
	@ExcelAnnotation(exportName="上级单位类型")
	 private String parentOrgType;
	@ExcelAnnotation(exportName="上级单位代码")
	 private String parentOrgCode;
	@ExcelAnnotation(exportName="上级单位名称")
	 private String parentOrgName;
	@ExcelAnnotation(exportName="上级单位负责人")
	 private String parentOrgLeader;
	@ExcelAnnotation(exportName="上级单位电话")
	 private String parentOrgPhone;
	
	private int id;
    private String cwts;

	public String getMainOrgName() {
		return mainOrgName;
	}
	public void setMainOrgName(String mainOrgName) {
		this.mainOrgName = mainOrgName;
	}
	public String getEnterpriseCode() {
		return enterpriseCode;
	}
	public void setEnterpriseCode(String enterpriseCode) {
		this.enterpriseCode = enterpriseCode;
	}
	public String getManageType() {
		return manageType;
	}
	public void setManageType(String manageType) {
		this.manageType = manageType;
	}
	public String getIsSignOrg() {
		return isSignOrg;
	}
	public void setIsSignOrg(String isSignOrg) {
		this.isSignOrg = isSignOrg;
	}
	public String getOrgCode() {
		return orgCode;
	}
	public void setOrgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getOrgName() {
		return orgName;
	}
	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}
	public String getOrgNature() {
		return orgNature;
	}
	public void setOrgNature(String orgNature) {
		this.orgNature = orgNature;
	}
	public String getLegalPerson() {
		return legalPerson;
	}
	public void setLegalPerson(String legalPerson) {
		this.legalPerson = legalPerson;
	}
	public String getOrgArea() {
		return orgArea;
	}
	public void setOrgArea(String orgArea) {
		this.orgArea = orgArea;
	}
	public String getOrgType() {
		return orgType;
	}
	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}
	public String getOrgLevel() {
		return orgLevel;
	}
	public void setOrgLevel(String orgLevel) {
		this.orgLevel = orgLevel;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getRegisterType() {
		return registerType;
	}
	public void setRegisterType(String registerType) {
		this.registerType = registerType;
	}
	public String getBusinessArea() {
		return businessArea;
	}
	public void setBusinessArea(String businessArea) {
		this.businessArea = businessArea;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSendTime() {
		return sendTime;
	}
	public void setSendTime(String sendTime) {
		this.sendTime = sendTime;
	}
	public String getParentOrgType() {
		return parentOrgType;
	}
	public void setParentOrgType(String parentOrgType) {
		this.parentOrgType = parentOrgType;
	}
	public String getParentOrgCode() {
		return parentOrgCode;
	}
	public void setParentOrgCode(String parentOrgCode) {
		this.parentOrgCode = parentOrgCode;
	}
	public String getParentOrgName() {
		return parentOrgName;
	}
	public void setParentOrgName(String parentOrgName) {
		this.parentOrgName = parentOrgName;
	}
	public String getParentOrgLeader() {
		return parentOrgLeader;
	}
	public void setParentOrgLeader(String parentOrgLeader) {
		this.parentOrgLeader = parentOrgLeader;
	}
	public String getParentOrgPhone() {
		return parentOrgPhone;
	}
	public void setParentOrgPhone(String parentOrgPhone) {
		this.parentOrgPhone = parentOrgPhone;
	}
	public String getCwts() {
		return cwts;
	}
	public void setCwts(String cwts) {
		this.cwts = cwts;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	

	
}
