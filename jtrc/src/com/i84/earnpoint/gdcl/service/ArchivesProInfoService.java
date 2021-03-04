package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesProInfo;

/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesProInfoService {
	 int insertArchivesProInfoSelective(ArchivesProInfo record,String fjparam,String ptype)throws Exception;
		
		int updateArchivesProInfoSelective(ArchivesProInfo record,String fjparam,String ptype)throws Exception;
		
		List<Map<String,Object>> listArchivesProInfos(ArchivesProInfo record);
}
