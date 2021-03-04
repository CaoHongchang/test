package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.AqsczxInfo;

public interface AqsczxInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AqsczxInfo record);

    int insertSelective(AqsczxInfo record);

    AqsczxInfo selectByPrimaryKey(Integer id);

    List<AqsczxInfo> selectByParam(Map<String,Object> params);

    int updateByPrimaryKeySelective(AqsczxInfo record);

    int updateByPrimaryKey(AqsczxInfo record);
}