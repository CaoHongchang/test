package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.EnterpriseInfoDetail;

public interface EnterpriseInfoDetailMapper {
    int deleteByPrimaryKey(Integer id);
    
    int deleteByenterpriseId(Integer id);

    int insert(EnterpriseInfoDetail record);

    int insertSelective(EnterpriseInfoDetail record);

    EnterpriseInfoDetail selectByPrimaryKey(Integer id);
    
    EnterpriseInfoDetail selectByEnterpriseId(Integer id);

    int updateByPrimaryKeySelective(EnterpriseInfoDetail record);

    int updateByPrimaryKeyWithBLOBs(EnterpriseInfoDetail record);

    int updateByPrimaryKey(EnterpriseInfoDetail record);
    
    /**
     * 
     * 招聘企业列表
     *
     * @author Cary Huang
     * @created 2016年10月22日 下午12:30:54
     * @param map
     * @return
     */
    List<Map<String, Object>> queryEnterprise(Map<String, Object> map);
}