package com.i84.earnpoint.sydwzp.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.BgActivityArgInfoMapper;
import com.i84.earnpoint.model.BgActivityArgInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityArgInfoService;

/**
 * 活动参数信息
 * @author linyj
 *
 */
@Service
public class BgActivityArgInfoServiceImpl extends BaseService implements BgActivityArgInfoService {

	@Resource
	private BgActivityArgInfoMapper bgActivityArgInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return bgActivityArgInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BgActivityArgInfo record) {
		return 0;
	}

	@Override
	public int insertSelective(BgActivityArgInfo record) {
		return bgActivityArgInfoMapper.insertSelective(record);
	}

	@Override
	public BgActivityArgInfo selectByPrimaryKey(Integer id) {
		return bgActivityArgInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BgActivityArgInfo record) {
		// TODO Auto-generated method stub
		return bgActivityArgInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BgActivityArgInfo record) {
		return 0;
	}

	@Override
	public List<BgActivityArgInfo> queryBgActivityArgInfo4List(BgActivityArgInfo bgActivityArgInfo) {
		return bgActivityArgInfoMapper.queryBgActivityArgInfo4List(bgActivityArgInfo);
	}

	@Override
	public Map<String, Object> queryBgActivityArgInfo4Bean(String key,String value) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put(key, value);
		return bgActivityArgInfoMapper.queryBgActivityArgInfo4Bean(param);
	}

	@Override
	public List<Map<String, Object>> queryBgActivityArgInfos(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return bgActivityArgInfoMapper.selectListBySelective(param);
	}

	@Override
	public BgActivityArgInfo selectByActivityId(Integer activityId) {
		return bgActivityArgInfoMapper.selectByActivityId(activityId);
	}

}
