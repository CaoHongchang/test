package com.i84.earnpoint.rygl.service;

import java.text.ParseException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.OfficialInfo;
import com.i84.earnpoint.model.RewardsInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.WorkInfo;


/**
 * 人员管理服务接口
 * @author wangsc
 *
 */
public interface RyglService {
	/**
     * 	获取人员表列表
     */
	List<Map<String, Object>> queryUserList(Map<String, Object> record);
	/**
	 * 人才管理信息
	 * @param userInfo
	 */
	int inserUserMgInfo(UserMgInfo userMgInfo);
	/**
	 * 新增的人员
	 * @param userInfo
	 */
	int inserUserInfo(UserInfo userInfo);
	/**
	 * 新增工作简历
	 * @param daPnum
	 * @param workInfo
	 */
	void saveWorkInfo(WorkInfo workInfo)throws Exception;
	
	/**
	 * 根据用户身份证查询对应的工作简历
	 * @param pnum
	 * @return
	 */
	List<WorkInfo> qryWorkInfo(String pnum);
	/**
	 * 工作经历删除
	 * @param wInfo
	 */
	void disabledWorkInfo(WorkInfo wInfo);
	/**
	 * 工作简历更新操作
	 * @param updateObj
	 */
	void updateWorkInfo(HttpServletRequest request,String da_dpno,String id,String startDate,String endDate,String enterpriseId,String departmentId,String placeId,String workName);
	
	/**
	 * 获取专家列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryExpertUserList(Map<String, Object> record);
	public List<Map<String, Object>> queryExpertUserList2(Map<String, Object> record);
	public List<Map<String,Object>> queryExpertUserList3(Map<String, Object> record);//抽专家
	public List<Map<String,Object>> queryExpertUserList4(Map<String, Object> record);//抽专家
	public List<Map<String,Object>> queryExpertUserList5(Map<String, Object> record);//抽专家
	
	
	/**
	 * 新增专家信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addExpertInfo(UserExpertInfo userExpertInfo,UserInfo userInfo, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改专家信息
	 * @param userExpertInfo
	 * @return
	 */
	public void updateExpertInfo(UserExpertInfo userExpertInfo, UserInfo userInfo, HttpServletResponse response) throws Exception;
	
	public void updateExpert(UserExpertInfoPickUp userExpertInfoPickUp, HttpServletResponse response) throws Exception;
	
	/**
	 * 删除专家信息
	 * @param id
	 * @return
	 */
	public void delExpertInfo(String id, HttpServletResponse response) throws Exception;
	
	public void delExpert(String id, HttpServletResponse response) throws Exception;
	
	/**
	 * 获取党员列表
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryPartyUserList(Map<String, Object> record);
	
	/**
	 * 新增党员信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addPartyInfo(UserPartyInfo userPartyInfo,UserInfo userInfo,List<UserPartyIn> userPartyInList,List<UserPartyOut> userPartyOutList, HttpServletResponse response) throws Exception;
	
	/**
	 * 修改党员信息
	 * @param userExpertInfo
	 * @return
	 */
	public void updatePartyInfo(UserPartyInfo userPartyInfo, UserInfo userInfo,List<UserPartyIn> userPartyInList,List<UserPartyOut> userPartyOutList, HttpServletResponse response) throws Exception;
	
	/**
	 * 删除党员信息
	 * @param id
	 * @return
	 */
	public void delPartyInfo(String id, HttpServletResponse response) throws Exception;
	 /**
     * 
     * 新增教育简历
     */
	void saveStudyInfo(StudyInfo studyInfo)throws Exception;
	void svaeStudyUpInfo(StudyUpInfo studyUpInfo);
	/**
	 * 奖励情况新增
	 * @param rewardsInfo
	 */
	void saveRewardsInfo(RewardsInfo rewardsInfo);
	
	/**
	 * 根据党员ID获取党员转入信息
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryPartyInListByParty(int party);
	
	/**
	 * 根据党员ID获取党员转出信息
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryPartyOutListByParty(int party);
	
	/**
	 * 更改来源
	 * @param id
	 * @param response
	 * @throws Exception
	 */
	public void updateMsgFromInfo(MsgFromInfo record, HttpServletResponse response) throws Exception;
	/**
     * 	获取奖励情况表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	List<Map<String, Object>> qryRewardsInfo(String uid);
	/**
	 * 获取职务职称列表
	 * @param uid
	 * @return
	 */
	List<Map<String, Object>> qryOfficialInfo(String uid);
	/**
     * 	获取职业培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	List<Map<String, Object>> qryStudyUpInfo(String uid);
	/**
     * 	获取教育培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	List<Map<String, Object>> qryStudyInfo(String uid);
	/**
	 * 删除用户
	 * @param id
	 * @throws Exception
	 */
	void disabledUserInfo(String id) throws Exception;
	/**
	 *  重置密码
	 * @param id
	 */
	void rePswUserInfo(String id);
	/**
	 * 审核
	 * @param map
	 */
	void ryxxCheckInfo(Map<String, Object> map);
	/**
	 * 职务职称
	 * @param officialInfo
	 */
	void saveOfficialInfo(OfficialInfo officialInfo);
	
