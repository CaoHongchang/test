package com.i84.earnpoint.aqsczxy.service;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.AqsczxInfoAuditMapper;
import com.i84.earnpoint.mapper.AqsczxInfoMapper;
import com.i84.earnpoint.model.AqsczxInfo;
import com.i84.earnpoint.model.AqsczxInfoAudit;

@Service
public class AqscbzhshService {
	
	@Autowired
	private AqsczxInfoMapper aqsczxInfoMapper; 
	
	@Autowired
	private AqsczxInfoAuditMapper aqsczxInfoAuditMapper;
	
	public List<AqsczxInfo> selectByParam(Map<String,Object> params){
		ResultConstant.pageSet(params);
		List<AqsczxInfo> list = aqsczxInfoMapper.selectByParam(params);
		return list;
	}
	
	
	public void updateContractStatus(int id,int contractStatus){
		AqsczxInfo aqsczxInfo = new AqsczxInfo();
		aqsczxInfo.setId(id);
		aqsczxInfo.setContractStatus(contractStatus);
		aqsczxInfoMapper.updateByPrimaryKeySelective(aqsczxInfo);
	}
	
	@Transactional(rollbackFor={Exception.class})
	public void audit(int id ,int applyStatus , String auditInstructions , String auditor){
		AqsczxInfo  aqsczxInfo = new AqsczxInfo();
		aqsczxInfo.setId(id);
		aqsczxInfo.setApplyStatus(applyStatus);
		aqsczxInfoMapper.updateByPrimaryKeySelective(aqsczxInfo);
		
		AqsczxInfoAudit aqsczxInfoAudit = new AqsczxInfoAudit();
		aqsczxInfoAudit.setAqsczxInfoId(id);
		aqsczxInfoAudit.setAuditStatus(applyStatus);
		aqsczxInfoAudit.setAuditInstructions(auditInstructions);
		aqsczxInfoAudit.setAuditor(auditor);
		aqsczxInfoAudit.setAuditTime(new Date());
		aqsczxInfoAuditMapper.insertSelective(aqsczxInfoAudit);
	}
}
