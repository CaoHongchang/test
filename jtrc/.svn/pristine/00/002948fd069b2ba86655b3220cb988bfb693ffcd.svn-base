package com.i84.earnpoint.rygl.controller;

import java.io.File;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.UserExpertImportInfo;
import com.i84.earnpoint.model.UserExpertImportInfo2;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * 专家管理
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/userExpertInfoTrol")
public class UserExpertInfoController  extends ResultConstant{

	@Autowired
	public RyglService ryglService;

	/**
	 * 	获取专家列表
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryExpertUserList")
	public  @ResponseBody Map<String, Object> queryExpertUserList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0) {
			page = 1;
		}
		int rows = TextUtil.getInt(request.getParameter("rows"));
		String s_username_no = request.getParameter("s_username_no");
		String s_userpnum_no = request.getParameter("s_userpnum_no");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);

		if(s_username_no!=null && !"".equals(s_username_no)&&!"输入姓名".equals(s_username_no)){
			params.put("name",s_username_no.trim());
		}

		if(s_userpnum_no!=null && !"".equals(s_userpnum_no)&&!"输入身份证号".equals(s_userpnum_no)){
			params.put("pnum",s_userpnum_no.trim());
		}
		List<Map<String, Object>> list = ryglService.queryExpertUserList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/queryExpertUserListMore")
	public  @ResponseBody Map<String, Object> queryExpertUserListMore(HttpServletResponse response,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0) {
			page = 1;
		}
		int rows = TextUtil.getInt(request.getParameter("rows"));
		String s_username_no = request.getParameter("s_username_no");
		String s_userpnum_no = request.getParameter("s_userpnum_no");
		String expert_name = request.getParameter("expertName");
		String protype =  request.getParameter("pro_type");
		//protype=URLDecoder.decode(protype, "UTF-8");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);

		
		if(s_username_no!=null && !"".equals(s_username_no)&&!"输入姓名".equals(s_username_no)){
			params.put("name",s_username_no.trim());
		}

		if(s_userpnum_no!=null && !"".equals(s_userpnum_no)&&!"输入身份证号".equals(s_userpnum_no)){
			params.put("pnum",s_userpnum_no.trim());
		}
		if(protype!=null&&protype!=""&&!protype.equals("全部")){
			String urlString;
			protype = new String(protype.getBytes("iso-8859-1"),"utf-8");
			urlString=URLDecoder.decode(protype,"utf-8");
			params.put("pro_type", urlString.trim());
			//Tomcat8用下面代码，7用上面代码
			//params.put("pro_type", protype);
		}
		List<Map<String, Object>> list = ryglService.queryExpertUserList4(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	
	/*
	 * 有排序的列表
	 */
	@RequestMapping("/queryExpertUserListOrder")
	public  @ResponseBody Map<String, Object> queryExpertUserListOrder(HttpServletResponse response,HttpServletRequest request) throws Exception{
		request.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0) {
			page = 1;
		}
		int rows = TextUtil.getInt(request.getParameter("rows"));
		String s_username_no = request.getParameter("s_username_no");
		String s_userpnum_no = request.getParameter("s_userpnum_no");
		String protype =  request.getParameter("pro_type");
		//protype=URLDecoder.decode(protype, "UTF-8");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);

		if(s_username_no!=null && !"".equals(s_username_no)&&!"输入姓名".equals(s_username_no)){
			params.put("name",s_username_no.trim());
		}

		if(s_userpnum_no!=null && !"".equals(s_userpnum_no)&&!"输入身份证号".equals(s_userpnum_no)){
			params.put("pnum",s_userpnum_no.trim());
		}
		if(protype!=null&&protype!=""&&!protype.equals("全部")){
			String urlString;
			protype = new String(protype.getBytes("iso-8859-1"),"utf-8");
			urlString=URLDecoder.decode(protype,"utf-8");
			params.put("pro_type", urlString.trim());
			//protype = new String(protype.get);
			//Tomcat8用下面代码，7用上面代码
			//params.put("pro_type", protype);	
			
		}
		List<Map<String, Object>> list = ryglService.queryExpertUserList5(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	

	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		ryglService.delExpertInfo(ids,response);
	}
	
