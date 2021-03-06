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
					response.getWriter().write("???????????????????????????");
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
					// ?????????????????????id
					departmentInfo.setMsgFromId(0);
					departmentInfo.setMsg("??????");

					// ???????????????????????????id
					String uid=(String) request.getSession().getAttribute("uid");
					departmentInfo.setUserId(uid==null?1:Integer.valueOf(uid));
					departmentInfo.setStaffId(uid==null?1:Integer.valueOf(uid));
					// ??????????????????????????????id
					departmentInfo.setEnterpriseId(Integer.valueOf(orgId));
					count += departmentInfoService
							.insertDepartmentInfo(departmentInfo);
				}

			}
			if (count > 0) {
				response.getWriter().write("1");
				response.getWriter().flush();
			} else {
				response.getWriter().write("????????????????????????");
				response.getWriter().flush();
			}
		} else {
			response.getWriter().write("????????????????????????????????????");
			response.getWriter().flush();
		}

	}

	/**
	 * ??????????????????????????????
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
	 * ????????????
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
				//?????????????????????????????????????????????????????????????????????
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
			response.getWriter().write("?????????????????????");
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
			response.getWriter().write("?????????????????????");
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
			response.getWriter().write("?????????????????????");
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

			//??????ac_id ???????????????????????????
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
			response.getWriter().write("?????????????????????");
		}

	}

	@Autowired
	private EnterpriseInfoService enterpriseInfoService;
	@Autowired
	private UserService userService;
	/**
	 * ??????????????????
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
		// ???????????????????????????
		enterpriseInfo.setIsOrder(Integer.valueOf(isSignOrg));
		// ??????????????????
		enterpriseInfo.setSname(legalPerson);
		// ???????????????????????????orgArea
		enterpriseInfo.setsArea(orgArea);
		// ?????????????????????orgType
		enterpriseInfo.settType(orgType);
		// ????????????????????????
		enterpriseInfo.setSlevel(Integer.valueOf(orgLevel));
		// ??????????????????
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
		 * messagefromid 0??????????????? 1??????????????? 2??????????????? ???????????????????????????????????????
		 */
		enterpriseInfo.setMsgFromId(0);
		enterpriseInfo.setIsValid("1");// ??????????????????????????????
		enterpriseInfo.setIsState(0);// ????????????????????? ?????????
		HttpSession session = request.getSession();
		String uid = (String) session.getAttribute("uid");
		if (uid != null) {
			enterpriseInfo.setUserId(Integer.valueOf(uid));
		}
		// ???????????????
		if (situation.equals("1")) {
			enterpriseInfo.setParentId(-1);

		} else {// ???????????????
			String parentId = request.getParameter("parentId");
			enterpriseInfo.setParentId(Integer.valueOf(parentId));

		}
		EnterpriseInfo e=enterpriseInfoService.selectEnterpriseBycCode(enterpriseInfo);
		if(e!=null){
			response.getWriter().write("????????????????????????????????????");
			response.getWriter().flush();
			return;
		}

		EnterpriseInfo e1=enterpriseInfoService.selectEnterpriseByPno(enterpriseInfo);
		if(e1!=null&&e1.getPno()!=null&&!e1.getPno().equals("")){
			response.getWriter().write("??????????????????????????????");
			response.getWriter().flush();
			return;
		}

		int count = enterpriseInfoService.insertEnterpriseInfo(enterpriseInfo);
		if (count > 0) {
			response.getWriter().write("1");
		} else {
			response.getWriter().write("?????????????????????");
		}

	}

	/**
	 * ?????????????????????
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
	 * ??????????????????
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
			response.getWriter().write("????????????????????????????????????");
			response.getWriter().flush();
			return;
		}
		enterpriseInfo.setId(Integer.valueOf(id));
		enterpriseInfo.setPno(TextUtil.getString(params.get("enterpriseCode")));
		enterpriseInfo.setProId(TextUtil.getInt(params.get("orgNature")));
		enterpriseInfo.setName(TextUtil.getString(params.get("orgName")));
		enterpriseInfo.setAddDate(new Date());
		// ???????????????????????????
		enterpriseInfo.setIsOrder(TextUtil.getInt(params.get("isSignOrg")));
		// ??????????????????
		enterpriseInfo.setSname(TextUtil.getString(params.get("legalPerson")));
		// ???????????????????????????orgArea
		enterpriseInfo.setsArea(TextUtil.getString(params.get("orgArea")));
		// ?????????????????????orgType
		enterpriseInfo.settType(TextUtil.getString(params.get("orgType")));
		// ????????????????????????
		enterpriseInfo.setSlevel(TextUtil.getInt(params.get("orgLevel")));
		// ??????????????????
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
		 * messagefromid 0??????????????? 1??????????????? 2??????????????? ???????????????????????????????????????
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
			response.getWriter().write("?????????????????????");
		}
	}
	/**
	 * ????????????
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
				response.getWriter().write("?????????????????????");
			}

		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}

	/**
	 * ???????????????????????????
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
			response.getWriter().write("?????????????????????");
		}

	}

	/**
	 * ??????????????????
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
			response.getWriter().write("?????????????????????????????????????????????");

		}else{
			int count = enterpriseInfoService.deleteEnterpriseInfo(Integer
					.valueOf(id));
			if (count > 0) {
				response.getWriter().write("1");
			} else {
				response.getWriter().write("?????????????????????");
			}
		}


	}

	/**
	 * ??????????????????
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
	 * ??????????????????
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
			response.getWriter().write("????????????????????????");
		}
	}

	/**
	 * ?????????????????????
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
	 * ????????????
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
				response.getWriter().write("?????????????????????");
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
				response.getWriter().write("?????????????????????");
			}
		}else{
			response.getWriter().write("??????????????????????????????");
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

			response.getWriter().write("?????????????????????????????????????????????");
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
			map.put("text", "????????????????????????");
			map.put("selected", true);
			acList.add(map);
		}else{
			Map map = new HashMap<String, String>();
			map.put("value", -2);
			map.put("text", "????????????????????????");
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
			map.put("text", "????????????????????????");
			map.put("selected", true);
			acList.add(map);
		}else{
			Map map = new HashMap<String, String>();
			map.put("value", -2);
			map.put("text", "??????");
			map.put("selected", true);
			acList.add(0, map);
		}
		String json =JSONArray.fromObject(acList).toString();
		response.getWriter().write(json);
		response.getWriter().flush();
	}

	/**
	 * ??????????????????
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
	 * ????????????
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
				response.getWriter().write("?????????????????????");
			}

		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}


	/**??????????????????
	 * @param response
	 * @param request
	 */
	@RequestMapping("/qyDownload")  
	@ResponseBody
	public void qyDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/zzgl/down", "qydrmb.xlsx","??????????????????.xlsx");//??????????????????
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**????????????
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/qyUpload")  
	public  void qyUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=true;
		String dateFlag1="";
		String infoMsg="";//?????????????????????+????????????
		String cause="";
		List<ImpEnterpriseInfo> slist=null;

		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
			File newFile=ResultConstant.fileupload(request, response, "temp/zzgl/upload/",newFileName);
			//?????????????????????
			ImportExcel<ImpEnterpriseInfo> importExcel = new ImportExcel<ImpEnterpriseInfo>(ImpEnterpriseInfo.class);
			List<ImpEnterpriseInfo> results = (List<ImpEnterpriseInfo>) importExcel.importExcel(newFile,"0");
			if(results!=null&&results.size()>0){
				//??????????????????1000???
				if(results.size()>1000){
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "????????????????????????????????????1000???");
					ResultConstant.write(response, jsonObject);
					return;
				}
				//????????????????????????
				Map<String, String> lackMap=importExcel.isTitle(newFile); 
				if(lackMap!=null&&lackMap.size()>0){
					String title="";
					for(Map.Entry<String, String> m:lackMap.entrySet()){
						title+=" "+m.getValue();
					}
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "???????????????????????????"+title);
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
					//???????????????????????????????????????????????????
					//???????????????????????????????????????????????????????????????
				  	if(StringUtils.isNotEmpty(mainOrgName)){
				  		
				  		if(!ValidatorUtil.isNumberOrEng(mainOrgName)){
							cwts+=" ?????????????????????????????????;";
						}
				  		
						//???????????????????????????????????????????????????????????????????????????????????????
						e=new EnterpriseInfo();
						e.setcCode(mainOrgName);
						e.setPno(enterpriseCode);
						List<EnterpriseInfo> enterpriseInfos=enterpriseInfoService.listEnterpriseInfo(e);
						if(enterpriseInfos==null||enterpriseInfos.size()<=0){
							cwts+=" ???"+mainOrgName+"??????????????????;";
						}
						
					}
					if(StringUtils.isEmpty(enterpriseCode)){
						cwts+=" ????????????????????????;";
					}else{
						if(!ValidatorUtil.isNumberOrEng(enterpriseCode)){
							cwts+=" ????????????????????????????????????;";
						}
						
					}
					
					
					if(StringUtils.isEmpty(manageType)){
						cwts+=" ????????????????????????;";
					}
					if(StringUtils.isEmpty(isSignOrg)){
						cwts+=" ??????????????????????????????;";
					}else if(!isSignOrg.equals("???")&&!isSignOrg.equals("???")){
						cwts+=" ????????????????????????????????????????????????;";
					} 
					
					if(StringUtils.isEmpty(orgCode)){
						cwts+=" ??????????????????????????????;";
					}else{
						if(!ValidatorUtil.isNumberOrEng(orgCode)){
							cwts+=" ??????????????????????????????????????????;";
						}
						
					}
					
					if(StringUtils.isEmpty(orgName)){
						cwts+=" ????????????????????????;";
					}
					if(StringUtils.isEmpty(orgNature)){
						cwts+=" ????????????????????????;";
					}else{//0:?????????1????????????2????????????3?????????
						if(!orgNature.equals("??????")&&!orgNature.equals("??????")&&!orgNature.equals("??????")&&!orgNature.equals("??????")){
							cwts+=" ???????????????????????? ?????????????????????????????????;";
						}
						
					}
					if(StringUtils.isEmpty(legalPerson)){
						cwts+=" ????????????????????????;";
					}
					if(StringUtils.isEmpty(orgArea)){
						cwts+=" ????????????????????????????????????;";
					}
					if(StringUtils.isEmpty(orgType)){
						cwts+=" ??????????????????????????????;";
					}
					if(StringUtils.isEmpty(orgLevel)){
						cwts+=" ??????????????????;";
					}else {
						try {
							Integer.valueOf(orgLevel);
						} catch (Exception ee) {
							cwts+=" ????????????????????????;";
						}
						
					} 
					if(StringUtils.isEmpty(type)){
						cwts+=" ????????????????????????;";
					}
					if(StringUtils.isEmpty(registerType)){
						cwts+=" ??????????????????????????????;";
					}
					if(StringUtils.isEmpty(businessArea)){
						cwts+=" ????????????????????????????????????;";
					}
					if(StringUtils.isEmpty(phone)){
						cwts+=" ????????????????????????;";
					}else{
						if(!ValidatorUtil.isMobile2(phone)&&!ValidatorUtil.isPhone(phone) ){
							cwts+=" ???????????????????????????;";
						}
						
					}
					if(StringUtils.isEmpty(email)){
						cwts+=" ????????????????????????;";
					}else{
						if(!ValidatorUtil.isEmail(email)){
							cwts+=" ???????????????????????????;";
						}
					}
					
					e=new EnterpriseInfo();
					e.setcCode(orgCode);//??????????????????
					List<EnterpriseInfo> enterpriseInfos=enterpriseInfoService.listEnterpriseInfo(e);
					if(enterpriseInfos!=null&&enterpriseInfos.size()>0){
						cwts+=" ???????????????????????????;";
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
			cause="??????????????????";
		}

		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", slist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag1);//????????????
		jsonObject.put("infoMsg", infoMsg);
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);
	}
	
	
	
	/**????????????
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addQyList")  
	public  @ResponseBody Map<String, Object> addQyList(HttpServletResponse response,HttpServletRequest request,@RequestBody List<ImpEnterpriseInfo> qyList){
		boolean flag=false;
		String cause="";
		try {
			//??????id
			HttpSession session = request.getSession();
			//????????????id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			enterpriseInfoService.insertQyList(qyList,uid);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="??????????????????";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**??????excel
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
