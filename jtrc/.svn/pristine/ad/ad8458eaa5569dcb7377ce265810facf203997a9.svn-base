package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.DispatchingManagementMapper;
import com.i84.earnpoint.model.DispatchingManagement;
import com.i84.earnpoint.service.DispatchingManagementService;




@Service
public class DispatchingManagementServiceImp  implements DispatchingManagementService{

	 @Autowired
	   private DispatchingManagementMapper dispatchingManagementMapper;

	@Override
	public List<DispatchingManagement> listAdverInfo(
			DispatchingManagement dispatchingManagement) {
		// TODO Auto-generated method stub
		return dispatchingManagementMapper.selectlist(dispatchingManagementMapper);
	}

	@Override
	public DispatchingManagement selectAdverInfoById(String id) {
		// TODO Auto-generated method stub
		return dispatchingManagementMapper.selectById(id);
	}

	@Override
	public int updateAdverInfo(DispatchingManagement dispatchingManagement) {
		// TODO Auto-generated method stub
		return dispatchingManagementMapper.updateById(dispatchingManagement);
	}
	




}
