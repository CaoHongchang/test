package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesMyInfo;

/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesMyInfoService {
	 int insertArchivesMyInfoSelective(ArchivesMyInfo record,String fjparam,String ptype);
		
		int updateArchivesMyInfoSelective(ArchivesMyInfo record,String fjparam,String ptype);
		
		List<Map<String,Object>> listArchivesMyInfos(ArchivesMyInfo record);
}
