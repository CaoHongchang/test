package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.ExamTicketInfoMapper;
import com.i84.earnpoint.model.ExamTicketInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamTicketInfoService;

@Service
public class ExamTicketInfoServiceImpl extends BaseService implements ExamTicketInfoService {
	@Autowired
	private ExamTicketInfoMapper examTicketInfoMapper;

	@Override
	public void insertList(List<ExamTicketInfo> list) {
		ExamTicketInfo info = null;
		for(ExamTicketInfo examTicketInfo:list){
			info = getExamTicketInfo(examTicketInfo.getClassNum(), examTicketInfo.getCardId());
			if(info==null)
				examTicketInfoMapper.insertSelective(examTicketInfo);
			else{
				examTicketInfo.setTicketId(info.getTicketId());
				examTicketInfoMapper.updateByPrimaryKeySelective(examTicketInfo);
			}
		}
	}

	@Override
	public ExamTicketInfo getExamTicketInfo(String classNum, String cardId) {
		return examTicketInfoMapper.getExamTicketInfo(classNum, cardId);
	}
}
