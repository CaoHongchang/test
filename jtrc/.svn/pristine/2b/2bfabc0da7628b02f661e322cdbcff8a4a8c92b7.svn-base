package com.i84.earnpoint.zxxx.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;

/**
 * 报名用户服务接口类
 * @author wangsc
 *
 */
public interface UserBgInfoService {

	/**
	 * 报名表导入信息插入表
	 * @param results
	 */
	void insertUserInfo(List<BmbImport> results);
    /**
     * 报名表列表信息获取
     * @param record
     * @return
     */
	List<BmbInfo> queryBmbList(BmbInfo record);
	/**
	 * 根据条件获取报名用户的信息
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	JSONObject queryUserBgInfoByParam(Map<String, Object> map);
	/**
	 * 审核报名用户操作
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	JSONObject checkUserBgInfo(Map<String, Object> params);
	
	void bmExport(HttpServletResponse response,HttpServletRequest request)throws Exception;

	
}