package com.i84.earnpoint.zyzgksgl.service;

import java.util.List;

import com.i84.earnpoint.model.ExamResultInfo;

public interface ExamResultInfoService {

	public void insertList(List<ExamResultInfo> list);
	
	public ExamResultInfo getExamResultInfo(String classNum, String cardId);
	
}
