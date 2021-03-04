package com.i84.earnpoint.sydwzp.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.BgActivityInfo;
/**
 * 活动信息
 * @author linyj
 *
 */
public interface BgActivityInfoService {
	
    int deleteByPrimaryKey(Integer id);

    int insert(BgActivityInfo record);

    int insertSelective(BgActivityInfo record);

    BgActivityInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BgActivityInfo record);

    int updateByPrimaryKey(BgActivityInfo record);
    
    //查询活动列表
    List<BgActivityInfo> selectListByPrimary(BgActivityInfo bgActivityInfo, int page, int rows);
    
    List<Map<String,Object>> queryBgActivityInfos(Map<String,Object> param);
    
    List<Map<String,Object>> queryBgActivityInfos2(Map<String,Object> param);
    
    //查询最大编号
    String selectMaxPno();
    
    BgActivityInfo queryByPno(String pno);

    List<Map<String,Object>> selectListAcBeforeStart(Map param);

	List<Map<String, Object>> selectListAcAll(Map param);
}