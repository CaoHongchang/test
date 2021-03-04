package com.i84.earnpoint.model;

import java.io.Serializable;
import java.util.Date;

import com.i84.earnpoint.common.SystemContant;

/**
 * 职业资格证书
 * @author Administrator
 *
 */
public class PersonProfessionCertificate extends Page implements Serializable{
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.id
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.given_date
     * 发证日期
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private String givenDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.major_type
     * 专业类别
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private String majorType;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.certificate_number
     * 证书编号
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private String certificateNumber;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.certificate_name
     * 证书名称
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private String certificateName;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.approval_department
     * 审批部门
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    private String approvalDepartment;
    /**
     * 身份证号码
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.pid
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    private Integer pid;
    private Date createDate;
    /**
     * 删除状态
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column person_profession_certificate.del_status
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    private String delStatus = SystemContant.STATUS_USABLE;
    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.id
     *
     * @return the value of person_profession_certificate.id
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.id
     *
     * @param id the value for person_profession_certificate.id
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.given_date
     *
     * @return the value of person_profession_certificate.given_date
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public String getGivenDate() {
        return givenDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.given_date
     *
     * @param givenDate the value for person_profession_certificate.given_date
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setGivenDate(String givenDate) {
        this.givenDate = givenDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.major_type
     *
     * @return the value of person_profession_certificate.major_type
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public String getMajorType() {
        return majorType;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.major_type
     *
     * @param majorType the value for person_profession_certificate.major_type
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setMajorType(String majorType) {
        this.majorType = majorType == null ? null : majorType.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.certificate_number
     *
     * @return the value of person_profession_certificate.certificate_number
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public String getCertificateNumber() {
        return certificateNumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.certificate_number
     *
     * @param certificateNumber the value for person_profession_certificate.certificate_number
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setCertificateNumber(String certificateNumber) {
        this.certificateNumber = certificateNumber;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.certificate_name
     *
     * @return the value of person_profession_certificate.certificate_name
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public String getCertificateName() {
        return certificateName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.certificate_name
     *
     * @param certificateName the value for person_profession_certificate.certificate_name
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setCertificateName(String certificateName) {
        this.certificateName = certificateName == null ? null : certificateName.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column person_profession_certificate.approval_department
     *
     * @return the value of person_profession_certificate.approval_department
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public String getApprovalDepartment() {
        return approvalDepartment;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column person_profession_certificate.approval_department
     *
     * @param approvalDepartment the value for person_profession_certificate.approval_department
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    public void setApprovalDepartment(String approvalDepartment) {
        this.approvalDepartment = approvalDepartment == null ? null : approvalDepartment.trim();
    }

	

	public Integer getPid() {
		return pid;
	}

	public void setPid(Integer pid) {
		this.pid = pid;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}

	public String getDelStatus() {
		return delStatus;
	}

	public void setDelStatus(String delStatus) {
		this.delStatus = delStatus;
	}
    
    
}