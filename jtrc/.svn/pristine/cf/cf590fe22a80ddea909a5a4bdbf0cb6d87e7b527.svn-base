package com.i84.earnpoint.daxt.service.impl;


import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.daxt.service.ResidenceQsInfoService;
import com.i84.earnpoint.mapper.AdverInfoMapper;
import com.i84.earnpoint.mapper.ArchivesBaseInfoMapper;
import com.i84.earnpoint.mapper.ArchivesMaterialOtherInfoMapper;
import com.i84.earnpoint.mapper.ResidenceGetoutInfoMapper;
import com.i84.earnpoint.mapper.ResidenceInfoMapper;
import com.i84.earnpoint.mapper.ResidenceQsInfoMapper;
import com.i84.earnpoint.mapper.RewardsInfoMapper;
import com.i84.earnpoint.mapper.StudyInfoMapper;
import com.i84.earnpoint.mapper.StudyUpInfoMapper;
import com.i84.earnpoint.mapper.UserExpertInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.UserMgInfoMapper;
import com.i84.earnpoint.mapper.WorkInfoMapper;
import com.i84.earnpoint.mapper.UserPartyInfoMapper;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.RewardsInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.mapper.UserPartyInMapper;
import com.i84.earnpoint.mapper.UserPartyOutMapper;
import com.i84.earnpoint.mapper.MsgFromInfoMapper;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.ResidenceQsInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.rygl.service.RyglService;
 
/**
 * 档案缺失信息服务具体实现类
 * @author wangsc
 *
 */
@Service
public class ResidenceQsInfoServiceImpl implements ResidenceQsInfoService {
	@Autowired
	private ResidenceQsInfoMapper residenceQsInfoMapper;
	
	@Autowired
	private ResidenceInfoMapper residenceInfoMapper;
	
	@Autowired
	private ArchivesBaseInfoMapper archivesBaseInfoMapper;
	@Autowired
	private ArchivesMaterialOtherInfoMapper archivesMaterialOtherInfoMapper;

	@Override
	public void addResidenceQsInfo(ResidenceQsInfo residenceQsInfo,String fjparam,
			HttpServletResponse response) throws Exception {
		try{
			//新增附件列表
			ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
			
			int tem = residenceQsInfoMapper.insertSelective(residenceQsInfo);
			if(tem > 0){
				//附件操作
				if(StringUtils.isNotEmpty(fjparam)){
					JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
					int iSize = jsonArray.size();
					for (int i = 0; i < iSize; i++) {
						JSONObject jsonObj = jsonArray.getJSONObject(i);

						a.setAddDate(new Date());
						a.setAid(residenceQsInfo.getId());
						a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
						a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
						a.setStuff(residenceQsInfo.getUid());//上传人
						a.setFileType(20);//材料类型（20:档案缺失材料管理附件    1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
						archivesMaterialOtherInfoMapper.insertSelective(a);
					}
				}
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "新增失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "新增失败");
		}
		
	}

	@Override
	public List<Map<String, Object>> queryResidenceQsInfoList(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
//		return archivesBaseInfoMapper.selectArchivesBaseInfoList(record);
		return residenceQsInfoMapper.selectResidenceQsInfoList(record);
	}

	@Override
	public void updateResidenceQsInfo(
			ResidenceQsInfo residenceQsInfo,String fjparam,
			HttpServletResponse response) throws Exception {
		try{
			int tem = residenceQsInfoMapper.updateByPrimaryKeySelective(residenceQsInfo);
			if(tem > 0){
				ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
				
				a.setFileType(20);//材料类型（20:档案缺失材料管理附件 1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
				a.setDelDate(new Date());
				a.setAid(residenceQsInfo.getId());
				archivesMaterialOtherInfoMapper.updateByPrimaryKeySelective(a);
			
				
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					a=new ArchivesMaterialOtherInfo();
				a.setFileType(20);
				a.setAddDate(new Date());
				a.setAid(residenceQsInfo.getId());
				a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
				a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
				a.setStuff(residenceQsInfo.getUid());
				archivesMaterialOtherInfoMapper.insertSelective(a);
				}
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "修改失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "修改失败");
		}
	}

	@Override
	public List<Map<String, Object>> queryResidenceQsInfoByDid(
			Map<String, Object> record) {
		
		return residenceQsInfoMapper.selectResidenceQsInfoBydid(record);
	}

	@Override
	public void deleteResidenceQsInfos(String[] ids,
			HttpServletResponse response) throws Exception {
		try{
			int temp=residenceQsInfoMapper.deleteResidenceQsInfosByIds(ids);
			if(temp>0){
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "删除失败");
			}
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "删除失败");
		}
		
	}

	

}
