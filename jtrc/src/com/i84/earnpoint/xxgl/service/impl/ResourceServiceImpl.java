package com.i84.earnpoint.xxgl.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.mapper.ClassInfoMapper;
import com.i84.earnpoint.mapper.ResourceMapper;
import com.i84.earnpoint.mapper.UserBgInfoMapper;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.xxgl.service.ResourceService;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.model.BmbImport;
/** 选项管理服务具体实现类
 * @author Wangsc
 *
 */
@Service
public class ResourceServiceImpl implements ResourceService {
	@Autowired
	public ResourceMapper resourceMapper;
	/**
     * 获取流水号
     * @param params
     * @return
     */
	@Override
	public Resource qrySeqNo(int params) {
		Resource resource=resourceMapper.selectByPrimaryKey(params);
		return resource;
	}
	/**
     * 更新流水号
     * @param params
     * @return
     */
	@Override
	public void updateResource(Resource resource) {
		resourceMapper.updateByPrimaryKey(resource);
	}
	 
}
