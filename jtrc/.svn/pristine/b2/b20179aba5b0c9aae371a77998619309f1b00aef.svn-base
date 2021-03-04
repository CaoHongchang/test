package com.i84.earnpoint.gdcl.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.swing.LookAndFeel;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.gdcl.BO.SerchBO;
import com.i84.earnpoint.gdcl.service.SortService;
import com.i84.earnpoint.mapper.ArchivesDisciplinedInfoMapper;
import com.i84.earnpoint.mapper.ArchivesKhInfoMapper;
import com.i84.earnpoint.mapper.ArchivesMaterialInfoMapper;
import com.i84.earnpoint.mapper.ArchivesMaterialOtherInfoMapper;
import com.i84.earnpoint.mapper.ArchivesMyInfoMapper;
import com.i84.earnpoint.mapper.ArchivesOtherInfoMapper;
import com.i84.earnpoint.mapper.ArchivesOutInfoMapper;
import com.i84.earnpoint.mapper.ArchivesPoliticalInfoMapper;
import com.i84.earnpoint.mapper.ArchivesProInfoMapper;
import com.i84.earnpoint.mapper.ArchivesPtInfoMapper;
import com.i84.earnpoint.mapper.ArchivesRewardInfoMapper;
import com.i84.earnpoint.model.ArchivesMaterialOtherInfo;



/**
 * 对材料进行排序的serviceImple，添加人：邓祯。添加时间：2017年3月19日12:04:14
 */
@Service
public class SortServiceImple implements SortService{
	private static Logger logger = Logger.getLogger(SortServiceImple.class);
	//档案履历材料
	@Autowired
	private ArchivesMaterialInfoMapper archivesMaterialInfoMapper;
	
	//档案自传材料
	@Autowired
	private ArchivesMyInfoMapper archivesMyInfoMapper;
	
	//档案鉴定考核材料
	@Autowired
	private ArchivesKhInfoMapper archivesKhInfoMapper;
	
	//档案学历和评聘专业职务材料
	@Autowired
	private ArchivesProInfoMapper archivesProInfoMapper;
	
	//档案政审材料
	@Autowired
	private ArchivesPoliticalInfoMapper archivesPoliticalInfoMapper;
	
	//党团材料
	@Autowired
	private ArchivesPtInfoMapper archivesPtInfoMapper;
	
	//奖励材料
	@Autowired
	private ArchivesRewardInfoMapper archivesRewardInfoMapper;
	
	//处分材料
	@Autowired
	private ArchivesDisciplinedInfoMapper archivesDisciplinedInfoMapper;
	
	//工资，任免等材料
	@Autowired
	private ArchivesOutInfoMapper archivesOutInfoMapper;
	
	//其他材料
	@Autowired
	private ArchivesOtherInfoMapper archivesOtherInfoMapper;
	
	@Autowired
	private ArchivesMaterialOtherInfoMapper archivesMaterialOtherInfoMapper;

	
	@Override
	public Map<String,Object> Svae(List<SerchBO> list) {
		int resultcount;
		Map<String,Object> resultMap=new HashMap<String,Object>();
		for (SerchBO serchBO : list) {
			switch (serchBO.getType()) {
			case 1:
				resultcount=archivesMaterialInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 2:
				resultcount=archivesMyInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 3:
				resultcount=archivesKhInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 4:
				resultcount=archivesProInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 5:
				resultcount=archivesPoliticalInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 6:
				resultcount=archivesPtInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 7:
				resultcount=archivesRewardInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 8:
				resultcount=archivesDisciplinedInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 9:
				resultcount=archivesOutInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			case 10:
				resultcount=archivesOtherInfoMapper.sort(serchBO);
				if(resultcount!=0){
					resultMap.put("flag", true);
				}else{
					resultMap.put("flag", false);
				}
				break;
			
			default:
				resultMap.put("flag", false);
				break;
			}
		}
		
		return resultMap;
	}


	@Override
	public Map<String, Object> delete(Map<String,Object> map) {
		logger.info("=======开始删除==========");
		int resultcount;
		Map<String,Object> resultMap=new HashMap<String, Object>();
		resultcount=archivesMaterialInfoMapper.delete_cl(map);
		logger.info("删除返回值 不为0删除:"+resultcount);
		if(resultcount!=0){
			resultMap.put("flag", true);
		}else{
			resultMap.put("flag", false);
		}
		logger.info("=========删除结束==========");
		return resultMap;
	}


	@Override
	public Map<String,Object> updatePotho(Map<String,Object> map) {
		int resultcount;
		Map<String,Object> resultMap=new HashMap<String, Object>();
		ArchivesMaterialOtherInfo a=new ArchivesMaterialOtherInfo();
		String aid = (String) map.get("aid");
        String file_type = (String) map.get("file_type");
        a.setFileType(Integer.valueOf(file_type));//材料类型（1：履历材料 2：自传材料 3：鉴定考核考察材料 4：鉴定考核考察材料 5：政审材料 6：党员材料 7：奖励材料 8：处分材料9：工资变动材料 10：其他材料）
        a.setAid(Integer.valueOf(aid));
        a.setDelDate(null);
        resultcount = archivesMaterialOtherInfoMapper.deletegdcl(a);
		if(resultcount!=0){
			resultMap.put("flag", true);
		}else{
			resultMap.put("flag", false);
		}
		return resultMap;
	}
	
	

}
