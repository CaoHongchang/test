package com.i84.earnpoint.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




import com.i84.earnpoint.mapper.CenterIntroductionMapper;
import com.i84.earnpoint.model.CenterIntroduction;
import com.i84.earnpoint.service.CenterIntroductionService;

@Service
public class CenterIntroductionServiceImpl  implements CenterIntroductionService{

	   @Autowired
	   private CenterIntroductionMapper centerIntroductionMapper ;

	@Override
	public List<CenterIntroduction> listAdverInfo(
			CenterIntroduction centerIntroduction) {
		// TODO Auto-generated method stub
		return centerIntroductionMapper.selectlist(centerIntroductionMapper);
	}

	@Override
	public CenterIntroduction selectAdverInfoById(Integer id) {
		// TODO Auto-generated method stub
		return centerIntroductionMapper.selectById(id);
	}

	@Override
	public int updateAdverInfo(CenterIntroduction centerIntroduction) {
		// TODO Auto-generated method stub
		return centerIntroductionMapper.updateById(centerIntroduction);
	}
	

}
