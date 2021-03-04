package com.i84.earnpoint.rygl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.daxt.service.UserMgInfoService;
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

@Service
public class RyAddORUpdateServiceImple implements RyAddORUpdateService {

	@Autowired
	public RyglService ryglService;

	@Autowired
	private UserMgInfoService userMgInfoService;

	/**
	 * 获取系统档案号最大值
	 * 
	 * @param dtype
	 * @return
	 */
	public String getMaxDpno(String dtype) {
		Calendar calendar = Calendar.getInstance();
		String year = calendar.get(Calendar.YEAR) + "";
		Map<String, Object> m = new HashMap<String, Object>();
		 m.put("dtype","%"+dtype+"%");
		m = userMgInfoService.selectmaxDpno(m);
		if (m != null) {
			String da_dpno = m.get("maxDpno") == null ? null : m.get("maxDpno")
					.toString().trim();
			if (StringUtils.isNotBlank(da_dpno)) {
				da_dpno = dtype
						+ String.valueOf(Long.valueOf(da_dpno.substring(1,
								da_dpno.length())) + 1);
				da_dpno = dtype + year + da_dpno.substring(5);
				return da_dpno;
			} else {
				year = year + "0000001";
				return dtype + year;
			}
		} else {
			year = year + "0000001";
			return dtype + year;
		}
	}

	/**
	 * 获取系统编码
	 * 
	 * @return
	 */
	public String getMaxpno() {
		String date = DateUtil.getFormatDate("yyyy", new Date());
		String pno = userMgInfoService.getNextPno(date);
		return date + pno;
	}

