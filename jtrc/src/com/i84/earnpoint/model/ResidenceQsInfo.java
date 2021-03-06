package com.i84.earnpoint.model;

public class ResidenceQsInfo {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.id
     *
     * @mbggenerated
     */
    private Integer id;
    private Integer uid;//
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.d_id
     *
     * @mbggenerated
     */
    private Integer dId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.d_no
     *
     * @mbggenerated
     */
    private String dNo;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.m1
     *
     * @mbggenerated
     */
    private String m1;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.m2
     *
     * @mbggenerated
     */
    private String m2;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.m3
     *
     * @mbggenerated
     */
    private String m3;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column residence_qs_info.remark
     *
     * @mbggenerated
     */
    private String remark;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.id
     *
     * @return the value of residence_qs_info.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.id
     *
     * @param id the value for residence_qs_info.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.d_id
     *
     * @return the value of residence_qs_info.d_id
     *
     * @mbggenerated
     */
    public Integer getdId() {
        return dId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.d_id
     *
     * @param dId the value for residence_qs_info.d_id
     *
     * @mbggenerated
     */
    public void setdId(Integer dId) {
        this.dId = dId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.d_no
     *
     * @return the value of residence_qs_info.d_no
     *
     * @mbggenerated
     */
    public String getdNo() {
        return dNo;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.d_no
     *
     * @param dNo the value for residence_qs_info.d_no
     *
     * @mbggenerated
     */
    public void setdNo(String dNo) {
        this.dNo = dNo == null ? null : dNo.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.m1
     *
     * @return the value of residence_qs_info.m1
     *
     * @mbggenerated
     */
    public String getM1() {
        return m1;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.m1
     *
     * @param m1 the value for residence_qs_info.m1
     *
     * @mbggenerated
     */
    public void setM1(String m1) {
        this.m1 = m1 == null ? null : m1.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.m2
     *
     * @return the value of residence_qs_info.m2
     *
     * @mbggenerated
     */
    public String getM2() {
        return m2;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.m2
     *
     * @param m2 the value for residence_qs_info.m2
     *
     * @mbggenerated
     */
    public void setM2(String m2) {
        this.m2 = m2 == null ? null : m2.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.m3
     *
     * @return the value of residence_qs_info.m3
     *
     * @mbggenerated
     */
    public String getM3() {
        return m3;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.m3
     *
     * @param m3 the value for residence_qs_info.m3
     *
     * @mbggenerated
     */
    public void setM3(String m3) {
        this.m3 = m3 == null ? null : m3.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column residence_qs_info.remark
     *
     * @return the value of residence_qs_info.remark
     *
     * @mbggenerated
     */
    public String getRemark() {
        return remark;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column residence_qs_info.remark
     *
     * @param remark the value for residence_qs_info.remark
     *
     * @mbggenerated
     */
    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

	public Integer getUid() {
		return uid;
	}

	public void setUid(Integer uid) {
		this.uid = uid;
	}
    
}