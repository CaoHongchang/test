package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesPoliticalInfo;

/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesPoliticalInfoService {
	 int insertArchivesPoliticalInfoSelective(ArchivesPoliticalInfo record,String fjparam,String ptype);
		
		int updateArchivesPoliticalInfoSelective(ArchivesPoliticalInfo record,String fjparam,String ptype);
		
		List<Map<String,Object>> listArchivesPoliticalInfos(ArchivesPoliticalInfo record);
}
