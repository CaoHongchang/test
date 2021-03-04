package com.i84.earnpoint.sydwzp.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.BgActivityEnterprise;
import com.i84.earnpoint.model.BgEnterprisePlace;
import com.i84.earnpoint.model.BgEnterprisePlaceExample;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.PlaceInfo;

public interface BgActivityEnterpriseService {
	public void addActivityEnterprise(BgActivityEnterprise record);
	public void delActivityEnterprise(Integer activityEnterpriseId);
	public void addEnterprisePlace(BgEnterprisePlace enterprisePlace);
	public void delEnterprisePlace(Integer enterprisePlaceId);
	
	/**
	 * 根据企业编码或名称获取报名活动的单位
	 * @param value 企业编码或企业名称
	 * @param activityId 报名活动id
	 * @return
	 */
	List<Map<String,Object>> listEnterpriseInfoByCodeOrName(Map<String, Object> param);
	/**
	 * 查询改报名活动以外的单位
	 * @param value
	 * @param activityId
	 * @return
	 */
	List<Map<String,Object>> listEnterpriseInfoNotInActivity(Map<String, Object> param);
	/**
	 * 根据获取单位岗位列表
	 * @param value
	 * @param enterpriseId
	 * @param activityId
	 * @return
	 */
	List<PlaceInfo> listPlaceInfoByEnterprise(String value,BgActivityEnterprise record);
	
	/**
	 * 根据获取单位以外岗位列表
	 * @param value
	 * @param enterpriseId
	 * @param activityId
	 * @return
	 */
	List<PlaceInfo> listPlaceInfoNotInEnterprise(String value,BgActivityEnterprise record);
	
	
	public int checkActivityEnterpriseIsExist(Map<String, Object> map);
	
	Map<String,Object> selectByCode(Map<String,Object> param);
	
}
