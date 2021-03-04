package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.ExamResultInfoMapper;
import com.i84.earnpoint.model.ExamResultInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamResultInfoService;

@Service
public class ExamResultInfoServiceImpl extends BaseService implements ExamResultInfoService {
	@Autowired
	private ExamResultInfoMapper examResultInfoMapper;

	@Override
	public void insertList(List<ExamResultInfo> list) {
		ExamResultInfo info = null;
		for(ExamResultInfo examResultInfo:list){
			info = getExamResultInfo(examResultInfo.getClassNum(), examResultInfo.getCardId());
			if(info==null)
				examResultInfoMapper.insertSelective(examResultInfo);
			else{
				examResultInfo.setResultId(info.getResultId());
				examResultInfoMapper.updateByPrimaryKeySelective(examResultInfo);
			}
		}
	}

	@Override
	public ExamResultInfo getExamResultInfo(String classNum, String cardId) {
		return examResultInfoMapper.getExamResultInfo(classNum, cardId);
	}

}
