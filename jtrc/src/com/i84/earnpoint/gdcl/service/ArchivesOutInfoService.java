package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesOutInfo;

/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesOutInfoService {
	 int insertArchivesOutInfoSelective(ArchivesOutInfo record,String fjparam,String ptype)throws Exception;
		
		int updateArchivesOutInfoSelective(ArchivesOutInfo record,String fjparam,String ptype)throws Exception;
		
		List<Map<String,Object>> listArchivesOutInfos(ArchivesOutInfo record);
}
