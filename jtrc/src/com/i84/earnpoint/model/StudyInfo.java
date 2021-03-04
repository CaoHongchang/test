package com.i84.earnpoint.model;

import java.util.Date;

public class StudyInfo  extends Page{

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.id
	 * @mbggenerated
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.uid
	 * @mbggenerated
	 */
	private Integer uid;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.study_type_id
	 * @mbggenerated
	 */
	private String studyTypeId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.school_name
	 * @mbggenerated
	 */
	private String schoolName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.in_date
	 * @mbggenerated
	 */
	private Date inDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.graduation_date
	 * @mbggenerated
	 */
	private Date graduationDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.education
	 * @mbggenerated
	 */
	private String education;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.degree
	 * @mbggenerated
	 */
	private String degree;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.certificate
	 * @mbggenerated
	 */
	private String certificate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.del_date
	 * @mbggenerated
	 */
	private Date delDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.pro_name
	 * @mbggenerated
	 */
	private String proName;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.xz
	 * @mbggenerated
	 */
	private String xz;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.get_method
	 * @mbggenerated
	 */
	private String getMethod;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.activity_id
	 * @mbggenerated
	 */
	private Integer activityId;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.add_date
	 * @mbggenerated
	 */
	private Date addDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column study_info.pid
	 * @mbggenerated
	 */
	private Integer pid;
	
	
	private String major;
	
	
	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.id
	 * @return  the value of study_info.id
	 * @mbggenerated
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.id
	 * @param id  the value for study_info.id
	 * @mbggenerated
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	public String getMajor() {
		return major;
	}

	public void setMajor(String major) {
		this.major = major;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.uid
	 * @return  the value of study_info.uid
	 * @mbggenerated
	 */
	public Integer getUid() {
		return uid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.uid
	 * @param uid  the value for study_info.uid
	 * @mbggenerated
	 */
	public void setUid(Integer uid) {
		this.uid = uid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.study_type_id
	 * @return  the value of study_info.study_type_id
	 * @mbggenerated
	 */
	public String getStudyTypeId() {
		return studyTypeId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.study_type_id
	 * @param studyTypeId  the value for study_info.study_type_id
	 * @mbggenerated
	 */
	public void setStudyTypeId(String studyTypeId) {
		this.studyTypeId = studyTypeId == null ? null : studyTypeId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.school_name
	 * @return  the value of study_info.school_name
	 * @mbggenerated
	 */
	public String getSchoolName() {
		return schoolName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.school_name
	 * @param schoolName  the value for study_info.school_name
	 * @mbggenerated
	 */
	public void setSchoolName(String schoolName) {
		this.schoolName = schoolName == null ? null : schoolName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.in_date
	 * @return  the value of study_info.in_date
	 * @mbggenerated
	 */
	public Date getInDate() {
		return inDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.in_date
	 * @param inDate  the value for study_info.in_date
	 * @mbggenerated
	 */
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.graduation_date
	 * @return  the value of study_info.graduation_date
	 * @mbggenerated
	 */
	public Date getGraduationDate() {
		return graduationDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.graduation_date
	 * @param graduationDate  the value for study_info.graduation_date
	 * @mbggenerated
	 */
	public void setGraduationDate(Date graduationDate) {
		this.graduationDate = graduationDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.education
	 * @return  the value of study_info.education
	 * @mbggenerated
	 */
	public String getEducation() {
		return education;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.education
	 * @param education  the value for study_info.education
	 * @mbggenerated
	 */
	public void setEducation(String education) {
		this.education = education == null ? null : education.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.degree
	 * @return  the value of study_info.degree
	 * @mbggenerated
	 */
	public String getDegree() {
		return degree;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.degree
	 * @param degree  the value for study_info.degree
	 * @mbggenerated
	 */
	public void setDegree(String degree) {
		this.degree = degree == null ? null : degree.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.certificate
	 * @return  the value of study_info.certificate
	 * @mbggenerated
	 */
	public String getCertificate() {
		return certificate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.certificate
	 * @param certificate  the value for study_info.certificate
	 * @mbggenerated
	 */
	public void setCertificate(String certificate) {
		this.certificate = certificate == null ? null : certificate.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.del_date
	 * @return  the value of study_info.del_date
	 * @mbggenerated
	 */
	public Date getDelDate() {
		return delDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.del_date
	 * @param delDate  the value for study_info.del_date
	 * @mbggenerated
	 */
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.pro_name
	 * @return  the value of study_info.pro_name
	 * @mbggenerated
	 */
	public String getProName() {
		return proName;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.pro_name
	 * @param proName  the value for study_info.pro_name
	 * @mbggenerated
	 */
	public void setProName(String proName) {
		this.proName = proName == null ? null : proName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.xz
	 * @return  the value of study_info.xz
	 * @mbggenerated
	 */
	public String getXz() {
		return xz;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.xz
	 * @param xz  the value for study_info.xz
	 * @mbggenerated
	 */
	public void setXz(String xz) {
		this.xz = xz == null ? null : xz.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.get_method
	 * @return  the value of study_info.get_method
	 * @mbggenerated
	 */
	public String getGetMethod() {
		return getMethod;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.get_method
	 * @param getMethod  the value for study_info.get_method
	 * @mbggenerated
	 */
	public void setGetMethod(String getMethod) {
		this.getMethod = getMethod == null ? null : getMethod.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.activity_id
	 * @return  the value of study_info.activity_id
	 * @mbggenerated
	 */
	public Integer getActivityId() {
		return activityId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.activity_id
	 * @param activityId  the value for study_info.activity_id
	 * @mbggenerated
	 */
	public void setActivityId(Integer activityId) {
		this.activityId = activityId;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.add_date
	 * @return  the value of study_info.add_date
	 * @mbggenerated
	 */
	public Date getAddDate() {
		return addDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.add_date
	 * @param addDate  the value for study_info.add_date
	 * @mbggenerated
	 */
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column study_info.pid
	 * @return  the value of study_info.pid
	 * @mbggenerated
	 */
	public Integer getPid() {
		if(pid==null)
			return 0;
		return pid;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column study_info.pid
	 * @param pid  the value for study_info.pid
	 * @mbggenerated
	 */
	public void setPid(Integer pid) {
		this.pid = pid;
	}

	private String graduationDate1;
	public String getGraduationDate1() {
		return graduationDate1;
	}

	public void setGraduationDate1(String graduationDate1) {
		this.graduationDate1 = graduationDate1;
	}
	
}