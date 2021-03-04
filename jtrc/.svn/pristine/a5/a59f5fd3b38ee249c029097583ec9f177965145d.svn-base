package com.i84.earnpoint.daxt.service.impl;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.daxt.service.ResidenceInfoService;
import com.i84.earnpoint.mapper.ResidenceInfoMapper;
import com.i84.earnpoint.mapper.ResidenceIntInfoMapper;
import com.i84.earnpoint.model.ResidenceInfo;
import com.i84.earnpoint.model.ResidenceIntInfo;
/**  户口信息服务具体实现类
 * @author Wangsc
 *
 */
@Service
public class ResidenceInfoServiceImpl implements ResidenceInfoService {
	@Autowired
	public ResidenceInfoMapper residenceInfoMapper;
	@Autowired
	public ResidenceIntInfoMapper residenceIntInfoMapper;
	
	/**
	 * 户口信息列表
	 */
	@Override
	public List< Map<String, Object>> qryResidencaInfoList(Map<String, Object> params) {
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
//		List<Map<String, Object>> rs = new ArrayList();
		List<Map<String, Object>> list = residenceInfoMapper.queryResidenceIoInfo(params);
//		for (int i = 0; i < list.size(); i++) {
//			Map<String, Object> t = list.get(i);
//			if(t.get("out_name")!=null && t.get("sign_name")==null)
//					t.put("state", 2);
//				else 
//					t.put("state", 1);
//			rs.add(t);
//		}
		return list;
	}
	/**
	 * 借出户口新增
	 * @param residenceIntInfo
	 */
	@Override
	public void saveResidenceIntInfo(ResidenceIntInfo residenceIntInfo,int id) {
		
		
		ResidenceIntInfo rt = residenceIntInfoMapper.selectByPrimaryKey(id);
		
		if(rt==null)
		residenceIntInfoMapper.insert(residenceIntInfo);
		else
		{
			
			residenceIntInfo.setId(rt.getId());
			residenceIntInfoMapper.updateByPrimaryKeySelective(residenceIntInfo);
		}
			
	
	}
	/**
	 * 户口信息新增
	 */
	@Override
	public void saveResidenceInfo(ResidenceInfo residenceInfo) {
		residenceInfoMapper.insert(residenceInfo);
	}
	/**
	 * 户口信息更新
	 */
	@Override
	public void updateResidenceInfo(ResidenceInfo residenceInfo) {
		residenceInfoMapper.updateByPrimaryKeySelective(residenceInfo);
	}
	 /**
     * 查询户口信息记录
     * @param paramMap
     * @return
     */
	@Override
	public ResidenceInfo qryResidenceInfo(Map<String, Object> paramMap) {
		return residenceInfoMapper.qryResidenceInfo(paramMap);
	} 
	 /**
     * 查询户口信息记录
     * @param paramMap
     * @return
     */
	@Override
	public ResidenceIntInfo qryResidenceIntInfo(int uid,int rid) {
		
		return residenceIntInfoMapper.selectByPrimaryKey(rid);
//		Map<String, Object> paramMap = new HashMap<String, Object>();
//		paramMap.put("uid", uid);
//		ResidenceInfo rf = residenceInfoMapper.qryResidenceInfo(paramMap);
//		if(rf!=null)
//		return residenceIntInfoMapper.selectByHk(rf.getId());
//		else
//			return null;
	} 
}
