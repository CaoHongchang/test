package com.i84.earnpoint.model;

public class Power {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column power.power_id
     *
     * @mbggenerated
     */
    private Integer powerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column power.parent_power_id
     *
     * @mbggenerated
     */
    private Integer parentPowerId;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column power.name
     *
     * @mbggenerated
     */
    private String name;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column power.state
     *
     * @mbggenerated
     */
    private String state;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column power.comments
     *
     * @mbggenerated
     */
    private String comments;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column power.power_id
     *
     * @return the value of power.power_id
     *
     * @mbggenerated
     */
    public Integer getPowerId() {
        return powerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column power.power_id
     *
     * @param powerId the value for power.power_id
     *
     * @mbggenerated
     */
    public void setPowerId(Integer powerId) {
        this.powerId = powerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column power.parent_power_id
     *
     * @return the value of power.parent_power_id
     *
     * @mbggenerated
     */
    public Integer getParentPowerId() {
        return parentPowerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column power.parent_power_id
     *
     * @param parentPowerId the value for power.parent_power_id
     *
     * @mbggenerated
     */
    public void setParentPowerId(Integer parentPowerId) {
        this.parentPowerId = parentPowerId;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column power.name
     *
     * @return the value of power.name
     *
     * @mbggenerated
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column power.name
     *
     * @param name the value for power.name
     *
     * @mbggenerated
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column power.state
     *
     * @return the value of power.state
     *
     * @mbggenerated
     */
    public String getState() {
        return state;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column power.state
     *
     * @param state the value for power.state
     *
     * @mbggenerated
     */
    public void setState(String state) {
        this.state = state == null ? null : state.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column power.comments
     *
     * @return the value of power.comments
     *
     * @mbggenerated
     */
    public String getComments() {
        return comments;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column power.comments
     *
     * @param comments the value for power.comments
     *
     * @mbggenerated
     */
    public void setComments(String comments) {
        this.comments = comments == null ? null : comments.trim();
    }
}