package com.i84.earnpoint.mapper;

import java.util.List;

import com.i84.earnpoint.model.TypeInfo;

public interface ZxTypeInfoMapper {
public int insertTypeInfo(TypeInfo typeInfo);
	
	public int updateTypeInfo(TypeInfo typeInfo);
	
    public List<TypeInfo> listTypeInfoByParentid(Integer parent_id);
    
    public List<TypeInfo> selectTypeInfoByPno(String pno);
    
    public TypeInfo selectTypeInfoByPrimaryKey(Integer id);
    
     int deleteTypeInfoByPrimayKeys(String[] list);
    
     List<TypeInfo> findByIds(String[] idArray);
     
     Integer selectMaxSeqByParentId(Integer parentId);
     
     public List<TypeInfo> selectBySelective(TypeInfo typeInfo);
     
     TypeInfo selectByPnoAndId(String pno,Integer id);
}
