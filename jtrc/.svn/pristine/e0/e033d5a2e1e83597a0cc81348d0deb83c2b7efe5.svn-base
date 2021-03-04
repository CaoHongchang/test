package com.i84.earnpoint.daxt.service.impl;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.daxt.service.ArchivesInfoService;
import com.i84.earnpoint.mapper.ArchivesInfoMapper;
import com.i84.earnpoint.model.ArchivesInfo;
import com.i84.earnpoint.model.ResidenceIoInfo;
/** 档案存放信息服务具体实现类
 * @author Wangsc
 *
 */
@Service
public class ArchivesInfoServiceImpl implements ArchivesInfoService {

	@Autowired
	private ArchivesInfoMapper archivesInfoMapper;
	/**
	 * 档案存放信息列表查询
	 * @param params
	 * @return
	 */
	@Override
	public List<Map<String, Object>> qryArchivesInfoList(Map<String, Object> params) {
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
		return archivesInfoMapper.qryArchivesInfoList(params);
	}
	/**
	 * 新增档案存放位置
	 * @param archivesInfo
	 */
	@Override
	public void saveArchivesInfo(ArchivesInfo archivesInfo) {
		archivesInfoMapper.insert(archivesInfo);
	}
	/**
	 * 获取 档案存放信息
	 * @param params
	 * @return
	 */
	@Override
	public ArchivesInfo qryArchivesInfoBean(Map<String, Object> params) {
		return archivesInfoMapper.qryArchivesInfoBean(params);
	}
	/**
	 * 更新档案存放位置
	 */
	@Override
	public void updateArchivesInfo(ArchivesInfo archivesInfo) {
		archivesInfoMapper.updateByPrimaryKey(archivesInfo);
	}
	 
}
