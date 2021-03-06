package com.i84.earnpoint.model;

import java.util.Date;

public class BusinessInfo {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.id
	 * @mbggenerated
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.pno
	 * @mbggenerated
	 */
	private String pno;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.name
	 * @mbggenerated
	 */
	private String name;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.type_id
	 * @mbggenerated
	 */
	private Integer typeId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.obj_id
	 * @mbggenerated
	 */
	private String objId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.remark
	 * @mbggenerated
	 */
	private String remark;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column business_info.del_date
	 * @mbggenerated
	 */
	private Date delDate;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.id
	 * @return  the value of business_info.id
	 * @mbggenerated
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.id
	 * @param id  the value for business_info.id
	 * @mbggenerated
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.pno
	 * @return  the value of business_info.pno
	 * @mbggenerated
	 */
	public String getPno() {
		return pno;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.pno
	 * @param pno  the value for business_info.pno
	 * @mbggenerated
	 */
	public void setPno(String pno) {
		this.pno = pno == null ? null : pno.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.name
	 * @return  the value of business_info.name
	 * @mbggenerated
	 */
	public String getName() {
		return name;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.name
	 * @param name  the value for business_info.name
	 * @mbggenerated
	 */
	public void setName(String name) {
		this.name = name == null ? null : name.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.type_id
	 * @return  the value of business_info.type_id
	 * @mbggenerated
	 */
	public Integer getTypeId() {
		return typeId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.type_id
	 * @param typeId  the value for business_info.type_id
	 * @mbggenerated
	 */
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.obj_id
	 * @return  the value of business_info.obj_id
	 * @mbggenerated
	 */
	public String getObjId() {
		return objId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.obj_id
	 * @param objId  the value for business_info.obj_id
	 * @mbggenerated
	 */
	public void setObjId(String objId) {
		this.objId = objId == null ? null : objId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.remark
	 * @return  the value of business_info.remark
	 * @mbggenerated
	 */
	public String getRemark() {
		return remark;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.remark
	 * @param remark  the value for business_info.remark
	 * @mbggenerated
	 */
	public void setRemark(String remark) {
		this.remark = remark == null ? null : remark.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column business_info.del_date
	 * @return  the value of business_info.del_date
	 * @mbggenerated
	 */
	public Date getDelDate() {
		return delDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column business_info.del_date
	 * @param delDate  the value for business_info.del_date
	 * @mbggenerated
	 */
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
}