package com.i84.earnpoint.model;

import java.util.Date;

public class AqscBmInfo {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.enterprise_id
     *
     * @mbggenerated
     */
    private Integer enterpriseId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.bm_date
     *
     * @mbggenerated
     */
    private Date bmDate;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.bm_state
     *
     * @mbggenerated
     */
    private String bmState;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column aqsc_bm_info.ht_state
     *
     * @mbggenerated
     */
    private String htState;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.id
     *
     * @return the value of aqsc_bm_info.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.id
     *
     * @param id the value for aqsc_bm_info.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.enterprise_id
     *
     * @return the value of aqsc_bm_info.enterprise_id
     *
     * @mbggenerated
     */
    public Integer getEnterpriseId() {
        return enterpriseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.enterprise_id
     *
     * @param enterpriseId the value for aqsc_bm_info.enterprise_id
     *
     * @mbggenerated
     */
    public void setEnterpriseId(Integer enterpriseId) {
        this.enterpriseId = enterpriseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.bm_date
     *
     * @return the value of aqsc_bm_info.bm_date
     *
     * @mbggenerated
     */
    public Date getBmDate() {
        return bmDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.bm_date
     *
     * @param bmDate the value for aqsc_bm_info.bm_date
     *
     * @mbggenerated
     */
    public void setBmDate(Date bmDate) {
        this.bmDate = bmDate;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.name
     *
     * @return the value of aqsc_bm_info.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.name
     *
     * @param name the value for aqsc_bm_info.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.bm_state
     *
     * @return the value of aqsc_bm_info.bm_state
     *
     * @mbggenerated
     */
    public String getBmState() {
        return bmState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.bm_state
     *
     * @param bmState the value for aqsc_bm_info.bm_state
     *
     * @mbggenerated
     */
    public void setBmState(String bmState) {
        this.bmState = bmState == null ? null : bmState.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column aqsc_bm_info.ht_state
     *
     * @return the value of aqsc_bm_info.ht_state
     *
     * @mbggenerated
     */
    public String getHtState() {
        return htState;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column aqsc_bm_info.ht_state
     *
     * @param htState the value for aqsc_bm_info.ht_state
     *
     * @mbggenerated
     */
    public void setHtState(String htState) {
        this.htState = htState == null ? null : htState.trim();
    }
}