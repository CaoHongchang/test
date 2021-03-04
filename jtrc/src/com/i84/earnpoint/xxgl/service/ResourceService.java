package com.i84.earnpoint.xxgl.service;

import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.model.UserScoreImportInfo;


/**
 * 选项管理接口
 * @author Wangsc
 *
 */
public interface ResourceService {
    /**
     * 获取流水号
     * @param params
     * @return
     */
	Resource qrySeqNo(int params);
	/**
     * 更新流水号
     * @param params
     * @return
     */
	void updateResource(Resource resource);
	 
}