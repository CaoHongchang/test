package com.i84.earnpoint.zxxx.service;

import java.io.IOException;
import java.util.List;
import java.util.Map;
import net.sf.json.JSONObject;

import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.UserBgInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;


/**
 * 班级服务接口
 * @author Wangsc
 *
 */
public interface ClassService {
	/**
	 * 新增班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public void saveClassInfo(ClassInfo classInfo)throws Exception;
	 /**
     * 	获取班级列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	public List<ClassInfo> queryClassList(Map<String,Object> record);
	/**
     * 	根据条件查询到取班级具体信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	public JSONObject queryClassInfoByParam(Map<String, Object> map);
	/**
	 * 编辑班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public JSONObject updateClass(ClassInfo classInfo);
	/**
	 * 失效班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	public JSONObject disabledClass(Map<String, Object> map);
	/**
	 * 查询班级的执行情况
	 * @param map
	 * @return
	 */
	public Map<String, Object> queryZxqkInfoByParam(Map<String, Object> map);
	/**
	 * 导入培训班执行情况表
	 * @param results
	 * @return
	 */
	public JSONObject insertClassActionInfo(List<ClassActionImportInfo> results);
	/**
	 * 导入成绩
	 * @param results
	 * @return
	 */
	public JSONObject insertUserScoreInfo(List<UserScoreImportInfo> results);
	/**
	 * 判断导入的成绩是否符合规则
	 * @param results
	 * @return
	 */
	JSONObject checkImportUserScoreInfo(UserScoreImportInfo userScoreInfo);
	 /**
	  * 获取年度执行情况
	  * @param map
	  * @return
	  */
	public List queryNdhz(Map<String, Object> map);
	/**
	 * 判断导入的报名信息是否符合规则
	 */
	public JSONObject checkImportUserBmInfo(BmbImport tempVo);
	/**
	 * 查询用户报名情况
	 */
	public Object qryUserBgInfo(Map<String, Object> map);
	/**
	 * 根据班级ID查询学时和成绩为空的个数
	 * @param classId
	 * @return
	 */
	public Integer qryCntScore2StimeNull(Integer classId);
	
	/**
	 * 更新班级状态
	 * @param pno
	 * @param cstate
	 */
	public void updateClassCstate(Map<String,Object> params);
	
}