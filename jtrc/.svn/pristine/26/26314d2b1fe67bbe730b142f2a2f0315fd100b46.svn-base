package com.i84.earnpoint.daxt.service;

import java.io.IOException;
import java.text.ParseException;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

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
 * 户口信息服务接口
 * @author Wangsc
 *
 */
public interface ResidenceInfoService {
 
	/**
	 * 户口信息列表
	 * @param params
	 * @return
	 */
	List<Map<String, Object>> qryResidencaInfoList(Map<String, Object> params);
	
	/**
	 * 借出户口新增
	 * @param residenceIntInfo
	 */
	void saveResidenceIntInfo(ResidenceIntInfo residenceIntInfo,int id);
	/**
	 * 户口信息新增
	 */
	void saveResidenceInfo(ResidenceInfo residenceInfo);
    /**
     * 查询户口信息记录
     * @param paramMap
     * @return
     */
	ResidenceInfo qryResidenceInfo(Map<String, Object> paramMap); 
	
	/**
	 * 户口信息更新
	 */
	void updateResidenceInfo(ResidenceInfo residenceInfo);
	
	/*
	 * 户口接入借出
	 * */
	ResidenceIntInfo qryResidenceIntInfo(int uid,int rid);
	
}