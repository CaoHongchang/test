package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.EnterpriseMaterialInfoMapper;
import com.i84.earnpoint.model.EnterpriseMaterialInfo;
import com.i84.earnpoint.service.EnterpriseMaterialInfoService;
@Service
public class EnterpriseMaterialInfoServiceImpl implements EnterpriseMaterialInfoService{
    @Autowired
    private EnterpriseMaterialInfoMapper enterpriseMaterialInfoMapper;

	@Override
	public int insertEnterpriseMaterialInfo(
			EnterpriseMaterialInfo enterpriseMaterialInfo) {
		// TODO Auto-generated method stub
		return enterpriseMaterialInfoMapper.insertSelective(enterpriseMaterialInfo);
	}

	@Override
	public int updateEnterpriseMaterialInfo(
			EnterpriseMaterialInfo enterpriseMaterialInfo) {
		// TODO Auto-generated method stub
		return enterpriseMaterialInfoMapper.updateByPrimaryKeySelective(enterpriseMaterialInfo);
	}

	@Override
	public List<EnterpriseMaterialInfo> listEnterpriseMaterialInfo(
			EnterpriseMaterialInfo enterpriseMaterialInfo) {
		// TODO Auto-generated method stub
		return enterpriseMaterialInfoMapper.selectBySelective(enterpriseMaterialInfo);
	}

	@Override
	public int invalidEnterpriseMaterialInfo(String ids) {
		// TODO Auto-generated method stub
		String []array=ids.split(",");
		return enterpriseMaterialInfoMapper.updateIsValid(array);
	}

}
