package com.i84.earnpoint.rygl.service.impl;


import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.AdverInfoMapper;
import com.i84.earnpoint.mapper.OfficialInfoMapper;
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
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.OfficialInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.rygl.service.RyglService;
import com.i84.earnpoint.service.UserInfoService;
 
/**
 * 人员管理服务具体实现类
 * @author wangsc
 *
 */
@Service
public class RyglServiceImpl implements RyglService {
	@Autowired
	private UserInfoMapper userInfoMapper;
	
	@Autowired
	private UserMgInfoMapper userMgInfoMapper;
	
	@Autowired
	private WorkInfoMapper workInfoMapper;
	
	@Autowired
	private UserExpertInfoMapper userExpertInfoMapper;
	
	@Autowired
	private UserPartyInfoMapper userPartyInfoMapper;
		
	@Autowired
	private StudyInfoMapper studyInfoMapper;
	
	@Autowired
	private OfficialInfoMapper officialInfoMapper;
	
	@Autowired
	private UserPartyInMapper userPartyInMapper;
	
	@Autowired
	private StudyUpInfoMapper studyUpInfoMapper;
	
	@Autowired
	private RewardsInfoMapper rewardsInfoMapper;
	
	@Autowired
	private UserPartyOutMapper userPartyOutMapper;
	
	@Autowired
	private MsgFromInfoMapper msgFromInfoMapper;
	
	@Autowired
	private UserInfoService userInfoService;
	/**
     * 	获取人员表列表
     */
	@Override
	public List<Map<String, Object>> queryUserList(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return userInfoMapper.queryUserList(record);
	}
	
	/**
	 * 新增的人员
	 * @param userInfo
	 */
	@Override
	public int inserUserInfo(UserInfo userInfo) {
		int userId = 0 ;
		UserInfo paramObj_dpno=new UserInfo();
		if(userInfo.getDpno()!=null){
			paramObj_dpno.setDpno(userInfo.getDpno());
			List<UserInfo> dpno = userInfoMapper.selectUserInfoBySelective1(paramObj_dpno);
			if(dpno != null && dpno.size() > 0)
				return userId;
		}
		if(userInfo.getPnum()==null||userInfo.getPnum().trim().equals("")){
			 userInfoMapper.insertReturnKey(userInfo);
			 userId = userInfo.getId();
			 return userId;
		}
		UserInfo paramObj = new UserInfo();
		
		paramObj.setPnum(userInfo.getPnum());
//		if(userInfo.getName()!=null&&!userInfo.getName().trim().equals(""))
//		paramObj.setName(userInfo.getName());
		
		List<UserInfo> resList = userInfoMapper.selectUserInfoBySelective1(paramObj);
		if(resList != null && resList.size() > 0 ){//已经存在了。做更新操作
//			paramObj = resList.get(0);
//			userId = paramObj.getId();
//			userInfo.setId(userId);
//			userInfoMapper.updateByPrimaryKey(userInfo);
			userId=-1;
			return userId;
		}else{//不存在。做新增操作
			 userInfoMapper.insertReturnKey(userInfo);
			 userId = userInfo.getId();
		}
		return userId;
	}
	/**
	 * 人才管理信息
	 * @param userInfo
	 */
	@Override
	public int inserUserMgInfo(UserMgInfo userMgInfo) {
		int a = 0;
		UserMgInfo uf = userMgInfoMapper.selectByUid(userMgInfo.getUid());
		if(uf==null){
			userMgInfoMapper.insert(userMgInfo);
			a=0;
		}else{
			a=1;
		}
		return a;
		
	}
	/**
	 * 新增工作简历
	 * @param daPnum
	 * @param workInfo
	 * @throws Exception 
	 */
	@Override
	public void saveWorkInfo(WorkInfo workInfo) throws Exception {

		workInfoMapper.insert(workInfo);
	}
	/**
	 * 根据用户身份证查询对应的工作简历
	 * @param pnum
	 * @return
	 */
	@Override
	public List<WorkInfo> qryWorkInfo(String userId) {
		List<WorkInfo> workList = new ArrayList<WorkInfo>();
		workList = workInfoMapper.selectByUserId(Integer.parseInt(userId));
		return workList;
	}
	/**
	 * 工作经历删除
	 * @param wInfo
	 */
	@Override
	public void disabledWorkInfo(WorkInfo wInfo) {
		 workInfoMapper.deleteByPrimaryKey(wInfo.getId());
	}
	/**
	 * 工作简历更新操作
	 * @param updateObj
	 */
	@Override
	public void updateWorkInfo(HttpServletRequest request,String da_dpno,String id,String startDate,String endDate,String enterpriseId,String departmentId,String placeId,String workName) {
		
		
		WorkInfo updateObj = workInfoMapper.selectByPrimaryKey(Integer.parseInt(id));
    	if(StringUtils.isNotBlank(startDate)){
    		updateObj.setStartDate(startDate);
		}
		
		if(StringUtils.isNotBlank(endDate)){
			updateObj.setEndDate(endDate);
		}
		if(!"".equals(enterpriseId))
    	updateObj.setEnterpriseId(enterpriseId);
		if(!"".equals(departmentId))
    	updateObj.setDepartmentId(departmentId);
		if(!"".equals(placeId))
    	updateObj.setPlaceId(placeId);
		if(!"".equals(workName))
        	updateObj.setWorkName(workName);
		
		WorkInfo paramObj = workInfoMapper.selectByPrimaryKey(updateObj.getId());
		updateObj.setAddDate(new Date());
		updateObj.setpUid(TextUtil.getInt(request.getSession().getAttribute("uid")+""));
		userInfoService.ufcheck(request, da_dpno, paramObj.getpUid(), paramObj, updateObj);
		workInfoMapper.updateByPrimaryKeySelective(updateObj);
	} 
	
