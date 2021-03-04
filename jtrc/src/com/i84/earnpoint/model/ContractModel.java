package com.i84.earnpoint.model;

import java.util.Date;

/**
 * 安全生产咨询合同模板表
 * @author zhengqr
 *
 */
public class ContractModel {
    private Integer id;

    private String name;

    private String path;

    private Date addDate;

    private String mid;
    
    private Date delDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}
 
    
}