	/**
	 * @param ResultRows
	 *            :结果集对象
	 * @param flag
	 *            :是否成功
	 * @param cause
	 *            ：失败原因
	 * @return
	 */
	public Map<String, Object> resultMap(Object ResultRows, boolean flag,
			String cause) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("rows", ResultRows);
		resultMap.put("flag", flag);
		resultMap.put("cause", cause);
		return resultMap;

	}

	/**
	 * @param flag
	 *            :是否成功
	 * @param cause
	 *            ：失败原因
	 * @return
	 */
	public static Map<String, Object> resultMap(boolean flag, String cause) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		resultMap.put("flag", flag);
		resultMap.put("cause", cause == null ? "" : cause);
		return resultMap;

	}

	@Override
	@Transactional
	public synchronized Map AddORUpdate(HttpServletResponse response,
			HttpServletRequest request, Boolean type)  throws Exception{
		System.out.println("进入方法;");
		
		if(type){
				String ryData = request.getParameter("ryData");
				String gzjlData = request.getParameter("gzjlData");// 工作简历
				String jypxData = request.getParameter("jypxData");// 教育培训
				String zypxData = request.getParameter("zypxData");// 职业培训
				String jlqkData = request.getParameter("jlqkData");// 奖励情况
				String zwzcData = request.getParameter("zwzcData");// 职务职称
//				//
//				System.out.println(ryData);
				Map<String, Object> ryMap = ResultConstant
						.fmSeriDecodeToMap(ryData);
				
				String da_dtype = ryMap.get("da_dtype").toString().trim();
				String da_dpno = getMaxDpno(da_dtype);
				String da_name = ryMap.get("da_name").toString().trim();
				String da_old_name = ryMap.get("da_old_name").toString().trim();
				String da_sex = ryMap.get("da_sex").toString().trim();
				String da_mz = ryMap.get("da_mz").toString().trim();
				String da_pnum = ryMap.get("da_pnum").toString().trim();
				String da_birthday = ryMap.get("da_birthday").toString().trim();
				String da_jg_name = ryMap.get("da_jg_name").toString().trim();
				String da_domicile = ryMap.get("da_domicile").toString().trim();
				String da_domicile_place = ryMap.get("da_domicile_place")
						.toString().trim();
				String da_zzmm = ryMap.get("da_zzmm").toString().trim();
				String da_marital_status = ryMap.get("da_marital_status")
						.toString().trim();
				String da_degree = ryMap.get("da_degree").toString().trim();
				String da_is_s = ryMap.get("da_is_s").toString().trim();
				String da_is_dl = ryMap.get("da_is_dl").toString().trim();
				String da_school = ryMap.get("da_school").toString().trim();
				String da_graduation_time = ryMap.get("da_graduation_time")
						.toString().trim();
				String da_major = ryMap.get("da_major").toString().trim();
				String da_bpno = ryMap.get("da_bpno").toString().trim();
				String da_bd_unit = ryMap.get("da_bd_unit").toString().trim();
				String da_sp_date = ryMap.get("da_sp_date").toString().trim();
				String da_work_name = ryMap.get("da_work_name").toString().trim();
				String da_work_time = ryMap.get("da_work_time").toString().trim();
				String da_unit_adr = ryMap.get("da_unit_adr").toString().trim();
				String da_ctype = ryMap.get("da_ctype").toString().trim();
				String da_license = ryMap.get("da_license").toString().trim();
				String da_home_tel = ryMap.get("da_home_tel").toString().trim();
				String da_home_adr = ryMap.get("da_home_adr").toString().trim();
				String da_home_post = ryMap.get("da_home_post").toString().trim();
				String da_tel = ryMap.get("da_tel").toString().trim();
				String da_my_tel = ryMap.get("da_my_tel").toString().trim();
				String da_my_adr = ryMap.get("da_my_adr").toString().trim();
				String da_my_post = ryMap.get("da_my_post").toString().trim();
				String da_qq = ryMap.get("da_qq").toString().trim();
				String da_email = ryMap.get("da_email").toString().trim();
				String da_wife_name = ryMap.get("da_wife_name").toString().trim();
				String da_wife_tel = ryMap.get("da_wife_tel").toString().trim();
				String da_create_date = ryMap.get("da_create_date").toString()
						.trim();
				String da_out_date = ryMap.get("da_out_date").toString().trim();
				String da_remark = ryMap.get("da_remark").toString().trim();
				String humanOut = ryMap.get("human_out").toString().trim();
				String da_img_url = "";
				if (null != ryMap.get("img_url")) {
					da_img_url = ryMap.get("img_url").toString().trim();
				}
				String da_pno = getMaxpno();
				String da_pid = ryMap.get("da_pid") == null ? "" : ryMap
						.get("da_pid").toString().trim();
				String da_add_date = ryMap.get("da_add_date") == null ? "" : ryMap
						.get("da_add_date").toString().trim();

				String da_is_dl1 = ryMap.get("da_is_dl1").toString().trim();
				String humanOut1 = ryMap.get("human_out1").toString().trim();
				String da_is_s1 = ryMap.get("da_is_s1").toString().trim();

				String max_degree = ryMap.get("max_degree").toString().trim();
				String max_graduation_time = ryMap.get("max_graduation_time")
						.toString().trim();
				String max_major = ryMap.get("max_major").toString().trim();
				String max_school = ryMap.get("max_school").toString().trim();

				SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
				// USERIFNO
				UserInfo userInfo = new UserInfo();
				if (!"".equals(da_name))
					userInfo.setName(da_name);
				if (!"".equals(da_old_name))
					userInfo.setOldName(da_old_name);
				if (!"".equals(da_sex))
					userInfo.setSex(da_sex);
				if (!"".equals(da_mz))
					userInfo.setMz(da_mz);
				if (!"".equals(da_pnum))
					userInfo.setPnum(da_pnum);
				if (StringUtils.isNotBlank(da_birthday)) {
					da_birthday = da_birthday.replace('/', '-');
					userInfo.setBirthDate(sdf.parse(da_birthday));
				}
				if (StringUtils.isNotBlank(da_pid)) {
					userInfo.setPid(Integer.parseInt(da_pid));
				}
				if (StringUtils.isNotBlank(da_add_date)) {
					da_add_date = da_add_date.replace('/', '-');
					userInfo.setAddDate(sdf.parse(da_add_date));
				} else {
					da_add_date = da_add_date.replace('/', '-');
					userInfo.setAddDate(sdf.parse(sdf.format(new Date())));
				}
				if (!"".equals(da_jg_name))
					userInfo.setJgName(da_jg_name);
				if (!"".equals(da_domicile))
					userInfo.setDomicile(da_domicile);
				if (!"".equals(da_domicile_place))
					userInfo.setDomicilePlace(da_domicile_place);
				if (!"".equals(da_zzmm))
					userInfo.setZzmm(da_zzmm);
				if (!"".equals(da_marital_status))
					userInfo.setMaritalStatus(da_marital_status);
				if (!"".equals(da_degree))
					userInfo.setDegree(da_degree);
				if (!"".equals(da_school))
					userInfo.setSchool(da_school);
				if (!"".equals(da_dpno))
					userInfo.setDpno(da_dpno);

				if (StringUtils.isNotBlank(da_graduation_time)) {
					da_graduation_time = da_graduation_time.replace('/', '-');
					userInfo.setGraduationTime(new SimpleDateFormat("yyyy-MM-dd")
							.parse(da_graduation_time));
				}
				if (!"".equals(da_major))
					userInfo.setMajor(da_major);
				if (!"".equals(da_work_name))
					userInfo.setWorkName(da_work_name);
				if (StringUtils.isNotBlank(da_work_time)) {
					da_work_time = da_work_time.replace('/', '-');
					userInfo.setWorkTime(new SimpleDateFormat("yyyy-MM-dd")
							.parse(da_work_time));
				}
				if (!"".equals(da_tel))
					userInfo.setTel(da_tel);
				if (!"".equals(da_qq))
					userInfo.setQq(da_qq);
				if (!"".equals(da_email))
					userInfo.setEmail(da_email);
				if (!"".equals(da_remark))
					userInfo.setRemark(da_remark);
				if (!"".equals(da_img_url))
					userInfo.setImgUrl(da_img_url);

				if (!"".equals(max_major))
					userInfo.setMax_major(max_major);
				if (!"".equals(max_school))
					userInfo.setMax_school(max_school);
				if (!"".equals(max_degree))
					userInfo.setMax_degree(max_degree);
				if (StringUtils.isNotBlank(max_graduation_time)) {
					max_graduation_time = max_graduation_time.replace('/', '-');
					userInfo.setMax_graduation_time(new SimpleDateFormat(
							"yyyy-MM-dd").parse(max_graduation_time));
				}

				int userId = ryglService.inserUserInfo(userInfo);
//				String tes=null;
//				Integer.valueOf(tes);
				if (userId == 0)
					return resultMap(false, "执行错误，请确认档案号是否重复。");
				if (userId == -1)
					return resultMap(false, "执行错误，系统已经有该用户的信息");
				// user_mg_info人才管理信息表
				UserMgInfo userMgInfo = new UserMgInfo();
				if (!"".equals(userId))
					userMgInfo.setUid(userId);
				if (!"".equals(da_dpno))
					userMgInfo.setDpno(da_dpno);
				if (!"".equals(da_pno))
					userMgInfo.setPno(da_pno);
				if (!"".equals(da_dtype))
					userMgInfo.setDtype(da_dtype);
				if (!"".equals(da_is_s))
					userMgInfo.setIsS(da_is_s);
				userMgInfo.setIsS1(da_is_s1);
				if (!"".equals(da_bpno))
					userMgInfo.setBpno(da_bpno);
				if (!"".equals(da_bd_unit))
					userMgInfo.setBdUnit(da_bd_unit);
				if (StringUtils.isNotBlank(da_sp_date)) {
					da_sp_date = da_sp_date.replace('/', '-');
					userMgInfo.setSpDate(new SimpleDateFormat("yyyy-MM-dd")
							.parse(da_sp_date));
				}
				if (!"".equals(da_is_dl))
					userMgInfo.setPointProxy(da_is_dl);
				userMgInfo.setPointProxy1(da_is_dl1);
				if (!"".equals(da_unit_adr))
					userMgInfo.setUnitAdr(da_unit_adr);
				if (!"".equals(da_ctype))
					userMgInfo.setCtype(da_ctype);
				if (!"".equals(da_license))
					userMgInfo.setLicense(da_license);
				if (!"".equals(da_home_tel))
					userMgInfo.setHomeTel(da_home_tel);
				if (!"".equals(da_home_adr))
					userMgInfo.setHomeAdr(da_home_adr);
				if (!"".equals(da_home_post))
					userMgInfo.setHomePost(da_home_post);
				if (!"".equals(da_my_tel))
					userMgInfo.setMyTel(da_my_tel);
				if (!"".equals(da_my_adr))
					userMgInfo.setMyAdr(da_my_adr);
				if (!"".equals(da_my_post))
					userMgInfo.setMyPost(da_my_post);
				if (!"".equals(da_wife_name))
					userMgInfo.setWifeName(da_wife_name);
				if (!"".equals(da_wife_tel))
					userMgInfo.setWifeTel(da_wife_tel);
				userMgInfo.setIsState(SystemContant.BG_STATE_SUCC + "");
				if (StringUtils.isNotBlank(da_create_date)) {
					da_create_date = da_create_date.replace('/', '-');
					userMgInfo.setCreateDate(new SimpleDateFormat("yyyy-MM-dd")
							.parse(da_create_date));
				}

				if (StringUtils.isNotBlank(da_out_date)) {
					da_out_date = da_out_date.replace('/', '-');
					userMgInfo.setOutDate(new SimpleDateFormat("yyyy-MM-dd")
							.parse(da_out_date));
				}
				if (!"".equals(humanOut))
					userMgInfo.setHumanOut(humanOut);
				userMgInfo.setHumanOut1(humanOut1);
				int a = ryglService.inserUserMgInfo(userMgInfo);
				if (a == 1) {
					return resultMap(false, "执行错误，请确认是否已有该身份证档案。。");
				}

				// 工作简历
				JSONObject workObj = JSONObject.fromObject(gzjlData);
				String total = workObj.get("total") == null ? null : workObj
						.get("total").toString().trim();
				if (StringUtils.isNotBlank(total) && Integer.parseInt(total) > 0) {
					JSONArray gzjlArray = (JSONArray) workObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						WorkInfo workInfo = new WorkInfo();
						workInfo.setAddDate(new Date());
						if (!"".equals(userId))
							workInfo.setUid(userId);
						if (!"".equals(obj.get("department_id").toString().trim()))
							workInfo.setDepartmentId(obj.get("department_id")
									.toString().trim());
						if (!"".equals(obj.get("enterprise_id").toString().trim()))
							workInfo.setEnterpriseId(obj.get("enterprise_id")
									.toString().trim());
						if (!"".equals(obj.get("place_id").toString().trim()))
							workInfo.setPlaceId(obj.get("place_id").toString()
									.trim());
						if (!"".equals(obj.get("start_date").toString().trim())) {
							String start_date = obj.get("start_date").toString()
									.trim().replace('/', '-');
							workInfo.setStartDate(start_date);
						}

						if (!"".equals(obj.get("end_date").toString().trim())) {
							String start_date = obj.get("end_date").toString()
									.trim().replace('/', '-');
							workInfo.setEndDate(start_date);
						}
						workInfo.setpUid(TextUtil.getInt(request.getSession()
								.getAttribute("uid")));
						ryglService.saveWorkInfo(workInfo);
					}
				}
				// 职业培训
				JSONObject jzypxObj = JSONObject.fromObject(zypxData);
				total = jzypxObj.get("total") == null ? "0" : jzypxObj.get("total")
						.toString().trim();
				if (StringUtils.isNotBlank(total) && Integer.parseInt(total) > 0) {
					JSONArray gzjlArray = (JSONArray) jzypxObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						StudyUpInfo studyUpInfo = new StudyUpInfo();
						studyUpInfo.setUid(userId);
						if (!"".equals(obj.get("trainingUnit").toString().trim()))
							studyUpInfo.setTrainingUnit(obj.get("trainingUnit")
									.toString().trim());
						if (!"".equals(obj.get("trainDate").toString().trim()))
							studyUpInfo.setTrainDate((obj.get("trainDate")
									.toString().trim()));
						if (!"".equals(obj.get("outDate").toString().trim())) {
							String outDate = obj.get("outDate").toString().trim()
									.replace('/', '-');
							studyUpInfo.setOutDate(outDate);
						}
						if (!"".equals(obj.get("office").toString().trim()))
							studyUpInfo.setOffice(obj.get("office").toString()
									.trim());
						if (!"".equals(obj.get("officeDate").toString().trim())) {
							String outDate = obj.get("officeDate").toString()
									.trim().replace('/', '-');
							studyUpInfo.setOfficeDate(outDate);
						}

						studyUpInfo.setAddDate(new Date());
						studyUpInfo.setPid(TextUtil.getInt(request.getSession()
								.getAttribute("uid")));
						ryglService.svaeStudyUpInfo(studyUpInfo);
					}
				}
				// 奖励情况
				JSONObject jlqkObj = JSONObject.fromObject(jlqkData);
			total = jlqkObj.get("total") == null ? "0" : jlqkObj.get("total")
						.toString().trim();
				if (StringUtils.isNotBlank(total) && Integer.parseInt(total) > 0) {
					JSONArray gzjlArray = (JSONArray) jlqkObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						RewardsInfo rewardsInfo = new RewardsInfo();
						if (!"".equals(obj.get("reward_name").toString().trim()))
							rewardsInfo.setRewardName(obj.get("reward_name")
									.toString().trim());
						if (!"".equals(obj.get("en_name").toString().trim()))
							rewardsInfo.setEnName(obj.get("en_name").toString()
									.trim());
						if (!"".equals(obj.get("pz_date").toString().trim())) {
							String pz_date = obj.get("pz_date").toString().trim()
									.replace('/', '-');
							rewardsInfo.setPzDate(pz_date);
						}
						if (!"".equals(obj.get("cx_date").toString().trim())) {
							String cx_date = obj.get("cx_date").toString().trim()
									.replace('/', '-');
							rewardsInfo.setCxDate(cx_date);
						}
						rewardsInfo.setUid(userId);
						rewardsInfo.setpDate(DateUtil.getFormatDate(
								DateUtil.OYYYY_MM_DD_HH_MI_SS, new Date()));
						rewardsInfo.setpUid(TextUtil.getInt(request.getSession()
								.getAttribute("uid")));
						ryglService.saveRewardsInfo(rewardsInfo);
					}
				}
				JSONObject jypxObj = JSONObject.fromObject(jypxData);
				// 教育培训

				total = jypxObj.get("total") == null ? "0" : jypxObj.get("total")
						.toString().trim();
				if (StringUtils.isNotBlank(total) && Integer.parseInt(total) > 0) {
					JSONArray gzjlArray = (JSONArray) jypxObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						StudyInfo studyInfo = new StudyInfo();
						if (!"".equals(obj.get("studyTypeId").toString().trim()))
							studyInfo.setStudyTypeId(obj.get("studyTypeId")
									.toString().trim());
						if (!"".equals(obj.get("schoolName").toString().trim()))
							studyInfo.setSchoolName(obj.get("schoolName")
									.toString().trim());
						if (!"".equals(obj.get("education").toString().trim()))
							studyInfo.setEducation(obj.get("education").toString()
									.trim());
						if (!"".equals(obj.get("degree").toString().trim()))
							studyInfo
									.setDegree(obj.get("degree").toString().trim());
						if (!"".equals(obj.get("certificate").toString().trim()))
							studyInfo.setCertificate(obj.get("certificate")
									.toString().trim());
						if (!"".equals(obj.get("inDate").toString().trim())) {
							String inDate = obj.get("inDate").toString().trim()
									.replace('/', '-');
							studyInfo.setInDate(new SimpleDateFormat("yyyy-MM-dd")
									.parse(inDate));
						}
						if (!"".equals(obj.get("graduationDate").toString().trim())) {
							String graduationDate = obj.get("graduationDate")
									.toString().trim().replace('/', '-');
							studyInfo.setGraduationDate(new SimpleDateFormat(
									"yyyy-MM-dd").parse(graduationDate));
						}
						if(!"".equals(obj.get("major").toString().trim())){
							studyInfo.setMajor(obj.get("major").toString().trim());
						}
						studyInfo.setUid(userId);

						studyInfo.setAddDate(new Date());
						studyInfo.setPid(TextUtil.getInt(request.getSession()
								.getAttribute("uid")));
						ryglService.saveStudyInfo(studyInfo);
					}
				}

				// 职务职称
				JSONObject zwzcObj = JSONObject.fromObject(zwzcData);
				total = zwzcObj.get("total") == null ? "0" : zwzcObj.get("total")
						.toString().trim();
				if (StringUtils.isNotBlank(total) && Integer.parseInt(total) > 0) {

					JSONArray array = (JSONArray) zwzcObj.get("rows");
					for (Object object : array) {
						JSONObject obj = JSONObject.fromObject(object);
						OfficialInfo officialInfo = new OfficialInfo();
						if (!"".equals(obj.get("p_level").toString().trim()))
							officialInfo.setpLevel(obj.get("p_level").toString()
									.trim());
						if (!"".equals(obj.get("p_method").toString().trim()))
							officialInfo.setpMethod(obj.get("p_method").toString()
									.trim());
						if (!"".equals(obj.get("pro_z_name").toString().trim()))
							officialInfo.setProZName(obj.get("pro_z_name")
									.toString().trim());
						if (!"".equals(obj.get("pro_name").toString().trim()))
							officialInfo.setProName(obj.get("pro_name").toString()
									.trim());
						if (!"".equals(obj.get("department_id").toString().trim()))
							officialInfo.setDepartmentId(obj.get("department_id")
									.toString().trim());
						if (!"".equals(obj.get("pro_name").toString().trim()))
							officialInfo.setPzNo(obj.get("pro_name").toString()
									.trim());
						if (!"".equals(obj.get("pz_date1").toString().trim())) {
							String pz_date1 = obj.get("pz_date1").toString().trim()
									.replace('/', '-');
							officialInfo.setPzDate1(pz_date1);
						}
						officialInfo.setUid(userId);

						officialInfo.setpDate(new Date());
						officialInfo.setpUid(TextUtil.getInt(request.getSession()
								.getAttribute("uid")));
						ryglService.saveOfficialInfo(officialInfo);
					}

				}
				// 数据信息来源MSG_FROM_INFO
				MsgFromInfo msgFromInfo = new MsgFromInfo();
				msgFromInfo.setSex(Integer.parseInt(da_sex));
				msgFromInfo.setPnum(da_pnum);
				msgFromInfo.setName(da_name);
				msgFromInfo.setMsgName("内部创建");
				msgFromInfo.setIsState(SystemContant.BG_STATE_NEW);
				ryglService.saveMsgFromInfo(msgFromInfo);
				Map map = resultMap(true, null);
				map.put("dpno", da_dpno);
				return map;
			
		}else{
				String ryData = request.getParameter("ryData");
				String gzjlData = request.getParameter("gzjlData");// 工作简历
				String jypxData = request.getParameter("jypxData");// 教育培训
				String zypxData = request.getParameter("zypxData");// 职业培训
				String jlqkData = request.getParameter("jlqkData");// 奖励情况
				String zwzcData = request.getParameter("zwzcData");// 职务职称
				String mid = request.getParameter("mid");
				//
				Map<String, Object> ryMap = ResultConstant
						.fmSeriDecodeToMap(ryData);
				String da_dtype = ryMap.get("da_dtype").toString().trim();
				String da_dpno = null;
				// 改了类型才改档案号。
				UserMgInfo userMgInfo = ryglService.getUserMgInfoById(TextUtil
						.getInt(mid));
				if (!userMgInfo.getDtype().trim().equals(da_dtype.trim())) {
					da_dpno = getMaxDpno(da_dtype);
					userMgInfo.setDpno(da_dpno);
				}

				String da_name = ryMap.get("da_name").toString().trim();
				String da_old_name = ryMap.get("da_old_name").toString().trim();
				String da_sex = ryMap.get("da_sex").toString().trim();
				String da_mz = ryMap.get("da_mz").toString().trim();
				String da_pnum = ryMap.get("da_pnum").toString().trim();
				String da_birthday = ryMap.get("da_birthday").toString().trim();
				String da_jg_name = ryMap.get("da_jg_name").toString().trim();
				String da_domicile = ryMap.get("da_domicile").toString().trim();
				String da_domicile_place = ryMap.get("da_domicile_place")
						.toString().trim();
				String da_zzmm = ryMap.get("da_zzmm").toString().trim();
				String da_marital_status = ryMap.get("da_marital_status")
						.toString().trim();
				String da_degree = ryMap.get("da_degree").toString().trim();
				String da_is_s = ryMap.get("da_is_s").toString().trim();
				String da_is_dl = ryMap.get("da_is_dl").toString().trim();
				String da_school = ryMap.get("da_school").toString().trim();
				String da_graduation_time = ryMap.get("da_graduation_time")
						.toString().trim();
				String da_major = ryMap.get("da_major").toString().trim();
				String da_bpno = ryMap.get("da_bpno").toString().trim();
				String da_bd_unit = ryMap.get("da_bd_unit").toString().trim();
				String da_sp_date = ryMap.get("da_sp_date").toString().trim();
				String da_work_name = ryMap.get("da_work_name").toString().trim();
				String da_work_time = ryMap.get("da_work_time").toString().trim();
				String da_unit_adr = ryMap.get("da_unit_adr").toString().trim();
				String da_ctype = ryMap.get("da_ctype").toString().trim();
				String da_license = ryMap.get("da_license").toString().trim();
				String da_home_tel = ryMap.get("da_home_tel").toString().trim();
				String da_home_adr = ryMap.get("da_home_adr").toString().trim();
				String da_home_post = ryMap.get("da_home_post").toString().trim();
				String da_tel = ryMap.get("da_tel").toString().trim();
				String da_my_tel = ryMap.get("da_my_tel").toString().trim();
				String da_my_adr = ryMap.get("da_my_adr").toString().trim();
				String da_my_post = ryMap.get("da_my_post").toString().trim();
				String da_qq = ryMap.get("da_qq").toString().trim();
				String da_email = ryMap.get("da_email").toString().trim();
				String da_wife_name = ryMap.get("da_wife_name").toString().trim();
				String da_wife_tel = ryMap.get("da_wife_tel").toString().trim();
				String da_create_date = ryMap.get("da_create_date").toString()
						.trim();
				String da_out_date = ryMap.get("da_out_date").toString().trim();
				String da_remark = ryMap.get("da_remark").toString().trim();
				String da_img_url = ryMap.get("img_url").toString().trim();
				String humanOut = ryMap.get("human_out").toString().trim();

				String da_is_dl1 = ryMap.get("da_is_dl1").toString().trim();
				String humanOut1 = ryMap.get("human_out1").toString().trim();
				String da_is_s1 = ryMap.get("da_is_s1").toString().trim();

				String max_degree = ryMap.get("max_degree").toString().trim();
				String max_graduation_time = ryMap.get("max_graduation_time")
						.toString().trim();
				String max_major = ryMap.get("max_major").toString().trim();
				String max_school = ryMap.get("max_school").toString().trim();

				String isUpdateIsState = request.getParameter("isUpdateIsState");// 是否更新档案状态

				// user_mg_info人才管理信息表

				int userId = userMgInfo.getUid();

				// 更新用户信息
				Map p = ryglService.updateUserInfo(request, userId, da_dpno, mid,
						da_name, da_old_name, da_sex, da_mz, da_pnum, da_birthday,
						da_jg_name, da_domicile, da_domicile_place, da_zzmm,
						da_marital_status, da_degree, da_school,
						da_graduation_time, da_major, da_work_name, da_work_time,
						da_tel, da_qq, da_email, da_remark, da_img_url, max_degree,
						max_graduation_time, max_major, max_school);

				userMgInfo.setDtype(da_dtype);
				userMgInfo.setIsS(da_is_s);
				userMgInfo.setIsS1(da_is_s1);
				userMgInfo.setBpno(da_bpno);
				userMgInfo.setBdUnit(da_bd_unit);
				userMgInfo.setPointProxy(da_is_dl);
				userMgInfo.setPointProxy1(da_is_dl1);
				if (StringUtils.isNotBlank(da_sp_date)) {
					da_sp_date = da_sp_date.replace("/", "-");
					userMgInfo.setSpDate(new SimpleDateFormat("yyyy-MM-dd hh:mm")
							.parse(da_sp_date + " 00:00"));
				}

				userMgInfo.setUnitAdr(da_unit_adr);
				userMgInfo.setCtype(da_ctype);
				userMgInfo.setLicense(da_license);
				userMgInfo.setHomeTel(da_home_tel);
				userMgInfo.setHomeAdr(da_home_adr);
				userMgInfo.setHomePost(da_home_post);
				userMgInfo.setMyTel(da_my_tel);
				userMgInfo.setMyAdr(da_my_adr);
				userMgInfo.setMyPost(da_my_post);
				userMgInfo.setWifeName(da_wife_name);
				userMgInfo.setWifeTel(da_wife_tel);
				if (isUpdateIsState == null || isUpdateIsState != null
						&& isUpdateIsState.trim().isEmpty())
					userMgInfo.setIsState(SystemContant.BG_STATE_SUCC + "");
				if (StringUtils.isNotBlank(da_create_date)) {
					da_create_date = da_create_date.replace("/", "-");
					userMgInfo.setCreateDate(new SimpleDateFormat(
							"yyyy-MM-dd hh:mm").parse(da_create_date + " 00:00"));
				}

				if (StringUtils.isNotBlank(da_out_date)) {
					da_out_date = da_out_date.replace("/", "-");
					userMgInfo.setOutDate(new SimpleDateFormat("yyyy-MM-dd hh:mm")
							.parse(da_out_date + " 00:00"));
				}

				userMgInfo.setHumanOut(humanOut);
				userMgInfo.setHumanOut1(humanOut1);
				ryglService.updateUserMgInfo(request, da_dpno, userMgInfo,
						TextUtil.getInt(p.get("pid") + ""));

				// 工作简历
				JSONObject workObj = JSONObject.fromObject(gzjlData);
				String total = workObj.get("total") == null ? "" : workObj
						.get("total").toString().trim();
				if (!total.equals("null") && Integer.parseInt(total) > 0) {
					JSONArray gzjlArray = (JSONArray) workObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						WorkInfo workInfo = new WorkInfo();
						workInfo.setAddDate(new Date());
						workInfo.setUid(userId);
						workInfo.setDepartmentId(obj.get("department_id")
								.toString().trim());
						workInfo.setEnterpriseId(obj.get("enterprise_id")
								.toString().trim());
						workInfo.setPlaceId(obj.get("place_id").toString().trim());
						workInfo.setStartDate((obj.get("start_date").toString()
								.trim()));
						workInfo.setEndDate((obj.get("end_date").toString().trim()));
						ryglService.saveWorkInfo(workInfo);
					}
				}
				// 职业培训
				JSONObject jzypxObj = JSONObject.fromObject(zypxData);
				total = jzypxObj.get("total") == null ? "" : jzypxObj.get("total")
						.toString().trim();

				if (!total.equals("null")
						&& Integer
								.parseInt(jzypxObj.get("total").toString().trim()) > 0) {
					JSONArray gzjlArray = (JSONArray) jzypxObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						StudyUpInfo studyUpInfo = new StudyUpInfo();
						studyUpInfo.setUid(userId);
						studyUpInfo.setTrainingUnit(obj.get("trainingUnit")
								.toString().trim());
						studyUpInfo.setTrainDate((obj.get("trainDate").toString()
								.trim()));
						studyUpInfo.setOutDate((obj.get("outDate").toString()
								.trim()));
						studyUpInfo.setOffice(obj.get("office").toString().trim());
						studyUpInfo.setOfficeDate((obj.get("officeDate").toString()
								.trim()));

						ryglService.svaeStudyUpInfo(studyUpInfo);
					}
				}
				// 奖励情况
				JSONObject jlqkObj = JSONObject.fromObject(jlqkData);
				total = jlqkObj.get("total") == null ? "" : jlqkObj.get("total")
						.toString().trim();

				if (!total.equals("null")
						&& Integer.parseInt(jlqkObj.get("total").toString().trim()) > 0) {
					JSONArray gzjlArray = (JSONArray) jlqkObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						RewardsInfo rewardsInfo = new RewardsInfo();
						rewardsInfo.setRewardName(obj.get("reward_name").toString()
								.trim());
						rewardsInfo.setEnName(obj.get("en_name").toString().trim());
						rewardsInfo
								.setPzDate((obj.get("pz_date").toString().trim()));
						rewardsInfo
								.setCxDate((obj.get("cx_date").toString().trim()));
						rewardsInfo.setUid(userId);
						ryglService.saveRewardsInfo(rewardsInfo);
					}
				}
				JSONObject jypxObj = JSONObject.fromObject(jypxData);
				total = jypxObj.get("total") == null ? "" : jypxObj.get("total")
						.toString().trim();
				// 教育培训
				if (!total.equals("null")
						&& Integer.parseInt(jypxObj.get("total").toString().trim()) > 0) {
					JSONArray gzjlArray = (JSONArray) jypxObj.get("rows");
					for (Object object : gzjlArray) {
						JSONObject obj = JSONObject.fromObject(object);
						StudyInfo studyInfo = new StudyInfo();
						studyInfo.setStudyTypeId(obj.get("studyTypeId").toString()
								.trim());
						studyInfo.setSchoolName(obj.get("schoolName").toString()
								.trim());
						studyInfo.setEducation(obj.get("education").toString()
								.trim());
						studyInfo.setDegree(obj.get("degree").toString().trim());
						studyInfo.setCertificate(obj.get("certificate").toString()
								.trim());
						String inDate = obj.get("inDate").toString().trim()
								.replace("/", "-");
						studyInfo.setInDate(new SimpleDateFormat("yyyy-MM-dd")
								.parse(inDate));
						String graduationDate = obj.get("graduationDate")
								.toString().trim().replace("/", "-");
						studyInfo.setGraduationDate(new SimpleDateFormat(
								"yyyy-MM-dd").parse(graduationDate));
						if(!"".equals(obj.get("major").toString().trim())){
							studyInfo.setMajor(obj.get("major").toString().trim());
						}
						studyInfo.setUid(userId);
						ryglService.saveStudyInfo(studyInfo);
					}
				}

				// 职务职称
				JSONObject zwzcObj = JSONObject.fromObject(zwzcData);
				total = zwzcObj.get("total") == null ? "" : zwzcObj.get("total")
						.toString().trim();
				if (!total.equals("null")
						&& Integer.parseInt(zwzcObj.get("total").toString().trim()) > 0) {

					JSONArray array = (JSONArray) zwzcObj.get("rows");
					for (Object object : array) {
						JSONObject obj = JSONObject.fromObject(object);
						OfficialInfo officialInfo = new OfficialInfo();
						officialInfo
								.setpLevel(obj.get("p_level").toString().trim());
						officialInfo.setProName(obj.get("p_method").toString()
								.trim());
						officialInfo.setProZName(obj.get("pro_z_name").toString()
								.trim());
						officialInfo.setProName(obj.get("pro_name").toString()
								.trim());
						officialInfo.setDepartmentId(obj.get("department_id")
								.toString().trim());
						officialInfo.setPzNo(obj.get("pro_name").toString().trim());
						officialInfo.setPzDate1((obj.get("pz_date1").toString()
								.trim()));
						officialInfo.setUid(userId);
						ryglService.saveOfficialInfo(officialInfo);
					}

				}
				// 数据信息来源MSG_FROM_INFO
				MsgFromInfo msgFromInfo = new MsgFromInfo();
				msgFromInfo.setSex(Integer.parseInt(da_sex));
				msgFromInfo.setPnum(da_pnum);
				msgFromInfo.setName(da_name);
				msgFromInfo.setMsgName("内部创建");
				msgFromInfo.setIsState(SystemContant.BG_STATE_NEW);
				ryglService.saveMsgFromInfo(msgFromInfo);
				Map map = resultMap(true, "保存成功！");
				if (da_dpno != null)
					map.put("dpno", da_dpno);
				else
					map.put("dpno", userMgInfo.getDpno());
				return map;
			
		}
	}
}
