package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**专业技术职务任职资格证书备案
 * @author liu_quan
 *
 */
public class ZyImportVo {
	@ExcelAnnotation(exportName="活动编码")
	private String businessId;
	@ExcelAnnotation(exportName="身份证")
	private String pnum;
	@ExcelAnnotation(exportName="级别")
	private String level;
	@ExcelAnnotation(exportName="资格名称")
	private String qualificationName;
	@ExcelAnnotation(exportName="证书编号")
	private String zno;
	@ExcelAnnotation(exportName="专业")
	private String pro;
	@ExcelAnnotation(exportName="审批部门")
	private String spart;
	@ExcelAnnotation(exportName="审批时间")
	private String sdate;
	@ExcelAnnotation(exportName="批准文号")
	private String pzno;
	@ExcelAnnotation(exportName="是否领取")
	private String isget;
	
	/**用户姓名*/
	private String xm;
	/**关联的用户id*/
	private String uid;
	/**活动id*/
	private String activityId;
	
	 /**错误提示*/
    private String cwts;
    /**id*/
    private String id;
    
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getLevel() {
		return level;
	}
	public void setLevel(String level) {
		this.level = level;
	}
	public String getQualificationName() {
		return qualificationName;
	}
	public void setQualificationName(String qualificationName) {
		this.qualificationName = qualificationName;
	}

	public String getZno() {
		return zno;
	}
	public void setZno(String zno) {
		this.zno = zno;
	}
	public String getPro() {
		return pro;
	}
	public void setPro(String pro) {
		this.pro = pro;
	}
	
	
	public String getSpart() {
		return spart;
	}
	public void setSpart(String spart) {
		this.spart = spart;
	}
	public String getSdate() {
		return sdate;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public String getPzno() {
		return pzno;
	}
	public void setPzno(String pzno) {
		this.pzno = pzno;
	}
	public String getIsget() {
		return isget;
	}
	public void setIsget(String isget) {
		this.isget = isget;
	}
	public String getCwts() {
		return cwts;
	}
	public void setCwts(String cwts) {
		this.cwts = cwts;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getUid() {
		return uid;
	}
	public void setUid(String uid) {
		this.uid = uid;
	}
	public String getActivityId() {
		return activityId;
	}
	public void setActivityId(String activityId) {
		this.activityId = activityId;
	}
   
}
