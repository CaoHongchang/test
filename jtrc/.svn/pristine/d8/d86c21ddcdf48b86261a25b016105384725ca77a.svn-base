package com.i84.earnpoint.aqsczxy.service.impl;


import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.aqsczxy.service.AqsczxService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.AdverInfoMapper;
import com.i84.earnpoint.mapper.ContractModelMapper;
import com.i84.earnpoint.mapper.EnterpriseCheckMapper;
import com.i84.earnpoint.mapper.OfficialInfoMapper;
import com.i84.earnpoint.mapper.RewardsInfoMapper;
import com.i84.earnpoint.mapper.SafetyProductionConsultMapper;
import com.i84.earnpoint.mapper.SafetyProductionConsultMaterialMapper;
import com.i84.earnpoint.mapper.StudyInfoMapper;
import com.i84.earnpoint.mapper.StudyUpInfoMapper;
import com.i84.earnpoint.mapper.UserExpertInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.UserMgInfoMapper;
import com.i84.earnpoint.mapper.WorkInfoMapper;
import com.i84.earnpoint.mapper.UserPartyInfoMapper;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.RewardsInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.mapper.UserPartyInMapper;
import com.i84.earnpoint.mapper.UserPartyOutMapper;
import com.i84.earnpoint.mapper.MsgFromInfoMapper;
import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.EnterpriseCheck;
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.OfficialInfo;
import com.i84.earnpoint.model.SafetyProductionConsult;
import com.i84.earnpoint.model.SafetyProductionConsultMaterial;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.rygl.service.RyglService;
import com.i84.earnpoint.service.UserInfoService;
 
/**
 * 安全生产咨询具体实现类
 * @author wangsc
 *
 */
@Service
public class AqsczxServiceImpl implements AqsczxService {
	
	@Autowired
	private ContractModelMapper contractModelMapper;
	
	@Autowired
	private SafetyProductionConsultMapper safetyProductionConsultMapper;
	
	@Autowired
	private SafetyProductionConsultMaterialMapper safetyProductionConsultMaterialMapper;
	
	@Autowired
	private EnterpriseCheckMapper enterpriseCheckMapper;

	@Override
	public void insertContractModel(HttpServletResponse response,ContractModel contractModel) {
		int tem = contractModelMapper.insertSelective(contractModel);
		if(tem > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "新增失败");
		}
	}

	@Override
	public List<Map<String, Object>> qryContractModel(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return contractModelMapper.qryContractModel(record);
	}

	@Override
	public List<Map<String, Object>> queryAqsczxList(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return safetyProductionConsultMapper.qrySafetyProductionConsultList(record);
	}
	
	@Override
	public void updSafetyProductionConsult(HttpServletResponse response,
			SafetyProductionConsult safetyProductionConsult) {
		int tem = safetyProductionConsultMapper.updateByPrimaryKeySelective(safetyProductionConsult);
		if(tem > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "0");
		}	
		
	}
	
	@Override
	public void htqrSafetyProductionConsult(HttpServletResponse response,
			SafetyProductionConsult safetyProductionConsult) {
		try{
			String[] ids = safetyProductionConsult.getIds().split(",");
			for(String id:ids){
				SafetyProductionConsult safetyProductionConsultVo = new SafetyProductionConsult();
				safetyProductionConsultVo.setContractState(1);
				safetyProductionConsultVo.setId(Integer.parseInt(id));
				safetyProductionConsultVo.setContractDate(new Date());
				safetyProductionConsultMapper.updateByPrimaryKeySelective(safetyProductionConsultVo);
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "0");
		}
		
	}
	
	@Override
	public void pxwcSafetyProductionConsult(HttpServletResponse response,
			SafetyProductionConsult safetyProductionConsult) {
		try{
			String[] ids = safetyProductionConsult.getIds().split(",");
			for(String id:ids){
				SafetyProductionConsult safetyProductionConsultVo = new SafetyProductionConsult();
				safetyProductionConsultVo.setTrainState(1);
				safetyProductionConsultVo.setId(Integer.parseInt(id));
				safetyProductionConsultVo.setTrainDate(new Date());
				safetyProductionConsultMapper.updateByPrimaryKeySelective(safetyProductionConsultVo);
				
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "0");
		}
		
	}
	
	@Override
	public void updateContractModel(HttpServletResponse response,
			ContractModel contractModel) {
		int tem = contractModelMapper.updateByPrimaryKeySelective(contractModel);
		if(tem > 0){
			ResultConstant.write(response, "1");
		}else{
			if(null == contractModel.getDelDate()){
				ResultConstant.write(response, "修改失败");
			}else{
				ResultConstant.write(response, "删除失败");				
			}
		}		
	}
	
	@Override
	public String getNextMid() {
		String pno = "000001";
		try{
			pno = contractModelMapper.getNextMid();
			if(StringUtils.isBlank(pno) || pno.length() == 0){
				pno = "000001";
			}else{
				int temp = Integer.parseInt(pno)+1;
				if(temp < 10){
					pno = "00000" + temp;
				}else if(temp < 100){
					pno = "0000" + temp;
				}else if(temp < 1000){
					pno = "000"+temp;
				}else if(temp < 10000){
					pno = "00"+temp;
				}else if(temp < 100000){
					pno = "0"+temp;
				}else if(temp < 1000000){
					pno = ""+temp;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			pno = "000001";
		}
		return pno;
	}

	@Override
	public List<Map<String, Object>> queryAqsczxClList(
			Map<String, Object> record) {
		return safetyProductionConsultMaterialMapper.qrySafetyProductionConsultMaterial(record);
	}

	@Override
	public void updSafetyProductionConsultMaterial(
			HttpServletResponse response,
			SafetyProductionConsultMaterial safetyProductionConsultMaterial) {
		int tem = safetyProductionConsultMaterialMapper.updateByPrimaryKeySelective(safetyProductionConsultMaterial);
//		if(tem > 0){
//			ResultConstant.write(response, "1");
//		}else{
//			ResultConstant.write(response, "0");
//		}	
	}

	@Override
	public List<Map<String, Object>> qryEnterpriseCheck(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return enterpriseCheckMapper.qryEnterpriseCheck(record);
	}

	@Override
	public void pcsh(HttpServletResponse response,
			SafetyProductionConsult safetyProductionConsult) {
		int tem = safetyProductionConsultMapper.updateByPrimaryKeySelective(safetyProductionConsult);
		if(tem > 0){
			EnterpriseCheck enterpriseCheck = new EnterpriseCheck();
			enterpriseCheck.setCheckDate(safetyProductionConsult.getLastCheckDate());
			enterpriseCheck.setSafeId(safetyProductionConsult.getId());
			enterpriseCheck.setState(safetyProductionConsult.getLastCheckState());
			enterpriseCheck.setRemark(safetyProductionConsult.getLastCheckRemark());
			enterpriseCheck.setId(safetyProductionConsult.getLastCheckId());
			int tem2 = enterpriseCheckMapper.updateByPrimaryKeySelective(enterpriseCheck);
			if(tem2 > 0){
			    ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "0");
			}	
		}else{
			ResultConstant.write(response, "0");
		}			
	}

	@Override
	public void insertSafetyProductionConsultMaterial(
			SafetyProductionConsultMaterial safetyProductionConsultMaterial) {
		safetyProductionConsultMaterialMapper.insertSelective(safetyProductionConsultMaterial);	
		
	}

	@Override
	public List<Map<String, Object>> countByYear(Map<String, Object> record) {
		return safetyProductionConsultMapper.countByYear(record);
	}

}
