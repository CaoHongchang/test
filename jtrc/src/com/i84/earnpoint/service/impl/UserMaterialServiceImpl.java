package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.UserMaterialInfoMapper;
import com.i84.earnpoint.model.UserMaterialInfo;
import com.i84.earnpoint.service.UserMaterialInfoService;
@Service
public class UserMaterialServiceImpl implements UserMaterialInfoService {
	@Autowired
     private UserMaterialInfoMapper userMaterialInfoMapper;

	@Override
	public int insertUserMaterialInfo(UserMaterialInfo userMaterialInfo) {
		// TODO Auto-generated method stub
		return userMaterialInfoMapper.insertSelective(userMaterialInfo);
		
	}
	
	public int updateUserMaterialInfo(UserMaterialInfo userMaterialInfo){
		return userMaterialInfoMapper.updateByPrimaryKeySelective(userMaterialInfo);
	}

	@Override
	public List<UserMaterialInfo> listUserMaterialInfo(
			UserMaterialInfo userMaterialInfo) {
		// TODO Auto-generated method stub
		return userMaterialInfoMapper.selectBySelective(userMaterialInfo);
	}

	@Override
	public int invalidUserMaterialInfo(String ids) {
		// TODO Auto-generated method stub
		String []array=ids.split(",");
		
		return userMaterialInfoMapper.updateIsValid(array);
	}
}
