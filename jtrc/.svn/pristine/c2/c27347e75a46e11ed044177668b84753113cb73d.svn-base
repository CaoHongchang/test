package com.i84.earnpoint.rygl.controller;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.ValidatorUtil;
import com.i84.earnpoint.daxt.service.UserMgInfoService;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.EnterpriseInfoDetail;
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.OfficialInfo;
import com.i84.earnpoint.model.RewardsInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMgInfo;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.rygl.service.RyAddORUpdateService;
import com.i84.earnpoint.rygl.service.RyglService;
import com.i84.earnpoint.service.UserInfoService;

/**
 * 人员管理
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/userInfoTrol")
public class UserInfoController extends ResultConstant{
	@Autowired 
	public RyglService ryglService;
	
	@Autowired
	private UserMgInfoService userMgInfoService;
	
	@Autowired
	private RyAddORUpdateService ryAddORUpdateService;
	
	@Autowired
	private UserInfoService userInfoService;
	 
	/**
     * 	获取用户基本信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryUseBaseMs")
	public  @ResponseBody Map<String, Object> qryUseBaseMs(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    String uid = request.getParameter("uid");
	    String mid=request.getParameter("mid");
	    return ryglService.qryUseBaseMs(uid,mid);
	}
	/**
     * 	获取工作简历表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryWorkInfo")
	public  @ResponseBody Map<String, Object> qryWorkInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
	     String uid = request.getParameter("uid");
		List<WorkInfo> list = ryglService.qryWorkInfo(uid);
		return resultMap(list,true, null);
	}
	/**
     * 	获取教育培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryStudyInfo")
	public  @ResponseBody Map<String, Object> qryStudyInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    String uid = request.getParameter("uid");
		List<Map<String, Object>> list = ryglService.qryStudyInfo(uid);
		return resultMap(list,true, null);
	}
	/**
     * 	获取职业培训列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryStudyUpInfo")
	public  @ResponseBody Map<String, Object> qryStudyUpInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    String uid = request.getParameter("uid");
		List<Map<String, Object>> list = ryglService.qryStudyUpInfo(uid);
		return resultMap(list,true, null);
	}
	/**
     * 	获取职务职称列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryOfficialInfo")
	public  @ResponseBody Map<String, Object> qryOfficialInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
	      String uid = request.getParameter("uid");
		  List<Map<String, Object>> list = ryglService.qryOfficialInfo(uid); 
		 return resultMap(list,true, null);
	}
	/**
     * 	获取奖励情况表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryRewardsInfo")
	public  @ResponseBody Map<String, Object> qryRewardsInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    String uid = request.getParameter("uid");
		List<Map<String, Object>> list = ryglService.qryRewardsInfo(uid);
		return resultMap(list,true, null);
	}
	
	 
	/**
     * 	获取人员表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryUserList")
	public  @ResponseBody Map<String, Object> queryUserList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		
		String s_username_no = request.getParameter("s_username_no");
		

		Map<String, Object> params = new HashMap<String, Object>();
		
		params.put("page", page);
		params.put("rows", rows);
		
		if(s_username_no!=null && !"".equals(s_username_no)){
			if(s_username_no.length()>14)
				params.put("PNUM",s_username_no);
			else
				params.put("NAME",s_username_no);
		}
		List<Map<String, Object>> list = ryglService.queryUserList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 审核
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/ryxxCheckInfo")
	public void ryxxCheckInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			/*获取查询条件*/
			String ids = request.getParameter("ids");
			String checkStatus = request.getParameter("checkStatus");
			String checkRemark = request.getParameter("checkRemark");
			
			String[] idArray = ids.split(",");
			for(String id : idArray){
				map.put("uid", id);
				map.put("checkStatus", checkStatus);
				map.put("checkRemark", checkRemark);
				ryglService.ryxxCheckInfo(map);
			}
			resObject.put("flag", true);
			ResultConstant.write(response, resObject);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errMsg", e.getMessage());
			ResultConstant.write(response, resObject);
		}
	}
	/**
	 * 重置密码
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/rePswUserInfo")
	public void rePswUserInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			/*获取查询条件*/
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(";");
			for(String id : idArray){
				ryglService.resetUserInfoPwd(Integer.parseInt(id.split(",")[0]),id.split(",")[1]);
			}
			resObject.put("flag", true);
			ResultConstant.write(response, resObject);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errMsg", e.getMessage());
			ResultConstant.write(response, resObject);
		}
	}
	/**
	 * 删除用户
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledUserInfo")
	public void disabledUserInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			Map<String, Object> map = new HashMap<String, Object>();
			/*获取查询条件*/
			String ids = request.getParameter("ids");
			String[] idArray = ids.split(",");
			for(String id : idArray){
				ryglService.disabledUserInfo(id);
			}
			resObject.put("flag", true);
			ResultConstant.write(response, resObject);
		} catch (Exception e) {
			resObject.put("flag", false);
			resObject.put("errMsg", e.getMessage());
			ResultConstant.write(response, resObject);
		}
	}
	
	
	/**
	 * 奖励情况删除
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledRewardsInfo")
	public  @ResponseBody Map<String, Object> disabledRewardsInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String deleteIds = request.getParameter("deleteIds");
        	String[] deleteIdArray = deleteIds.split(",");
        	for (String deleteId : deleteIdArray) {
        		ryglService.disabledRewardsInfo(Integer.parseInt(deleteId));
			}
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 工作经历删除
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledStudyInfo")
	public  @ResponseBody Map<String, Object> disabledStudyInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String deleteIds = request.getParameter("deleteIds");
        	String[] deleteIdArray = deleteIds.split(",");
        	for (String deleteId : deleteIdArray) {
        		ryglService.disabledStudyInfo(Integer.parseInt(deleteId));
			}
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 人员新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveUserInfo")
	@ResponseBody 
	public  synchronized Map<String, Object> saveUserInfo( HttpServletResponse response, HttpServletRequest request) throws Exception{
//		Thread thread=new Thread(){
//			public void run(){
//				for (int i = 0; i < 10; i++) {
//					System.out.println(Thread.currentThread());
//				
//					
//				}
//			}
//		};
//		thread.start();
		try {
			return 	ryAddORUpdateService.AddORUpdate(response, request, true);
		} catch (Exception e) {
			return resultMap(false, "执行错误，系统异常！");
		}
		
	}
	
	/**
	 *职务职称新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveOfficialInfo")
	public  @ResponseBody Map<String, Object> saveOfficialInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
    		String daPnum = request.getParameter("daPnum");
    		String p_level = request.getParameter("p_level");
    		String pro_z_name = request.getParameter("pro_z_name");
    		String pz_date1 = request.getParameter("pz_date1");
    		String p_method = request.getParameter("p_method");
    		String pro_name = request.getParameter("pro_name");
    		String department_id = request.getParameter("department_id");
    		String pz_no = request.getParameter("pz_no");
    		
    		if(StringUtils.isBlank(daPnum)){
    			throw new Exception("档案号不能为空");
    		}else{
    			UserInfo record = new UserInfo();
    			//获取用户信息
    			record.setPnum(daPnum);
    			record = ryglService.selectYg(record);
    			
    			//新增对象
    			OfficialInfo officialInfo = new OfficialInfo();
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
	   			officialInfo.setUid(record.getId());
	   			if(!"".equals(pz_no))
	   			officialInfo.setPzNo(pz_no);
	    		ryglService.saveOfficialInfo(officialInfo);
        		return resultMap(true, null);
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 奖励情况新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveRewardsInfo")
	public  @ResponseBody Map<String, Object> saveRewardsInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String reward_name = request.getParameter("reward_name");
    		String en_name = request.getParameter("en_name");
    		String pz_date = request.getParameter("pz_date");
    		String cx_date = request.getParameter("cx_date");
    		String daPnum = request.getParameter("daPnum");
    		if(StringUtils.isBlank(daPnum)){
    			throw new Exception("档案号不能为空");
    		}else{
    			UserInfo record = new UserInfo();
    			//获取用户信息
    			record.setPnum(daPnum);
    			record = ryglService.selectYg(record);
    			
    			//新增对象
			    RewardsInfo rewardsInfo = new RewardsInfo();
			    int a =0;
			    if(!"".equals(reward_name)){
   	   		    
			    	a=1;
			    	rewardsInfo.setRewardName(reward_name);
			    }
			    if(!"".equals(en_name)){
   	   		    
			    	 a=1;
			    	rewardsInfo.setEnName(en_name);
			    }
			    if(!"".equals(pz_date)){
   	   		    
			    	 a=1;
			    	rewardsInfo.setPzDate(pz_date) ;
			    }
			    if(!"".equals(cx_date)){
   	   		    
			    	 a=1;
			    	rewardsInfo.setCxDate(cx_date) ;
			    }
			    rewardsInfo.setUid(record.getId());
			    if(a==1)
   	   			ryglService.saveRewardsInfo(rewardsInfo);
        		return resultMap(true, null);
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 职业培训新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveStudyUpInfo")
	public  @ResponseBody Map<String, Object> saveStudyUpInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String trainingUnit = request.getParameter("trainingUnit");
    		String trainDate = request.getParameter("trainDate");
    		String outDate = request.getParameter("outDate");
    		String officeDate = request.getParameter("officeDate");
    		String office = request.getParameter("office");
    		String trainNo = request.getParameter("trainNo");
    		String daPnum = request.getParameter("daPnum");
    		 
    		if(StringUtils.isBlank(daPnum)){
    			throw new Exception("档案号不能为空");
    		}else{
    			UserInfo record = new UserInfo();
    			//获取用户信息
    			record.setPnum(daPnum);
    			record = ryglService.selectYg(record);
    			
    			//新增对象
    			 StudyUpInfo studyInfo = new StudyUpInfo();
    			 studyInfo.setUid(record.getId());
    			 int a=0;
    			 if(!"".equals(trainingUnit)){
    			     a=1;
    				 studyInfo.setTrainingUnit(trainingUnit);
    			 }
    			 if(!"".equals(trainDate)){
    				 a=1;
    				 studyInfo.setTrainDate(trainDate);
    			 }
    			 if(!"".equals(outDate)){
    			 
    				 a=1;
    				 studyInfo.setOutDate(outDate);
    			 }
    			 if(!"".equals(officeDate)){
    			 
    				 studyInfo.setOfficeDate(officeDate);
    			 }
    			 if(!"".equals(office)){
    			 
    				 a=1;
    				 studyInfo.setOffice(office);
    			 }
    			 if(!"".equals(trainNo)){
    			 
    				 a=1;
    				 studyInfo.setTrainNo(trainNo);
    			 }
    			 if(a==1)
    			 ryglService.saveStudyUpInfo(studyInfo);
        		return resultMap(true, null);
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 教育培训新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveStudyInfo")
	public  @ResponseBody Map<String, Object> saveStudyInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String studyTypeId = request.getParameter("studyTypeId");
    		String schoolName = request.getParameter("schoolName");
    		String inDate = request.getParameter("inDate");
    		String graduationDate = request.getParameter("graduationDate");
    		String education = request.getParameter("education");
    		String degree = request.getParameter("degree");
    		String certificate = request.getParameter("certificate");
    		String daPnum = request.getParameter("daPnum");
	        String major=request.getParameter("major");
	        
	        
	        
    		
    		if(StringUtils.isBlank(daPnum)){
    			throw new Exception("档案号不能为空");
    		}else{
    			UserInfo record = new UserInfo();
    			//获取用户信息
    			record.setDpno(daPnum);
    			record = ryglService.selectByDpno(record);
    			
    			//新增对象
    			StudyInfo studyInfo = new StudyInfo();
    				studyInfo.setUid(record.getId());
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
        			studyInfo.setMajor(major.trim());
        		ryglService.saveStudyInfo(studyInfo);
        		return resultMap(true, null);
    		}
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 工作经历新增
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveWorkInfo")
	public  @ResponseBody Map<String, Object> saveWorkInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	WorkInfo workInfo = new WorkInfo();
        	String startDate = request.getParameter("startDate");
    		String endDate = request.getParameter("endDate");
    		String enterpriseId = request.getParameter("enterpriseId");
    		String departmentId = request.getParameter("departmentId");
    		String placeId = request.getParameter("placeId");
    		String daPnum = request.getParameter("daPnum");
    		String workName = request.getParameter("workName");
    		
    		if(StringUtils.isBlank(daPnum)){
    			throw new Exception("档案号不能为空");
    		}
    		if(StringUtils.isNotBlank(startDate)){
    			workInfo.setStartDate(startDate);
    		}
    		
    		if(StringUtils.isNotBlank(endDate)){
    			workInfo.setEndDate(endDate);
    		}
    		if(!"".equals(enterpriseId))
    		workInfo.setEnterpriseId(enterpriseId);
    		if(!"".equals(departmentId))
    		workInfo.setDepartmentId(departmentId);
    		if(!"".equals(placeId))
    		workInfo.setPlaceId(placeId);
    		if(!"".equals(workName))
    		workInfo.setWorkName(workName);
    		workInfo.setAddDate(new Date());
    		ryglService.saveWorkInfo(daPnum,workInfo);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	
	
	/**
	 * 删除职务职称
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledOfficialInfo")
	public  @ResponseBody Map<String, Object> disabledOfficialInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String deleteIds = request.getParameter("deleteIds");
        	String[] deleteIdArray = deleteIds.split(",");
        	for (String deleteId : deleteIdArray) {
        		ryglService.disabledOfficialInfo(Integer.parseInt(deleteId));
			}
	         
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 工作经历删除
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledWorkInfo")
	public  @ResponseBody Map<String, Object> disabledWorkInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String deleteIds = request.getParameter("deleteIds");
        	String[] deleteIdArray = deleteIds.split(",");
        	for (String deleteId : deleteIdArray) {
        		WorkInfo wInfo = new WorkInfo();
        		wInfo.setId(Integer.parseInt(deleteId));
        		wInfo.setDelDate(new Date());
        		ryglService.disabledWorkInfo(wInfo);
			}
	         
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	
	/**
	 * 职业培训删除
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledStudyUpInfo")
	public  @ResponseBody Map<String, Object> disabledStudyUpInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String deleteIds = request.getParameter("deleteIds");
        	String[] deleteIdArray = deleteIds.split(",");
        	for (String deleteId : deleteIdArray) {
        		ryglService.disabledStudyUpInfo(Integer.parseInt(deleteId));
			}
	         
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 教育培训更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateStudyInfo")
	public  @ResponseBody Map<String, Object> updateStudyInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String id = request.getParameter("id");
        	String studyTypeId = request.getParameter("studyTypeId");
    		String schoolName = request.getParameter("schoolName");
    		String inDate = request.getParameter("inDate");
    		String graduationDate = request.getParameter("graduationDate");
    		String education = request.getParameter("education");
    		String degree = request.getParameter("degree");
    		String certificate = request.getParameter("certificate");
    		String da_dpno = request.getParameter("da_dpno");
    		String major = request.getParameter("major");
        	ryglService.updateStudyInfo(request, da_dpno, id, studyTypeId, schoolName, inDate, graduationDate, education, degree, certificate,major);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	
	/**
	 * 职务职称更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateOfficialInfo")
	public  @ResponseBody Map<String, Object> updateOfficialInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String id = request.getParameter("id");
        	String p_level = request.getParameter("p_level");
    		String pro_z_name = request.getParameter("pro_z_name");
    		String pz_date1 = request.getParameter("pz_date1");
    		String p_method = request.getParameter("p_method");
    		String pro_name = request.getParameter("pro_name");
    		String department_id = request.getParameter("department_id");
    		String pz_no = request.getParameter("pz_no");
    		String da_dpno = request.getParameter("da_dpno");
        	
        	ryglService.updateOfficialInfo(request, da_dpno, id, p_level, p_method, pro_z_name, pro_name, department_id, pz_date1, pz_no);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 奖励情况更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateRewardsInfo")
	public  @ResponseBody Map<String, Object> updateRewardsInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String id = request.getParameter("id");
        	String reward_name = request.getParameter("reward_name");
    		String en_name = request.getParameter("en_name");
    		String pz_date = request.getParameter("pz_date");
    		String cx_date = request.getParameter("cx_date");
    		String da_dpno = request.getParameter("da_dpno");
    	
        	ryglService.updateRewardsInfo(request, da_dpno, id, reward_name, pz_date, en_name, cx_date);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 职业培训更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateStudyUpInfo")
	public  @ResponseBody Map<String, Object> updateStudyUpInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String id = request.getParameter("id");
        	String trainingUnit = request.getParameter("trainingUnit");
    		String trainDate = request.getParameter("trainDate");
    		String outDate = request.getParameter("outDate");
    		String officeDate = request.getParameter("officeDate");
    		String office = request.getParameter("office");
    		String trainNo = request.getParameter("trainNo");
    		String da_dpno = request.getParameter("da_dpno");
    		
        	ryglService.updateStudyUpInfo(request, da_dpno, trainingUnit, trainDate, outDate, officeDate, office, trainNo, id);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	/**
	 * 工作经历更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateWorkInfo")
	public  @ResponseBody Map<String, Object> updateWorkInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
        try {
        	String id = request.getParameter("id");
        	String startDate = request.getParameter("startDate");
        	String endDate = request.getParameter("endDate");
        	String enterpriseId = request.getParameter("enterpriseId");
        	String departmentId = request.getParameter("departmentId");
        	String placeId = request.getParameter("placeId");
        	String da_dpno = request.getParameter("da_dpno");
        	String workName = request.getParameter("workName");
        	
        	ryglService.updateWorkInfo(request, da_dpno, id, startDate, endDate, enterpriseId, departmentId, placeId, workName);
    		return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			return resultMap(false, e.getMessage());
		}		
	}
	
	/**
	 * 人员更新
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateUserInfo")
	@ResponseBody
	public synchronized Map<String, Object> updateUserInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		return ryAddORUpdateService.AddORUpdate(response, request,false);
	}
	
	/**
	 * 获取系统档案号最大值
	 * @param dtype
	 * @return
	 */
