package com.i84.earnpoint.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.ValidationUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.MenuNode;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.ValidatorUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.BgActivityInfo;
import com.i84.earnpoint.model.DepartmentInfo;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.ImpEnterpriseInfo;
import com.i84.earnpoint.model.PlaceInfo;
import com.i84.earnpoint.model.StudentAchievement;
import com.i84.earnpoint.model.UnitInfo;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.rckgl.service.UnitInfoService;
import com.i84.earnpoint.service.DepartmentInfoService;
import com.i84.earnpoint.service.EnterpriseInfoService;
import com.i84.earnpoint.service.PlaceInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityInfoService;
import com.i84.earnpoint.system.service.UserService;

@Controller
@RequestMapping("/zzgl")
public class OrgManageController {
	@Autowired
	private DepartmentInfoService departmentInfoService;
	@Autowired
	private PlaceInfoService placeInfoService;
	@Autowired
	private UnitInfoService unitInfoService;
	@Autowired
	private BgActivityInfoService bgActivityInfoService;

	@RequestMapping("/insertDepartmentInfo")
	public void insertDepartmentInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String orgId = request.getParameter("orgId");
		String []ids=request.getParameterValues("id");
		String[] deptNames = request.getParameterValues("deptName");
		String[] deptCodes = request.getParameterValues("deptCode");
		int index=0;
		if(ids!=null&&ids.length>0){
			index=ids.length;
			int count=0;
			for(int i=0;i<ids.length;i++){
				DepartmentInfo departmentInfo=new DepartmentInfo();
				departmentInfo.setId(Integer.valueOf(ids[i]));
				departmentInfo.setbCode(deptCodes[i]);
				departmentInfo.setName(deptNames[i]);
				count+=departmentInfoService.updateDepartmentInfo(departmentInfo);
			}
			if(ids.length==deptNames.length){
				if(count>0){
					response.getWriter().write("1");
				}else{
					response.getWriter().write("更新部门信息失败！");
				}
			}
		}
		if (deptNames != null && deptNames.length > 0) {

			int count = 0;
			for (int i = index; i < deptNames.length; i++) {
				String deptName = deptNames[i];
				String deptCode = deptCodes[i];
				if (!deptName.trim().isEmpty() && !deptCode.trim().isEmpty()) {
					DepartmentInfo departmentInfo = new DepartmentInfo();

					departmentInfo.setAddDate(new Date());
					departmentInfo.setName(deptName);
					departmentInfo.setIsState(1);
					departmentInfo.setbCode(deptCode);
					// 获取数据来源的id
					departmentInfo.setMsgFromId(0);
					departmentInfo.setMsg("同意");

					// 获取当前登录用户的id
					String uid=(String) request.getSession().getAttribute("uid");
					departmentInfo.setUserId(uid==null?1:Integer.valueOf(uid));
					departmentInfo.setStaffId(uid==null?1:Integer.valueOf(uid));
					// 根据组织代码获取企业id
					departmentInfo.setEnterpriseId(Integer.valueOf(orgId));
					count += departmentInfoService
							.insertDepartmentInfo(departmentInfo);
				}

			}
			if (count > 0) {
				response.getWriter().write("1");
				response.getWriter().flush();
			} else {
				response.getWriter().write("保存部门信息失败");
				response.getWriter().flush();
			}
		} else {
			response.getWriter().write("请为该组织配置部门信息！");
			response.getWriter().flush();
		}

	}

	/**
	 * 部门管理界面数据显示
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listOrgDeptInfo")
	public void listOrgDepartmentInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String orgCode = request.getParameter("selectOrgCode");
		String orgName = request.getParameter("selectOrgName");
		String check = request.getParameter("selectCheck");
		String source = request.getParameter("selectSource");
		EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
		if(orgCode!=null&&!orgCode.trim().isEmpty()){
			enterpriseInfo.setcCode(orgCode);
		}
		if(orgName!=null&&!orgName.trim().isEmpty()){
			enterpriseInfo.setName(orgName);
		}
		if(check!=null&&!check.equals("3")){
			enterpriseInfo.setIsState(Integer.valueOf(check));
		}
		if(source!=null&&!source.equals("3")){
			enterpriseInfo.setMsgFromId(Integer.valueOf(Integer.valueOf(source)));
		}
		JSONObject objs=new JSONObject();
		JSONArray jArray=new JSONArray();
		List<EnterpriseInfo> enterpriseInfos=enterpriseInfoService.listEnterpriseInfo(enterpriseInfo);
		for(int i=0;i<enterpriseInfos.size();i++){
			JSONObject jobj=new JSONObject();
			EnterpriseInfo mi=enterpriseInfos.get(i);
			jobj.put("id1", mi.getId());
			jobj.put("orgCode", mi.getcCode());
			jobj.put("orgName", mi.getName());
			DepartmentInfo departmentInfo=new DepartmentInfo();
			departmentInfo.setEnterpriseId(mi.getId());
			List<DepartmentInfo> departmentInfos=departmentInfoService.listDepartmentInfo(departmentInfo);
			String deptName="";
			for(int j=0;j<departmentInfos.size();j++){
				deptName+=departmentInfos.get(j).getName()+"+";
			}
			jobj.put("deptName", deptName.equals("")?"":deptName.substring(0, deptName.length()-1));
			jobj.put("status", mi.getIsState());
			jobj.put("source", mi.getMsgFromId());
			User user=userService.selectByPrimaryKey(mi.getUserId());
			jobj.put("creator", user!=null?user.getUsername():"");
			jobj.put("createTime", mi.getAddDate()!=null?new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()):"");
			jArray.add(jobj);
		}
		objs.put("rows", jArray);
		objs.put("total", enterpriseInfos.size());
		objs.put("flag", true);
		objs.put("cause", null);
		response.getWriter().write(objs.toString());

	}

	/**
	 * 查看部门
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listDeptInfo")
	public void listDeptInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String orgId=request.getParameter("orgId");
		DepartmentInfo departmentInfo=new DepartmentInfo();
		if(orgId!=null&&!orgId.trim().isEmpty()){
			departmentInfo.setEnterpriseId(Integer.valueOf(orgId));
		}
		List<DepartmentInfo> departmentInfos = departmentInfoService
				.listDepartmentInfo(departmentInfo);
		JSONObject objs = new JSONObject();
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < departmentInfos.size(); i++) {
			JSONObject jobj = new JSONObject();
			DepartmentInfo mi = departmentInfos.get(i);
			jobj.put("id1", mi.getId());
			jobj.put("deptName", mi.getName());
			jobj.put("deptCode",mi.getbCode());
			if(mi.getMsgFromId()==2&&mi.getIsState()==2){
				//若数据来源为数据采集，则将审核失败的改为待审核
				mi.setIsState(0);
				departmentInfoService.updateDepartmentInfo(mi);
			}
			jobj.put("status", mi.getIsState());
			jobj.put("advice", mi.getMsg());
			jArray.add(jobj);
		}
		objs.put("rows", jArray);
		objs.put("total", departmentInfos.size());
		objs.put("flag", true);
		objs.put("cause", null);
		response.getWriter().write(objs.toString());
	}

	@RequestMapping("/insertPlaceInfo")
	public void insertPlaceInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String activityCode = request.getParameter("activityCode");
		String postName = request.getParameter("postName");
		String postCode=request.getParameter("postCode");
		String remark = request.getParameter("remark");
		String msgfrom=request.getParameter("msgfrom");
		PlaceInfo placeInfo = new PlaceInfo();
		placeInfo.setAcId(Integer.valueOf(activityCode));
		placeInfo.setName(postName);
		placeInfo.setPno(postCode);
		placeInfo.setIsValid(1);
		placeInfo.setMsgFromId(Integer.valueOf(msgfrom));
		String uid=(String) request.getSession().getAttribute("uid");
		placeInfo.setUserId(uid!=null?Integer.valueOf(uid):1);
		placeInfo.setRemark(remark);
		placeInfo.setAddDate(new Date());
		int count = placeInfoService.insertPlaceInfo(placeInfo);
		System.out.println(count);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("新增岗位失败！");
		}

	}

	@RequestMapping("/updatePlaceInfo")
	public void updatePlaceInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		Integer id = TextUtil.getInt(request.getParameter("id"));
		String activityCode = request.getParameter("activityCode");
		String postName = request.getParameter("postName");
		String postCode=request.getParameter("postCode");
		String remark = request.getParameter("remark");
		String msgfrom=request.getParameter("msgfrom");
		PlaceInfo placeInfo = new PlaceInfo();
		placeInfo.setAcId(Integer.valueOf(activityCode));
		placeInfo.setId(id);
		placeInfo.setName(postName);
		placeInfo.setPno(postCode);
		placeInfo.setMsgFromId(Integer.valueOf(msgfrom));
		String uid=(String) request.getSession().getAttribute("uid");
		placeInfo.setUserId(uid!=null?Integer.valueOf(uid):1);
		placeInfo.setRemark(remark);
		placeInfo.setAddDate(new Date());
		int count = placeInfoService.updatePlaceInfo(placeInfo);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("修改岗位失败！");
		}

	}

	@RequestMapping("/deletePlaceInfo")
	public void deletePlaceInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String ids = request.getParameter("ids");

		int count = placeInfoService.deletePlaceInfo(ids);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("删除岗位失败！");
		}

	}

	@RequestMapping("/listPlaceInfo")
	public void listPlaceInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page == 0 ? 1 : page;
		// int rows=TextUtil.getInt(request.getParameter("rows"));
		PlaceInfo placeInfo = new PlaceInfo();
		String acId = request.getParameter("activityCode");
		String postName = request.getParameter("selectPostName");
		String source = request.getParameter("selectSource");
		String isValid = request.getParameter("selectIsValid");
		String createTime = request.getParameter("selectAddtime");

		if(source!=null&&!source.equals("3")){
			placeInfo.setMsgFromId(Integer.valueOf(source));
		}
		if (postName != null && !postName.trim().isEmpty()) {
			placeInfo.setName("%" + postName + "%");
		}
		if (null != acId && Integer.valueOf(acId) > 0) {
			placeInfo.setAcId(Integer.valueOf(acId));
		}
		if (isValid != null && !isValid.trim().isEmpty()) {
			if (Integer.valueOf(isValid) != 2) {
				placeInfo.setIsValid(Integer.valueOf(isValid));
			}
		}
		if (createTime != null && !createTime.trim().isEmpty()) {
			placeInfo.setAddDate(DateUtil
					.stringToDate(createTime, "yyyy-MM-dd"));
		}

		List<PlaceInfo> placeInfos = placeInfoService
				.selectPlaceInfoByPrimaryKey(placeInfo);
		JSONObject objs = new JSONObject();
		JSONArray jArray = new JSONArray();
		for (int i = 0; i < placeInfos.size(); i++) {
			JSONObject jobj = new JSONObject();
			PlaceInfo mi = placeInfos.get(i);
			System.out.println(mi.toString());
			jobj.put("id1", mi.getId());
			jobj.put("postName", mi.getName());
			jobj.put("source", mi.getMsgFromId());
			jobj.put("remark", mi.getRemark());
			jobj.put("available", mi.getIsValid());
			jobj.put("postCode", mi.getPno());
			jobj.put("createTime",
					mi.getAddDate()!=null?new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()):"");
			User user=userService.selectByPrimaryKey(mi.getUserId());
			jobj.put("creator", user!=null?user.getUsername():"");

			//根据ac_id 关联出招聘活动信息
			Integer ac_id = mi.getAcId();
			BgActivityInfo bgActivityInfo  = bgActivityInfoService.selectByPrimaryKey(ac_id);
			
			jobj.put("acId", bgActivityInfo.getId());
			jobj.put("acName", bgActivityInfo.getPname());
			jArray.add(jobj);
		}
		objs.put("rows", jArray);
		objs.put("total", placeInfos.size());
		objs.put("flag", true);
		objs.put("cause", null);
		response.getWriter().write(objs.toString());

	}

	@RequestMapping("/invalidPlaceInfo")
	public void invalidPlaceInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String ids = request.getParameter("ids");
		String[] array = ids.split(",");
		int statue=0;
		int count = 0;
		for (int i = 0; i < array.length; i++) {
			PlaceInfo placeInfo = new PlaceInfo();
			placeInfo.setId(Integer.valueOf(array[i]));
			int old = placeInfoService.selectPlaceInfoById(
					Integer.valueOf(array[i])).getIsValid();
			statue=old;
			placeInfo.setIsValid(old == 0 ? 1 : 0);
			count += placeInfoService.updatePlaceInfo(placeInfo);
		}

		if (count > 0) {
			response.getWriter().write(statue+"");

		} else {
			response.getWriter().write("岗位失效失败！");
		}

	}

	@Autowired
	private EnterpriseInfoService enterpriseInfoService;
	@Autowired
	private UserService userService;
	/**
	 * 插入企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/insertEnterpriseInfo")
	public void insertEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		response.setCharacterEncoding("utf-8");
		String situation = request.getParameter("situation");
		String enterpriseCode = request.getParameter("enterpriseCode");
		String isSignOrg = request.getParameter("isSignOrg");
		// String mainOrgName=request.getParameter("mainOrgName");
		String orgCode = request.getParameter("orgCode");
		String orgName = request.getParameter("orgName");
		String orgNature = request.getParameter("orgNature");
		String legalPerson = request.getParameter("legalPerson");
		String orgArea = request.getParameter("orgArea");
		String orgType = request.getParameter("orgType");
		String orgLevel = request.getParameter("orgLevel");
		String type = request.getParameter("type");
		String registerType = request.getParameter("registerType");
		String businessArea = request.getParameter("businessArea");
		String manageType = request.getParameter("manageType");
		String phone = request.getParameter("phone");
		String email = request.getParameter("email");
		String sendTime = request.getParameter("sendTime");
		String parentOrgType = request.getParameter("parentOrgType");
		String parentOrgCode = request.getParameter("parentOrgCode");
		String parentOrgName = request.getParameter("parentOrgName");
		String parentOrgLeader = request.getParameter("parentOrgLeader");
		String parentOrgPhone = request.getParameter("parentOrgPhone");
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
		enterpriseInfo.setPno(enterpriseCode);
		enterpriseInfo.setcCode(orgCode);

		enterpriseInfo.setProId(Integer.valueOf(orgNature));
		enterpriseInfo.setName(orgName);
		enterpriseInfo.setAddDate(new Date());
		// 设置是否为签约企业
		enterpriseInfo.setIsOrder(Integer.valueOf(isSignOrg));
		// 设置法人代表
		enterpriseInfo.setSname(legalPerson);
		// 单位所在行政区划：orgArea
		enterpriseInfo.setsArea(orgArea);
		// 填报单位类型：orgType
		enterpriseInfo.settType(orgType);
		// 设置填报单位层次
		enterpriseInfo.setSlevel(Integer.valueOf(orgLevel));
		// 设置机构类型
		enterpriseInfo.setJgType(type);
		enterpriseInfo.setJjType(registerType);
		enterpriseInfo.setArea(businessArea);
		enterpriseInfo.setTel(phone);
		enterpriseInfo.setEmail(email);
		enterpriseInfo.setUpUid(parentOrgLeader);
		enterpriseInfo.setUpType(parentOrgType);
		enterpriseInfo.setUpCode(parentOrgCode);
		if(!StringUtils.isEmpty(sendTime))
			enterpriseInfo.setUpDate(DateUtil.stringToDate(sendTime, "yyyy-MM-dd"));
		enterpriseInfo.setUpName(parentOrgName);
		enterpriseInfo.setUpTel(parentOrgPhone);
		enterpriseInfo.setMgType(manageType);
		enterpriseInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
		//
		/**
		 * messagefromid 0：内部创建 1：外部注册 2：数据采集 后台创建的默认有效且已审核
		 */
		enterpriseInfo.setMsgFromId(0);
		enterpriseInfo.setIsValid("1");// 有效性设置？？？？？
		enterpriseInfo.setIsState(0);// 设置审核状态为 未审核
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		if (uid != null) {
			enterpriseInfo.setUserId(Integer.valueOf(uid));
		}
		// 添加主企业
		if (situation.equals("1")) {
			enterpriseInfo.setParentId(-1);

		} else {// 添加子企业
			String parentId = request.getParameter("parentId");
			enterpriseInfo.setParentId(Integer.valueOf(parentId));

		}
		EnterpriseInfo e=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
		if(e!=null){
			response.getWriter().write("该组织机构代码已经存在！");
			response.getWriter().flush();
			return;
		}

		EnterpriseInfo e1=enterpriseInfoService.selectEnterpriseByPno(enterpriseInfo);
		if(e1!=null&&e1.getPno()!=null&&!e1.getPno().equals("")){
			response.getWriter().write("该企业代码已经存在！");
			response.getWriter().flush();
			return;
		}

		int count = enterpriseInfoService.insertEnterpriseInfo(enterpriseInfo);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("添加企业失败！");
		}

	}

	/**
	 * 列出企业菜单树
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listOrgMenuTree")
	public void listOrgMenuTree(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		List<MenuNode> nodes = listMenuTree(-1);
		response.getWriter().write(JSONArray.fromObject(nodes).toString());
	}

	/**
	 * 修改企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateEnterpriseInfo")
	public void updateEnterpriseInfo(@RequestParam Map<String,Object> params,HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String cCode=TextUtil.getString(params.get("orgCode"));
		Date nowTime = new Date(System.currentTimeMillis());
		SimpleDateFormat sdFormatter = new SimpleDateFormat("yyyy-MM-dd");
		String retStrFormatNowDate = sdFormatter.format(nowTime);
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
		enterpriseInfo.setcCode(cCode);
		EnterpriseInfo e=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
		if(e!=null&&e.getcCode()!=null&&!e.getcCode().equals(cCode)){
			response.getWriter().write("该组织机构代码已经存在！");
			response.getWriter().flush();
			return;
		}
		enterpriseInfo.setId(Integer.valueOf(id));
		enterpriseInfo.setPno(TextUtil.getString(params.get("enterpriseCode")));
		enterpriseInfo.setProId(TextUtil.getInt(params.get("orgNature")));
		enterpriseInfo.setName(TextUtil.getString(params.get("orgName")));
		enterpriseInfo.setAddDate(new Date());
		// 设置是否为签约企业
		enterpriseInfo.setIsOrder(TextUtil.getInt(params.get("isSignOrg")));
		// 设置法人代表
		enterpriseInfo.setSname(TextUtil.getString(params.get("legalPerson")));
		// 单位所在行政区划：orgArea
		enterpriseInfo.setsArea(TextUtil.getString(params.get("orgArea")));
		// 填报单位类型：orgType
		enterpriseInfo.settType(TextUtil.getString(params.get("orgType")));
		// 设置填报单位层次
		enterpriseInfo.setSlevel(TextUtil.getInt(params.get("orgLevel")));
		// 设置机构类型
		enterpriseInfo.setJgType(TextUtil.getString(params.get("type")));
		enterpriseInfo.setJjType(TextUtil.getString(params.get("registerType")));
		enterpriseInfo.setArea(TextUtil.getString(params.get("businessArea")));
		enterpriseInfo.setTel(TextUtil.getString(params.get("phone")));
		enterpriseInfo.setEmail(TextUtil.getString(params.get("email")));
		enterpriseInfo.setUpUid(TextUtil.getString(params.get("parentOrgLeader")));
		enterpriseInfo.setUpType(TextUtil.getString(params.get("parentOrgType")));
		enterpriseInfo.setUpCode(TextUtil.getString(params.get("parentOrgCode")));

		enterpriseInfo.setUpDate(DateUtil.stringToDate(retStrFormatNowDate, "yyyy-MM-dd"));
		enterpriseInfo.setUpName(TextUtil.getString(params.get("parentOrgName")));
		enterpriseInfo.setUpTel(TextUtil.getString(params.get("parentOrgPhone")));
		enterpriseInfo.setMgType(TextUtil.getString(params.get("manageType")));
		enterpriseInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));

		//
		/**
		 * messagefromid 0：内部创建 1：外部注册 2：数据采集 后台创建的默认有效且已审核
		 */
		enterpriseInfo.setMsgFromId(0);
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		if (uid != null) {
			enterpriseInfo.setUserId(Integer.valueOf(uid));
		}
		int count = enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("修改企业失败！");
		}
	}
	/**
	 * 审核企业
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkEnterpriseInfo")
	public void checkEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		String id=TextUtil.getString(request.getParameter("id"));
		String status=request.getParameter("status");
		String content=request.getParameter("content");
		String checkUserId=request.getParameter("checkUserId");
		try{
			EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
			enterpriseInfo.setId(Integer.valueOf(id));
			if(status!=null){
				enterpriseInfo.setIsState(Integer.valueOf(status));
			}
			enterpriseInfo.setsMsg(content);
			if(checkUserId!=null){
				enterpriseInfo.setUid(Integer.valueOf(checkUserId));
			}
			int count=enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo);
			if(count>0){
				response.getWriter().write("1");
			}else{
				response.getWriter().write("审核企业失败！");
			}

		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}

	/**
	 * 采集授权和取消授权
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/authorizeEnterpriseInfo")
	public void authorizeEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		String id=TextUtil.getString(request.getParameter("id"));
		String authorize= request.getParameter("authorize");

		EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
		enterpriseInfo.setId(Integer.valueOf(id));
		if(authorize!=null){
			enterpriseInfo.setIsAuthorize(Integer.valueOf(authorize));
		}
		int count=enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo);
		if(count>0){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("授权企业失败！");
		}

	}

	/**
	 * 删除企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/deleteEnterpriseInfo")
	public void deleteEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
		enterpriseInfo.setParentId(Integer.valueOf(id));
		int size=enterpriseInfoService.listEnterpriseInfo(enterpriseInfo).size();
		if(size>0){
			response.getWriter().write("该企业下包含子企业，不能删除！");

		}else{
			int count = enterpriseInfoService.deleteEnterpriseInfo(Integer
					.valueOf(id));
			if (count > 0) {
				response.getWriter().write("1");
			} else {
				response.getWriter().write("删除企业失败！");
			}
		}


	}

	/**
	 * 列出企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listEnterpriseInfo")
	public void listEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		int page=TextUtil.getInt(request.getParameter("page"));
		int rows=TextUtil.getInt(request.getParameter("rows"));
		page=page<=0?1:page;
		rows=rows<=0?10:rows;
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
		String selectOrgCode=request.getParameter("selectOrgCode");
		String selectOrgName=request.getParameter("selectOrgName");
		String selectOrgType=request.getParameter("selectOrgType");
		String selectOrgType1=request.getParameter("selectOrgType1");
		String selectIsValid=request.getParameter("selectIsValid");
		String selectCheckType=request.getParameter("selectCheckType");
		String selectMsgFrom=request.getParameter("selectMsgFrom");
		if(selectOrgCode!=null&&!selectOrgCode.trim().isEmpty()){

			enterpriseInfo.setcCode(selectOrgCode);
		}
		if(selectOrgName!=null&&!selectOrgName.trim().isEmpty()){
			enterpriseInfo.setName(selectOrgName);
		}
		//		if(selectOrgType!=null&&!selectOrgType.equals("4")){
		//			enterpriseInfo.setProId(Integer.valueOf(selectOrgType));
		//		}
		//		if(selectOrgType1!=null&&!selectOrgType1.equals("2")){
		//			//enterpriseInfo.setProId(Integer.valueOf(selectOrgType));
		//		}

		if(selectIsValid!=null&&!selectIsValid.equals("2")){
			enterpriseInfo.setIsValid(selectIsValid);
		}

		if(selectCheckType!=null&&!selectCheckType.equals("3")){
			enterpriseInfo.setIsState(Integer.valueOf(selectCheckType));
		}
		if(selectMsgFrom!=null&&!selectMsgFrom.equals("3")){
			enterpriseInfo.setMsgFromId(Integer.valueOf(selectMsgFrom));
		}
		PageHelper.startPage(page, rows);
		List<EnterpriseInfo> list = enterpriseInfoService.listEnterpriseInfo(enterpriseInfo);
		JSONArray jArray=new JSONArray();
		JSONObject obj=new JSONObject();
		for(int i=0;i<list.size();i++){
			JSONObject jobj=new JSONObject();
			EnterpriseInfo mi=list.get(i);
			jobj.put("id1", mi.getId());
			EnterpriseInfo main=enterpriseInfoService.selectEnterpriseById(mi.getParentId());
			jobj.put("mainOrg", main!=null?main.getName():"");
			if(mi.getParentId()==null||mi.getParentId()==-1){
				jobj.put("orgType1",1);
			}else {
				jobj.put("orgType1",2);
			}
			jobj.put("orgType",mi.gettType());//
			jobj.put("orgCode", mi.getcCode());
			jobj.put("orgName", mi.getName());
			jobj.put("orgType2", mi.getProId());
			jobj.put("available", mi.getIsValid());
			jobj.put("status", mi.getIsState());
			jobj.put("isAuthorize", mi.getIsAuthorize());
			jobj.put("options", "");
			User user=userService.selectByPrimaryKey(mi.getUserId());
			jobj.put("source", mi.getMsgFromId());
			jobj.put("creator", user!=null?user.getUsername():"");
			jobj.put("createTime",mi.getAddDate()!=null? new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()):"");
			jobj.put("manageType", mi.getMgType());
			jobj.put("isSignOrg", mi.getIsOrder());
			jobj.put("mainOrgName",  mi.getName());
			jobj.put("enterpriseCode", mi.getPno());
			jobj.put("orgNature", mi.getProId());
			jobj.put("legalPerson", mi.getSname());
			jobj.put("orgArea", mi.getsArea());
			jobj.put("orgLevel", mi.getSlevel());
			jobj.put("type", mi.getJgType());
			jobj.put("registerType", mi.getJjType());
			jobj.put("businessArea", mi.getArea());
			jobj.put("phone", mi.getTel());
			jobj.put("email", mi.getEmail());
			jobj.put("sendTime",mi.getUpDate()!=null? new SimpleDateFormat("yyyy-MM-dd").format(mi.getUpDate()):"");
			jobj.put("parentOrgType", mi.getUpType());
			jobj.put("parentOrgCode", mi.getUpCode());
			jobj.put("parentOrgName", mi.getUpName());
			jobj.put("parentOrgLeader", mi.getUpUid());
			jobj.put("parentOrgPhone", mi.getUpTel());

			jArray.add(jobj);
		}
		PageInfo<EnterpriseInfo> pageInfo=new PageInfo<EnterpriseInfo>(list);
		obj.put("rows", jArray);
		obj.put("total", pageInfo.getTotal());
		obj.put("flag", true);
		obj.put("cause", false);
		response.getWriter().write(obj.toString());
	}

	/**
	 * 无效企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/invalidEnterprise")
	public void invalidEnterpriseInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String id = request.getParameter("id");
		String isValid = request.getParameter("isValid");
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
		enterpriseInfo.setId(Integer.valueOf(id));
		enterpriseInfo.setIsValid(isValid);
		int count = enterpriseInfoService.updateEnterpriseInfo(enterpriseInfo);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("无效该企业失败！");
		}
	}

	/**
	 * 列出企业菜单树
	 * 
	 * @param parentId
	 * @return
	 */
	public List<MenuNode> listMenuTree(Integer parentId) {

		List<MenuNode> nodes = new ArrayList<MenuNode>();
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
		enterpriseInfo.setParentId(parentId);
		List<EnterpriseInfo> list = enterpriseInfoService
				.listEnterpriseInfo(enterpriseInfo);
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
				MenuNode node = new MenuNode();
				node.setState("open");
				node.setId(list.get(i).getId() + "");
				node.setText(list.get(i).getName());
				node.setChildren(listMenuTree(list.get(i).getId()));
				nodes.add(node);
			}
		}
		return nodes;
	}

	/**
	 * 删除部门
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/deleteDepartment")
	public void deleteDepartment(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String id=request.getParameter("id");
		response.setCharacterEncoding("utf-8");
		if(id!=null&&!id.trim().isEmpty()){

			int count=departmentInfoService.deleteDepartmentInfo(Integer.valueOf(id));
			if(count>0){
				response.getWriter().write("1");
			}else{
				response.getWriter().write("删除部门失败！");
			}
		}


	}
	@RequestMapping("/checkDepartment")
	public void checkDepartment(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setCharacterEncoding("utf-8");
		String []ids=request.getParameterValues("id");
		String []checks=request.getParameterValues("check");
		String []advices=request.getParameterValues("advice");
		if(ids!=null&&ids.length>0){
			int count=0;
			for(int i=0;i<ids.length;i++){
				DepartmentInfo departmentInfo=new DepartmentInfo();
				departmentInfo.setId(Integer.valueOf(ids[i]));
				departmentInfo.setIsState(Integer.valueOf(checks[i]));
				departmentInfo.setMsg(advices[i]);
				String uid=(String) request.getSession().getAttribute("uid");
				departmentInfo.setStaffId(uid!=null?Integer.valueOf(uid):1);
				count+=departmentInfoService.updateDepartmentInfo(departmentInfo);
			}
			if(count>0){
				response.getWriter().write("1");
			}else{
				response.getWriter().write("审核部门失败！");
			}
		}else{
			response.getWriter().write("您当前尚未审核部门！");
		}
	}

	@RequestMapping("/checkOrgCode")
	public void checkOrgCodeIsExist(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String orgCode=request.getParameter("orgCode");
		EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
		enterpriseInfo.setcCode(orgCode);
		response.setCharacterEncoding("utf-8");
		EnterpriseInfo e=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
		if(e!=null){

			response.getWriter().write("系统中已经存在该组织机构代码！");
		}else{
			response.getWriter().write("1");

		}
	}
	@RequestMapping("/generateFlowNum")
	public void generateFlowNum(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setCharacterEncoding("utf-8");
		String activityCode = request.getParameter("activityCode");
		String pno=placeInfoService.generateFlowNum(Integer.valueOf(activityCode));
		response.getWriter().write(pno);
		response.getWriter().flush();
	}
	
	@RequestMapping("/generateactivityCode")
	public void generateactivityCode(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setCharacterEncoding("utf-8");
		Map param = new HashMap<String, String>();
		List<Map<String,Object>> acList=bgActivityInfoService.selectListAcBeforeStart(param);
		if(null != acList && acList.size()<=0){
			Map map = new HashMap<String, String>();
			map.put("value", -1);
			map.put("text", "暂无可选招聘活动");
			map.put("selected", true);
			acList.add(map);
		}else{
			Map map = new HashMap<String, String>();
			map.put("value", -2);
			map.put("text", "请先选择招聘活动");
			map.put("selected", true);
			acList.add(0, map);
		}
		String json =JSONArray.fromObject(acList).toString();
		response.getWriter().write(json);
		response.getWriter().flush();
	}
	
	@RequestMapping("/generateactivityCodeAll")
	public void generateactivityCodeAll(HttpServletRequest request,HttpServletResponse response)throws Exception{
		response.setCharacterEncoding("utf-8");
		Map param = new HashMap<String, String>();
		List<Map<String,Object>> acList=bgActivityInfoService.selectListAcAll(param);
		if(null != acList && acList.size()<=0){
			Map map = new HashMap<String, String>();
			map.put("value", -1);
			map.put("text", "暂无可选招聘活动");
			map.put("selected", true);
			acList.add(map);
		}else{
			Map map = new HashMap<String, String>();
			map.put("value", -2);
			map.put("text", "全部");
			map.put("selected", true);
			acList.add(0, map);
		}
		String json =JSONArray.fromObject(acList).toString();
		response.getWriter().write(json);
		response.getWriter().flush();
	}

	/**
	 * 采集企业信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listUnitInfo")
	public void listUnitInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String orgCode = request.getParameter("selectOrgCode");
		String orgName = request.getParameter("selectOrgName");
		String check = request.getParameter("selectCheck");
		UnitInfo unitInfo=new UnitInfo();
		if(orgCode!=null&&!orgCode.trim().isEmpty()){
			unitInfo.setOrgCode(orgCode);
		}
		if(orgName!=null&&!orgName.trim().isEmpty()){
			unitInfo.setOrgName(orgName);
		}
		if(check!=null&&!check.equals("3")){
			unitInfo.setStatus(check);
		}
		JSONObject objs=new JSONObject();
		JSONArray jArray=new JSONArray();
		int page=TextUtil.getInt(request.getParameter("page"));
		int rows=TextUtil.getInt(request.getParameter("rows"));
		page=page<=0?1:page;
		rows=rows<=0?10:rows;
		PageHelper.startPage(page, rows);
		List<UnitInfo> unitInfos=unitInfoService.queryUnitList(unitInfo);
		for(int i=0;i<unitInfos.size();i++){
			JSONObject jobj=new JSONObject();
			UnitInfo uInfo=unitInfos.get(i);
			EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
			enterpriseInfo.setcCode(uInfo.getOrgCode());
			enterpriseInfo=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
			EnterpriseInfo main=enterpriseInfoService.selectEnterpriseById(enterpriseInfo.getParentId());
			jobj.put("id1", uInfo.getId());
			jobj.put("mainOrg", main!=null?main.getName():"");
			jobj.put("orgType", main!=null?"1":"0");//
			jobj.put("orgCode", uInfo.getOrgCode());
			jobj.put("orgName", uInfo.getOrgName());
			jobj.put("status", uInfo.getStatus());
			jobj.put("content", uInfo.getContent());

			User user=userService.selectByPrimaryKey(enterpriseInfo.getUserId());
			jobj.put("dataSource", enterpriseInfo.getMsgFromId());
//			jobj.put("creator", user!=null?user.getRealName():"");
			jobj.put("creator", main!=null?main.getName():uInfo.getOrgName());
			jobj.put("createTime",enterpriseInfo.getAddDate()!=null? new SimpleDateFormat("yyyy-MM-dd").format(enterpriseInfo.getAddDate()):"");

			jobj.put("otherName", uInfo.getOtherName());
			jobj.put("competentDepartment", uInfo.getCompetentDepartment());
			jobj.put("approvalNumber", uInfo.getApprovalNumber());
			jobj.put("establishTime", uInfo.getEstablishTime()!=null? new SimpleDateFormat("yyyy-MM-dd").format(uInfo.getEstablishTime()):"");
			jobj.put("unitNature", uInfo.getUnitNature());
			jobj.put("unitLevel", uInfo.getUnitLevel());
			jobj.put("fundsSource", uInfo.getFundsSource());
			jobj.put("industryInvolved", uInfo.getIndustryInvolved());
			jobj.put("corporateRepresentative", uInfo.getCorporateRepresentative());
			jobj.put("unitAllNumber", uInfo.getUnitAllNumber());
			jobj.put("unitNowNumber", uInfo.getUnitNowNumber());
			jobj.put("codeNumber", uInfo.getCodeNumber());
			jobj.put("unitAddress", uInfo.getUnitAddress());

			jobj.put("postalCode", uInfo.getPostalCode());
			jobj.put("branchedLeader", uInfo.getBranchedLeader());
			jobj.put("branchedLeaderPhone", uInfo.getBranchedLeaderPhone());
			jobj.put("branchedLeaderMobile", uInfo.getBranchedLeaderMobile());
			jobj.put("branchedLeaderEmail", uInfo.getBranchedLeaderEmail());
			jobj.put("personnelLeader", uInfo.getPersonnelLeader());
			jobj.put("personnelLeaderPhone", uInfo.getPersonnelLeaderPhone());
			jobj.put("personnelLeaderMobile", uInfo.getPersonnelLeaderMobile());
			jobj.put("personnelLeaderEmail", uInfo.getPersonnelLeaderEmail());
			jobj.put("personnelLeaderFax", uInfo.getPersonnelLeaderFax());

			jArray.add(jobj);
		}
		PageInfo<UnitInfo> pageInfo=new PageInfo<UnitInfo>(unitInfos);
		objs.put("rows", jArray);
		objs.put("total", pageInfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		response.getWriter().write(objs.toString());

	}

	/**
	 * 审核企业
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkUnitInfo")
	public void checkUnitInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		String id=TextUtil.getString(request.getParameter("id"));
		String status=request.getParameter("status");
		String content=request.getParameter("content");
		String checkUserId=request.getParameter("checkUserId");
		try{
			UnitInfo unitInfo=new UnitInfo();
			unitInfo.setId(Integer.valueOf(id));
			if(status!=null){
				unitInfo.setStatus(status);
			}
			unitInfo.setContent(content);
			if(checkUserId!=null){
				unitInfo.setUid(Integer.valueOf(checkUserId));
			}
			int count=unitInfoService.updateByPrimaryKeySelective(unitInfo);
			if(count>0){
				response.getWriter().write("1");
			}else{
				response.getWriter().write("审核企业失败！");
			}

		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}


	/**导出企业模板
	 * @param response
	 * @param request
	 */
	@RequestMapping("/qyDownload")  
	@ResponseBody
	public void qyDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/zzgl/down", "qydrmb.xlsx","企业导入模板.xlsx");//成绩导入模板
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**企业导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/qyUpload")  
	public  void qyUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=true;
		String dateFlag1="";
		String infoMsg="";//已存在身份证号+教育编号
		String cause="";
		List<ImpEnterpriseInfo> slist=null;

		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
			File newFile=ResultConstant.fileupload(request, response, "temp/zzgl/upload/",newFileName);
			//读取导入的文件
			ImportExcel<ImpEnterpriseInfo> importExcel = new ImportExcel<ImpEnterpriseInfo>(ImpEnterpriseInfo.class);
			List<ImpEnterpriseInfo> results = (List<ImpEnterpriseInfo>) importExcel.importExcel(newFile,"0");
			if(results!=null&&results.size()>0){
				//数量不能超过1000条
				if(results.size()>1000){
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入的记录数最大不能超过1000条");
					ResultConstant.write(response, jsonObject);
					return;
				}
				//校验标题是否存在
				Map<String, String> lackMap=importExcel.isTitle(newFile); 
				if(lackMap!=null&&lackMap.size()>0){
					String title="";
					for(Map.Entry<String, String> m:lackMap.entrySet()){
						title+=" "+m.getValue();
					}
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入文件标题缺失："+title);
					ResultConstant.write(response, jsonObject);
					return;
				}

				slist=new ArrayList<ImpEnterpriseInfo>();
				int i=0;
				Map<String,String> map1=new HashMap<String,String>();
				for (ImpEnterpriseInfo impInfo : results) {
					i=i+1;
					String mainOrgName=ResultConstant.replaceTrim(impInfo.getMainOrgName());
					String enterpriseCode=ResultConstant.replaceTrim(impInfo.getEnterpriseCode());
					String manageType=ResultConstant.replaceTrim(impInfo.getManageType());
					String isSignOrg=ResultConstant.replaceTrim(impInfo.getIsSignOrg());
					String orgCode=ResultConstant.replaceTrim(impInfo.getOrgCode());
					String orgName=ResultConstant.replaceTrim(impInfo.getOrgName());
					String orgNature=ResultConstant.replaceTrim(impInfo.getOrgNature());
					String legalPerson=ResultConstant.replaceTrim(impInfo.getLegalPerson());
					String orgArea=ResultConstant.replaceTrim(impInfo.getOrgArea());
					String orgType=ResultConstant.replaceTrim(impInfo.getOrgType());
					String orgLevel=ResultConstant.replaceTrim(impInfo.getOrgLevel());
					String type=ResultConstant.replaceTrim(impInfo.getType());
					String registerType=ResultConstant.replaceTrim(impInfo.getRegisterType());
					String businessArea=ResultConstant.replaceTrim(impInfo.getBusinessArea());
					String phone=ResultConstant.replaceTrim(impInfo.getPhone());
					String email=ResultConstant.replaceTrim(impInfo.getEmail());
					String cwts="";
					
					EnterpriseInfo e=null;
					//主企业对应主企业记录的组织机构代码
					//主企业字段值不为空，那么导入的肯定是子企业
				  	if(StringUtils.isNotEmpty(mainOrgName)){
				  		
				  		if(!ValidatorUtil.isNumberOrEng(mainOrgName)){
							cwts+=" 主企业只能为数字或字母;";
						}
				  		
						//子企业的话必须存在主企业，根据主企业和企业代码查询是否存在
						e=new EnterpriseInfo();
						e.setcCode(mainOrgName);
						e.setPno(enterpriseCode);
						List<EnterpriseInfo> enterpriseInfos=enterpriseInfoService.listEnterpriseInfo(e);
						if(enterpriseInfos==null||enterpriseInfos.size()<=0){
							cwts+=" “"+mainOrgName+"”不是主企业;";
						}
						
					}
					if(StringUtils.isEmpty(enterpriseCode)){
						cwts+=" 企业代码不能为空;";
					}else{
						if(!ValidatorUtil.isNumberOrEng(enterpriseCode)){
							cwts+=" 企业代码只能为数字或字母;";
						}
						
					}
					
					
					if(StringUtils.isEmpty(manageType)){
						cwts+=" 管理类型不能为空;";
					}
					if(StringUtils.isEmpty(isSignOrg)){
						cwts+=" 是否签约企业不能为空;";
					}else if(!isSignOrg.equals("是")&&!isSignOrg.equals("否")){
						cwts+=" 是否签约企业只能为“是”或“否”;";
					} 
					
					if(StringUtils.isEmpty(orgCode)){
						cwts+=" 组织机构代码不能为空;";
					}else{
						if(!ValidatorUtil.isNumberOrEng(orgCode)){
							cwts+=" 组织机构代码只能为数字或字母;";
						}
						
					}
					
					if(StringUtils.isEmpty(orgName)){
						cwts+=" 单位名称不能为空;";
					}
					if(StringUtils.isEmpty(orgNature)){
						cwts+=" 企业性质不能为空;";
					}else{//0:私企，1：国企，2：外企，3：合资
						if(!orgNature.equals("私企")&&!orgNature.equals("国企")&&!orgNature.equals("外企")&&!orgNature.equals("合资")){
							cwts+=" 企业性质只能填写 私企，国企，外企，合资;";
						}
						
					}
					if(StringUtils.isEmpty(legalPerson)){
						cwts+=" 法人代表不能为空;";
					}
					if(StringUtils.isEmpty(orgArea)){
						cwts+=" 单位所在行政区划不能为空;";
					}
					if(StringUtils.isEmpty(orgType)){
						cwts+=" 填报单位类型不能为空;";
					}
					if(StringUtils.isEmpty(orgLevel)){
						cwts+=" 层次不能为空;";
					}else {
						try {
							Integer.valueOf(orgLevel);
						} catch (Exception ee) {
							cwts+=" 层次只能为正整数;";
						}
						
					} 
					if(StringUtils.isEmpty(type)){
						cwts+=" 机构类型不能为空;";
					}
					if(StringUtils.isEmpty(registerType)){
						cwts+=" 注册经济类型不能为空;";
					}
					if(StringUtils.isEmpty(businessArea)){
						cwts+=" 单位主管业务区域不能为空;";
					}
					if(StringUtils.isEmpty(phone)){
						cwts+=" 联系电话不能为空;";
					}else{
						if(!ValidatorUtil.isMobile2(phone)&&!ValidatorUtil.isPhone(phone) ){
							cwts+=" 联系电话不符合规范;";
						}
						
					}
					if(StringUtils.isEmpty(email)){
						cwts+=" 邮箱号码不能为空;";
					}else{
						if(!ValidatorUtil.isEmail(email)){
							cwts+=" 邮箱号码不符合规范;";
						}
					}
					
					e=new EnterpriseInfo();
					e.setcCode(orgCode);//组织机构代码
					List<EnterpriseInfo> enterpriseInfos=enterpriseInfoService.listEnterpriseInfo(e);
					if(enterpriseInfos!=null&&enterpriseInfos.size()>0){
						cwts+=" 组织机构代码已存在;";
					}
					//e.setName(mainOrgName);

					impInfo.setId(i);
					impInfo.setCwts(cwts);
					if(StringUtils.isNotBlank(cwts)){
						dateFlag1="true";
					}
					slist.add(impInfo);
				}

			}
		}
		catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}

		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", slist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag1);//错误标识
		jsonObject.put("infoMsg", infoMsg);
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);
	}
	
	
	
	/**添加企业
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addQyList")  
	public  @ResponseBody Map<String, Object> addQyList(HttpServletResponse response,HttpServletRequest request,@RequestBody List<ImpEnterpriseInfo> qyList){
		boolean flag=false;
		String cause="";
		try {
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			enterpriseInfoService.insertQyList(qyList,uid);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**导出excel
	 * @param response
	 * @param request
	 */
	@RequestMapping("/qyExport")  
	@ResponseBody
	public void qyExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			enterpriseInfoService.qyExport(response, request);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	
}
