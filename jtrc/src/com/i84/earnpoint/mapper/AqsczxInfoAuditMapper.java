package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.AqsczxInfoAudit;

public interface AqsczxInfoAuditMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(AqsczxInfoAudit record);

    int insertSelective(AqsczxInfoAudit record);

    AqsczxInfoAudit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(AqsczxInfoAudit record);

    int updateByPrimaryKey(AqsczxInfoAudit record);
}