public String getMaxDpno(String dtype){
		 Calendar calendar=Calendar.getInstance();
		 String year=calendar.get(Calendar.YEAR)+"";
		Map<String, Object> m=new HashMap<String, Object>();
       m.put("dtype","%"+dtype+"%");
		m= userMgInfoService.selectmaxDpno(m);
		if(m!=null){
			String da_dpno=m.get("maxDpno")==null?null:m.get("maxDpno").toString();
			if(StringUtils.isNotBlank(da_dpno)){
				da_dpno=dtype+String.valueOf(Long.valueOf(da_dpno.substring(1, da_dpno.length()))+1);
				da_dpno=dtype+year+da_dpno.substring(5);
				return da_dpno;
			}else{
				year=year+"0000001";
				return dtype+year;
			}
		}else{
			year=year+"0000001";
			return dtype+year;
		}
	}

/**
 * 获取系统编码
 * @return
 */
public String getMaxpno(){
	String date = DateUtil.getFormatDate("yyyy", new Date());
	String pno = userMgInfoService.getNextPno(date);
	return date+pno;
}

/**
 * 获取学历统计list
 */
@RequestMapping("/getxltjlist")
@ResponseBody
public Map<String,Object> GetXltjList(HttpServletResponse response,HttpServletRequest request){
	
	int page = TextUtil.getInt(request.getParameter("page"));
	if (page == 0)
		page = 1;
	int rows = TextUtil.getInt(request.getParameter("rows"));
	Map<String, Object> params = new HashMap<String, Object>();
	params.put("page", page);
	params.put("rows", rows);
	String pnum = request.getParameter("pnum");
	String name=request.getParameter("name");
	String age=request.getParameter("age");
	String key = request.getParameter("key");
	if(StringUtils.isNotBlank(key)){
		params.put("dpno", key);
	}
	if(StringUtils.isNotBlank(pnum)){
		params.put("pnum", pnum);
	}
	if(StringUtils.isNotBlank(name)){
		params.put("name", name);
	}

//	List<Map<String, Object>> list = archivesBaseInfoService.QueryBaseinfoList(params);
	List<Map<String, Object>> list =userInfoService.getxltjlist(params);
	PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
	return resultMap(list, pageinfo.getTotal(), true, null);
}

	@RequestMapping("/exportxltjlist")
	
	public void ExportXltjList(HttpServletResponse response,HttpServletRequest request){
		 userInfoService.ExportXltjList(response);
	}
	
	@RequestMapping("/addUser")
	@ResponseBody
	public Map<String, Object> addUser(HttpServletResponse response,HttpServletRequest request){
		Map<String, Object>  resultMap=new HashMap<String, Object>();
		
		String id=request.getParameter("id");
		String name=request.getParameter("name");
		String pnum=request.getParameter("pnum");
		String sex=request.getParameter("sex");
		String tel=request.getParameter("tel");
		String mz=request.getParameter("mz");
		String zzmm=request.getParameter("zzmm");
		String url=request.getParameter("url");
		String school=request.getParameter("school");
		String graduation_time=request.getParameter("graduation_time");
		String major=request.getParameter("major");
		String degree=request.getParameter("degree");
		String adr=request.getParameter("adr");
		String email=request.getParameter("email");
		String birth_date=request.getParameter("birth_date");
		String qq=request.getParameter("qq");
		String wx=request.getParameter("wx");
		UserInfo userInfo =new UserInfo();
		if(name!=null)
			userInfo.setName(name);
		if(pnum==null){
			resultMap.put("flag", false);
			resultMap.put("message", "身份证不能为空！");
			return resultMap;
		}else{
			if(ValidatorUtil.isIDCard(pnum)){
				userInfo.setPnum(pnum);
			}else{
				resultMap.put("flag", false);
				resultMap.put("message", "身份证格式错误！");
				return resultMap;
			}
		}
		if(sex!=null){
			userInfo.setSex(sex);
		}
		if(tel!=null){
//			if(ValidatorUtil.isMobile(tel)){
//				resultMap.put("flag", false);
//				resultMap.put("message", "手机格式错误！");
//				return resultMap;
//			}
			userInfo.setTel(tel);
		}
		if(mz!=null){
			userInfo.setMz(mz);
		}
		if(zzmm!=null){
			userInfo.setZzmm(zzmm);
		}
		if(school!=null){
			userInfo.setSchool(school);
		}
		
		try {
			if(graduation_time!=null&&!graduation_time.equals("")){
				userInfo.setGraduationTime(ResultConstant.parseDateTime(graduation_time,null));
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("flag", false);
			resultMap.put("message", "毕业时间格式错误！");
			return resultMap;
		}
		if(major!=null){
			userInfo.setMajor(major);
		}
		if(degree!=null){
			userInfo.setDegree(degree);
		}
		if(adr!=null){
			userInfo.setAdr(adr);
		}
		if(email!=null){
			userInfo.setEmail(email);
//			if(ValidatorUtil.isEmail(email)){
//				userInfo.setEmail(email);
//			}else{
//				resultMap.put("flag", false);
//				resultMap.put("message", "邮箱格式错误！");
//				return resultMap;
//			}
		}
		try {
			if(birth_date!=null&&!birth_date.equals("")){
				userInfo.setBirthDate(ResultConstant.parseDateTime(birth_date,null));
			}
		} catch (Exception e) {
			e.printStackTrace();
			resultMap.put("flag", false);
			resultMap.put("message", "出生日期格式错误！");
			return resultMap;
		}
		if(qq!=null){
			userInfo.setQq(qq);
		}
		if(wx!=null){
			userInfo.setWx(wx);
		}
		if(url!=null){
			userInfo.setImgUrl(url);
		}
		userInfo.setAddDate(new Date());
		if(request.getSession().getAttribute("uid")!=null){
			userInfo.setPid(Integer.valueOf(request.getSession().getAttribute("uid").toString()));
		}else{
			resultMap.put("flag", false);
			resultMap.put("message", "请先登录！");
			return resultMap;
		}
		if(id==null||id.equals("")){
			int count=ryglService.inserUserInfo(userInfo);
			if(count==-1){
				resultMap.put("flag", false);
				resultMap.put("message", "该用户已经存在！");
				return resultMap;
			}
			MsgFromInfo msgFromInfo = new MsgFromInfo();
			if(userInfo.getSex().equals("1")||userInfo.getSex().equals("男")){
				msgFromInfo.setSex(1);
			}
			else if(userInfo.getSex().equals("0")||userInfo.getSex().equals("女")){
				msgFromInfo.setSex(0);
			}
			msgFromInfo.setPnum(userInfo.getPnum());
			msgFromInfo.setName(userInfo.getName());
			msgFromInfo.setMsgName("内部创建");
			msgFromInfo.setIsState(SystemContant.BG_STATE_NEW);
			ryglService.saveMsgFromInfo(msgFromInfo);
			resultMap.put("flag", true);
			resultMap.put("message", "新增成功！");
			return resultMap;
		}else{
			userInfo.setId(Integer.valueOf(id.toString()));
			ryglService.updateUser(userInfo);
			resultMap.put("flag", true);
			resultMap.put("message", "修改成功！");
			return resultMap;
		}
	}
	
	@RequestMapping("/getUser")
	@ResponseBody
	public Map<String,Object> getUser(HttpServletResponse response,HttpServletRequest request){
		Integer id=Integer.valueOf(request.getParameter("id").toString());
		return userInfoService.getUserById(id);
	}
}
