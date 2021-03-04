package com.i84.earnpoint.model;

import java.util.Date;

/**
 * 安全生产咨询材料表
 * @author zhengqr
 *
 */
public class SafetyProductionConsultMaterial {
    private Integer id;

    private Integer safeId;

    private String name;

    private String path;

    private Date addDate;
    
    private Date delDate;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getSafeId() {
		return safeId;
	}

	public void setSafeId(Integer safeId) {
		this.safeId = safeId;
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

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

    
}