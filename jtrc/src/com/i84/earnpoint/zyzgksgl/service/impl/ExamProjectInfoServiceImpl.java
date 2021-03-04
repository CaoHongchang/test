package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.ExamProjectInfoMapper;
import com.i84.earnpoint.model.ExamProjectInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamProjectInfoService;

@Service
public class ExamProjectInfoServiceImpl extends BaseService implements ExamProjectInfoService {
	@Autowired
	private ExamProjectInfoMapper examProjectInfoMapper;

	@Override
	public void insertExamProjectInfo(ExamProjectInfo examProjectInfo) {
		examProjectInfoMapper.insertExamProjectInfo(examProjectInfo);
	}

	@Override
	public void updateExamProjectInfo(ExamProjectInfo examProjectInfo) {
		examProjectInfoMapper.updateExamProjectInfo(examProjectInfo);
	}

	@Override
	public List<ExamProjectInfo> queryList(ExamProjectInfo record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		return examProjectInfoMapper.queryList(record);
	}

	@Override
	public ExamProjectInfo getExamProjectInfo(Integer id) {
		return examProjectInfoMapper.getExamProjectInfo(id);
	}

	@Override
	public void deleteExamProjectInfo(Integer id) {
		examProjectInfoMapper.deleteExamProjectInfo(id);
	}

	@Override
	public String getMaxNo() {
		return examProjectInfoMapper.getMaxNo();
	}

	@Override
	public List<ExamProjectInfo> getAll() {
		return examProjectInfoMapper.getAll();
	}

	@Override
	public void setStatus(ExamProjectInfo examProjectInfo) {
		examProjectInfoMapper.setStatus(examProjectInfo);
	}

}
