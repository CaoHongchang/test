package com.i84.earnpoint.daxt.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

import com.i84.earnpoint.model.ArchivesInfo;
import com.i84.earnpoint.model.ArchivesMoneyInfo;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.ResidenceInfo;
import com.i84.earnpoint.model.ResidenceIntInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;


/**
 * 档案存放信息服务接口
 * @author Wangsc
 *
 */
public interface ArchivesInfoService {

	/**
	 * 档案存放信息列表查询
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> qryArchivesInfoList(Map<String, Object> params);

	/**
	 * 新增档案存放位置
	 * @param archivesInfo
	 */
	void saveArchivesInfo(ArchivesInfo archivesInfo);

	/**
	 * 获取 档案存放信息
	 * @param params
	 * @return
	 */
	ArchivesInfo qryArchivesInfoBean(Map<String, Object> params);
	/**
	 * 更新档案存放位置
	 */
	void updateArchivesInfo(ArchivesInfo archivesInfo);
  
}