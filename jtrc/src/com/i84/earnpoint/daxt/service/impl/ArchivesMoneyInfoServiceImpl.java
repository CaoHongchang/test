package com.i84.earnpoint.daxt.service.impl;

import java.io.IOException;
import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.aop.ThrowsAdvice;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.sf.json.JSONObject;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.daxt.service.ArchivesMoneyInfoService;
import com.i84.earnpoint.mapper.ArchivesMoneyInfoMapper;
import com.i84.earnpoint.mapper.ResidenceIoInfoMapper;
import com.i84.earnpoint.model.ArchivesMoneyImportInfo;
import com.i84.earnpoint.model.ArchivesMoneyInfo;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;


/**
 * 档案缴费信息服务实现类
 * @author Wangsc
 *
 */
@Service
public class ArchivesMoneyInfoServiceImpl implements ArchivesMoneyInfoService {
	@Autowired
	public ArchivesMoneyInfoMapper archivesMoneyInfoMapper;
	/**
	 * 	查询档案缴费信息列表
	 * @param params
	 * @return
	 */
	public List<ArchivesMoneyInfo> queryArchivesMoneyList(Map<String, Object> params) {
		ResultConstant.pageSet(params);
		return archivesMoneyInfoMapper.queryArchivesMoneyList(params);
	}

	@Override
	public void delResidenceIoInfo(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public List<ResidenceIoInfo> queryResidenceIoInfo(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void saveResidenceIoInfo(Map<String, Object> param)
			throws ParseException {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void updateResidenceIoInfo(Map<String, Object> param) {
		// TODO Auto-generated method stub
		
	}
	/**
	 * 添加缴费情况
	 * @param list
	 */
	@Override
	public void saveJf(List<ArchivesMoneyImportInfo> list) { 
		for (ArchivesMoneyImportInfo obj : list) {
			ArchivesMoneyInfo record = new ArchivesMoneyInfo();
			record.setArNo(obj.getArNo());
			record.setProxyName(obj.getProxyName());
			record.setJfType(obj.getJfType());
			record.setJfDate(obj.getJfDate());
			record.setpNo(obj.getpNo());
			record.setsDate(obj.getsDate());
			record.seteDate(obj.geteDate());
			record.setM(Float.parseFloat(obj.getM()));
			record.setJfName(obj.getJfName());
			archivesMoneyInfoMapper.insertSelective(record);
		 }
	}

	@Override
	public void updateJf(ArchivesMoneyInfo record) throws Exception {
		try{
			archivesMoneyInfoMapper.updateByPrimaryKeySelective(record);
		}catch(Exception e){
			throw new Exception(e.getMessage());
		}
	
	}

	@Override
	public void deleteJf(String[] ids, HttpServletResponse response)
			 {
		try{
			int temp = archivesMoneyInfoMapper.deleteJfInfosByIds(ids);
			if(temp>0){
			   ResultConstant.write(response, "1");	
			}else{
				ResultConstant.write(response, "删除失败");
			}
			
		}catch(Exception e){
			ResultConstant.write(response, "删除失败");
		}
		
	}

	@Override
	public void addJf(ArchivesMoneyInfo archivesMoneyInfo) throws Exception {
        archivesMoneyInfoMapper.insertSelective(archivesMoneyInfo);		
	} 
	
}