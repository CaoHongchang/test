package com.i84.earnpoint.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.PlaceInfoMapper;
import com.i84.earnpoint.model.PlaceInfo;
import com.i84.earnpoint.service.PlaceInfoService;
@Service
public class PlaceInfoServiceImpl implements PlaceInfoService {
	@Autowired
    private PlaceInfoMapper placeInfoMapper;
	@Override
	public int insertPlaceInfo(PlaceInfo placeInfo) {
		// TODO Auto-generated method stub
		return placeInfoMapper.insertSelective(placeInfo);
	}

	@Override
	public int updatePlaceInfo(PlaceInfo placeInfo) {
		// TODO Auto-generated method stub
		return placeInfoMapper.updateByPrimaryKeySelective(placeInfo);
	}

	@Override
	public List<PlaceInfo> selectPlaceInfoByPrimaryKey(PlaceInfo placeInfo) {
		// TODO Auto-generated method stub
		return placeInfoMapper.selectPlaceInfoBySelective(placeInfo);
	}

	@Override
	public int deletePlaceInfo(String ids) {
		// TODO Auto-generated method stub
		String []array=ids.split(",");
		int count=0;
		for(int i=0;i<array.length;i++){
			PlaceInfo placeInfo=new PlaceInfo();
			placeInfo.setId(Integer.valueOf(array[i]));
			placeInfo.setDelDate(new Date());
			count+=placeInfoMapper.updateByPrimaryKeySelective(placeInfo);
		}
		return count;
	}

	public PlaceInfo selectPlaceInfoById(Integer id){
		return placeInfoMapper.selectByPrimaryKey(id);
	}
	
	public PlaceInfo selectByPno(PlaceInfo record){
		return placeInfoMapper.selectByPno(record);
	}

	@Override
	public String generateFlowNum(Integer activityCode) {
		// TODO Auto-generated method stub
		String num=placeInfoMapper.selectMaxPno(activityCode);
		int max=0;
		if(num!=null){
			max=Integer.valueOf(num);
		}
		return String.format("%03d", max+1);
	}
}
