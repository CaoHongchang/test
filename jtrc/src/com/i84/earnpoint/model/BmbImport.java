package com.i84.earnpoint.model;

import java.util.List;

import com.i84.earnpoint.common.excel.ExcelAnnotation;
import com.i84.earnpoint.model.Page;
/**
 * 报名表导入BEAN
 * @author Wangsc
 *
 */
public class BmbImport extends Page implements java.io.Serializable { 

	@ExcelAnnotation(exportName="班级编码")
	public String classId;
	
	@ExcelAnnotation(exportName="姓名")
	public String name;
	
	@ExcelAnnotation(exportName="身份证号")
	public String pnum;
	
	@ExcelAnnotation(exportName="性别")
	public String sex;
	
	@ExcelAnnotation(exportName="民族")
	public String mz;
	
	@ExcelAnnotation(exportName="党派")
	public String partyName;
	
	@ExcelAnnotation(exportName="工作单位")
	public String workName;
	
	@ExcelAnnotation(exportName="部门")
	public String bgDepartmentId;
	
	@ExcelAnnotation(exportName="职务")
	public String placeName;
	
	@ExcelAnnotation(exportName="专业技术职务")
	public String zyjs;
	
	@ExcelAnnotation(exportName="出生年月")
	public String brith;
	
	@ExcelAnnotation(exportName="所属地区")
	public String domicilePlace;
	
	@ExcelAnnotation(exportName="文化程度")
	public String degree;
	
	@ExcelAnnotation(exportName="电话")
	public String tel;
	
	@ExcelAnnotation(exportName="备注")
	public String remark;
	
	public String userId;//用户id
	
	public String id;//用户表的主键id
	public String isState;//状态
	public String bName;//班级名称
	public String rs;//审核意见
	public String cj;//成绩
	public String xs;//学时
	public String errMsg;//学时
	public String pwd;//密码
	public String getTechnical() {
		return technical;
	}
	public void setTechnical(String technical) {
		this.technical = technical;
	}
	public String technical;//专业技术职务
	
	public String getClassId() {
		return classId;
	}
	public void setClassId(String classId) {
		this.classId = classId;
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
	public String getMz() {
		return mz;
	}
	public void setMz(String mz) {
		this.mz = mz;
	}
	public String getPartyName() {
		return partyName;
	}
	public void setPartyName(String partyName) {
		this.partyName = partyName;
	}
	public String getWorkName() {
		return workName;
	}
	public void setWorkName(String workName) {
		this.workName = workName;
	}
	public String getBgDepartmentId() {
		return bgDepartmentId;
	}
	public void setBgDepartmentId(String bgDepartmentId) {
		this.bgDepartmentId = bgDepartmentId;
	}
	public String getPlaceName() {
		return placeName;
	}
	public void setPlaceName(String placeName) {
		this.placeName = placeName;
	}
	public String getBrith() {
		return brith;
	}
	public void setBrith(String brith) {
		this.brith = brith;
	}
	public String getDomicilePlace() {
		return domicilePlace;
	}
	public void setDomicilePlace(String domicilePlace) {
		this.domicilePlace = domicilePlace;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getIsState() {
		return isState;
	}
	public void setIsState(String isState) {
		this.isState = isState;
	}
	public String getbName() {
		return bName;
	}
	public void setbName(String bName) {
		this.bName = bName;
	}
	public String getRs() {
		return rs;
	}
	public void setRs(String rs) {
		this.rs = rs;
	}
	public String getCj() {
		return cj;
	}
	public void setCj(String cj) {
		this.cj = cj;
	}
	public String getXs() {
		return xs;
	}
	public void setXs(String xs) {
		this.xs = xs;
	}
	public String getErrMsg() {
		return errMsg;
	}
	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public String getZyjs() {
		return zyjs;
	}
	public void setZyjs(String zyjs) {
		this.zyjs = zyjs;
	}

}