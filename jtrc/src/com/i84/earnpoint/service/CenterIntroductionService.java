package com.i84.earnpoint.service;

import java.util.List;



import com.i84.earnpoint.model.CenterIntroduction;



public interface CenterIntroductionService {

	List<CenterIntroduction> listAdverInfo(CenterIntroduction centerIntroduction);
	CenterIntroduction selectAdverInfoById(Integer id);
	int updateAdverInfo(CenterIntroduction centerIntroduction);
}
