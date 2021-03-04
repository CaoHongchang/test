package com.i84.earnpoint.zcps.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.StudyInfoMapper;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.zcps.service.StudyInfoService;
@Service
public class StudyInfoServiceImpl implements StudyInfoService{
	@Autowired
	private StudyInfoMapper studyInfoMapper;
	@Override
	public List<StudyInfo> queryStudyList(StudyInfo record) {
		return this.studyInfoMapper.queryStudyList(record);
	}

}
