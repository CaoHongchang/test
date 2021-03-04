package com.i84.earnpoint.gdcl.service;

import com.i84.earnpoint.model.ArchivesDisciplinedInfo;

import java.util.List;
import java.util.Map;
/**
 * 自传材料
 * @author CHEN
 *
 */
public interface ArchivesDisciplinedInfoService {

	int insertDisciplinedInfoSelective(ArchivesDisciplinedInfo record,String fjparam,String ptype)throws Exception;
	
	int updateDisciplinedInfoSelective(ArchivesDisciplinedInfo record,String fjparam,String ptype)throws Exception;
	
	List<Map<String,Object>> listArchivesDisciplinedInfos(ArchivesDisciplinedInfo record);
}
