package com.i84.earnpoint.sydwzp.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.mapper.BgActivityInfoMapper;
import com.i84.earnpoint.model.BgActivityInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityInfoService;

/**
 * 活动信息
 * @author linyj
 *
 */
@Service
public class BgActivityInfoServiceImpl extends BaseService implements BgActivityInfoService {

	@Resource
	private BgActivityInfoMapper bgActivityInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		return bgActivityInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(BgActivityInfo record) {
		return 0;
	}

	@Override
	public int insertSelective(BgActivityInfo record) {
		return bgActivityInfoMapper.insertSelective(record);
	}

	@Override
	public BgActivityInfo selectByPrimaryKey(Integer id) {
		return bgActivityInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(BgActivityInfo record) {
		// TODO Auto-generated method stub
		return bgActivityInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(BgActivityInfo record) {
		return 0;
	}

	@Override
	public List<BgActivityInfo> selectListByPrimary(BgActivityInfo bgActivityInfo, int page, int rows) {
		PageHelper.startPage(page,rows);
		return bgActivityInfoMapper.selectListByPrimary(bgActivityInfo);
	}

	@Override
	public String selectMaxPno() {
		return bgActivityInfoMapper.selectMaxPno();
	}

	@Override
	public List<Map<String, Object>> queryBgActivityInfos(Map<String, Object> param) {
		return bgActivityInfoMapper.selectListBySelective(param);
	}
	
	@Override
	public List<Map<String, Object>> queryBgActivityInfos2(Map<String, Object> param) {
		return bgActivityInfoMapper.selectListBySelective2(param);
	}

	@Override
	public BgActivityInfo queryByPno(String pno) {
		// TODO Auto-generated method stub
		return bgActivityInfoMapper.queryByPno(pno);
	}

	@Override
	public List<Map<String, Object>> selectListAcBeforeStart(Map param) {
		// TODO Auto-generated method stub
		return bgActivityInfoMapper.selectListAcBeforeStart(param);
	}

	@Override
	public List<Map<String, Object>> selectListAcAll(Map param) {
		// TODO Auto-generated method stub
		return bgActivityInfoMapper.selectListAcAll(param);
	}
	
	

}
