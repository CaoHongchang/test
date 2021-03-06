package com.i84.earnpoint.model;

import java.util.Date;

public class UserPartyOut {

	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.id
	 * @mbggenerated
	 */
	private Integer id;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.party
	 * @mbggenerated
	 */
	private Integer party;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.in_date
	 * @mbggenerated
	 */
	private Date inDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.zpno
	 * @mbggenerated
	 */
	private String zpno;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.in_place
	 * @mbggenerated
	 */
	private String inPlace;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.staff
	 * @mbggenerated
	 */
	private Integer staff;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.add_date
	 * @mbggenerated
	 */
	private Date addDate;
	/**
	 * This field was generated by MyBatis Generator. This field corresponds to the database column user_party_out.del_date
	 * @mbggenerated
	 */
	private Date delDate;

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.id
	 * @return  the value of user_party_out.id
	 * @mbggenerated
	 */
	public Integer getId() {
		return id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.id
	 * @param id  the value for user_party_out.id
	 * @mbggenerated
	 */
	public void setId(Integer id) {
		this.id = id;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.party
	 * @return  the value of user_party_out.party
	 * @mbggenerated
	 */
	public Integer getParty() {
		return party;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.party
	 * @param party  the value for user_party_out.party
	 * @mbggenerated
	 */
	public void setParty(Integer party) {
		this.party = party;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.in_date
	 * @return  the value of user_party_out.in_date
	 * @mbggenerated
	 */
	public Date getInDate() {
		return inDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.in_date
	 * @param inDate  the value for user_party_out.in_date
	 * @mbggenerated
	 */
	public void setInDate(Date inDate) {
		this.inDate = inDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.zpno
	 * @return  the value of user_party_out.zpno
	 * @mbggenerated
	 */
	public String getZpno() {
		return zpno;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.zpno
	 * @param zpno  the value for user_party_out.zpno
	 * @mbggenerated
	 */
	public void setZpno(String zpno) {
		this.zpno = zpno == null ? null : zpno.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.in_place
	 * @return  the value of user_party_out.in_place
	 * @mbggenerated
	 */
	public String getInPlace() {
		return inPlace;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.in_place
	 * @param inPlace  the value for user_party_out.in_place
	 * @mbggenerated
	 */
	public void setInPlace(String inPlace) {
		this.inPlace = inPlace == null ? null : inPlace.trim();
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.staff
	 * @return  the value of user_party_out.staff
	 * @mbggenerated
	 */
	public Integer getStaff() {
		return staff;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.staff
	 * @param staff  the value for user_party_out.staff
	 * @mbggenerated
	 */
	public void setStaff(Integer staff) {
		this.staff = staff;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.add_date
	 * @return  the value of user_party_out.add_date
	 * @mbggenerated
	 */
	public Date getAddDate() {
		return addDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.add_date
	 * @param addDate  the value for user_party_out.add_date
	 * @mbggenerated
	 */
	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method returns the value of the database column user_party_out.del_date
	 * @return  the value of user_party_out.del_date
	 * @mbggenerated
	 */
	public Date getDelDate() {
		return delDate;
	}

	/**
	 * This method was generated by MyBatis Generator. This method sets the value of the database column user_party_out.del_date
	 * @param delDate  the value for user_party_out.del_date
	 * @mbggenerated
	 */
	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
}