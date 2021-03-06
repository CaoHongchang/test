package com.i84.earnpoint.model;

public class BgDepartmentInfo {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.id
     *
     * @mbggenerated
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.bg_enterprise_id
     *
     * @mbggenerated
     */
    private Integer bgEnterpriseId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.dno
     *
     * @mbggenerated
     */
    private String dno;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.is_start
     *
     * @mbggenerated
     */
    private String isStart;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column bg_department_info.department_name
     *
     * @mbggenerated
     */
    private String departmentName;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.id
     *
     * @return the value of bg_department_info.id
     *
     * @mbggenerated
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.id
     *
     * @param id the value for bg_department_info.id
     *
     * @mbggenerated
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.bg_enterprise_id
     *
     * @return the value of bg_department_info.bg_enterprise_id
     *
     * @mbggenerated
     */
    public Integer getBgEnterpriseId() {
        return bgEnterpriseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.bg_enterprise_id
     *
     * @param bgEnterpriseId the value for bg_department_info.bg_enterprise_id
     *
     * @mbggenerated
     */
    public void setBgEnterpriseId(Integer bgEnterpriseId) {
        this.bgEnterpriseId = bgEnterpriseId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.name
     *
     * @return the value of bg_department_info.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.name
     *
     * @param name the value for bg_department_info.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.dno
     *
     * @return the value of bg_department_info.dno
     *
     * @mbggenerated
     */
    public String getDno() {
        return dno;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.dno
     *
     * @param dno the value for bg_department_info.dno
     *
     * @mbggenerated
     */
    public void setDno(String dno) {
        this.dno = dno == null ? null : dno.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.is_start
     *
     * @return the value of bg_department_info.is_start
     *
     * @mbggenerated
     */
    public String getIsStart() {
        return isStart;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.is_start
     *
     * @param isStart the value for bg_department_info.is_start
     *
     * @mbggenerated
     */
    public void setIsStart(String isStart) {
        this.isStart = isStart == null ? null : isStart.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column bg_department_info.department_name
     *
     * @return the value of bg_department_info.department_name
     *
     * @mbggenerated
     */
    public String getDepartmentName() {
        return departmentName;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column bg_department_info.department_name
     *
     * @param departmentName the value for bg_department_info.department_name
     *
     * @mbggenerated
     */
    public void setDepartmentName(String departmentName) {
        this.departmentName = departmentName == null ? null : departmentName.trim();
    }
}