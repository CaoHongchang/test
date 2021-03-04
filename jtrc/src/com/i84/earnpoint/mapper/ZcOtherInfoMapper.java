package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ZcOtherInfo;

public interface ZcOtherInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ZcOtherInfo record);

    int insertSelective(ZcOtherInfo record);

    ZcOtherInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ZcOtherInfo record);

    int updateByPrimaryKey(ZcOtherInfo record);
    
    List<Map> selectfj(Map map);
}