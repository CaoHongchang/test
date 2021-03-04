package com.i84.earnpoint.sjbb.service;

import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.ClassInfoMapper;
import com.i84.earnpoint.mapper.EnterpriseInfoMapper;
import com.i84.earnpoint.mapper.RsBusinessInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;

@Service
public class BbtjService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private ClassInfoMapper classInfoMapper;
	@Autowired
	private EnterpriseInfoMapper enterpriseInfoMapper;
	@Autowired
	private RsBusinessInfoMapper rsBusinessInfoMapper;
	
	/**
	 * 党员数量统计
	*/
	public List countdysl(Map map){
		if(map.get("time_type").equals("month")){
		return userInfoMapper.countdyslBymonth(map);
		}else{
			return userInfoMapper.countdyslByyear(map);
		}
	}
	
	/**
	 * 培训完成情况统计
	 */
	public List countpxwcqk(Map map){
	
		return classInfoMapper.countpxwcqk(map);
	}
	
	/**
	 * 培训人员情况统计
	 */
	public List countpxryqktj(Map map){
	return classInfoMapper.countpxryqktj(map);
	}
	/**
	 * 企业数量统计
	 */
	public List countqysltj(Map map){
		return enterpriseInfoMapper.countqysltj(map);
	}
	/**
	 * 业务办理数量统计
	 * @param map
	 * @return
	 */
	public  List countywlxtj(Map map){
		
		return rsBusinessInfoMapper.countywblsltj(map);
	}
	
	public List countywblsltj(Map map){
	if(map.get("time_type").equals("month")){
		return rsBusinessInfoMapper.countywlxtjbymonth(map);
		}else{
			return rsBusinessInfoMapper.countywlxtjbyyear(map);
		}
		
	}
}
