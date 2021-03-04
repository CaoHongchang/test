package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ArchivesRewardInfo;

/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesRewardInfoService {
	 int insertArchivesRewardInfoSelective(ArchivesRewardInfo record,String fjparam,String ptype)throws Exception;
		
		int updateArchivesRewardInfoSelective(ArchivesRewardInfo record,String fjparam,String ptype)throws Exception;
		
		List<Map<String,Object>> listArchivesRewardInfos(ArchivesRewardInfo record);
}
