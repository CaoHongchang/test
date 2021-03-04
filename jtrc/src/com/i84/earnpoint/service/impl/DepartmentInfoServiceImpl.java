package com.i84.earnpoint.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.DepartmentInfoMapper;
import com.i84.earnpoint.model.DepartmentInfo;
import com.i84.earnpoint.service.DepartmentInfoService;
@Service
public class DepartmentInfoServiceImpl implements DepartmentInfoService {
	@Autowired
	private DepartmentInfoMapper departmentInfoMapper;

	@Override
	public int insertDepartmentInfo(DepartmentInfo departmentInfo) {
		// TODO Auto-generated method stub
		return departmentInfoMapper.insertSelective(departmentInfo);
	}

	@Override
	public List<DepartmentInfo> listDepartmentInfo(DepartmentInfo departmentInfo) {
		// TODO Auto-generated method stub
		return departmentInfoMapper.selectByPrimaryKeySelective(departmentInfo);
	}

	@Override
	public List<DepartmentInfo> listDepartmentInfoByIds(String ids) {
		// TODO Auto-generated method stub
		String []idArray=ids.split(",");
		return departmentInfoMapper.findByIds(idArray);
	}

	@Override
	public int updateDepartmentInfo(DepartmentInfo departmentInfo) {
		// TODO Auto-generated method stub
		return departmentInfoMapper.updateByPrimaryKeySelective(departmentInfo);
	}

	@Override
	public int deleteDepartmentInfo(Integer id) {
		// TODO Auto-generated method stub
	    DepartmentInfo departmentInfo=new DepartmentInfo();
	    departmentInfo.setId(id);
	    departmentInfo.setDelDate(new Date());
		return departmentInfoMapper.updateByPrimaryKeySelective(departmentInfo);
	}

}
