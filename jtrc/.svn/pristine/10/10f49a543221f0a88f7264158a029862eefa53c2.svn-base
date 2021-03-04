package com.i84.earnpoint.zcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.StudyUpInfoMapper;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.zcps.service.StudyUpInfoService;
@Service
public class StudyUpInfoServiceImpl implements StudyUpInfoService{
	@Autowired
	private StudyUpInfoMapper studyUpInfoMapper;
	
	@Override
	public List<StudyUpInfo> queryList(StudyUpInfo studyUpInfo) {
		return this.studyUpInfoMapper.queryList(studyUpInfo);
	}

}
