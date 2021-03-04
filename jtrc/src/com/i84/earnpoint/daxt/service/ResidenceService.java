package com.i84.earnpoint.daxt.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;


/**
 * 档案管理服务接口
 * @author Wangsc
 *
 */
public interface ResidenceService {
	/**
     * 	获取档案流动列表
     */
	List<ResidenceIoInfo> queryResidenceIoInfo(Map<String,Object> record);
	/**
	 * 新增档案流动信息
	 */
	int saveResidenceIoInfo(Map<String, Object> param) throws ParseException;
	/**
	 * 更新档案流动信息
	 * @param param
	 */
	void updateResidenceIoInfo(Map<String, Object> param);
	/**
	 * 删除档案流动信息
	 * @param id
	 */
	void delResidenceIoInfo(int id); 
	
}