package com.i84.earnpoint.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.AdverInfoMapper;
import com.i84.earnpoint.model.AdverInfo;
import com.i84.earnpoint.service.AdverInfoService;
@Service
public class AdverInfoServiceImpl implements AdverInfoService {
	@Autowired
   private AdverInfoMapper adverInfoMapper;
	@Override
	public int insertAdverInfo(AdverInfo adverInfo) {
		// TODO Auto-generated method stub
		return adverInfoMapper.insertSelective(adverInfo);
	}

	@Override
	public int updateAdverInfo(AdverInfo adverInfo) {
		// TODO Auto-generated method stub
		return adverInfoMapper.updateByPrimaryKeySelective(adverInfo);
	}

	@Override
	public List<AdverInfo> listAdverInfo(AdverInfo adverInfo) {
		// TODO Auto-generated method stub
		return adverInfoMapper.selectByPrimaryKeySelective(adverInfo);
	}

	@Override
	public int deleteAdverInfo(String ids) {
		// TODO Auto-generated method stub
		String [] idArray=ids.split(",");
		int count=0;
		for(int i=0;i<idArray.length;i++){
		    AdverInfo adverInfo=new AdverInfo();
		    adverInfo.setId(Integer.valueOf(idArray[i]));
		    adverInfo.setDelDate(new Date());
			count+=adverInfoMapper.updateByPrimaryKeySelective(adverInfo);
		}
		return count;
	}

	@Override
	public AdverInfo selectAdverInfoById(Integer id) {
		// TODO Auto-generated method stub
		return adverInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public String generateFlowNum() {
		// TODO Auto-generated method stub
		String num=adverInfoMapper.selectMaxPno();
		int max=0;
		if(num!=null){
			max=Integer.valueOf(num);
		}
		return String.format("%06d", max+1);
	}

}
