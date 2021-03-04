package com.i84.earnpoint.daxt.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.daxt.service.ArchivesBaseInfoService;
import com.i84.earnpoint.mapper.ArchivesBaseInfoMapper;
import com.i84.earnpoint.mapper.ResidenceInfoMapper;
import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.Statistical;
 
/**
 * 人员管理服务具体实现类
 * @author wangsc
 *
 */
@Service
public class ArchivesBaseInfoServiceImpl implements ArchivesBaseInfoService {
	@Autowired
	private ArchivesBaseInfoMapper archivesBaseInfoMapper;
	
	@Autowired
	private ResidenceInfoMapper residenceInfoMapper;

	@Override
	public void addArchivesBaseInfo(ArchivesBaseInfo archivesBaseInfo,
			HttpServletResponse response) throws Exception {
		try{
			int tem = archivesBaseInfoMapper.insertSelective(archivesBaseInfo);
			if(tem > 0){
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "新增失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "新增失败");
		}
	}

	@Override
	public List<Map<String, Object>> queryArchivesBaseInfoList(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
//		List<Map<String, Object>> rs = new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> list = archivesBaseInfoMapper.selectArchivesBaseInfoList(record);
//		for (int i = 0; i < list.size(); i++) {
//			Map<String,Object> r = list.get(i);
//			if(TextUtil.getInt(r.get("p_state"))==1||TextUtil.getInt(r.get("p_state"))==2){
//				rs.add(r);
//			}
//		}
//		return rs;
		return list;
	}
	@Override
	public List<Map<String, Object>> queryArchivesBaseInfoList1(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		List<Map<String, Object>> list = archivesBaseInfoMapper.selectArchivesBaseInfoList1(record);
		
		return list;
	}

	@Override
	public void updateArchivesBaseInfo(ArchivesBaseInfo archivesBaseInfo,
			HttpServletResponse response) throws Exception {
		try{
			int tem = archivesBaseInfoMapper.updateByPrimaryKeySelective(archivesBaseInfo);
			if(tem > 0){
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "修改失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "修改失败");
		}
	}

	@Override
	public void delArchivesBaseInfo(String ids,String pid, HttpServletResponse response)
			throws Exception {
		String[] idt = ids.split(",");
		for (int i = 0; i < idt.length; i++) {
			
			ArchivesBaseInfo ab = archivesBaseInfoMapper.selectByPrimaryKey(TextUtil.getInt(idt[i]));
			ab.setDelDate(new Date());
			ab.setDelId(TextUtil.getInt(pid));
			archivesBaseInfoMapper.updateByPrimaryKeySelective(ab);
		}
		
		ResultConstant.write(response, "1");
	}

	@Override
	public List<Map<String, Object>> QueryBaseinfoList(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		List<Map<String, Object>> list = archivesBaseInfoMapper.getcllist(record);
		
		return list;
	}

	@Override
	public List<Map<String, Object>> sendByYear(String year1, String year2, String timeType, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.sendByYear(year1, year2, timeType, fileType);
		return list;
	}

	@Override
	public List<Map<String, Object>> sjdasltj(String year1, String year2, String timeType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.sjdasltj(year1, year2,timeType);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> rswbtj(String year1, String year2, String timeType, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.rswbtj(year1, year2, timeType, fileType);
		return list;
	}

	
	@Override
	public List<Map<String, Object>> dwdltj(String year1, String year2, String timeType, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.dwdltj(year1, year2, timeType, fileType);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> xbtj(String year1, String year2, String timeType, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.xbtj(year1, year2, timeType, fileType);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> sex(String year1, String year2, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.sex(year1, year2,fileType);
		return list;
	}

	@Override
	public List<Map<String, Object>> birthDate(String year1, String year2,
			String timeType, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.birthDate(year1, year2, timeType, fileType);
		return list;
	}

	
	
	@Override
	public List<Map<String, Object>> degree(String year1, String year2, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.degree(year1, year2,fileType);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> zzmm(String year1, String year2, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.zzmm(year1, year2,fileType);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> dtype(String year1, String year2, String fileType) {
		List<Map<String, Object>> list = archivesBaseInfoMapper.dtype(year1, year2,fileType);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> QueryCheckBaseinfoList(
			Map<String, Object> record) {
		
		List<Map<String, Object>> list = archivesBaseInfoMapper.getcheckllist(record);
		
		return list;
	}

	
}
