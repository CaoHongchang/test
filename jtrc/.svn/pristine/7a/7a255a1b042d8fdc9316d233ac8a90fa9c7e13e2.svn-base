package com.i84.earnpoint.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.TypeInfo;

/**
 * 资讯类别
 * @author CHEN
 *
 */
public interface ZxTypeInfoService{
	/**
	 * 插入资讯类别
	 * @param typeInfo
	 * @return
	 */
	public int insertTypeInfo(TypeInfo typeInfo);
	
	/**
	 * 修改资讯类别
	 * @param typeInfo
	 * @return
	 */
	public int updateTypeInfo(TypeInfo typeInfo);
	
	
	
	/**
	 * 根据父节点id列出资讯类别
	 * @param parent_id
	 * @return
	 */
	public List<TypeInfo> listTypeInfoByParentid(Integer parent_id);
	
	/**
	 * 根据类型编号获取资讯类别
	 * @param pno
	 * @return
	 */
	public TypeInfo selectTypeInfoByPno(String pno);
	
	/**
	 * 根据id获取资讯类别
	 * @param id
	 * @return
	 */
	public TypeInfo selectTypeInfoByPrimaryKey(Integer id);
	
	/**
	 * 根据主键列表删除资讯类别
	 * @param ids
	 * @param response
	 */
	public void deleteTypeInfoByPrimaryKeys(String ids,HttpServletResponse response)throws Exception;
	
	/**
	 * 列出某个类别下最大的序列号
	 * @param parentId
	 * @return
	 */
	public int selectMaxSeqByParentId(Integer parentId);
	/**
	 * 查询资讯类别
	 * @param typeInfo
	 * @return
	 */
	public List<TypeInfo> queryZxTypeInfos(TypeInfo typeInfo);
	
	/**
	 * 根据编号和id获取一个id不同的类别，如果存在的话
	 * @param pno
	 * @param id
	 * @return
	 */
	TypeInfo getChildTypeInfoIfExists(String pno,Integer id);
	
}