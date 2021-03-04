package com.i84.earnpoint.sydwzp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.BgActivityEnterpriseMapper;
import com.i84.earnpoint.mapper.BgEnterprisePlaceMapper;
import com.i84.earnpoint.model.BgActivityEnterprise;
import com.i84.earnpoint.model.BgEnterprisePlace;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.PlaceInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityEnterpriseService;

@Service
public class BgActivityEnterpriseServiceImpl extends BaseService implements BgActivityEnterpriseService{

	@Resource
	private BgActivityEnterpriseMapper activityEnterpriseMapper;
	@Resource
	private BgEnterprisePlaceMapper bgEnterprisePlaceMapper;
	@Override
	public void addActivityEnterprise(BgActivityEnterprise record) {
		// TODO Auto-generated method stub
		activityEnterpriseMapper.insert(record);
		
	}

	@Override
	public void delActivityEnterprise(Integer activityEnterpriseId) {
		// TODO Auto-generated method stub
		activityEnterpriseMapper.deleteByPrimaryKey(activityEnterpriseId);
		
	}

	@Override
	public void addEnterprisePlace(BgEnterprisePlace enterprisePlace) {
		// TODO Auto-generated method stub
		bgEnterprisePlaceMapper.insert(enterprisePlace);
	}

	@Override
	public void delEnterprisePlace(Integer enterprisePlaceId) {
		// TODO Auto-generated method stub
		bgEnterprisePlaceMapper.deleteByPrimaryKey(enterprisePlaceId);
		
	}

	@Override
	public List<Map<String,Object>> listEnterpriseInfoByCodeOrName(Map<String, Object> param) {
//		return null;
		return activityEnterpriseMapper.selectByCodeOrName(param);
	}

	@Override
	public List<Map<String,Object>> listEnterpriseInfoNotInActivity(Map<String, Object> param) {
//		return null;
		return activityEnterpriseMapper.selectNotInActivity(param);
	}

	@Override
	public List<PlaceInfo> listPlaceInfoByEnterprise(String value,BgActivityEnterprise record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<PlaceInfo> listPlaceInfoNotInEnterprise(String value,BgActivityEnterprise record) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int checkActivityEnterpriseIsExist(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return activityEnterpriseMapper.checkActivityEnterpriseIsExist(param);
	}

	@Override
	public Map<String,Object> selectByCode(Map<String,Object> param) {
		// TODO Auto-generated method stub
		return activityEnterpriseMapper.selectByCode(param);
	}

}
