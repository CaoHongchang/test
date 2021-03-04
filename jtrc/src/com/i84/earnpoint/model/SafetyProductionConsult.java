package com.i84.earnpoint.model;

import java.util.Date;

/**
 * 安全生产咨询表
 * @author zhengqr
 *
 */
public class SafetyProductionConsult {
    private Integer id;

    private Integer enterpriseId;

    private Integer type;

    private Integer checkState;
    
    private String checkRemark;

    private Integer contractState;

    private Date addDate;

    private String contractPath;
    
    private String contractName;

    private Integer trainState;
    
    private String trainRemark;

    private String trainMsg;

    private Integer checkCount;
    
    private Date delDate;
    
    private Integer trainCheckState;
    
    private String lastCheckRemark;
    
    private Date lastCheckDate;
    
    private Integer lastCheckState;
    
    private Integer lastCheckId;
    
    private String ids;
    
    private Date checkDate;
    
    private Date contractDate;

    private Date trainAddDate;
    
    private Date trainDate;
    
    private Date trainCheckDate;

    private Date lastCheckAddDate;
    
    private String pno;

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getLastCheckId() {
		return lastCheckId;
	}

	public void setLastCheckId(Integer lastCheckId) {
		this.lastCheckId = lastCheckId;
	}

	public Integer getEnterpriseId() {
		return enterpriseId;
	}

	public String getCheckRemark() {
		return checkRemark;
	}

	public void setCheckRemark(String checkRemark) {
		this.checkRemark = checkRemark;
	}

	public void setEnterpriseId(Integer enterpriseId) {
		this.enterpriseId = enterpriseId;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getCheckState() {
		return checkState;
	}

	public void setCheckState(Integer checkState) {
		this.checkState = checkState;
	}

	public String getIds() {
		return ids;
	}

	public void setIds(String ids) {
		this.ids = ids;
	}

	public Integer getContractState() {
		return contractState;
	}

	public void setContractState(Integer contractState) {
		this.contractState = contractState;
	}

	public String getLastCheckRemark() {
		return lastCheckRemark;
	}

	public void setLastCheckRemark(String lastCheckRemark) {
		this.lastCheckRemark = lastCheckRemark;
	}

	public Date getLastCheckDate() {
		return lastCheckDate;
	}

	public void setLastCheckDate(Date lastCheckDate) {
		this.lastCheckDate = lastCheckDate;
	}

	public Integer getLastCheckState() {
		return lastCheckState;
	}

	public void setLastCheckState(Integer lastCheckState) {
		this.lastCheckState = lastCheckState;
	}

	public Date getAddDate() {
		return addDate;
	}

	public void setAddDate(Date addDate) {
		this.addDate = addDate;
	}

	public String getContractPath() {
		return contractPath;
	}

	public void setContractPath(String contractPath) {
		this.contractPath = contractPath;
	}

	public String getContractName() {
		return contractName;
	}

	public void setContractName(String contractName) {
		this.contractName = contractName;
	}

	public String getTrainRemark() {
		return trainRemark;
	}

	public void setTrainRemark(String trainRemark) {
		this.trainRemark = trainRemark;
	}

	public String getTrainMsg() {
		return trainMsg;
	}

	public void setTrainMsg(String trainMsg) {
		this.trainMsg = trainMsg;
	}

	public Integer getTrainState() {
		return trainState;
	}

	public void setTrainState(Integer trainState) {
		this.trainState = trainState;
	}

	public Integer getCheckCount() {
		return checkCount;
	}

	public void setCheckCount(Integer checkCount) {
		this.checkCount = checkCount;
	}

	public Integer getTrainCheckState() {
		return trainCheckState;
	}

	public void setTrainCheckState(Integer trainCheckState) {
		this.trainCheckState = trainCheckState;
	}

	public Date getCheckDate() {
		return checkDate;
	}

	public void setCheckDate(Date checkDate) {
		this.checkDate = checkDate;
	}

	public Date getContractDate() {
		return contractDate;
	}

	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}

	public Date getTrainAddDate() {
		return trainAddDate;
	}

	public void setTrainAddDate(Date trainAddDate) {
		this.trainAddDate = trainAddDate;
	}

	public Date getTrainDate() {
		return trainDate;
	}

	public void setTrainDate(Date trainDate) {
		this.trainDate = trainDate;
	}

	public Date getTrainCheckDate() {
		return trainCheckDate;
	}

	public void setTrainCheckDate(Date trainCheckDate) {
		this.trainCheckDate = trainCheckDate;
	}

	public Date getLastCheckAddDate() {
		return lastCheckAddDate;
	}

	public void setLastCheckAddDate(Date lastCheckAddDate) {
		this.lastCheckAddDate = lastCheckAddDate;
	}

	public String getPno() {
		return pno;
	}

	public void setPno(String pno) {
		this.pno = pno;
	}

    
    
}