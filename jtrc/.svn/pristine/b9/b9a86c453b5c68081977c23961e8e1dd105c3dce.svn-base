package com.i84.earnpoint.hygsgl.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.hygsgl.service.YwflInfoService;
import com.i84.earnpoint.hygsgl.service.YwglInfoService;
import com.i84.earnpoint.mapper.BusinessInfoMapper;
import com.i84.earnpoint.mapper.BusinessOtherInfoMapper;
import com.i84.earnpoint.mapper.TypeInfoMapper;
import com.i84.earnpoint.model.BusinessInfo;
import com.i84.earnpoint.model.BusinessOtherInfo;


/**
 * @author liu_quan
 *
 */
@Service
public class YwglInfoServiceImpl implements YwglInfoService{
	@Autowired 
	private BusinessInfoMapper businessInfoMapper;
	@Autowired
	private BusinessOtherInfoMapper businessOtherInfoMapper;
	@Override
	public boolean addYwgl(Map<String, Object> map,String fjparam)throws Exception {
        String objId2=map.get("objId2")==null?null:map.get("objId2").toString(); 
		if(objId2!=null){
			map.put("objId", objId2);//业务对象
		}
		int c=businessInfoMapper.insertBusinessInfo(map);
		if(c>0){
			//附件操作
			Map<String, Object> fjmap=new HashMap<String, Object>();
			if(StringUtils.isNotEmpty(fjparam)){
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					fjmap.put("name", jsonObj.get("name"));
					fjmap.put("url", jsonObj.get("url"));
					fjmap.put("bid", map.get("id"));//业务id
					fjmap.put("addDate", new Date());
					fjmap.put("b_type", 2);//业务类型（1：业务受理信息，2：业务基础信息）
					businessOtherInfoMapper.insertBusinessOtherInfo(fjmap);
				}
			}
			return true;
		}
		return false;

	}

	@Override
	public List<Map<String, Object>> selectYwglList(Map<String, Object> obj) {
		ResultConstant.pageSet(obj);
		return businessInfoMapper.selectYwglList(obj);
	}

	@Override
	public boolean editYwgl(String id,String uid,Map<String, Object> map, String fjparam)throws Exception {
		
		BusinessInfo businessInfo=new BusinessInfo();
		businessInfo.setId(Integer.valueOf(id));
		businessInfo.setName(map.get("name")==null?null:map.get("name").toString());
		businessInfo.setTypeId(map.get("typeId")==null?null:Integer.valueOf(map.get("typeId").toString()));
		businessInfo.setObjId(map.get("objId")==null?null:map.get("objId").toString());
		businessInfo.setRemark(map.get("remark")==null?null:map.get("remark").toString());
		//businessInfo.setPno(map.get("pno")==null?null:map.get("pno").toString());
		int c=businessInfoMapper.updateByPrimaryKeySelective(businessInfo);
		if(c>0){
			 
			Map<String,Object> m=new HashMap<String, Object>();
			m.put("bid", businessInfo.getId());
			m.put("bType", 2);//业务类型（1：业务受理信息，2：业务基础信息）
			businessOtherInfoMapper.deleteByFj(m);
			//附件操作
			Map<String, Object> fjmap=new HashMap<String, Object>();
			if(StringUtils.isNotEmpty(fjparam)){
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					fjmap.put("name", jsonObj.get("name"));
					fjmap.put("url", jsonObj.get("url"));
					fjmap.put("bid", map.get("id"));//业务id
					fjmap.put("addDate", new Date());
					fjmap.put("b_type", 2);//业务类型（1：业务受理信息，2：业务基础信息）
					fjmap.put("uid", uid);
					businessOtherInfoMapper.insertBusinessOtherInfo(fjmap);
				}
			}
			return true;
		}
		return false;
	}


	public boolean editYwgl(String id)throws Exception {
		BusinessInfo businessInfo=new BusinessInfo();
		businessInfo.setId(Integer.valueOf(id));
		businessInfo.setDelDate(new Date());
		int c=businessInfoMapper.updateByPrimaryKeySelective(businessInfo);
		if(c>0){
			//Map<String,Object> m=new HashMap<String, Object>();
			//m.put("bid", businessInfo.getId());
			//m.put("bType", 2);
			BusinessOtherInfo m=new BusinessOtherInfo();
			m.setBid( businessInfo.getId());
			m.setbType(2);//业务类型（1：业务受理信息，2：业务基础信息）
			m.setDelDate(new Date());
			businessOtherInfoMapper.updateByPrimaryKeySelective(m);
			return true;
		}
		return false;
				
	}

	@Override
	public BusinessOtherInfo selectBusinessOther(Integer id) {
		// TODO Auto-generated method stub
		return businessOtherInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public Map<String, Object> selectIsExistYwsl(Map<String, Object> map) {
		return businessInfoMapper.selectIsExistYwsl(map);
	}


}