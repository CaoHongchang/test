package com.i84.earnpoint.hygsgl.service.impl;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.hygsgl.service.YwflInfoService;
import com.i84.earnpoint.mapper.BusinessInfoMapper;
import com.i84.earnpoint.mapper.TypeInfoMapper;


/**
 * @author liu_quan
 *
 */
@Service
public class YwflInfoServiceImpl implements YwflInfoService{
	@Autowired 
	private TypeInfoMapper typeInfoMapper;
	@Autowired
	private BusinessInfoMapper businessInfoMapper;
	@Override
	public int addYwfl(Map<String, Object> map)throws Exception {
		
		return typeInfoMapper.insertTypeInfo(map);
	}
	public int editYwfl(Map<String, Object> map)throws Exception {
		
		return typeInfoMapper.updateTypeInfo(map);
	}
	@Override
	public List<Map<String, Object>> selectYwflList(Map<String, Object> obj) {
		ResultConstant.pageSet(obj);
		return typeInfoMapper.selectYwflList(obj);
	}

	@Override
	public List<Map<String, Object>> selectYwflData(Map<String, Object> obj) {
		return typeInfoMapper.selectYwflList(obj);
	}
	@Override
	public Map<String, Object> selectIsExist(Map<String, Object> map) {
		return businessInfoMapper.selectIsExist(map);
	}
	
	
	
	

}