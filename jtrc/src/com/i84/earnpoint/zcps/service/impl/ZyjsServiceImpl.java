package com.i84.earnpoint.zcps.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.mapper.ProfessorBakInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.ZcActivityInfoMapper;
import com.i84.earnpoint.model.ProfessorBakInfo;
import com.i84.earnpoint.model.ZyImportVo;
import com.i84.earnpoint.zcps.service.ZyjsService;

/**专业技术职务任职资格
 * @author liu_quan
 *
 */
@Service
public class ZyjsServiceImpl implements ZyjsService{
	@Autowired 
	private ProfessorBakInfoMapper professorBakInfoMapper;
	@Autowired 
	private ZcActivityInfoMapper zcActivityInfoMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Override
	public List<Map<String, Object>> selectZyjsList(Map<String, Object> m)throws Exception {
		return professorBakInfoMapper.selectZyjsList(m);
	}
	@Override
	public List<Map<String, Object>> queryBusinessList(Map<String, Object> map)throws Exception {
		return zcActivityInfoMapper.queryBusinessList(map);
	}
	@Override
	public List<Map<String, Object>> selectYgList3(Map<String, Object> record)throws Exception {
		return userInfoMapper.selectYgList3(record);
	}
	@Override
	public int addzy(Map<String,Object> m) throws Exception {
		return professorBakInfoMapper.insertPro(m);
	}
	public int editZy(Map<String,Object> m) throws Exception {
		return professorBakInfoMapper.editPro(m);
	}
	@Override
	public Map<String, Object> selectIsExistByUid(Map<String, Object> m)throws Exception {
		return professorBakInfoMapper.selectIsExistByUid(m);
	}
	@Override
	public void insertZyList(List<ZyImportVo> ygList,String stuff) throws Exception {
		if(ygList!=null&&ygList.size()>0){
			for(int i=0;i<ygList.size();i++){

				ZyImportVo v=ygList.get(i);
				Map<String,Object>m=new HashMap<String, Object>();
				m.put("uid",v.getUid());
				m.put("level", v.getLevel());
				m.put("qualificationName",v.getQualificationName());
				m.put("zNo",v.getZno());
				m.put("sPart",v.getSpart());
				m.put("sDate",v.getSdate());
				m.put("addDate",new Date());
				m.put("stuff",stuff);//录入人
				m.put("isGet", v.getIsget());
				m.put("pzNo",v.getPzno());
				m.put("pro",v.getPro());
				m.put("name",v.getXm());
				m.put("activityId",v.getActivityId());
				Map<String,Object>m1 = professorBakInfoMapper.selectIsExistByUid(m);
				if(m1!=null&&(Long)m1.get("total")>=1){//存在记录更新操作
					professorBakInfoMapper.editPro(m);
				}else{//其它新增	
				professorBakInfoMapper.insertPro(m);
				}
			}
		} 
	}
	@Override
	public int updateZySelective(ProfessorBakInfo record) {
		// TODO Auto-generated method stub
		return professorBakInfoMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public ProfessorBakInfo selectZyMsg(Integer id) {
		return professorBakInfoMapper.selectByPrimaryKey(id);
	}

}
