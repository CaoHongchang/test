package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.ExamClassInfoMapper;
import com.i84.earnpoint.model.ExamClassInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamClassInfoService;

@Service
public class ExamClassInfoServiceImpl extends BaseService implements ExamClassInfoService {
	@Autowired
	private ExamClassInfoMapper examClassInfoMapper;

	@Override
	public List<Map<String,Object>> queryList(ExamClassInfo record) {
		PageHelper.startPage(record.getPage(), record.getRows());
		return examClassInfoMapper.queryList(record);
	}

	@Override
	public void insertExamClassInfo(ExamClassInfo examClassInfo) {
		examClassInfoMapper.insertExamClassInfo(examClassInfo);
	}

	@Override
	public void updateExamClassInfo(ExamClassInfo examClassInfo) {
		examClassInfoMapper.updateExamClassInfo(examClassInfo);
	}
	
	public void updateByPrimaryKeySelective(ExamClassInfo examClassInfo) {
		examClassInfoMapper.updateByPrimaryKeySelective(examClassInfo);
	}
	
	
	@Override
	public ExamClassInfo getExamClassInfo(Integer id) {
		return examClassInfoMapper.getExamClassInfo(id);
	}

	@Override
	public void deleteExamClassInfo(Integer id) {
		examClassInfoMapper.deleteExamClassInfo(id);
		
	}

	@Override
	public String getMaxNo() {
		return examClassInfoMapper.getMaxNo();
	}

	@Override
	public void setStudent(Integer id, Integer count) {
		examClassInfoMapper.setStudent(id, count);
	}

	@Override
	public Map<String, Object> getExamClass(Integer id) {
		return examClassInfoMapper.getExamClass(id);
	}

	@Override
	public ExamClassInfo getExamClassInfoByNum(String classNum) {
		return examClassInfoMapper.getExamClassInfoByNum(classNum);
	}

}
