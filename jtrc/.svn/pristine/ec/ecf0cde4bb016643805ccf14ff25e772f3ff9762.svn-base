package com.i84.earnpoint.rsdlgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.model.TypeInfo;


/**分类管理
 * @author zhengqr
 *
 */
public interface TypeInfoService {
	void deleteChildByPrimaryKeys(String ids,String childIds,HttpServletResponse response) throws Exception;
    
    void deleteByPrimaryKeys(String ids,HttpServletResponse response) throws Exception;
    
    void insert(TypeInfo typeInfo, HttpServletResponse response) throws Exception;
    
    void insertChild(TypeInfo typeInfo,RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;

    TypeInfo selectByPrimaryKey(Integer id);
    
    List<TypeInfo> selectListByPrimaryKey(TypeInfo typeInfo);
    
    List<TypeInfo> loadTypeInfo();
    
    List<TypeInfo> selectListByPrimary(TypeInfo record);
    
    List<TypeInfo> selectChildListByPrimary(TypeInfo record);

    int updateByPrimaryKeySelective(TypeInfo typeInfo);

    void updateByPrimaryKey(TypeInfo typeInfo, HttpServletResponse response) throws Exception;
    
    void updateChildByPrimaryKey(TypeInfo typeInfo,RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;
    
    void deleteMunu(TypeInfo typeInfo,HttpServletResponse response)throws Exception ;
    
    void saveMunu(TypeInfo typeInfo,HttpServletResponse response)throws Exception ;
    
    /**
     * 获取流水号
     * @return
     */
    String getNextPno();
    
    public List<Map<String, Object>> businessTypeStatistics(String year1,String year2);
    public List<Map<String, Object>> handle(String year1,String year2,String timeType);
    
    
    
}