package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;

public interface ArchivesMaterialOtherInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ArchivesMaterialOtherInfo record);

    int insertSelective(ArchivesMaterialOtherInfo record);

    ArchivesMaterialOtherInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ArchivesMaterialOtherInfo record);

    int updateByPrimaryKey(ArchivesMaterialOtherInfo record);
    
    List<Map<String,Object>>selectByClFjList(Map<String, Object>m);
    
    int deletegdcl(ArchivesMaterialOtherInfo record);
    
}