	/**
     * 	获取专家列表
     */
	@Override
	public List<Map<String, Object>> queryExpertUserList(Map<String, Object> record) {
		PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		return userExpertInfoMapper.selectUserExpertList(record);
	}

	public List<Map<String, Object>> queryExpertUserList2(Map<String, Object> record) {
		return userExpertInfoMapper.selectUserExpertList(record);

	}
	/**
	 * 抽专家用
	 * 获取专家
	 */
	public List<Map<String,Object>> queryExpertUserList3(Map<String, Object> record) {   //抽专家
		return userExpertInfoMapper.selectUserExpertListMore(record);

	}
	/**
	 * 抽专家用
	 * 获取专家
	 */
	public List<Map<String,Object>> queryExpertUserList4(Map<String, Object> record) {   //抽专家
		PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		return userExpertInfoMapper.selectUserExpertListMore(record);
	}
	
	public List<Map<String,Object>> queryExpertUserList5(Map<String, Object> record) {   //抽专家
		PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		return userExpertInfoMapper.selectUserExpertListMoreOrder(record);
	}
	
	/**
	 * 抽专家用
	 * 获取该组别的专家
	 */
	public List<Map<String,Object>> queryExpertUserListByPro_Type(String type) {  
		return userExpertInfoMapper.selectUserExpertListByPro_type(type);

	}
	/**
	 * 抽专家用
	 * 设置专家为非中状态(多次抽取时使用)
	 */
	public int updateSelectedToFalse()   //抽专家
	{
		return userExpertInfoMapper.updateSelectedToFalse();
	}
	
	/**
	 * 抽专家用
	 * 设置专家为选中状态(多次抽取时使用)
	 */
	public int updateSelectedToTrue(int uid)   //抽专家
	{
		return userExpertInfoMapper.updateSelectedToTrue(uid);
	}
	
	/**
	 * 抽专家用
	 * 通过专家编码设置专家为上一次评委
	 */
	public int updateEffectedToTrueByzpno(String zpno)   
	{
		return userExpertInfoMapper.updateEffectedToTrueByzpno(zpno);
	}
	
	/**
	 * 抽专家用
	 * 通过专家编码设置专家为非上一次评委
	 */
	public int updateEffectedToFalseByzpno(String zpno)   
	{
		return userExpertInfoMapper.updateEffectedToFalseByzpno(zpno);
	}
	
	/**
	 * 抽专家用
	 * 设置专家为上一次评委
	 */
	public int updateEffectedToTrue(int id)   
	{
		return userExpertInfoMapper.updateEffectedToTrue(id);
	}
	
	/**
	 * 抽专家用
	 * 设置专家为非上一次评委
	 */
	public int updateEffectedToFalse(String pro_type)   
	{
		return userExpertInfoMapper.updateEffectedToFalse(pro_type);
	}
	
	public List<Map<String,Object>> quertyPro_type()
	{
		return userExpertInfoMapper.selectPro_type();
	}
	
	/**
	 * 抽专家用
	 * 获得所有公司列表
	 */
	public List<String> queryAllCompany() {   
		return userExpertInfoMapper.selectAllCompany();

	}
	/**
	 * 抽专家用
	 * 根据组别获得公司列表
	 */
	public List<String> queryCompanyByPro_type(String pro_type)  
	{
		return userExpertInfoMapper.selectCompanyByPro_type(pro_type);
	}
	
	/**
	 * 抽专家用
	 * 新增信息
	 */
	@Override
	public void addExpertInfoMore(UserExpertInfoPickUp userExpertInfoPickUp,
			HttpServletResponse response) throws Exception {
		int flag=0;
			if(flag==0)
			{
			int tem=0;

				 tem = userExpertInfoMapper.insertPickUp(userExpertInfoPickUp);
				if(tem > 0){
					ResultConstant.write(response, "1");
				}else{
					ResultConstant.write(response, "新增失败");
				}
			}
			//}
	
		
	}
	