	@RequestMapping("/del2")
	public  @ResponseBody void del2(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		ryglService.delExpert(ids,response);
	}


	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserExpertInfo userExpertInfo = new UserExpertInfo();
		UserInfo userInfo = new UserInfo();
		String zpno = request.getParameter("zpno");
		String name = request.getParameter("name");
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String pro_type = request.getParameter("pro_type");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String zg_level = request.getParameter("zg_level");
		userExpertInfo.setAddDate(new Date());
		userExpertInfo.setCompany(company);
		userExpertInfo.setProType(pro_type);
		//		userExpertInfo.setStaff(staff)
		userExpertInfo.setZgLevel(zg_level);
		userExpertInfo.setZpno(zpno);
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setWorkName(company);
		ryglService.addExpertInfo(userExpertInfo,userInfo,response);
	}

	@RequestMapping("/save2")
	public  @ResponseBody void saveMore(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserExpertInfoPickUp userExpertInfoPickUp = new UserExpertInfoPickUp();
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String zpno = request.getParameter("zpno");
		String name = request.getParameter("name");
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String birth_date = request.getParameter("birth_date");
		String place_name = request.getParameter("place_name");
		String pro_type = request.getParameter("pro_type");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String zg_level = request.getParameter("zg_level");
		String zg_time = request.getParameter("zg_time");
		String work_name= request.getParameter("work_name");
		String graduation_time = request.getParameter("graduation_time");
		String school = request.getParameter("school");
		String major = request.getParameter("major");
		String degree = request.getParameter("degree");
		String remark = request.getParameter("remark");
		
		userExpertInfoPickUp.setAdd_date(new Date());
		userExpertInfoPickUp.setCompany(company);
		userExpertInfoPickUp.setPro_type(pro_type);
		userExpertInfoPickUp.setZg_level(zg_level);
		if(zg_time!="")
		userExpertInfoPickUp.setZg_time1(formatter.parse(zg_time));
		userExpertInfoPickUp.setZpno(zpno);
		userExpertInfoPickUp.setName(name);
		userExpertInfoPickUp.setTel(tel);
		if(sex!="")
		userExpertInfoPickUp.setSex(sex);
		userExpertInfoPickUp.setPnum(pnum);
		userExpertInfoPickUp.setWork_name(work_name);
		if(birth_date!="")
		userExpertInfoPickUp.setBirth_date1(formatter.parse(birth_date));
		userExpertInfoPickUp.setPlace_name(place_name);
		if(graduation_time!="")
		userExpertInfoPickUp.setGraduation_time1(formatter.parse(graduation_time));
		if(school!="")
		userExpertInfoPickUp.setSchool(school);
		if(major!="")
		userExpertInfoPickUp.setMajor(major);
		if(degree!="")
		userExpertInfoPickUp.setDegree(degree);
		if(remark!="")
		userExpertInfoPickUp.setRemark(remark);
		ryglService.addExpertInfoMore(userExpertInfoPickUp,response);
	}
	
	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserExpertInfo userExpertInfo = new UserExpertInfo();
		UserInfo userInfo = new UserInfo();
		String zpno = request.getParameter("zpno");
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String pro_type = request.getParameter("pro_type");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String zg_level = request.getParameter("zg_level");
		userExpertInfo.setAddDate(new Date());
		userExpertInfo.setCompany(company);
		userExpertInfo.setProType(pro_type);
		//		userExpertInfo.setStaff(staff)
		userExpertInfo.setZgLevel(zg_level);
		userExpertInfo.setZpno(zpno);
		userExpertInfo.setId(Integer.parseInt(id));
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setWorkName(company);
		userInfo.setId(Integer.parseInt(uid));
		ryglService.updateExpertInfo(userExpertInfo,userInfo, response);
	}

	@RequestMapping("/update2")
	public  @ResponseBody void update2(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserExpertInfoPickUp userExpertInfoPickUp = new UserExpertInfoPickUp();
		java.text.SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String zpno = request.getParameter("zpno");
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String name = request.getParameter("name");
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String pro_type = request.getParameter("pro_type");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String zg_level = request.getParameter("zg_level");
		String zg_time = request.getParameter("zg_time");
		String birth_date = request.getParameter("birth_date");
		String place_name = request.getParameter("place_name");
		String work_name = request.getParameter("work_name");
		String graduation_time = request.getParameter("graduation_time");
		String school = request.getParameter("school");
		String major = request.getParameter("major");
		String degree = request.getParameter("degree");
		String remark = request.getParameter("remark");
		
		if(birth_date!="")
		userExpertInfoPickUp.setBirth_date1(formatter.parse(birth_date));
			
		
		userExpertInfoPickUp.setPlace_name(place_name);
		userExpertInfoPickUp.setWork_name(work_name);
		if(graduation_time!="")
			userExpertInfoPickUp.setGraduation_time1(formatter.parse(graduation_time));
		
		userExpertInfoPickUp.setSchool(school);
		userExpertInfoPickUp.setMajor(major);
		userExpertInfoPickUp.setDegree(degree);
		userExpertInfoPickUp.setRemark(remark);
		userExpertInfoPickUp.setAdd_date(new Date());
		
		userExpertInfoPickUp.setCompany(company);
		userExpertInfoPickUp.setPro_type(pro_type);
		userExpertInfoPickUp.setZg_level(zg_level);
		if(zg_time!=""){
			userExpertInfoPickUp.setZg_time(zg_time);
		}
		userExpertInfoPickUp.setZpno(zpno);
		userExpertInfoPickUp.setId(Integer.parseInt(id));
		userExpertInfoPickUp.setName(name);
		userExpertInfoPickUp.setTel(tel);
		userExpertInfoPickUp.setSex(sex);
		userExpertInfoPickUp.setPnum(pnum);
		userExpertInfoPickUp.setWork_name(company);
		ryglService.updateExpert(userExpertInfoPickUp, response);
	}
	

	/**
	 * 
	 * 记录本次抽取的专家
	 * 
	 */
	@RequestMapping("/updateToYes")
	public  @ResponseBody void updateToYes(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String[] ids = request.getParameter("ids").toString().split(",");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("ids",ids);
		List<Map<String, Object>> rylist =ryglService.queryExpertUserList3(map);
		ryglService.updateEffectedToFalse(rylist.get(0).get("pro_type").toString());
		for(int i=0;i<ids.length;i++)
		{
			ryglService.updateEffectedToTrue(Integer.parseInt(ids[i]));
		}
		ryglService.updateSelectedToFalse();
	}
	
	
	/**
	 * 导入文件
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importExcel")
	public @ResponseBody void importExcel(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		JSONObject resObject = new JSONObject();
		JSONArray array = new JSONArray();
		try {
			/*获取导入文件类型*/
			DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem();
			File f = fi.getStoreLocation();/**/
			String type = request.getParameter("type");
			boolean dataFlag = true;
			String tipMsg = "";//提示信息
			ImportExcel<UserExpertImportInfo> excelUtil = new ImportExcel<UserExpertImportInfo>(UserExpertImportInfo.class);
			List<UserExpertImportInfo> results = (List<UserExpertImportInfo>) excelUtil.importExcel(f);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");

			if(results!=null && results.size()>0){
				//数量不能超过1000条
				if(results.size()>1000){
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入的记录数最大不能超过1000条");
					ResultConstant.write(response, jsonObject);
					return;
					//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
				}
				List<UserExpertImportInfo> resList = new ArrayList<UserExpertImportInfo>();
				Map<String,String> saveMap = new HashMap<String,String>();
				for (UserExpertImportInfo tempVo : results) {
					String errMsg = "";
					tempVo.setPnum(tempVo.getPnum().trim());
					tempVo.setName(tempVo.getName().trim());
					tempVo.setTel(tempVo.getTel().trim());
					tempVo.setSex(tempVo.getSex().trim());
					tempVo.setCompany(tempVo.getCompany().trim());
					tempVo.setZpno(tempVo.getZpno().trim());
					tempVo.setZgLevel(tempVo.getZgLevel().trim());

					String pnum = tempVo.getPnum();// 身份证号
					String name = tempVo.getName();// 姓名
					String tel = tempVo.getTel();
					String sex = tempVo.getSex();
					String company = tempVo.getCompany();
					String zpno = tempVo.getZpno();
					String proType = tempVo.getProType();
					String zgLevel = tempVo.getZgLevel();


					if(StringUtils.isBlank(name)){
						dataFlag = false;
						errMsg = "专家姓名不能为空";
					}
					if(StringUtils.isNotBlank(pnum)){
						if(pnum.length() > 18 || pnum.length() < 15){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "身份证号必须是15到18位数字";
							}else{
								errMsg += ",身份证号必须是15到18位数字";
							}
						}else{
							if(null != saveMap.get(pnum)){
								dataFlag = false;
								if(StringUtils.isBlank(errMsg)){
									errMsg = "身份证不能重复上传，请检查数据";
								}else{
									errMsg += ",身份证不能重复上传，请检查数据";
								}
							}
							saveMap.put(pnum, "1");
							//校验是否存在
							Map<String, Object> partyMap = new HashMap<String, Object>();
							partyMap.put("PNUM", pnum);
							List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
							if(null != userList && userList.size() > 0){
								Map<String,Object> map = userList.get(0);
								if(null != map.get("ZJ")){
									if(StringUtils.isBlank(tipMsg)){
										tipMsg = name + ":【身份证】的专家信息已存在";
									}else{
										tipMsg += ","+name+":【身份证】的专家信息已存在";
									}
								}
							}


						}
					}else{
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "身份证号不能为空";
						}else{
							errMsg += ",身份证号不能为空";
						}
					}
					if(StringUtils.isNotBlank(tel)){
						if(!isMobile(tel)){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "电话号码错误";
							}else{
								errMsg += ",电话号码错误";
							}
						}
					}else{
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "电话不能为空";
						}else{
							errMsg += ",电话不能为空";
						}
					}

					if(StringUtils.isBlank(sex)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "性别不能为空";
						}else{
							errMsg += ",性别不能为空";
						}
					}
					if(StringUtils.isBlank(company)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "工作单位不能为空";
						}else{
							errMsg += ",工作单位不能为空";
						}
					}
					if(StringUtils.isBlank(zpno)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "专家编号不能为空";
						}else{
							errMsg += ",专家编号不能为空";
						}
					}
					if(StringUtils.isBlank(proType)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "专业类别不能为空";
						}else{
							errMsg += ",专业类别不能为空";
						}
					}
					if(StringUtils.isBlank(zgLevel)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "资格级别不能为空";
						}else{
							errMsg += ",资格级别不能为空";
						}
					}

					tempVo.setErrMsg(errMsg);
					resList.add(tempVo);
				}
				System.out.println("----------tipMsg--------" + tipMsg);
				//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("rows", resList);
				jsonObject.put("flag", dataFlag);
				jsonObject.put("cause", tipMsg);
				ResultConstant.write(response, jsonObject);
				return;
			}else{
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("flag", false);
				jsonObject.put("cause", "文件中未上传任何数据");
				ResultConstant.write(response, jsonObject);
				return;
				//return ResultConstant.resultMap(false,"文件中未上传任何数据");

			}
		} catch (Exception e) {
			e.printStackTrace();
			resObject.put("flag", "1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
		return;
		//return resObject;
	}

	
	/**
	 * 导入文件
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importExcel2")
	public @ResponseBody void importExcel2(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,
			HttpServletRequest request, HttpServletResponse response)
					throws Exception {
		JSONObject resObject = new JSONObject();
		JSONArray array = new JSONArray();
		try {
			/*获取导入文件类型*/
			DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem();
			File f = fi.getStoreLocation();/**/
			String type = request.getParameter("type");
			boolean dataFlag = true;
			String tipMsg = "";//提示信息
			ImportExcel<UserExpertImportInfo2> excelUtil = new ImportExcel<UserExpertImportInfo2>(UserExpertImportInfo2.class);
			List<UserExpertImportInfo2> results = (List<UserExpertImportInfo2>) excelUtil.importExcel(f);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
			SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
			
			if(results!=null && results.size()>0){
				//数量不能超过1000条
				if(results.size()>1000){
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "导入的记录数最大不能超过1000条");
					ResultConstant.write(response, jsonObject);
					return;
					//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
				}
				List<UserExpertImportInfo2> resList = new ArrayList<UserExpertImportInfo2>();
				Map<String,String> saveMap = new HashMap<String,String>();
				for (UserExpertImportInfo2 tempVo : results) {
					String errMsg = "";
					if(tempVo.getPnum()!=null)
					tempVo.setPnum(tempVo.getPnum().trim());
					if(tempVo.getName()!=null)
					tempVo.setName(tempVo.getName().trim());
					if(tempVo.getTel()!=null)
					{
					tempVo.setTel(tempVo.getTel().trim());
					String tel = tempVo.getTel();
					}
					if(tempVo.getSex()!=null)
					{
					tempVo.setSex(tempVo.getSex().trim());
					String sex = tempVo.getSex();
					}
					if(tempVo.getCompany()!=null&&tempVo.getCompany()!="")
					{
					tempVo.setCompany(tempVo.getCompany().trim());
					String company = tempVo.getCompany();
					}
					if(tempVo.getZpno()!=null)
					{
					tempVo.setZpno(tempVo.getZpno().trim());
					}
					if(tempVo.getZgLevel()!=null)
					{
					tempVo.setZgLevel(tempVo.getZgLevel().trim());
					}
					if(tempVo.getBirthDate()!=null)
					{
					tempVo.setBirthDate(tempVo.getBirthDate().trim());
					String Birth_date = tempVo.getBirthDate();

					}
					
					if(tempVo.getPlace_Name()!=null)
					{
					tempVo.setPlace_Name(tempVo.getPlace_Name().trim());
					}
					if(tempVo.getWork_name()!=null)
					{
					tempVo.setWork_name(tempVo.getWork_name().trim());
					String work_Name =tempVo.getWork_name();
					}
					if(tempVo.getGraduationDate()!=null)
					{
					tempVo.setGraduationDate(tempVo.getGraduationDate().trim());
					String graduation_time=  tempVo.getGraduationDate();
					}
					if(tempVo.getSchool()!=null)
					{
					tempVo.setSchool(tempVo.getSchool().trim());
					String school = tempVo.getSchool();
					}
					if(tempVo.getMajor()!=null)
					{
					tempVo.setMajor(tempVo.getMajor().trim());
					String major = tempVo.getMajor();
					}
					if(tempVo.getDegree()!=null)
					{
					tempVo.setDegree(tempVo.getDegree().trim());
					String degree = tempVo.getDegree();
					}
					if(tempVo.getRemark()!=null)
					{
					tempVo.setRemark(tempVo.getRemark().trim());
					String remark = tempVo.getRemark();
					}
					if(tempVo.getZgTime()!=null)
					{
						tempVo.setZgTime(tempVo.getZgTime());
					}
					
					
					String pnum = tempVo.getPnum();// 身份证号
					String name = tempVo.getName();// 姓名

					String proType = tempVo.getProType();
					String zgLevel = tempVo.getZgLevel();
					String place_Name = tempVo.getPlace_Name();

					if(StringUtils.isBlank(name)){
						dataFlag = false;
						errMsg = "专家姓名不能为空";
					}
					if(StringUtils.isNotBlank(pnum)){
						if(pnum.length() > 18 || pnum.length() < 15){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "身份证号必须是15到18位数字";
							}else{
								errMsg += ",身份证号必须是15到18位数字";
							}
						}else{
							if(null != saveMap.get(pnum)){
								dataFlag = false;
								if(StringUtils.isBlank(errMsg)){
									errMsg = "身份证不能重复上传，请检查数据";
								}else{
									errMsg += ",身份证不能重复上传，请检查数据";
								}
							}
							saveMap.put(pnum, "1");
							//校验是否存在
							Map<String, Object> partyMap = new HashMap<String, Object>();
							partyMap.put("pnum", pnum);
							List<Map<String,Object>> userList = ryglService.queryExpertUserList3(partyMap);
							if(null != userList && userList.size() > 0){
								Map<String,Object> map = userList.get(0);
								if(null != map.get("pnum")){
									dataFlag = false;
									if(StringUtils.isBlank(errMsg)){
										errMsg = name + ":【身份证】的专家信息已存在";
									}else{
										errMsg += ","+name+":【身份证】的专家信息已存在";
									}
								}
							}


						}
					}
					if(StringUtils.isBlank(proType)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "专业组名不能为空";
						}else{
							errMsg += ",专业组名不能为空";
						}
					}
					
					tempVo.setErrMsg(errMsg);
					resList.add(tempVo);
				}
				System.out.println("----------tipMsg--------" + tipMsg);
				//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("rows", resList);
				jsonObject.put("flag", dataFlag);
				jsonObject.put("cause", tipMsg);
				ResultConstant.write(response, jsonObject);
				return;
			}else{
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("flag", false);
				jsonObject.put("cause", "文件中未上传任何数据");
				ResultConstant.write(response, jsonObject);
				return;
				//return ResultConstant.resultMap(false,"文件中未上传任何数据");

			}
		} catch (Exception e) {
			e.printStackTrace();
			resObject.put("flag", "1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
		return;
		//return resObject;
	}

	/**
	 * 手机号验证
	 * 
	 * @param  str
	 * @return 验证通过返回true
	 */
	public static boolean isMobile(String str) {
		Pattern p = null;
		Matcher m = null;
		boolean b = false;
		p = Pattern.compile("^[1][3,4,5,8][0-9]{9}$"); // 验证手机号
		m = p.matcher(str);
		b = m.matches();
		return b;
	}

	/**添加专家情况
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveZj")
	public  @ResponseBody Map<String, Object> saveZj(@RequestBody List<UserExpertImportInfo> list,HttpServletResponse response) throws Exception{
		boolean flag=false;
		String cause="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
		try {
			List<UserExpertInfo> userExpertInfoList = new ArrayList<UserExpertInfo>();
			List<UserInfo> userInfoList = new ArrayList<UserInfo>();
			for(UserExpertImportInfo userExpertImportInfo:list){
				UserExpertInfo userExpertInfo = new UserExpertInfo();
				UserInfo userInfo = new UserInfo();
				userExpertInfo.setCompany(userExpertImportInfo.getCompany());
				userExpertInfo.setZpno(userExpertImportInfo.getZpno());
				userExpertInfo.setAddDate(new Date());
				userExpertInfo.setProType(userExpertImportInfo.getProType());
				userExpertInfo.setZgLevel(userExpertImportInfo.getZgLevel());

				userInfo.setName(userExpertImportInfo.getName());
				userInfo.setTel(userExpertImportInfo.getTel());
				if("男".equals(userExpertImportInfo.getSex())){
					userInfo.setSex("1");
				}else if("女".equals(userExpertImportInfo.getSex())){
					userInfo.setSex("0");
				}else{
					userInfo.setSex(userExpertImportInfo.getSex());
				}
				userInfo.setPnum(userExpertImportInfo.getPnum());
				userInfo.setAddDate(new Date());
				userInfo.setWorkName(userExpertImportInfo.getCompany());
				userInfoList.add(userInfo);
				userExpertInfoList.add(userExpertInfo);
			}
			ryglService.addExpertInfoList(userExpertInfoList, userInfoList, response);
			//			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
			return null;
		}
		return null;
		//		return ResultConstant.resultMap(flag,cause);
	}


	/**添加专家情况
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveZj2")
	public  @ResponseBody Map<String, Object> saveZj2(@RequestBody List<UserExpertImportInfo2> list,HttpServletResponse response) throws Exception{
		boolean flag=false;
		String cause="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
		try {
			List<UserExpertInfoPickUp> userExpertInfoList = new ArrayList<UserExpertInfoPickUp>();
			//List<UserInfo> userInfoList = new ArrayList<UserInfo>();
			for(UserExpertImportInfo2 userExpertImportInfo:list){
				UserExpertInfoPickUp userExpertInfo = new UserExpertInfoPickUp();
				userExpertInfo.setCompany(userExpertImportInfo.getCompany());
				userExpertInfo.setZpno(userExpertImportInfo.getZpno());
				userExpertInfo.setAdd_date(new Date());
				userExpertInfo.setPro_type(userExpertImportInfo.getProType());
				userExpertInfo.setZg_level(userExpertImportInfo.getZgLevel());				
				if(userExpertImportInfo.getZgTime()!=""){
					if(1==StringUtils.countMatches(userExpertImportInfo.getZgTime(), "-")){						
						userExpertInfo.setZg_time1(sdfBirth.parse(userExpertImportInfo.getZgTime()));
					}
					if(2==StringUtils.countMatches(userExpertImportInfo.getZgTime(), "-")){
						userExpertInfo.setZg_time1(sdf.parse(userExpertImportInfo.getZgTime()));
					}
				}										
				userExpertInfo.setName(userExpertImportInfo.getName());
				userExpertInfo.setTel(userExpertImportInfo.getTel());
				if("男".equals(userExpertImportInfo.getSex())){
					userExpertInfo.setSex("男");
				}else if("女".equals(userExpertImportInfo.getSex())){
					userExpertInfo.setSex("女");
				}else{
					userExpertInfo.setSex(userExpertImportInfo.getSex());
				}
				userExpertInfo.setPlace_name(userExpertImportInfo.getPlace_Name());
				userExpertInfo.setPnum(userExpertImportInfo.getPnum());
				userExpertInfo.setWork_name(userExpertImportInfo.getWork_name());				
				if(userExpertImportInfo.getBirthDate()!=""){					
					if(1==StringUtils.countMatches(userExpertImportInfo.getBirthDate(), "-")){
						userExpertInfo.setBirth_date1(sdfBirth.parse(userExpertImportInfo.getBirthDate()));
					}
					if(2==StringUtils.countMatches(userExpertImportInfo.getBirthDate(), "-")){
						userExpertInfo.setBirth_date1(sdf.parse(userExpertImportInfo.getBirthDate()));
					}
				}					
				if(userExpertImportInfo.getGraduationDate()!=""){					
					if(1==StringUtils.countMatches(userExpertImportInfo.getGraduationDate(), "-")){
						userExpertInfo.setGraduation_time1(sdfBirth.parse(userExpertImportInfo.getGraduationDate()));
					}
					if(2==StringUtils.countMatches(userExpertImportInfo.getGraduationDate(), "-")){
						userExpertInfo.setGraduation_time1(sdf.parse(userExpertImportInfo.getGraduationDate()));
					}					
				}				
				userExpertInfo.setSchool(userExpertImportInfo.getSchool());
				userExpertInfo.setMajor(userExpertImportInfo.getMajor());
				userExpertInfo.setDegree(userExpertImportInfo.getDegree());
				userExpertInfo.setRemark(userExpertImportInfo.getRemark());
				userExpertInfoList.add(userExpertInfo);
			}
			ryglService.addExpertInfoList2(userExpertInfoList, response);
			//			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
			ResultConstant.write(response, "导入失败,请核查数据中错误提示");
			return null;
		}
		return null;
		//		return ResultConstant.resultMap(flag,cause);
	}	
	
	/**获取专家分组
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/hdbhList")  
	public  @ResponseBody List<Map<String, Object>> hdbhList(HttpServletResponse response,HttpServletRequest request){  

		List<Map<String,Object>> hdList=new ArrayList<Map<String,Object>>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("pro_type", "全部");
		if(request.getParameter("place")==null)
		hdList.add(map);
		try {
			
			hdList.addAll(ryglService.quertyPro_type());
			if(hdList!=null&&hdList.size()>0){
				for(int i=0;i<hdList.size();i++){
					Map<String,Object> m=hdList.get(i);
				}
			}
			return hdList;

		}catch (Exception e) {
			e.printStackTrace();
		}
		return hdList;
	}

	


}
