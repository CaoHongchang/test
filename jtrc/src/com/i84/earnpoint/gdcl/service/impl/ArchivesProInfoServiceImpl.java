package com.i84.earnpoint.gdcl.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.gdcl.service.ArchivesDisciplinedInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesProInfoService;
import com.i84.earnpoint.mapper.ArchivesMaterialOtherInfoMapper;
import com.i84.earnpoint.mapper.ArchivesProInfoMapper;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;
import com.i84.earnpoint.model.ArchivesProInfo;
@Service
public class ArchivesProInfoServiceImpl implements
ArchivesProInfoService {
	private static Logger logger = Logger.getLogger(ArchivesProInfoService.class);
	@Autowired
    private ArchivesProInfoMapper archivesProInfoMapper;
	@Autowired
	private ArchivesMaterialOtherInfoMapper archivesMaterialOtherInfoMapper;
	@Override
	public int insertArchivesProInfoSelective(ArchivesProInfo record,String fjparam,String ptype)throws Exception{
		// TODO Auto-generated method stub
	//为新增材料添加排序字段sort的数值，因原有数据没有sort字段故而有可能出现为空值的情况。
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("pno", record.getpNo());
		Integer sort;
		if(archivesProInfoMapper.getsort(map)!=null&&archivesProInfoMapper.getsort(map).get("sort")!=null&&!archivesProInfoMapper.getsort(map).get("sort").equals(""))
			sort =Integer.valueOf(archivesProInfoMapper.getsort(map).get("sort").toString())+1;
		else
			sort=0;
		record.setSort(sort);
		int c= archivesProInfoMapper.insertSelective(record);
		if(c>0){
			//新增附件列表
			ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
			//附件操作
			if(StringUtils.isNotEmpty(fjparam)){
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);

					a.setAddDate(new Date());
					a.setAid(record.getId());
					a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
					a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
					a.setStuff(record.getStuff());
					if(StringUtils.isNotEmpty(ptype))
					a.setFileType(Integer.valueOf(ptype));//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
					archivesMaterialOtherInfoMapper.insertSelective(a);
				}
			}
			
			
		}
		return c;
	}

	@Override
	@Transactional
	public int updateArchivesProInfoSelective(ArchivesProInfo record,String fjparam,String ptype)throws Exception{
		// TODO Auto-generated method stub
		logger.info("====开始做修改操作，修改的参数为：record"+record+"fjparam="+fjparam+"ptype="+ptype);
		int c= archivesProInfoMapper.updateByPrimaryKeySelective(record);
		if(c>0){
			ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
			if(StringUtils.isNotEmpty(ptype))
			a.setFileType(Integer.valueOf(ptype));//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
			a.setDelDate(new Date());
			a.setAid(record.getId());
			archivesMaterialOtherInfoMapper.deletegdcl(a);
			a=new ArchivesMaterialOtherInfo();
			
			JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
			logger.info("修改文件的id:"+a.getAid()+"==============");
			logger.info("jsonArray的大小:"+jsonArray.size());
			int iSize = jsonArray.size();
			for (int i = 0; i < iSize; i++) {
				JSONObject jsonObj = jsonArray.getJSONObject(i);
			if(StringUtils.isNotEmpty(ptype))
			a.setFileType(Integer.valueOf(ptype));
			 logger.info("保存新的图片id："+record.getId());
			a.setAddDate(new Date());
			a.setAid(record.getId());
			a.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
			a.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
			a.setStuff(record.getStuff());
			archivesMaterialOtherInfoMapper.insertSelective(a);
			}
			logger.info("=====修改保存结束=====");
		}
		return c;
	}

	@Override
	public List<Map<String,Object>> listArchivesProInfos(ArchivesProInfo record) {
		// TODO Auto-generated method stub
		return archivesProInfoMapper.selectByPno(record);
	}
}
