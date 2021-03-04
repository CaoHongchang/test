package com.i84.earnpoint.service;

import java.util.List;

import com.i84.earnpoint.model.AdverTypeInfo;

public interface AdverTypeInfoService {
	/**
	 * 插入图片分类
	 * @param adverTypeInfo
	 * @return
	 */
	int insertAdverTypeInfo(AdverTypeInfo adverTypeInfo);
	/**
	 * 列出所有的图片分类
	 * @return
	 */
	List<AdverTypeInfo> listAdverTypeInfo(AdverTypeInfo adverTypeInfo);
	
	/**
	 * 根据ids删除图片分类
	 * @param ids
	 */
	int deleteAdverTypeInfoByIdArray(String ids);
	
	int updateAdverTypeInfoBySelective(AdverTypeInfo adverTypeInfo);
	
	AdverTypeInfo selectAdverTypeInfoById(Integer id);

}