	@Override
	public void addExpertInfo(UserExpertInfo userExpertInfo,UserInfo userInfo,
			HttpServletResponse response) throws Exception {
		int uid = 0;
		String password = "";
		try{
			UserInfo user = userInfoMapper.selectYg(userInfo);
			
			try{
				password = userInfo.getPnum().substring(userInfo.getPnum().length()-6, userInfo.getPnum().length());
				password = MD5.GetMD5Code(MD5.GetMD5Code(password));
			}catch(Exception e){
				e.printStackTrace();
			}
			if(null != user && user.getId() > 0){
				uid = user.getId();
				userInfoMapper.updateByPrimaryKeySelective(userInfo);
			}else{
				userInfo.setPwd(password);
				//表明没有此用户信息，需要保存
				userInfoMapper.insertReturnKey(userInfo);
				int sex = 0;
				try{
					sex = Integer.parseInt(userInfo.getSex());
				}catch(Exception e){
				}
				saveMsgFromInfo(userInfo.getName(),sex,userInfo.getPnum(),0,"内部创建");
				uid = userInfo.getId();
			}
		}catch(Exception e){
			userInfo.setPwd(password);
			//表明没有此用户信息，需要保存
			userInfoMapper.insertReturnKey(userInfo);
			uid = userInfo.getId();
		}
		userExpertInfo.setUid(uid);
		int tem = userExpertInfoMapper.insertSelective(userExpertInfo);
		if(tem > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "新增失败");
		}
	}

	@Override
	public void delExpertInfo(String ids, HttpServletResponse response) throws Exception {
		
		try{
			String[] strings = ids.split(",");
			for(String string:strings){
				UserExpertInfo userExpertInfo = new UserExpertInfo();
				userExpertInfo.setDelDate(new Date());
				userExpertInfo.setId(Integer.parseInt(string));
				userExpertInfoMapper.updateByPrimaryKeySelective(userExpertInfo);
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "删除失败");
		}
		
		
		
		
//		int tem = userExpertInfoMapper.deleteByPrimaryKey(Integer.parseInt(ids));
//		if(tem > 0){
//			ResultConstant.write(response, "1");
//		}else{
//			ResultConstant.write(response, "删除失败");
//		}
	}

	@Override
	public void delExpert(String ids, HttpServletResponse response) throws Exception {
		
		try{
			String[] strings = ids.split(",");
			for(String string:strings){
				UserExpertInfoPickUp userExpertInfo = new UserExpertInfoPickUp();
				userExpertInfo.setDel_date(new Date());
				userExpertInfo.setId(Integer.parseInt(string));
				userExpertInfoMapper.updatePickUp(userExpertInfo);
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "删除失败");
		}	
	}
	
	@Override
	public void updateExpertInfo(UserExpertInfo userExpertInfo,UserInfo userInfo,
			HttpServletResponse response) throws Exception {
		int tem = userInfoMapper.updateByPrimaryKey(userInfo);
		int tem2 = userExpertInfoMapper.updateByPrimaryKeySelective(userExpertInfo);
		if(tem > 0 && tem2 > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
	}
	
	@Override
	public void updateExpert(UserExpertInfoPickUp userExpertInfoPickUp,
			HttpServletResponse response) throws Exception {
		int tem = userExpertInfoMapper.updatePickUp(userExpertInfoPickUp);
		
		if(tem > 0 ){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
	}
	
	
	@Override
	public List<Map<String, Object>> queryPartyUserList(
			Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return userPartyInfoMapper.selectUserPartyList(record);
	} 

	@Override
	public void addPartyInfo(UserPartyInfo userPartyInfo, UserInfo userInfo,List<UserPartyIn> userPartyInList,List<UserPartyOut> userPartyOutList,
			HttpServletResponse response) throws Exception {
		int uid = 0;
		boolean flag = false;
		try{
			UserInfo user = userInfoMapper.selectYg(userInfo);
			if(null != user && user.getId() > 0){
				uid = user.getId();
				Map<String, Object> params = new HashMap<String, Object>();
				params.put("uid", uid);
				//判断党员信息是否已经存在，已经存在则提示
				List list = userPartyInfoMapper.selectUserPartyList(params);
				if(null != list && list.size() > 0){
					ResultConstant.write(response, "该党员信息已存在!");
					flag = true;
				}
			}else{
				String password = "";
				try{
					password = userInfo.getPnum().substring(userInfo.getPnum().length()-6, userInfo.getPnum().length());
					password = MD5.GetMD5Code(MD5.GetMD5Code(password));
				}catch(Exception e){
					e.printStackTrace();
				}
				userInfo.setPwd(password);
				//表明没有此用户信息，需要保存
				userInfoMapper.insertReturnKey(userInfo);
				int sex = 0;
				try{
					sex = Integer.parseInt(userInfo.getSex());
				}catch(Exception e){
				}
				saveMsgFromInfo(userInfo.getName(),sex,userInfo.getPnum(),0,"内部创建");
				uid = userInfo.getId();
			}
		}catch(Exception e){
			//表明没有此用户信息，需要保存
			userInfoMapper.insertReturnKey(userInfo);
			uid = userInfo.getId();
		}
		if(!flag){
			userPartyInfo.setUid(uid);
			int tem = userPartyInfoMapper.insertSelectiveForKey(userPartyInfo);
			if(tem > 0){
				if(null != userPartyInList && userPartyInList.size() > 0){
					for(UserPartyIn in:userPartyInList){
						in.setParty(userPartyInfo.getId());
						userPartyInMapper.insertSelective(in);
					}
				}
				if(null != userPartyOutList && userPartyOutList.size() > 0){
					for(UserPartyOut out:userPartyOutList){
						out.setParty(userPartyInfo.getId());
						userPartyOutMapper.insertSelective(out);
					}
				}
				ResultConstant.write(response, "1");
			}else{
				ResultConstant.write(response, "新增失败");
			}
		}
	}

	@Override
	public void delPartyInfo(String ids, HttpServletResponse response)
			throws Exception {
		
		try{
			String[] strings = ids.split(",");
			for(String string:strings){
				UserPartyInfo userPartyInfo = new UserPartyInfo();
				userPartyInfo.setDelDate(new Date());
				userPartyInfo.setId(Integer.parseInt(string));
				userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
				
				//up.setId(Integer.parseInt(string));
				UserPartyInfo up=userPartyInfoMapper.selectByPrimaryKey(Integer.parseInt(string));
				UserInfo user = new UserInfo();
				user.setId(up.getUid());
				user.setDelDate(new Date());
				userInfoMapper.updateByPrimaryKeySelective(user);
				
				UserPartyIn userPartyIn = new UserPartyIn();
				userPartyIn.setDelDate(new Date());
				userPartyIn.setParty(Integer.parseInt(string));
				userPartyInMapper.updateByPrimaryKeySelectiveForParty(userPartyIn);
				
				UserPartyOut userPartyOut = new UserPartyOut();
				userPartyOut.setDelDate(new Date());
				userPartyOut.setParty(Integer.parseInt(string));
				userPartyOutMapper.updateByPrimaryKeySelectiveForParty(userPartyOut);
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "删除失败");
		}
//		int tem = userPartyInfoMapper.deleteByPrimaryKey(Integer.parseInt(id));
//		if(tem > 0){
//			ResultConstant.write(response, "1");
//		}else{
//			ResultConstant.write(response, "删除失败");
//		}
	}

	@Override
	public void updatePartyInfo(UserPartyInfo userPartyInfo, UserInfo userInfo,List<UserPartyIn> userPartyInList,List<UserPartyOut> userPartyOutList,
			HttpServletResponse response) throws Exception {
		
		String password = userInfo.getPwd();
		if("".equals(password) || password==null){
		try{
			password = userInfo.getPnum().substring(userInfo.getPnum().length()-6, userInfo.getPnum().length());
			password = MD5.GetMD5Code(MD5.GetMD5Code(password));
		}catch(Exception e){
			e.printStackTrace();
		}
		userInfo.setPwd(password);
		}
		int tem = userInfoMapper.updateByPrimaryKey(userInfo);
		int tem2 = userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
		UserPartyIn userPartyIn = new UserPartyIn();
		userPartyIn.setDelDate(new Date());
		userPartyIn.setParty(userPartyInfo.getId());
		userPartyInMapper.updateByPrimaryKeySelectiveForParty(userPartyIn);
		
		UserPartyOut userPartyOut = new UserPartyOut();
		userPartyOut.setDelDate(new Date());
		userPartyOut.setParty(userPartyInfo.getId());
		userPartyOutMapper.updateByPrimaryKeySelectiveForParty(userPartyOut);
		if(tem > 0 && tem2 > 0){
			if(null != userPartyInList && userPartyInList.size() > 0){
				for(UserPartyIn in:userPartyInList){
					userPartyInMapper.insertSelective(in);
				}
			}
			if(null != userPartyOutList && userPartyOutList.size() > 0){
				for(UserPartyOut out:userPartyOutList){
					userPartyOutMapper.insertSelective(out);
				}
			}
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
	}
    /**
     * 
     * 新增教育简历
     */
	@Override
	public void saveStudyInfo(StudyInfo studyInfo)throws Exception { 
		studyInfoMapper.insert(studyInfo);
	}
	/**
     * 
     * 新增奖励情况
     */
	@Override
	public void saveRewardsInfo(RewardsInfo rewardsInfo) {
		rewardsInfoMapper.insert(rewardsInfo);
	}
   /**
    * 新增职业培训
    */
	@Override
	public void svaeStudyUpInfo(StudyUpInfo studyUpInfo) {
		studyUpInfoMapper.insert(studyUpInfo);
	}

	@Override
	public List<Map<String, Object>> queryPartyInListByParty(int party) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("party", party);
		return userPartyInMapper.selectByPrimaryKeyForParty(params);
	}

	@Override
	public List<Map<String, Object>> queryPartyOutListByParty(int party) {
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("party", party);
		return userPartyOutMapper.selectByPrimaryKeyForParty(params);
	}
	
	public int saveMsgFromInfo(String name,int sex,String pnum,int is_state,String msg_name){
		MsgFromInfo msgFromInfo = new MsgFromInfo();
		msgFromInfo.setName(name);
		msgFromInfo.setSex(sex);
		msgFromInfo.setIsState(is_state);
		msgFromInfo.setPnum(pnum);
		msgFromInfo.setMsgName(null != msg_name?msg_name:"内部创建");
		return msgFromInfoMapper.insertSelective(msgFromInfo);
	}

	@Override
	public void updateMsgFromInfo(MsgFromInfo record,
			HttpServletResponse response) throws Exception {
		
		try{
			msgFromInfoMapper.updateByPrimaryKeySelective(record);
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "审核失败");
		}
		
	}

	@Override
	public List<Map<String, Object>> qryOfficialInfo(String uid) {
		 return officialInfoMapper.selectByUserId(Integer.parseInt(uid));
	}
	/**
     * 	获取奖励情况表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@Override
	public List<Map<String, Object>> qryRewardsInfo(String uid) {
		return rewardsInfoMapper.selectByUserId(Integer.parseInt(uid));
	}
	/**
     * 	获取教育培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@Override
	public List<Map<String, Object>> qryStudyInfo(String uid) {
		return studyInfoMapper.selectByUserId(Integer.parseInt(uid));
	}
	/**
     * 	获取职业培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@Override
	public List<Map<String, Object>> qryStudyUpInfo(String uid) {
		return studyUpInfoMapper.selectByUserId(Integer.parseInt(uid));
	}
	/**
	 * 删除用户
	 * @param id
	 * @throws Exception
	 */
	@Override
	public void disabledUserInfo(String uid) throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("uid", uid);
		params.put("isState", 0);
		params.put("delDate", new Date());
		msgFromInfoMapper.updateIsState(params);
		
		UserMgInfo userMgInfo = new UserMgInfo();
		userMgInfo.setIsState("0");
		userMgInfo.setUid(Integer.parseInt(uid));
		userMgInfo.setDelDate(new Date());
		userMgInfoMapper.updateIsState(userMgInfo);
		
		UserInfo uf = userInfoMapper.selectByPrimaryKey(TextUtil.getInt(uid));
		if(uf!=null)
			uf.setDelDate(new Date());
		userInfoMapper.updateByPrimaryKeySelective(uf);
	}
	/**
	 *  重置密码
	 * @param id
	 */
	@Override
	public void rePswUserInfo(String id) {
		UserInfo record = new UserInfo();
		record.setId(Integer.parseInt(id));
		record.setPwd("123456");
		userInfoMapper.updateByPrimaryKeySelective(record);
	}
	/**
	 * 审核
	 * @param id
	 */
	@Override
	public void ryxxCheckInfo(Map<String, Object> params) {
		userMgInfoMapper.ryxxCheckInfo(params);
//		params.put("isState", Integer.parseInt(params.get("checkStatus").toString()));
//		params.put("delDate", new Date());
//		msgFromInfoMapper.updateIsState(params);
	}
	/**
	 * 职务职称
	 * @param officialInfo
	 */
	@Override
	public void saveOfficialInfo(OfficialInfo officialInfo) {
		officialInfoMapper.insert(officialInfo);
	}

	@Override
	public void addPartyInfoList(List<UserPartyInfo> userPartyInfoList,
			List<UserInfo> userInfoList, List<UserPartyIn> userPartyInList,
			List<UserPartyOut> userPartyOutList, HttpServletResponse response)
			throws Exception {
		String msg = "";
		for(int i=0;i<userPartyInfoList.size();i++){
			UserPartyInfo userPartyInfo = userPartyInfoList.get(i);
			UserInfo userInfo = userInfoList.get(i);
			int uid = 0;
			try{
				UserInfo user = userInfoMapper.selectYg(userInfo);
				if(null != user && user.getId() > 0){
					uid = user.getId();
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("uid", uid);
					//判断党员信息是否已经存在，已经存在则提示(后面改为界面提示直接更新)
					List<Map<String,Object>> list = userPartyInfoMapper.selectUserPartyList(params);
					if(null != list && list.size() > 0){
//						if(StringUtils.isNotBlank(msg)){
//							msg += ",["+userInfo.getName()+"]党员信息已存在!";
//						}else{
//							msg += "["+userInfo.getName()+"]党员信息已存在!";
//						}
						userPartyInfo.setId(Integer.parseInt((""+list.get(0).get("id"))));
						userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
						continue;
					}else{
						
					}
				}else{
					String password = "";
					try{
						password = userInfo.getPnum().substring(userInfo.getPnum().length()-6, userInfo.getPnum().length());
						password = MD5.GetMD5Code(MD5.GetMD5Code(password));
					}catch(Exception e){
						e.printStackTrace();
					}
					userInfo.setPwd(password);
					//表明没有此用户信息，需要保存
					userInfoMapper.insertReturnKey(userInfo);
					int sex = 0;
					try{
						sex = Integer.parseInt(userInfo.getSex());
					}catch(Exception e){
					}
					saveMsgFromInfo(userInfo.getName(),sex,userInfo.getPnum(),0,"内部创建");
					uid = userInfo.getId();
				}
			}catch(Exception e){
				//表明没有此用户信息，需要保存
				userInfoMapper.insertReturnKey(userInfo);
				uid = userInfo.getId();
			}
			userPartyInfo.setUid(uid);
			String pno = getNextPno();
			userPartyInfo.setPno("PM" + pno);
			int tem = userPartyInfoMapper.insertSelectiveForKey(userPartyInfo);
		}
		if(StringUtils.isNotBlank(msg)){
			System.out.println("------------false------------" + msg);
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
		}else{
			System.out.println("------------true------------");
			ResultConstant.write(response, "导入成功");
//			ResultConstant.write(response, "导入成功!");
		}
	}

	@Override
	public void saveMsgFromInfo(MsgFromInfo msgFromInfo) {
		msgFromInfoMapper.insert(msgFromInfo);
	}

	@Override
	public Map<String, Object> qryUseBaseMs(String uid,String mid) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("id", uid);
		param.put("mid", mid);
		param= userInfoMapper.qryUseBaseMs(param);
		if(param!=null){
			try {
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,param, "birth_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,param, "graduation_time");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,param, "da_sp_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,param, "work_time");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,param, "sp_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,param, "create_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,param, "out_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,param, "add_date");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,param, "max_graduation_time");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return param;
	}
    /**
     * 更新用户信息
     * @throws ParseException 
     */
	@Override
	public Map updateUserInfo(HttpServletRequest request,int userId ,String da_dpno,String mid,String da_name,String da_old_name,String da_sex,String da_mz,String da_pnum,String da_birthday,
		String da_jg_name,String da_domicile,String da_domicile_place,String da_zzmm,String da_marital_status,String da_degree,String da_school,
		String da_graduation_time,String da_major,String da_work_name,String da_work_time,String da_tel,String da_qq,String da_email,String da_remark,String da_img_url
		,String max_degree,String max_graduation_time,String max_major,String max_school) throws ParseException {
		

				
		//USERIFNO
		UserInfo userInfo = userInfoMapper.selectByPrimaryKey(userId);
		userInfo.setName(da_name);
		userInfo.setOldName(da_old_name);
		userInfo.setSex(da_sex);
		userInfo.setMz(da_mz);
		userInfo.setPnum(da_pnum);
		if(StringUtils.isNotBlank(da_birthday)){
			da_birthday=da_birthday.replace("/", "-");
			userInfo.setBirthDate(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(da_birthday+" 00:00"));
		}
		userInfo.setJgName(da_jg_name);
		userInfo.setDomicile(da_domicile);
		userInfo.setDomicilePlace(da_domicile_place);
		userInfo.setZzmm(da_zzmm);
		userInfo.setMaritalStatus(da_marital_status);
		userInfo.setDegree(da_degree);
		userInfo.setSchool(da_school);
		if(StringUtils.isNotBlank(da_graduation_time)){
			da_graduation_time=da_graduation_time.replace("/", "-");
			userInfo.setGraduationTime(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(da_graduation_time+" 00:00"));
		}
		userInfo.setMajor(da_major);
		userInfo.setWorkName(da_work_name);
		if(StringUtils.isNotBlank(da_work_time)){
			da_work_time=da_work_time.replace("/", "-");
			userInfo.setWorkTime(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(da_work_time+" 00:00"));
		}
		userInfo.setTel(da_tel);
		userInfo.setQq(da_qq);
		userInfo.setEmail(da_email);
		userInfo.setRemark(da_remark);
		userInfo.setImgUrl(da_img_url);
		userInfo.setAddDate(new Date());
		if(da_dpno!=null)
		userInfo.setDpno(da_dpno);
        
		userInfo.setPid(TextUtil.getInt(request.getSession().getAttribute("uid")));
		
        userInfo.setMax_school(max_school);
		userInfo.setMax_major(max_major);
		userInfo.setMax_degree(max_degree);
		if(StringUtils.isNotBlank(max_graduation_time)){
			max_graduation_time=max_graduation_time.replace("/", "-");
			userInfo.setMax_graduation_time(new SimpleDateFormat("yyyy-MM-dd hh:mm").parse(max_graduation_time+" 00:00"));
		}
		Map p = new HashMap();

		UserInfo paramObj = userInfoMapper.selectByPrimaryKey(userInfo.getId());
//		paramObj.setPnum(userInfo.getPnum());
//		List<UserInfo> resList = userInfoMapper.selectUserInfoBySelective(paramObj);
//		if(resList != null && resList.size() > 0){//已经存在了。做更新操作
//			paramObj = resList.get(0);
			userId = paramObj.getId();
			userInfo.setId(userId);
			p.put("userid", userId+"");
			p.put("pid", paramObj.getPid()+"");
			userInfoService.ufcheck(request, da_dpno, TextUtil.getInt(paramObj.getPid()+""), paramObj, userInfo);
			userInfoMapper.updateByPrimaryKey(userInfo);
//		} 
		return p;
	}

	@Override
	public void updateUserMgInfo(HttpServletRequest request,String da_dpno,UserMgInfo userMgInfo,int userId) {
		// TODO Auto-generated method stub
		
		UserMgInfo uf1 = userMgInfoMapper.selectByUid(userMgInfo.getUid());

		if(uf1!=null)
		userInfoService.ufcheck(request, da_dpno, userId, uf1, userMgInfo);
		userMgInfoMapper.updateByUid(userMgInfo);
	}
	/**
	 * 新增用户的工作简历
	 * @param daPnum
	 * @param workInfo
	 */
	@Override
	public void saveWorkInfo(String daPnum, WorkInfo workInfo) {
		UserInfo record = new UserInfo();
		record.setPnum(daPnum);
		record = userInfoMapper.selectYg(record);
		workInfo.setUid(record.getId());
		workInfoMapper.insert(workInfo);
	}
