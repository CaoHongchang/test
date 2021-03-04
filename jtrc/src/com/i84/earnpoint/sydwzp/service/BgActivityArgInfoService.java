package com.i84.earnpoint.sydwzp.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.BgActivityArgInfo;
/**
 * 活动参数信息
 * @author linyj
 *
 */
public interface BgActivityArgInfoService {
	
    int deleteByPrimaryKey(Integer id);

    int insert(BgActivityArgInfo record);

    int insertSelective(BgActivityArgInfo record);

    BgActivityArgInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BgActivityArgInfo record);

    int updateByPrimaryKey(BgActivityArgInfo record);
    
    List<BgActivityArgInfo> queryBgActivityArgInfo4List(BgActivityArgInfo bgActivityArgInfo);
    
    Map<String, Object> queryBgActivityArgInfo4Bean(String key,String value);
    
    List<Map<String,Object>> queryBgActivityArgInfos(Map<String,Object> param);
    
    BgActivityArgInfo selectByActivityId(Integer activityId);
}