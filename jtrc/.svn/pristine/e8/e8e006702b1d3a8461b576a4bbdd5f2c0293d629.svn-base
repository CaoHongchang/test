package com.i84.earnpoint.zcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.WorkInfoMapper;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.zcps.service.WorkInfoService;
@Service
public class WorkInfoSericeImpl implements WorkInfoService{
	@Autowired
	private WorkInfoMapper workInfoMapper;
	@Override
	public List<WorkInfo> queryList(WorkInfo record) {
		return this.workInfoMapper.queryList(record);
	}

}
