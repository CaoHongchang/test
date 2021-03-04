package com.i84.earnpoint.zcps.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.WorkCurInfo;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.ZcActivityGet;
import com.i84.earnpoint.model.ZcDissertationInfo;

public interface ZcActivityGetService {
	/**
	 * 插入评审活动
	 * @param zcActivityInfo
	 * @return
	 */
	int insertZcActivityGet(ZcActivityGet recork);
	/**
	 * 修改评审活动
	 * @param zcActivityInfo
	 * @return
	 */
	int updateZcActivityGet(ZcActivityGet recork);
	
	/**
	 * 删除评审活动
	 * @param ids
	 * @return
	 */
	int deleteZcActivityGet(String ids);
	/**
	 * 根据ID获取评审活动
	 * @param id
	 * @return
	 */
	ZcActivityGet selectZcActivityGetById(Integer id);
	
	int updateByPrimaryKeySelective(ZcActivityGet zcActivityGet);
	
	List<Map<String,Object>> queryList(Map<String,Object> recork);
	List<Map<String,Object>> queryListExcel(Map<String,Object> map);
	List<Map<String,Object>> queryListExcel1(Map<String,Object> map);
	List<Map<String,Object>> queryListExcel2(Map<String,Object> map);
	

	List<Map<String,Object>> queryZCPSBaseInfo(Map<String,Object> params);
	String queryZCPSBaseInfo1(ZcActivityGet params);
	/**
	 * 
	 * @param record
	 * @return
	 */
	ZcActivityGet selectZcActivityGetByActivityIdAndUid(ZcActivityGet record);
	String showxxjlsave(String activityid,int uid, String xxjlid, String schoolName, String inData ,String graduationDate, String proName, String xz, String getMethod, String education, String degree );

	String zcsbtj(String path, MultipartFile file,ZcActivityGet zaget);
	String zcsbdel(int delid);

	String showlwzzsave(String path, ZcDissertationInfo obj,String fjParam);
	String showjxjysave(StudyUpInfo obj);
	String showgzjlsave(WorkInfo obj);
	
	String showxxjldel(int delid);
	String showgzjldel(int delid);
	String showjxjydel(int delid);
	String showlwzzdel(int delid);
	
	  List<Map> selectfj(Map map);
	  
	  int selectZCPSBaseInfoList2(ZcActivityGet params);
 
}
