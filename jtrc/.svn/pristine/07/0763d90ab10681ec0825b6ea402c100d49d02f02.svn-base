package com.i84.earnpoint.daxt.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.mapper.AdverInfoMapper;
import com.i84.earnpoint.mapper.ArchivesBaseInfoMapper;
import com.i84.earnpoint.mapper.ResidenceGetoutInfoMapper;
import com.i84.earnpoint.mapper.ResidenceInfoMapper;
import com.i84.earnpoint.mapper.RewardsInfoMapper;
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
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.rygl.service.RyglService;
 
/**
 * 人员管理服务具体实现类
 * @author wangsc
 *
 */
@Service
public class ResidenceGetoutInfoServiceImpl implements ResidenceGetoutInfoService {
	@Autowired
	private ResidenceGetoutInfoMapper residenceGetoutInfoMapper;
	
	@Autowired
	private ResidenceInfoMapper residenceInfoMapper;
	
	@Autowired
	private ArchivesBaseInfoMapper archivesBaseInfoMapper;

	@Override
	public void addResidenceGetoutInfo(ResidenceGetoutInfo residenceGetoutInfo,
			HttpServletResponse response) throws Exception {
		try{
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("p_no", residenceGetoutInfo.getdNo());
			params.put("pState", 1);
			List<Map<String, Object>> list = archivesBaseInfoMapper.selectArchivesBaseInfoList(params);
			if(null != list && list.size() > 0){
				int tem = residenceGetoutInfoMapper.insertSelective(residenceGetoutInfo);
				if(tem > 0){
					ResultConstant.write(response, "1");
				}else{
					ResultConstant.write(response, "新增失败");
				}
			}else{
				ResultConstant.write(response, "借阅的档案不存在，请确认！");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "新增失败");
		}
		
	}

	@Override
	public List<Map<String, Object>> queryResidenceGetoutInfoList(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return residenceGetoutInfoMapper.selectResidenceGetoutInfoList(record);
	}

	@Override
	public void updateResidenceGetoutInfo(
			ResidenceGetoutInfo residenceGetoutInfo,
			HttpServletResponse response) throws Exception {
		try{
			int tem = residenceGetoutInfoMapper.updateByPrimaryKeySelective(residenceGetoutInfo);
			if(tem > 0){
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "修改失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "修改失败");
		}
	}

	@Override
	public void backResidenceGetoutInfo(
			ResidenceGetoutInfo residenceGetoutInfo,
			HttpServletResponse response) throws Exception {
		try{
			int tem = residenceGetoutInfoMapper.updateByPrimaryKeySelective(residenceGetoutInfo);
			if(tem > 0){
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "归还失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "归还失败");
		}
	}

	@Override
	public void addResidenceGetoutInfoList(
			List<ResidenceGetoutInfo> residenceGetoutInfoList,
			HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String msg = "";	
		for (int i = 0; i < residenceGetoutInfoList.size(); i++) {
			int tem = residenceGetoutInfoMapper.insertSelective(residenceGetoutInfoList.get(i));
			
		}
			
		
		if(StringUtils.isNotBlank(msg)){
			System.out.println("------------false------------" + msg);
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
		}else{
			System.out.println("------------true------------");
			ResultConstant.write(response, "导入成功");
//			ResultConstant.write(response, "导入成功!");
		}
	}
	

}
