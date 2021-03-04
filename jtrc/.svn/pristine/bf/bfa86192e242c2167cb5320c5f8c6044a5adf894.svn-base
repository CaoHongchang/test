package com.i84.earnpoint.daxt.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.daxt.service.ResidenceService;
import com.i84.earnpoint.mapper.ClassInfoMapper;
import com.i84.earnpoint.mapper.ResidenceIoInfoMapper;
import com.i84.earnpoint.mapper.UserBgInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.UserMgInfoMapper;
import com.i84.earnpoint.mapper.UserScoreInfoMapper;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.model.BmbImport;
/** 档案管理服务具体实现类
 * @author Wangsc
 *
 */
@Service
public class ResidenceServiceImpl implements ResidenceService {
	@Autowired
	public ResidenceIoInfoMapper residenceIoInfoMapper;
	
	@Autowired
	private UserMgInfoMapper userMgInfoMapper;
	/**
     * 	获取档案流动列表
     */
	@Override
	public List<ResidenceIoInfo> queryResidenceIoInfo(Map<String,Object> record) {
		ResultConstant.pageSet(record);
		List<ResidenceIoInfo> list = residenceIoInfoMapper.queryResidenceIoInfo(record);
		return list;
	}
	/**
	 * 新增档案流动信息
	 * @throws ParseException 
	 */
	@Override
	public int saveResidenceIoInfo(Map<String, Object> param) throws ParseException {
		ResidenceIoInfo residenceIoInfo = new ResidenceIoInfo();
		if(param.containsKey("anum"))
			residenceIoInfo.setAnum(Integer.parseInt(param.get("anum").toString()));
		else
			residenceIoInfo.setAnum(0);
		if(param.containsKey("out_date"))
			residenceIoInfo.setOutDate(param.get("out_date").toString());
		if(param.containsKey("out_use"))
			residenceIoInfo.setOutUse(param.get("out_use").toString());
		else
			residenceIoInfo.setOutUse("");
		if(param.containsKey("out_uid"))
			residenceIoInfo.setOutUid(param.get("out_uid").toString());	
		else
			residenceIoInfo.setOutUid("");	
		if(param.containsKey("j_uid"))
			residenceIoInfo.setjUid(param.get("j_uid").toString());	
		else
			residenceIoInfo.setjUid("");	
		if(param.containsKey("remark"))
			residenceIoInfo.setRemark(param.get("remark").toString());	
		else
			residenceIoInfo.setRemark("");
		if(param.containsKey("staff"))
			residenceIoInfo.setStaff(Integer.parseInt(param.get("staff").toString()));
		else
			residenceIoInfo.setStaff(0);
		if(param.containsKey("sessionUserName"))
			residenceIoInfo.setStaffname(param.get("sessionUserName").toString());
		else
			residenceIoInfo.setStaffname("");
		if(param.containsKey("add_date")){
			residenceIoInfo.setAddDate(param.get("add_date").toString());
		}
		
		if(param.containsKey("dpno")){
			 Map<String, Object> record = new HashMap<String, Object>();
			 record.put("dpno", param.get("dpno").toString());
			 List<Map<String, Object>> list = userMgInfoMapper.selectUserMgInfoList(record);
			 if(list!=null && list.size()>0){
				 int dId = TextUtil.getInt(list.get(0).get("aid"));
				 residenceIoInfo.setdId(dId);
			 }else{
				 return 0;
			 }
		}
		
		residenceIoInfoMapper.insert(residenceIoInfo);
		return 1;
	}
	/**
	 * 更新档案流动信息
	 * @param param
	 */
	@Override
	public void updateResidenceIoInfo(Map<String, Object> param) {
		ResidenceIoInfo residenceIoInfo = residenceIoInfoMapper.selectByPrimaryKey(Integer.parseInt(param.get("id").toString()));
		//residenceIoInfo.setId(Integer.parseInt(param.get("id").toString()));
		if(param.containsKey("anum"))
		residenceIoInfo.setAnum(Integer.parseInt(param.get("anum").toString()));
		if(param.containsKey("out_date"))
		residenceIoInfo.setOutDate(param.get("out_date").toString());
		if(param.containsKey("out_use"))
		residenceIoInfo.setOutUse(param.get("out_use").toString());
		if(param.containsKey("out_uid"))
		residenceIoInfo.setOutUid(param.get("out_uid").toString());	
		if(param.containsKey("j_uid"))
		residenceIoInfo.setjUid(param.get("j_uid").toString());	
		if(param.containsKey("remark"))
		residenceIoInfo.setRemark(param.get("remark").toString());	
		if(param.containsKey("sessionUserName"))
		residenceIoInfo.setStaffname(param.get("sessionUserName").toString());
		if(param.containsKey("staff"))
		residenceIoInfo.setStaff(Integer.parseInt(param.get("staff").toString()));	
		if(param.containsKey("add_date")){
		residenceIoInfo.setAddDate(param.get("add_date").toString());
		}
		residenceIoInfoMapper.updateByPrimaryKeySelective(residenceIoInfo);
	}
	/**
	 * 删除档案流动信息
	 * @param id
	 */
	@Override
	public void delResidenceIoInfo(int id) {
		residenceIoInfoMapper.deleteByPrimaryKey(id);
	}
	 
}
