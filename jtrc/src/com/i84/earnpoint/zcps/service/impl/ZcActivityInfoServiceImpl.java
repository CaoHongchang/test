package com.i84.earnpoint.zcps.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.ZcActivityInfoMapper;
import com.i84.earnpoint.model.Pagination;
import com.i84.earnpoint.model.ZcActivityInfo;
import com.i84.earnpoint.zcps.service.ZcActivityInfoService;
@Service
public class ZcActivityInfoServiceImpl implements ZcActivityInfoService {
	@Autowired
    private ZcActivityInfoMapper zcActivityInfoMapper;
	@Override
	public int insertZcActivityInfo(ZcActivityInfo zcActivityInfo) {
		return zcActivityInfoMapper.insertSelective(zcActivityInfo);
	}

	@Override
	public int updateZcActivityInfo(ZcActivityInfo zcActivityInfo) {
		return zcActivityInfoMapper.updateByPrimaryKeySelective(zcActivityInfo);
	}

	@Override
	public int deleteZcActivityInfo(String ids) {
		String [] idArray=ids.split(",");
		int count=0;
		for(int i=0;i<idArray.length;i++){
			count+=zcActivityInfoMapper.deleteByPrimaryKey(Integer.valueOf(idArray[i]));
		}
		return count;
	}

	@Override
	public ZcActivityInfo selectZcActivityInfoById(Integer id) {
		return zcActivityInfoMapper.selectByPrimaryKey(id);
	}

	public ZcActivityInfoMapper getZcActivityInfoMapper() {
		return zcActivityInfoMapper;
	}

	public void setZcActivityInfoMapper(ZcActivityInfoMapper zcActivityInfoMapper) {
		this.zcActivityInfoMapper = zcActivityInfoMapper;
	}

	@Override
	public List<ZcActivityInfo> queryList(ZcActivityInfo zcActivityInfo) {
		return this.zcActivityInfoMapper.queryList(zcActivityInfo);
	}

	@Override
	public int getAllCount() {
		return this.zcActivityInfoMapper.getAllCount();
	}
	
	public Map<String,Object> getAll(ZcActivityInfo record){
		return this.zcActivityInfoMapper.getAll(record);
		
	}

	
}