	/**
	 * 新增党员信息列表
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addPartyInfoList(List<UserPartyInfo> userPartyInfo,List<UserInfo> userInfo,List<UserPartyIn> userPartyInList,List<UserPartyOut> userPartyOutList, HttpServletResponse response) throws Exception;
	/**
	 * 新增档案信息
	 * @param msgFromInfo
	 */
	void saveMsgFromInfo(MsgFromInfo msgFromInfo);
	/**
	 * 查询用户基本信息
	 * @param uid
	 * @return
	 */
	Map<String, Object> qryUseBaseMs(String uid,String mid);
	/**
     * 更新用户信息
     */
	Map updateUserInfo(HttpServletRequest request,	int userId,String da_dpno,String mid,String da_name,String da_old_name,String da_sex,String da_mz,String da_pnum,String da_birthday,
			String da_jg_name,String da_domicile,String da_domicile_place,String da_zzmm,String da_marital_status,String da_degree,String da_school,
			String da_graduation_time,String da_major,String da_work_name,String da_work_time,String da_tel,String da_qq,String da_email,String da_remark,String da_img_url,String max_degree,String max_graduation_time,String max_major,String max_school) throws ParseException ;
	
	void updateUserMgInfo(HttpServletRequest request,String da_dpno,UserMgInfo userMgInfo,int userId);
	/**
	 * 新增用户的工作简历
	 * @param daPnum
	 * @param workInfo
	 */
	void saveWorkInfo(String daPnum, WorkInfo workInfo);
	/**
	 * 获取用户信息
	 * @param record
	 * @return
	 */
	UserInfo selectYg(UserInfo record);
	/**
	 * 教育培训更新
	 * @param major 
	 * @param studyInfo
	 */
	void updateStudyInfo(HttpServletRequest request,String da_dpno,String id,String studyTypeId,String schoolName,String inDate,String graduationDate,String education,String degree,String certificate, String major) throws ParseException;
	/**
	 * 删除教育培训信息
	 * @param id
	 */
	void disabledStudyInfo(Integer id);
	/**
	 * 职业培训新增
	 * @param studyInfo
	 */
	void saveStudyUpInfo(StudyUpInfo studyInfo);
	/**
	 *  职业培训更新
	 * @param studyInfo
	 */
	void updateStudyUpInfo(HttpServletRequest request,String da_dpno,String trainingUnit,String trainDate,String outDate,String officeDate,String office,String trainNo,String id);
	/**
	 * 职业培训删除
	 */
	void disabledStudyUpInfo(int parseInt);
	/**
	 *  奖励情况更新
	 * @param rewardsInfo
	 */
	void updateRewardsInfo(HttpServletRequest request,String da_dpno,String id,String reward_name,String pz_date,String en_name,String cx_date);
	 /**
     * 奖励情况删除
     */
	void disabledRewardsInfo(int parseInt);
	/**
	 * 职务职称更新
	 * @param officialInfo
	 */
	void updateOfficialInfo(HttpServletRequest request,String da_dpno,String id,String p_level,String p_method,String pro_z_name,String pro_name,String department_id,String pz_date1,String pz_no);
	/**
	 *  删除职务职称
	 * @param parseInt
	 */
	void disabledOfficialInfo(int parseInt);
	
	/**
	 * 获取档案编号
	 * @return
	 */
	public String getNextPno();
	
	/**
	 * 新增党员转入信息列表
	 * @param userPartyInList
	 * @return
	 * @throws Exception 
	 */
	public void addPartyInList(List<UserPartyIn> userPartyInList, HttpServletResponse response) throws Exception;
	
	/**
	 * 新增党员转出信息列表
	 * @param userPartyOutList
	 * @return
	 * @throws Exception 
	 */
	public void addPartyOutList(List<UserPartyOut> userPartyOutList, HttpServletResponse response) throws Exception;
	
	/**
	 * 新增专家信息列表
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addExpertInfoList(List<UserExpertInfo> userPartyInfo,List<UserInfo> userInfo, HttpServletResponse response) throws Exception;

	public void addExpertInfoList2(List<UserExpertInfoPickUp> userPartyInfo, HttpServletResponse response) throws Exception;

	

	public UserMgInfo getUserMgInfoById(int id);
	
	/**
	 * 重置密码身份证后6位
	 * @param id
	 * @param pwd
	 */
	public void resetUserInfoPwd(int id,String pwd);
	
	
	public UserMgInfo selectByUid(Integer id);
	
	public int updateUser(UserInfo userInfo);
	
	public UserInfo selectByDpno(UserInfo userInfo);
	
	//修改selected全部为否
	public int updateEffectedToTrueByzpno(String zpno);
	
	public int updateEffectedToFalseByzpno(String zpno);
	
	public int updateSelectedToFalse();
	
	public int updateSelectedToTrue(int uid);
	
	public int updateEffectedToTrue(int id);
	
	public int updateEffectedToFalse(String pro_type);
	//获取所有公司
	public List<String> queryAllCompany();
	//获取子库公司
	public List<String> queryCompanyByPro_type(String pro_type);
	//抽专家
	public List<Map<String,Object>> queryExpertUserListByPro_Type(String pro_type);
	
	public List<Map<String,Object>> quertyPro_type();
	
	/**
	 * 新增抽专家信息
	 * @param userExpertInfo
	 * @return
	 * @throws Exception 
	 */
	public void addExpertInfoMore(UserExpertInfoPickUp userExpertInfoPickUp, HttpServletResponse response) throws Exception;
	
	
	
}