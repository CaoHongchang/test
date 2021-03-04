package com.i84.earnpoint.mapper;

import java.util.List;


import com.i84.earnpoint.model.AdverInfo;
import com.i84.earnpoint.model.CenterIntroduction;



public  interface  CenterIntroductionMapper {
	
	List<CenterIntroduction> selectlist(CenterIntroductionMapper centerIntroductionMapper);
	CenterIntroduction selectById(Integer id);
	int updateById(CenterIntroduction record);

}
