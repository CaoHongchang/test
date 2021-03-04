package com.i84.earnpoint.gdcl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ArchivesMaterialInfo;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;

/**
 * 履历材料
 * @author CHEN
 *
 */
public interface ArchivesMaterialInfoService {
	 int insertArchivesMaterialInfoSelective(ArchivesMaterialInfo record,String fjparam,String ptype)throws Exception;
		
		int updateArchivesMaterialInfoSelective(ArchivesMaterialInfo record,String fjparam,String ptype)throws Exception;
		
		List<Map<String,Object>> listArchivesMaterialInfos(ArchivesMaterialInfo record);
		
		public void exportMaterialList(String pnos,HttpServletResponse response)throws Exception;
		
		public List<Map<String,Object>>selectByClFjList(Map<String, Object>m)throws Exception ;
		
		ArchivesMaterialOtherInfo selectByPrimaryKey(Integer id);

}
