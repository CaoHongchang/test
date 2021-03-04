package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.ResourceMapper;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.service.ParameterService;
@Service
public class ParameterServiceImpl implements ParameterService {

	@Autowired
	private ResourceMapper resourceMapper;
	@Override
	public int saveParameter(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.insertSelective(resource);
	}

	@Override
	public int updateParameter(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.updateByPrimaryKeySelective(resource);
	}
	
	@Override
	public int updateParameterByExt(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.updateByExtSelective(resource);
	}

	@Override
	public List<Resource> listResource(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.selectBySelective(resource);
	}

	@Override
	public String selectMaxCode(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.selectMaxCode(resource);
	}

	@Override
	public int deleteResource(Resource resource) {
		// TODO Auto-generated method stub
		return resourceMapper.deleteByExt(resource);
	}

}
