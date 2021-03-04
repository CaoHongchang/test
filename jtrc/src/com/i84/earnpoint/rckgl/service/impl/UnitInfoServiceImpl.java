package com.i84.earnpoint.rckgl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.UnitInfoMapper;
import com.i84.earnpoint.model.UnitInfo;
import com.i84.earnpoint.rckgl.service.UnitInfoService;
/**
 * 单位信息管理
 * @author Administrator
 *
 */
@Service
public class UnitInfoServiceImpl implements UnitInfoService{
	
	@Autowired
	private UnitInfoMapper unitInfoMapper;

	/**
	 * 查询单位列表
	 * @param unitInfo
	 * @return
	 */
	@Override
	public List<UnitInfo> queryUnitList(UnitInfo unitInfo) {
		List<UnitInfo> list = unitInfoMapper.queryUnitList(unitInfo);
		return list;
	}

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return unitInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UnitInfo record) {
		// TODO Auto-generated method stub
		return unitInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(UnitInfo record) {
		// TODO Auto-generated method stub
		return unitInfoMapper.insertSelective(record);
	}

	@Override
	public UnitInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return unitInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UnitInfo record) {
		// TODO Auto-generated method stub
		return unitInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UnitInfo record) {
		// TODO Auto-generated method stub
		return unitInfoMapper.updateByPrimaryKey(record);
	}
	

	


}
