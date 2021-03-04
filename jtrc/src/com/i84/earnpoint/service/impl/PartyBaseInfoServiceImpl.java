package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.PartyBaseInfoMapper;
import com.i84.earnpoint.model.PartyBaseInfo;
import com.i84.earnpoint.service.PartyBaseInfoService;

@Service
public class PartyBaseInfoServiceImpl implements PartyBaseInfoService {
	@Autowired
	private PartyBaseInfoMapper partyBaseInfoMapper;

	@Override
	public List<PartyBaseInfo> listPartyBaseInfo(PartyBaseInfo record) {
		// TODO Auto-generated method stub
		return partyBaseInfoMapper.selectBySelective(record);
	}

	@Override
	public int savePartyBaseInfo(PartyBaseInfo record) {
		// TODO Auto-generated method stub
		return partyBaseInfoMapper.insertSelective(record);
	}

	@Override
	public int updatePartyBaseInfo(PartyBaseInfo record) {
		// TODO Auto-generated method stub
		return partyBaseInfoMapper.updateByPrimaryKeySelective(record);
	}

}
