package com.i84.earnpoint.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.AdverTypeInfoMapper;
import com.i84.earnpoint.model.AdverTypeInfo;
import com.i84.earnpoint.service.AdverTypeInfoService;
@Service
public class AdverTypeInfoServiceImpl implements AdverTypeInfoService {

	@Autowired
	private AdverTypeInfoMapper adverTypeInfoMapper;
	@Override
	public int insertAdverTypeInfo(AdverTypeInfo adverTypeInfo) {
		// TODO Auto-generated method stub
		return adverTypeInfoMapper.insertSelective(adverTypeInfo);
	}

	@Override
	public List<AdverTypeInfo> listAdverTypeInfo(AdverTypeInfo adverTypeInfo) {
		// TODO Auto-generated method stub
		return adverTypeInfoMapper.selectByPrimaryKeySelective(adverTypeInfo);
	}

	@Override
	public int deleteAdverTypeInfoByIdArray(String ids) {
		// TODO Auto-generated method stub
		String idArray []=ids.split(",");
		int count=0;
		for(int i=0;i<idArray.length;i++){
			AdverTypeInfo adverTypeInfo=new AdverTypeInfo();
			adverTypeInfo.setId(Integer.valueOf(idArray[i]));
			adverTypeInfo.setDelDate(new Date());
			count+=adverTypeInfoMapper.updateByPrimaryKeySelective(adverTypeInfo);
		}
		return count;
	}

	@Override
	public int updateAdverTypeInfoBySelective(AdverTypeInfo adverTypeInfo) {
		// TODO Auto-generated method stub
		return adverTypeInfoMapper.updateByPrimaryKeySelective(adverTypeInfo);
	}

	@Override
	public AdverTypeInfo selectAdverTypeInfoById(Integer id) {
		// TODO Auto-generated method stub
		return adverTypeInfoMapper.selectByPrimaryKey(id);
	}

}
