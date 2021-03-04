package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.ExamCertificateInfoMapper;
import com.i84.earnpoint.model.ExamCertificateInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamCertificateInfoService;

@Service
public class ExamCertificateInfoServiceImpl extends BaseService implements ExamCertificateInfoService {
	@Autowired
	private ExamCertificateInfoMapper examCertificateInfoMapper;

	@Override
	public List<Map<String,Object>> queryList(ExamCertificateInfo record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		return examCertificateInfoMapper.queryList(record);
	}

	@Override
	public void delete(Integer id) {
		examCertificateInfoMapper.delete(id);
	}

	@Override
	public void insertList(List<ExamCertificateInfo> list) {
		ExamCertificateInfo info = null;
		for(ExamCertificateInfo examCertificateInfo:list){
			info = getExamCertificateInfo(examCertificateInfo.getClassNum(), examCertificateInfo.getCardId());
			if(info==null)
				examCertificateInfoMapper.insertSelective(examCertificateInfo);
			else{
				examCertificateInfo.setCertificateId(info.getCertificateId());
				examCertificateInfoMapper.updateByPrimaryKeySelective(examCertificateInfo);
			}
		}
	}

	@Override
	public ExamCertificateInfo getExamCertificateInfo(String classNum, String cardId) {
		return examCertificateInfoMapper.getExamCertificateInfo(classNum, cardId);
	}

	@Override
	public Map<String, Object> getPrintInfo(Integer id) {
		return examCertificateInfoMapper.getPrintInfo(id);
	}
	
}
