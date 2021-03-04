package com.i84.earnpoint.zxxx.service.impl;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.mapper.ClassInfoMapper;
import com.i84.earnpoint.mapper.UserBgInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.UserScoreInfoMapper;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.UserBgInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.zxxx.service.ClassService;
/** 班级服务具体实现类
 * @author Wangsc
 *
 */
@Service
public class ClassServiceImpl implements ClassService {
	@Autowired
	public ClassInfoMapper classInfoMapper;
	@Autowired
	public UserBgInfoMapper userBgInfoMapper;
	@Autowired
	public UserInfoMapper userInfoMapper;
	@Autowired
	public UserScoreInfoMapper userScoreInfoMapper;
	/**
	 * 新增班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public void saveClassInfo(ClassInfo classInfo) throws Exception {
			 classInfoMapper.insertClassInfo(classInfo);
	}
	 /**
     * 	获取班级列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@Override
	public List<ClassInfo> queryClassList(Map<String,Object> record) {
		ResultConstant.pageSet(record);
		List<ClassInfo> list = classInfoMapper.queryClassList(record);
		return list;
	}
	/**
     * 	根据条件查询到取班级具体信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@Override
	public JSONObject queryClassInfoByParam(Map<String, Object> map) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 ClassInfo classInfo = classInfoMapper.queryClassInfoByParam(map);
			 if(classInfo != null){
				 resJsonObj.put("flag", "0");
				 resJsonObj.put("classInfo", classInfo);
			 }else{
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errorMsg", "没有查询到对应的班级信息");
			 }
			
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 编辑班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public JSONObject updateClass(ClassInfo classInfo) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 classInfoMapper.updateClass(classInfo);
			 resJsonObj.put("flag", "0");
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 失效班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@Override
	public JSONObject disabledClass(Map<String, Object> map) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 classInfoMapper.disabledClass(map);
			 resJsonObj.put("flag", "0");
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 查询班级的执行情况
	 * @param map
	 * @return
	 */
	@Override
	public Map<String, Object> queryZxqkInfoByParam(Map<String, Object> map) {
		Map<String, Object> resMap = new HashMap<String, Object>();
		resMap = classInfoMapper.queryZxqkInfoByParam(map);
		return resMap;
	}
	/**
	 * 导入培训班执行情况表
	 * @param results
	 * @return
	 */
	@Override
	public JSONObject insertClassActionInfo(List<ClassActionImportInfo> results) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 Map<String, Object> map = new HashMap<String, Object>();
			 ClassInfo classInfo = null;
			 for (ClassActionImportInfo classActionInfo : results) {
				 map.put("pno", classActionInfo.getPno());
				 classInfo = classInfoMapper.queryClassInfoByParam(map);
				 if(classInfo != null){
					 
					 //判断执行情况况是否存在
					 if(classInfoMapper.selectClassActionInfoByPno(classActionInfo.getPno())>0){
						 classInfoMapper.updateClassActionInfo(classActionInfo);
					 }else{
						 classInfoMapper.insertClassActionInfo(classActionInfo);
					 }
					 
					 
					 //修改班级状态
					 map.clear();
					 map.put("id", classInfo.getId());
					 map.put("cstate",SystemContant.CLASS_STATE_ZX );
					 classInfoMapper.updateClassCstate(map);
					 //更新报名表状态
					 UserBgInfo userBgInfo = new UserBgInfo();
					 userBgInfo.setClassId(classInfo.getId());
					 userBgInfo.setIsState(SystemContant.BG_STATE_END+"");
					 userBgInfoMapper.updateUserBgInfoState(userBgInfo);
				 }else{
					 classActionInfo.setErrMsg("没有找到对应的班级");
				 }
			}
			resJsonObj.put("flag", "0");
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 导入成绩
	 * @param results
	 * @return
	 */
	@Override
	public JSONObject insertUserScoreInfo(List<UserScoreImportInfo> results) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 Map<String, Object> map = new HashMap<String, Object>();
			 for (UserScoreImportInfo userScoreInfo : results) { 
				 String pno = userScoreInfo.getClassId();//班级编码
				 //查询班级ID
				 Map<String, Object> param = new HashMap<String, Object>();
				 param.put("pno", pno);
				 ClassInfo classInfo = classInfoMapper.queryClassInfoByParam(param);
				 UserInfo userInfo = new UserInfo();
				 userInfo.setPnum(userScoreInfo.getPnum());
				 userInfo = userInfoMapper.selectYgByclass(userInfo);
				 userScoreInfo.setClassId(classInfo.getId()+"");
				 userScoreInfo.setUid(userInfo.getId());
				 
				 if(classInfoMapper.isExistTheSameUserOfClass(userScoreInfo)>0){
					 //如果存在同一个班级同一的学院则覆盖。
					 classInfoMapper.updateUserScoreInfo(userScoreInfo);
				 }else{
					 //int cnt = userScoreInfoMapper.qryIsExist(userScoreInfo);
					 classInfoMapper.inserUserScoreInfo(userScoreInfo);
				 }
				 
				 //更新班级状态
				 param.clear();
				 param.put("id",classInfo.getId());
				 param.put("cstate",SystemContant.CLASS_STATE_CJ );
				 classInfoMapper.updateClassCstate(param);
				 
				 //更新报名表状态
				 UserBgInfo userBgInfo = new UserBgInfo();
				 userBgInfo.setClassId(classInfo.getId());
				 userBgInfo.setUserId(userInfo.getId());
				 userBgInfo.setIsState(SystemContant.BG_STATE_SCORE+"");
				 userBgInfoMapper.updateUserBgInfoState(userBgInfo);
			 }
			resJsonObj.put("flag", "0");
		} catch (Exception e) {
			e.printStackTrace();
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 判断导入的成绩是否符合规则
	 * @param results
	 * @return
	 */
	@Override
	public JSONObject checkImportUserScoreInfo(UserScoreImportInfo userScoreInfo) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 Map<String, Object> map = new HashMap<String, Object>();

			 int i = 0;
			 //判读班级编码是否存在
			 if(StringUtils.isNotBlank(userScoreInfo.getClassId())){
				 map.clear();
				 map.put("pno", userScoreInfo.getClassId());
				 ClassInfo classInfo = classInfoMapper.queryClassInfoByParam(map);
				 if(classInfo == null){
					 i = i+1;
				 }
			 }else if(StringUtils.isBlank(userScoreInfo.getClassId())){
				 i = i+1;
			 }
			 //判断用户是否存在
			 if(StringUtils.isNotBlank(userScoreInfo.getPnum())){
				 map.put("pnum", userScoreInfo.getPnum());
				 BmbImport userBean = (BmbImport)userBgInfoMapper.queryUserBgInfoByParam(map);
				 if(userBean == null){
					 i = i+2;
				 }else{
					 userScoreInfo.setUid(Integer.parseInt(userBean.getId()));
				 }
			 }else if(StringUtils.isBlank(userScoreInfo.getPnum())){
				 i = i+2;
			 }
			 
			 switch (i) {
			 case 0:
				 resJsonObj.put("flag", "0");
				 break;
			 case 1://班级不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "班级不存在");
				 break;
			 case 2://用户不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "身份证号没有对应的用户");
				 break;
			 case 3://班级和用户都不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "班级和用户都不存在");
				 break;
			 default:
				break;
			}
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	  * 获取年度执行情况
	  * @param map
	  * @return
	  */
	@Override
	public List queryNdhz(Map<String, Object> map) {
		return classInfoMapper.queryNdhz(map);
	}
	/**
	 * 判断导入的报名信息是否符合规则
	 */
	@Override
	public JSONObject checkImportUserBmInfo(BmbImport tempVo) {

		JSONObject resJsonObj = new JSONObject();
		try {
			 Map<String, Object> map = new HashMap<String, Object>();

			 int i = 0;
			 int classId=0;
			 //判读班级编码是否存在
			 if(StringUtils.isNotBlank(tempVo.getClassId())){
				 map.clear();
				 map.put("pno", tempVo.getClassId());
				 ClassInfo classInfo = classInfoMapper.queryClassInfoByParam(map);
				
				 if(classInfo == null){
					 i = i+1;
				 }else{
					 
					 classId = classInfo.getId();
				 }
			 }else if(StringUtils.isBlank(tempVo.getClassId())){
				 i = i+1;
			 }
			 //判断身份证号输入
			 if(StringUtils.isNotBlank(tempVo.getPnum())){
				 if(tempVo.getPnum().length() == 15 || tempVo.getPnum().length() == 18){
					 
				 }else{
					 i = i+2;
				 }
				 BmbImport bt = new BmbImport();
				 bt.setPnum(tempVo.getPnum());
				 bt.setClassId(classId+"");
				 int a = userBgInfoMapper.queryIsExistUserInfo(bt);
				 if(a>0)
					 i=4;
			 }else if(StringUtils.isBlank(tempVo.getPnum())){
				 i = i+2;
			 }
			 
			 switch (i) {
			 case 0:
				 resJsonObj.put("flag", "0");
				 break;
			 case 1://班级不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "班级不存在");
				 break;
			 case 2://用户不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "身份证号输入不正确");
				 break;
			 case 3://班级和用户都不存在
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "班级和身份证号输入不正确");
				 break;
			 case 4://该班级已经报名过
				 resJsonObj.put("flag", "1");
				 resJsonObj.put("errMsg", "该班级已经报名过");
				 break;
			 default:
				break;
			}
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	
	}
	/**
	 * 查询用户报名情况
	 */
	@Override
	public Object qryUserBgInfo(Map<String, Object> map) {
		return userBgInfoMapper.queryUserBgInfoByParam(map);
	}
	/**
	 * 根据班级ID查询学时和成绩为空的个数
	 * @param classId
	 * @return
	 */
	@Override
	public Integer qryCntScore2StimeNull(Integer classId) {
		return classInfoMapper.qryCntScore2StimeNull(classId);
	}
	@Override
	public void updateClassCstate(Map<String,Object> params) {
		classInfoMapper.updateClassCstate(params);
	}
}
