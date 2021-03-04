package com.i84.earnpoint.sydwzp.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.BgActivityUserScoreInfoMapper;
import com.i84.earnpoint.model.BgActivityUserScoreInfo;
import com.i84.earnpoint.model.ExportScore;
import com.i84.earnpoint.sydwzp.service.BgActivityUserScoreInfoService;
@Service
public class BgActivityUserScoreInfoServiceImpl implements BgActivityUserScoreInfoService{

	@Resource
	private BgActivityUserScoreInfoMapper bgActivityUserScoreInfoMapper;
	
	@Override
	public BgActivityUserScoreInfo selectByPrimaryKey(Integer id) {
		return bgActivityUserScoreInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<Map<String, Object>> activityPlaceList(Map<String, Object> param) {
		return bgActivityUserScoreInfoMapper.activityPlaceList(param);
	}

	@Override
	public List<Map<String, Object>> userScoreList(Map<String, Object> param) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.userScoreList(param);
	}

	@Override
	public int updateByPrimaryKeySelective(BgActivityUserScoreInfo record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public List<Map<String, Object>> checkIn(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.checkIn(record);
	}
	
	@Override
	public List<Map<String, Object>> checkIn3(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.checkIn3(record);
	}
	@Override
	public List<Map<String, Object>> checkIn2(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.checkIn2(record);
	}
	
	@Override
	public List<Map<String, Object>> checkIn4(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.checkIn4(record);
	}

	@Override
	public int queryUserId(String pnum) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.queryUserId(pnum);
	}

	@Override
	public int insertSelective(BgActivityUserScoreInfo record) {
		// TODO Auto-generated method stub
		return bgActivityUserScoreInfoMapper.insertSelective(record);
	}

	@Override
	public void deleteOrder(Integer id) {
		bgActivityUserScoreInfoMapper.deleteOrder(id);
	}

	@Override
	public void exportOrder(Map<String, Object> param, HttpServletResponse response, HttpServletRequest request) throws Exception {
		OutputStream out = null;  
		try {
			
			List<ExportScore> exportOrder = bgActivityUserScoreInfoMapper.exportOrder(param);
			ExcelExport<ExportScore> ex = new ExcelExport<ExportScore>();
			List resultList=new ArrayList(); 
			if(exportOrder.size()>0){
				
				List<ExportScore> da1 = new ArrayList();
				for (int i = 0; i < exportOrder.size(); i++) {
					ExportScore dv = exportOrder.get(i);
					da1.add(dv);
				}
				
				resultList.add(da1);
			}
			
			
			
			String fileName = "成绩排名导出.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("成绩信息");
			String syDelTitle="";
			
			Map<String,Object>title=new HashMap<String, Object>();
			title.put("1", syDelTitle);	
			ex.exportExcel2(titleList, resultList, title,output);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
}