/**
 * 获取用户信息
 */
	@Override
	public UserInfo selectYg(UserInfo record) {
		return userInfoMapper.selectYg(record);
	}

	/**
	 * 教育培训更新
	 * @throws ParseException 
	 */
	@Override
	public void updateStudyInfo(HttpServletRequest request,String da_dpno,String id,String studyTypeId,String schoolName,String inDate,String graduationDate,String education,String degree,String certificate,String major) throws ParseException {
		
		//新增对象
		StudyInfo studyInfo = studyInfoMapper.selectByPrimaryKey(Integer.parseInt(id));
		if(!"".equals(studyTypeId))
			studyInfo.setStudyTypeId(studyTypeId);
		if(!"".equals(schoolName))
			studyInfo.setSchoolName(schoolName);
		if(!"".equals(inDate))
			studyInfo.setInDate(new SimpleDateFormat("yyyy-MM-dd").parse(inDate));
		if(!"".equals(graduationDate))
			studyInfo.setGraduationDate(new SimpleDateFormat("yyyy-MM-dd").parse(graduationDate));
		if(!"".equals(education))
			studyInfo.setEducation(education);
		if(!"".equals(degree))
			studyInfo.setDegree(degree);
		if(!"".equals(certificate))
			studyInfo.setCertificate(certificate);
		if(!"".equals(major))
			studyInfo.setMajor(major);
		
		StudyInfo paramObj = studyInfoMapper.selectByPrimaryKey(studyInfo.getId());
		studyInfo.setAddDate(new Date());
		studyInfo.setUid(paramObj.getUid());
		studyInfo.setPid(TextUtil.getInt(request.getSession().getAttribute("uid")+""));
		userInfoService.ufcheck(request, da_dpno, paramObj.getPid(), paramObj, studyInfo);
		studyInfoMapper.updateByPrimaryKey(studyInfo);
	}
	/**
	 * 删除教育培训信息
	 * @param id
	 */
	@Override
	public void disabledStudyInfo(Integer id) {
		studyInfoMapper.deleteByPrimaryKey(id);
	}
	/**
	 * 职业培训新增
	 * @param studyInfo
	 */
	@Override
	public void saveStudyUpInfo(StudyUpInfo studyInfo) {
		studyUpInfoMapper.insert(studyInfo);
	}
	/**
	 *  职业培训更新
	 * @param studyInfo
	 */
	@Override
	public void updateStudyUpInfo(HttpServletRequest request,String da_dpno,String trainingUnit,String trainDate,String outDate,String officeDate,String office,String trainNo,String id) {
		
		 StudyUpInfo studyInfo = studyUpInfoMapper.selectByPrimaryKey(Integer.parseInt(id));
		 if(!"".equals(trainingUnit))
		 studyInfo.setTrainingUnit(trainingUnit);
		 if(!"".equals(trainDate))
		 studyInfo.setTrainDate(trainDate);
		 if(!"".equals(outDate))
		 studyInfo.setOutDate(outDate);
		 if(!"".equals(officeDate))
		 studyInfo.setOfficeDate(officeDate);
		 if(!"".equals(office))
		 studyInfo.setOffice(office);
		 if(!"".equals(trainNo))
		 studyInfo.setTrainNo(trainNo);
		 
		StudyUpInfo paramObj = studyUpInfoMapper.selectByPrimaryKey(studyInfo.getId());
		studyInfo.setAddDate(new Date());
		studyInfo.setPid(TextUtil.getInt(request.getSession().getAttribute("uid")+""));
		userInfoService.ufcheck(request, da_dpno, paramObj.getPid(), paramObj, studyInfo);
		studyUpInfoMapper.updateByPrimaryKeySelective(studyInfo);
	}
	/**
	 * 职业培训删除
	 */
	@Override
	public void disabledStudyUpInfo(int id) {
		studyUpInfoMapper.deleteByPrimaryKey(id);
	}
	/**
	 *  奖励情况更新
	 */
	@Override
	public void updateRewardsInfo(HttpServletRequest request,String da_dpno,String id,String reward_name,String pz_date,String en_name,String cx_date) {
		
		
		RewardsInfo rewardsInfo = rewardsInfoMapper.selectByPrimaryKey(Integer.parseInt(id));
		if(!"".equals(reward_name))
		    rewardsInfo.setRewardName(reward_name);
		if(!"".equals(en_name))
		    rewardsInfo.setEnName(en_name);
		if(!"".equals(pz_date))
		    rewardsInfo.setPzDate(pz_date) ;
		if(!"".equals(cx_date))
		    rewardsInfo.setCxDate(cx_date) ;
		    
		RewardsInfo paramObj = rewardsInfoMapper.selectByPrimaryKey(rewardsInfo.getId());
		rewardsInfo.setpDate(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,new Date()));
   	   	rewardsInfo.setpUid(TextUtil.getInt(request.getSession().getAttribute("uid")));
		userInfoService.ufcheck(request, da_dpno, paramObj.getpUid(), paramObj, rewardsInfo);
		 rewardsInfoMapper.updateByPrimaryKeySelective(rewardsInfo);
	}
    /**
     * 奖励情况删除
     */
	@Override
	public void disabledRewardsInfo(int id) {
		rewardsInfoMapper.deleteByPrimaryKey(id);		
	}
	/**
	 * 职务职称更新
	 */
	@Override
	public void updateOfficialInfo(HttpServletRequest request,String da_dpno,String id,String p_level,String p_method,String pro_z_name,String pro_name,String department_id,String pz_date1,String pz_no) {
		
		
		OfficialInfo officialInfo =officialInfoMapper.selectByPrimaryKey(Integer.parseInt(id));
		if(!"".equals(p_level))
			officialInfo.setpLevel(p_level);
		if(!"".equals(p_method))
			officialInfo.setpMethod(p_method);
		if(!"".equals(pro_z_name))
			officialInfo.setProZName(pro_z_name);
		if(!"".equals(pro_name))
			officialInfo.setProName(pro_name);
		if(!"".equals(department_id))
			officialInfo.setDepartmentId(department_id);
		if(!"".equals(pro_name))
			officialInfo.setPzNo(pro_name);
		if(!"".equals(pz_date1))
			officialInfo.setPzDate1(pz_date1);
		if(!"".equals(pz_no))
			officialInfo.setPzNo(pz_no);
			
		OfficialInfo paramObj = officialInfoMapper.selectByPrimaryKey(officialInfo.getId());
		officialInfo.setpDate(new Date());
		officialInfo.setpUid(TextUtil.getInt(request.getSession().getAttribute("uid")));
		userInfoService.ufcheck(request, da_dpno, paramObj.getpUid(), paramObj, officialInfo);
		officialInfoMapper.updateByPrimaryKeySelective(officialInfo);
	}
	/**
	 *  删除职务职称
	 */
	@Override
	public void disabledOfficialInfo(int id) {
		officialInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public String getNextPno() {
		String pno = "000001";
		try{
			pno = userPartyInfoMapper.getNextPno();
			if(StringUtils.isBlank(pno) || pno.length() == 0){
				pno = "000001";
			}else{
				int temp = Integer.parseInt(pno)+1;
				if(temp < 10){
					pno = "00000" + temp;
				}else if(temp < 100){
					pno = "0000" + temp;
				}else if(temp < 1000){
					pno = "000"+temp;
				}else if(temp < 10000){
					pno = "00"+temp;
				}else if(temp < 100000){
					pno = "0"+temp;
				}else if(temp < 1000000){
					pno = ""+temp;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			pno = "000001";
		}
		return pno;
	}

	@Override
	public void addPartyInList(List<UserPartyIn> userPartyInList,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(UserPartyIn userPartyIn:userPartyInList){
			UserPartyInfo userPartyInfo = new UserPartyInfo();
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", userPartyIn.getParty());
			//判断党员信息是否已经存在，已经存在则提示
			List<Map<String,Object>> list = userPartyInfoMapper.selectUserPartyList(params);
			if(null != list && list.size() > 0){
				Map<String,Object> map = list.get(0);
				String inDate = map.get("in_date")+"";
				String outDate = map.get("out_date")+"";
				if(StringUtils.isBlank(inDate) || "null".equals(inDate) || userPartyIn.getInDate().after(sdf.parse(inDate))){
					userPartyInfo.setId(userPartyIn.getParty());
					userPartyInfo.setInDate(userPartyIn.getInDate());
					if(StringUtils.isBlank(outDate) || "null".equals(outDate) || userPartyIn.getInDate().after(sdf.parse(outDate))){
						userPartyInfo.setIsIn("1");
					}
					userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
				}else{
				}
				userPartyInMapper.insertSelective(userPartyIn);
			}else{
				ResultConstant.write(response, "导入失败");
				break;
			}
		}
		ResultConstant.write(response, "导入成功");
	}

	@Override
	public void addPartyOutList(List<UserPartyOut> userPartyOutList,
			HttpServletResponse response) throws Exception {
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		for(UserPartyOut userPartyOut:userPartyOutList){
			UserPartyInfo userPartyInfo = new UserPartyInfo();
			Map<String, Object> params = new HashMap<String, Object>();
			params.put("id", userPartyOut.getParty());
			//判断党员信息是否已经存在，已经存在则提示
			List<Map<String,Object>> list = userPartyInfoMapper.selectUserPartyList(params);
			if(null != list && list.size() > 0){
				Map<String,Object> map = list.get(0);
				String inDate = map.get("in_date")+"";
				String outDate = map.get("out_date")+"";
				if(StringUtils.isBlank(outDate) || "null".equals(outDate) || userPartyOut.getInDate().after(sdf.parse(outDate))){
					userPartyInfo.setId(userPartyOut.getParty());
					userPartyInfo.setOutDate(userPartyOut.getInDate());
					if(StringUtils.isBlank(inDate) || "null".equals(inDate) || userPartyOut.getInDate().after(sdf.parse(inDate))){
						userPartyInfo.setIsIn("0");
					}
					userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
				}else{
				}
				userPartyOutMapper.insertSelective(userPartyOut);
			}else{
				ResultConstant.write(response, "导入失败");
				break;
			}
		}
		ResultConstant.write(response, "导入成功");
		
	}

	@Override
	public void addExpertInfoList(List<UserExpertInfo> userExpertInfoList,
			List<UserInfo> userInfoList, HttpServletResponse response)
			throws Exception {
		String msg = "";
		for(int i=0;i<userExpertInfoList.size();i++){
			UserExpertInfo userExpertInfo = userExpertInfoList.get(i);
			UserInfo userInfo = userInfoList.get(i);
			int uid = 0;
			String password = "";
			try{
				password = userInfo.getPnum().substring(userInfo.getPnum().length()-6, userInfo.getPnum().length());
				password = MD5.GetMD5Code(MD5.GetMD5Code(password));
			}catch(Exception e){
				e.printStackTrace();
			}
			try{
				UserInfo user = userInfoMapper.selectYg(userInfo);
				if(null != user && user.getId() > 0){
					uid = user.getId();
					userInfo.setId(uid);
					userInfoMapper.updateByPrimaryKeySelective(userInfo);
					Map<String, Object> params = new HashMap<String, Object>();
					params.put("uid", uid);
					//判断专家信息是否已经存在，已经存在则提示(后面改为界面提示直接更新)
					List<Map<String,Object>> list = userExpertInfoMapper.selectUserExpertList(params);
					if(null != list && list.size() > 0){
//						if(StringUtils.isNotBlank(msg)){
//							msg += ",["+userInfo.getName()+"]党员信息已存在!";
//						}else{
//							msg += "["+userInfo.getName()+"]党员信息已存在!";
//						}
						userExpertInfo.setId(Integer.parseInt((""+list.get(0).get("id"))));
						userExpertInfoMapper.updateByPrimaryKeySelective(userExpertInfo);
						continue;
					}else{
						
					}
				}else{
				
					userInfo.setPwd(password);
					//表明没有此用户信息，需要保存
					userInfoMapper.insertReturnKey(userInfo);
					
					int sex = 0;
					try{
						sex = Integer.parseInt(userInfo.getSex());
					}catch(Exception e){
					}
					saveMsgFromInfo(userInfo.getName(),sex,userInfo.getPnum(),0,"内部创建");
					uid = userInfo.getId();
				}
			}catch(Exception e){
				
				userInfo.setPwd(password);
				//表明没有此用户信息，需要保存
				userInfoMapper.insertReturnKey(userInfo);
				uid = userInfo.getId();
			}
			userExpertInfo.setUid(uid);
			int tem = userExpertInfoMapper.insertSelective(userExpertInfo);
		}
		if(StringUtils.isNotBlank(msg)){
			System.out.println("------------false------------" + msg);
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
		}else{
			System.out.println("------------true------------");
			ResultConstant.write(response, "导入成功");
		}
	}
	
	
	@Override
	public void addExpertInfoList2(List<UserExpertInfoPickUp> userExpertInfoList,
			 HttpServletResponse response)
			throws Exception {
		String msg = "";
		int id = 0;
		int flag=0;
		List<Map<String,Object>> list = userExpertInfoMapper.selectUserExpertListMore2();
		for(int i=0;i<userExpertInfoList.size();i++){
			UserExpertInfoPickUp userExpertInfoPickUp = userExpertInfoList.get(i);

			
			try{
				for(int j=0;j<list.size();j++)
				{
					if(userExpertInfoPickUp.getPnum().equals(list.get(i).get("pnum").toString()))
					{
						id =Integer.parseInt(list.get(i).get("pnum").toString());
						userExpertInfoPickUp.setId(id);
						userExpertInfoMapper.updatePickUp(userExpertInfoPickUp);
						flag=1;
						break;
					}
					
				}
				if(flag==0)
				{
				int tem=0;
					 tem = userExpertInfoMapper.insertPickUp(userExpertInfoPickUp);
				}
			}catch(Exception e){
				
			}
			flag=0;
		}
		if(StringUtils.isNotBlank(msg)){
			System.out.println("------------false------------" + msg);
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
		}else{
			System.out.println("------------true------------");
			ResultConstant.write(response, "导入成功");
		}
	}
	

	@Override
	public UserMgInfo getUserMgInfoById(int id) {
		
		
		return userMgInfoMapper.selectByPrimaryKey(id);
	}

	
	/**
	 * 重置密码身份证后6位
	 */
	@Override
	public void resetUserInfoPwd(int id, String pwd) {
		userInfoMapper.resetUserInfoPwd(id,MD5.GetMD5Code(MD5.GetMD5Code(pwd)));
	}

	
	public UserMgInfo selectByUid(Integer id){
		return  userMgInfoMapper.selectByUid(id);
	}
	
	public int updateUser(UserInfo userInfo){
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
	}

	@Override
	public UserInfo selectByDpno(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByDpno(userInfo);
	}
}
