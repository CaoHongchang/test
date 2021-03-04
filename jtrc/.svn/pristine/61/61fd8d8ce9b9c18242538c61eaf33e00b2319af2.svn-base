package com.i84.earnpoint.zcps.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ProfessorBakInfo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.model.ZyImportVo;

/**专业技术职务任职资格
 * @author liu_quan
 *
 */
public interface ZyjsService {

	public List<Map<String,Object>>selectZyjsList(Map<String,Object> m)throws Exception;
	public List<Map<String,Object>> queryBusinessList(Map<String,Object>map)throws Exception;
	public List<Map<String,Object>>selectYgList3(Map<String,Object> record)throws Exception;
	public int addzy(Map<String,Object> record)throws Exception;
	public  Map<String, Object> selectIsExistByUid(Map<String, Object> m)throws Exception;
	public int editZy(Map<String,Object> m) throws Exception; 
	public void insertZyList(List<ZyImportVo> ygList,String stuff)throws Exception;
	int updateZySelective(ProfessorBakInfo record);
	ProfessorBakInfo selectZyMsg(Integer id);


}
