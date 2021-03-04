package com.i84.earnpoint.zcps.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.StudyCurInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.ZcActivityGetMapper;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.ZcActivityGet;
import com.i84.earnpoint.model.ZcActivityInfo;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.service.UserInfoService;
import com.i84.earnpoint.zcps.excel.ExportExcelUtils;
import com.i84.earnpoint.zcps.excel.GetPO;
import com.i84.earnpoint.zcps.excel.Paper;
import com.i84.earnpoint.zcps.service.StudyInfoService;
import com.i84.earnpoint.zcps.service.StudyUpInfoService;
import com.i84.earnpoint.zcps.service.WorkInfoService;
import com.i84.earnpoint.zcps.service.ZcActivityGetService;
import com.i84.earnpoint.zcps.service.ZcActivityInfoService;
import com.i84.earnpoint.zcps.service.ZcDissertationInfoService;
import com.i84.earnpoint.common.Log;

/**
 * 职称活动评审
 * 
 * @author liuwenchun
 *
 */
@Controller
@RequestMapping("/zcps")
public class ZcActivityInfoController extends ResultConstant {
	private static final String separator = System.getProperty("file.separator");

	@Autowired
	private ZcActivityInfoService zcActivityInfoService;
	@Autowired
	private ZcActivityGetService zcActivityGetService;
	@Autowired
	private UserInfoService userInfoService;
	@Autowired
	private StudyInfoService studyInfoService;
	@Autowired
	private WorkInfoService workInfoService;
	@Autowired
	private StudyUpInfoService studyUpInfoService;
	@Autowired
	private ZcDissertationInfoService zcDissertationInfoService;
	@Autowired
	private UserInfoMapper userinfomapper;

	@Autowired
	private StudyCurInfoMapper studycurinfomapper;

	@Autowired
	private ZcActivityGetMapper zcActivityGetMapper;

	@RequestMapping("/queryById")
	public void queryById(HttpServletResponse response, HttpServletRequest request, Integer id) throws Exception {
		response.setCharacterEncoding("utf-8");
		ZcActivityInfo queryInfo = this.zcActivityInfoService.selectZcActivityInfoById(id);
		System.out.println(JsonUtil.getJsonString4JavaPOJO(queryInfo));
		response.getWriter().write(JsonUtil.getJsonString4JavaPOJO(queryInfo));
	}

	@RequestMapping("/queryPageList")
	public void queryPageList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		ZcActivityInfo queryInfo = new ZcActivityInfo();
		queryInfo.setPage(page);
		queryInfo.setRows(rows);
		PageHelper.startPage(page, rows); // 分页
		List<ZcActivityInfo> list = this.zcActivityInfoService.queryList(queryInfo);
		PageInfo<ZcActivityInfo> pageinfo = new PageInfo<ZcActivityInfo>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		String realPath = new File(getClass().getClassLoader().getResource("").getPath()).getParentFile()
				.getParentFile().getPath() + File.separator + "upload";
		if (list != null && list.size() > 0) {
			for (ZcActivityInfo info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("businessId", TextUtil.getSNumber(info.getBusinessId(), 6));
				obj.put("name", info.getName());
				obj.put("price", info.getState());// 有效性
				obj.put("state_info", getStateInfo(info));// 状态
				obj.put("state", info.getState());
				obj.put("zurl", realPath + info.getzUrl());
				obj.put("remark", info.getRemark());
				obj.put("zname", info.getzName());
				obj.put("sbkssj", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getsStartdate()));
				obj.put("sbjssj", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getsEnddate()));
				obj.put("pskssj", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getpStartdate()));
				obj.put("psjssj", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getpEnddate()));
				obj.put("hdjssj", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.gethEnddate()));
				jArray.add(obj);
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	@RequestMapping("/addinfo")
	public void addInfo(HttpServletResponse response, HttpServletRequest request, String id, String businessId,
			String name, String sbkssj, String sbjssj, String pskssj, String psjssj, String hdjssj) throws Exception {
		JSONObject resObject = new JSONObject();
		try {
			ZcActivityInfo zcActivityInfo = new ZcActivityInfo();

			Map<String, String> ret = saveFile(response, request);
			if ("0".equals(ret.get("flag")) || "-2".equals(ret.get("flag"))) {
				zcActivityInfo.setName(TextUtil.getString(name));
				zcActivityInfo.setRemark(TextUtil.getString(request.getParameter("remark")));
				zcActivityInfo.setsStartdate(TextUtil.getDateFormate(sbkssj, null));
				zcActivityInfo.setsEnddate(TextUtil.getDateFormate(sbjssj, null));
				zcActivityInfo.setpStartdate(TextUtil.getDateFormate(pskssj, null));
				zcActivityInfo.setpEnddate(TextUtil.getDateFormate(psjssj, null));
				zcActivityInfo.sethEnddate(TextUtil.getDateFormate(hdjssj, null));
				zcActivityInfo.setState(TextUtil.getString(request.getParameter("state")).equals("有效") ? "有效" : "失效");// 有效
				if (StringUtils.isBlank(id)) {
					// if("-2".equals(ret.get("flag"))){
					// resObject.put("flag", -1);
					// resObject.put("errorMsg", ret.get("msg"));
					// }else{
					zcActivityInfo.setzUrl(ret.get("zUrl"));
					zcActivityInfo.setzName(ret.get("zName"));
					zcActivityInfo.setBusinessId(this.zcActivityInfoService.getAllCount() + 1);
					this.zcActivityInfoService.insertZcActivityInfo(zcActivityInfo);
					resObject.put("flag", 0);
					// }
				} else {
					zcActivityInfo.setId(TextUtil.getInt(id));
					zcActivityInfo.setzUrl(ret.get("zUrl"));
					zcActivityInfo.setzName(ret.get("zName"));
					this.zcActivityInfoService.updateZcActivityInfo(zcActivityInfo);
					resObject.put("flag", 0);
				}
			} else {
				resObject.put("flag", -1);
				resObject.put("errorMsg", ret.get("msg"));
			}

		} catch (Exception e) {
			resObject.put("flag", -1);
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/validity")
	public void setValidity(HttpServletResponse response, HttpServletRequest request, String id, String state)
			throws Exception {
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (StringUtils.isBlank(id) || StringUtils.isBlank(state)) {
				resObject.put("errorMsg", "参数异常");
			}
			ZcActivityInfo zcActivityInfo = this.zcActivityInfoService.selectZcActivityInfoById(TextUtil.getBD2Int(id));
			if (zcActivityInfo == null) {
				resObject.put("errorMsg", "活动信息不存在");
			} else {
				if (zcActivityInfo.getState().equals("有效")) {
					zcActivityInfo.setState("失效");
					resObject.put("state", "失效");
				} else {
					zcActivityInfo.setState("有效");
					resObject.put("state", "有效");
				}
				this.zcActivityInfoService.updateZcActivityInfo(zcActivityInfo);
				resObject.put("flag", 0);
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/getinfo")
	public void getById(HttpServletResponse response, HttpServletRequest request, String id) throws Exception {
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		if (StringUtils.isBlank(id)) {
			resObject.put("errorMsg", "参数异常");
		}
		ZcActivityInfo zcActivityInfo = this.zcActivityInfoService.selectZcActivityInfoById(TextUtil.getBD2Int(id));
		ResultConstant.write(response, zcActivityInfo);
	}

	private String getStateInfo(ZcActivityInfo info) {
		String ret = "未开始";
		if (new Date().after(info.gethEnddate())) {
			ret = "结束";
		} else if (info.getsStartdate() != null && info.getsStartdate().after(new Date())) {
			ret = "未开始";
		} else if (info.getsStartdate() != null && info.getsStartdate() != null
				&& info.getsStartdate().before(new Date()) && info.getsEnddate().after(new Date())) {
			ret = "评审申报";
		} else if (info.getsStartdate() != null && info.getsStartdate() != null
				&& new Date().before(info.getpStartdate()) && new Date().after(info.getsEnddate())) {
			ret = "申报结束";
		} else if (info.getsStartdate() != null && info.getsStartdate() != null
				&& info.getpStartdate().before(new Date()) && info.getpEnddate().after(new Date())) {
			ret = "专家评审";
		} else if (info.getsStartdate() != null && info.getsStartdate() != null
				&& new Date().before(info.getpEnddate())) {
			ret = "评审完成";
		} else if (new Date().after(info.getpEnddate()) && new Date().before(info.gethEnddate())) {
			ret = "评审结束";
		}
		return ret;
	}

	private Map<String, String> saveFile(HttpServletResponse response, HttpServletRequest request) {
		Map<String, String> ret = new HashMap<String, String>();
		ret.put("flag", "-1");
		ret.put("msg", "附近上传失败");
		try {
			// 设置响应给前台内容的数据格式
			response.setContentType("text/plain; charset=UTF-8");
			// 如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
			// 这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
			String realPath = getWEB_ROOTPath() + "upload";
			String url = File.separator + "zcactivity" + File.separator + DateUtil.getFormatDate(DateUtil.YYYYMMDD)
					+ "/";
			// 判断路径是否存在，不存在则创建
			File dir = new File(realPath + url);
			if (!dir.isDirectory()) {
				dir.mkdirs();
			}
			// 上传文件的原名(即上传前的文件名字)
			MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;
			MultipartFile file = multipartRequest.getFile("imgFile");
			if (file != null) {
				if (file.getSize() <= 2 * 1024 * 1024) {
					String fileName = file.getOriginalFilename();
					url = url + fileName;
					try {
						BufferedInputStream in = new BufferedInputStream(file.getInputStream());// 获得文件输入流
						FileOutputStream a = new FileOutputStream(new File(realPath + url));
						BufferedOutputStream output = new BufferedOutputStream(a);
						Streams.copy(in, output, true);
						ret.put("flag", "0");
						ret.put("zName", fileName);
						ret.put("zUrl", url);
					} catch (IOException e) {
						e.printStackTrace();
						ret.put("msg", "附件上传失败");
					}
				} else {
					ret.put("msg", "附件不能大于2M");
				}
			} else {
				ret.put("flag", "-2");
				ret.put("msg", "请上传附件");
			}
		} catch (Exception e) {
			e.printStackTrace();
		}

		return ret;
	}

	/**
	 * 活动列表
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryShLeftPageList")
	public void queryShLeftPageList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		ZcActivityInfo queryInfo = new ZcActivityInfo();
		queryInfo.setPage(page);
		queryInfo.setRows(rows);
		PageHelper.startPage(page, rows); // 分页
		List<ZcActivityInfo> list = this.zcActivityInfoService.queryList(queryInfo);
		PageInfo<ZcActivityInfo> pageinfo = new PageInfo<ZcActivityInfo>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		if (list != null && list.size() > 0) {
			for (ZcActivityInfo info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("businessId", TextUtil.getSNumber(info.getBusinessId(), 6));
				obj.put("name", info.getName());
				obj.put("enddate", info.gethEnddate());// 活动结束时间
				Date current = new Date();
				// 活动结束标记
				if (DateUtil.isDateBefore(info.gethEnddate(), current)) {

					obj.put("hEndFlag", true);
				} else {
					obj.put("hEndFlag", false);
				}
				// 评审结束标记
				if (DateUtil.isDateBefore(info.getpEnddate(), current)) {

					obj.put("pEndFlag", true);
				} else {
					obj.put("pEndFlag", false);
				}
				// 申报结束标记
				if (DateUtil.isDateBefore(info.getsEnddate(), current)) {

					obj.put("sEndFlag", true);
				} else {
					obj.put("sEndFlag", false);
				}
				if ("有效".equals(info.getState())) {
					jArray.add(obj);
				} else {

					pageinfo.setTotal(pageinfo.getTotal() - 1);
				}
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	/**
	 * 活动列表
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/querySHPageList")
	public void querySHPageList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String id = TextUtil.getString(request.getParameter("id"));
		String sType = TextUtil.getString(request.getParameter("sType"));
		String sort = request.getParameter("sort"); //获取排序字段
		String order = request.getParameter("order"); //获取升序降序
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;

		Map<String, Object> params = ResultConstant.paramSet(request);
		if (!"".equals(id)) {
			params.put("activityId", TextUtil.getOInteger(id));
			params.put("sType", TextUtil.getString(sType));
			params.put("sort", TextUtil.getString(sort));
			params.put("order", TextUtil.getString(order));
			PageHelper.startPage(page, rows); // 分页
			List<Map<String, Object>> list = this.zcActivityGetService.queryList(params);
			PageInfo<Map<String, Object>> pageinfo = new PageInfo<Map<String, Object>>(list);
			JSONArray jArray = new JSONArray();
			JSONObject objs = new JSONObject();
			ZcActivityInfo zc = new ZcActivityInfo();
			if (list != null && list.size() > 0) {
				for (Map<String, Object> info : list) {
					JSONObject obj = new JSONObject();

					obj.put("mz", info.get("mz"));
					obj.put("formPlace", info.get("formPlace"));
					obj.put("getTime", info.get("getTime"));
					obj.put("zipCode", info.get("zipCode"));
					obj.put("gTel", info.get("gTel"));
					obj.put("qq", info.get("qq"));

					obj.put("user_name", info.get("zfname"));
					obj.put("sex", info.get("sex"));
					obj.put("pNum", info.get("u1_pnum"));
					obj.put("birthDate", info.get("birth_date"));
					obj.put("workName", info.get("work_name"));
					obj.put("workTime", info.get("work_time2"));
					obj.put("sx", info.get("d_point"));// 至于属性
					obj.put("adr", info.get("adr"));
					obj.put("technical", info.get("technical"));
					obj.put("email", info.get("email"));
					obj.put("zsNo", info.get("z_no"));// 证书编号
					obj.put("tel", info.get("tel"));

					obj.put("id", info.get("seq"));
					obj.put("sbDate",
							DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, (Date) info.get("sbDate")));
					obj.put("uId", info.get("uid"));// 申报人ID
					obj.put("name", info.get("zfname"));// 申报人姓名
					obj.put("pnum", info.get("u1_pnum"));// 申报人身份证
					obj.put("sLevel", info.get("s_level"));
					obj.put("sName", info.get("s_name"));
					obj.put("sPro", info.get("s_pro"));
					obj.put("sId", info.get("s_id"));
					obj.put("sState", info.get("s_state"));
					// sStateName
					obj.put("sStateName", getStateName((Integer) info.get("s_state")));
					obj.put("remark", info.get("remark"));
					obj.put("s_uid", info.get("s_uid"));
					obj.put("sh_name", info.get("u2_name"));
					obj.put("sDate", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, (Date) info.get("s_date")));
					/** 审核页面显示的 **/
					obj.put("prDate",
							DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, (Date) info.get("pr_date")));
					obj.put("zType", info.get("z_type"));
					obj.put("pTime", info.get("p_time"));
					obj.put("isOther", info.get("is_other"));
					obj.put("workNow", info.get("work_now"));
					obj.put("workTime1", info.get("work_time"));
					obj.put("point", info.get("point"));
					obj.put("yearK", info.get("year_k"));
					obj.put("url", info.get("url"));
					obj.put("wRemark", info.get("w_remark"));
					obj.put("curPos", info.get("cur_pos"));
					obj.put("pTime", info.get("p_time"));
					obj.put("xzPos", info.get("xz_pos"));
					obj.put("jscore", info.get("jscore"));
					obj.put("xpPro", info.get("xp_pro"));
					obj.put("remark_info", info.get("remark_info"));
					zc.sethEnddate((Date) info.get("h_enddate"));
					zc.setpEnddate((Date) info.get("p_enddate"));
					zc.setpStartdate((Date) info.get("p_startdate"));
					zc.setsEnddate((Date) info.get("s_enddate"));
					zc.setsStartdate((Date) info.get("s_startdate"));
					String ps = getStateInfo(zc);
					if ("评审申报".equals(ps)) {
						obj.put("pstate", 1);
					} else {
						obj.put("pstate", 0);
					}
					jArray.add(obj);
				}
			}
			objs.put("rows", jArray);
			objs.put("total", pageinfo.getTotal());
			objs.put("flag", true);
			objs.put("cause", null);
			System.out.println(objs.toString());
			response.getWriter().write(objs.toString());
		}
	}

	private String getStateName(Integer state) {
		if (state == null || state == 0) {
			return "未审核";
		} else if (state == 1) {
			return "审核通过";
		} else {
			return "审核未通过";
		}
	}

	@RequestMapping("/getUserInfoById")
	public void getUserInfoById(HttpServletResponse response, HttpServletRequest request, String id) throws Exception {
		JSONObject resObject = new JSONObject();
		resObject.put("flag", false);
		if (StringUtils.isBlank(id)) {
			resObject.put("cause", "用户ID不能为空");
		} else {
			try {
				UserInfo user = this.userInfoService.selectById(TextUtil.getOInteger(id));
				JSONObject obj = new JSONObject();
				obj.put("user_name", user.getName());
				obj.put("sex", user.getSex());
				obj.put("pNum", user.getPnum());
				obj.put("birthDate", DateUtil.getFormatDate(DateUtil.YYMM, user.getBirthDate()));
				obj.put("workName", user.getWorkName());
				obj.put("workTime", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, user.getWorkTime()));
				obj.put("sx", user.getdPoint());// 至于属性
				obj.put("adr", user.getAdr());
				obj.put("technical", user.getTechnical());
				obj.put("email", user.getEmail());
				obj.put("zsNo", user.getzNo());// 证书编号
				obj.put("tel", user.getgTel());
				resObject.put("data", obj);
				resObject.put("flag", true);
			} catch (Exception e) {
				resObject.put("cause", e.getMessage());
			}
		}
		System.out.println(resObject.toString());
		response.getWriter().write(resObject.toString());
	}

	/**
	 * 学习经历
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryStudyList")
	public void queryStudyList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Integer uid = TextUtil.getOInteger(request.getParameter("uid"));
		Integer activityId = TextUtil.getOInteger(request.getParameter("activityId"));
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		StudyInfo query = new StudyInfo();
		if (!"".equals(uid)) {
			query.setUid(uid);
		}
		if (!"".equals(activityId)) {
			query.setActivityId(activityId);
		}
		PageHelper.startPage(page, rows); // 分页
		List<StudyInfo> list = this.studyInfoService.queryStudyList(query);
		// List<StudyCurInfo> list = studycurinfomapper.getInfo(query);;
		PageInfo<StudyInfo> pageinfo = new PageInfo<StudyInfo>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		if (list != null && list.size() > 0) {
			for (StudyInfo info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("school_name", info.getSchoolName());
				obj.put("in_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD, info.getInDate()));
				obj.put("graduation_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD, info.getGraduationDate()));
				// 专业
				obj.put("sxzy", info.getProName());
				// 学制
				obj.put("xz", info.getXz());
				// 取得方式
				obj.put("qdfs", info.getGetMethod());
				obj.put("education", info.getEducation());
				obj.put("degree", info.getDegree());
				jArray.add(obj);
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	/**
	 * 工作经历
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryWorkList")
	public void queryWorkList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Integer uid = TextUtil.getOInteger(request.getParameter("uid"));
		Integer activityId = TextUtil.getOInteger(request.getParameter("activityId"));
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		WorkInfo query = new WorkInfo();
		if (null != uid || "".equals(uid)) {
			query.setUid(uid);
		}
		if (null != activityId || !"".equals(activityId)) {
			query.setActivityId(activityId);
		}
		PageHelper.startPage(page, rows); // 分页
		List<WorkInfo> list = workInfoService.queryList(query);

		PageInfo<WorkInfo> pageinfo = new PageInfo<WorkInfo>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		if (list != null && list.size() > 0) {
			for (WorkInfo info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("work_adr", info.getWorkAdr());
				obj.put("enterprise_id", info.getEnterpriseId());
				obj.put("work_name", info.getWorkName());
				obj.put("place_id", info.getPlaceId());
				obj.put("start_date", info.getStartDate());
				obj.put("end_date", info.getEndDate());
				jArray.add(obj);
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	/**
	 * 继续教育
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryCEList")
	public void queryCEList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		Integer uid = TextUtil.getOInteger(request.getParameter("uid"));
		Integer activityId = TextUtil.getOInteger(request.getParameter("activityId"));
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		StudyUpInfo queryGet = new StudyUpInfo();
		if (null != uid) {
			queryGet.setUid(uid);
			;
		}
		if (null != activityId) {
			queryGet.setActivityId(activityId);
		}
		PageHelper.startPage(page, rows); // 分页
		List<StudyUpInfo> list = this.studyUpInfoService.queryList(queryGet);
		PageInfo<StudyUpInfo> pageinfo = new PageInfo<StudyUpInfo>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		if (list != null && list.size() > 0) {
			for (StudyUpInfo info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("study_content", info.getStudyContent());
				obj.put("train_date", info.getTrainDate());
				obj.put("study_time", info.getStudyTime());
				obj.put("study_method", info.getStudyMethod());
				obj.put("out_date", info.getOutDate());
				jArray.add(obj);
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	/**
	 * 申报论文
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryPaperList")
	public void queryPaperList(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String uid = TextUtil.getString(request.getParameter("uid"));
		String activityId = TextUtil.getString(request.getParameter("activityId"));
		response.setCharacterEncoding("utf-8");
		int page = TextUtil.getInt(request.getParameter("page"));
		page = page <= 0 ? 1 : page;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		rows = rows <= 0 ? 10 : rows;
		Map<String, Object> params = ResultConstant.paramSet(request);
		if (!"".equals(uid) && !uid.equals("null")) {
			params.put("uid", TextUtil.getOInteger(uid));
		}
		if (!"".equals(activityId)) {
			params.put("activityId", TextUtil.getOInteger(activityId));
		}
		PageHelper.startPage(page, rows); // 分页
		List<Map<String, Object>> list = this.zcDissertationInfoService.queryList(params);
		PageInfo<Map<String, Object>> pageinfo = new PageInfo<Map<String, Object>>(list);
		JSONArray jArray = new JSONArray();
		JSONObject objs = new JSONObject();
		if (list != null && list.size() > 0) {

			for (Map<String, Object> info : list) {
				JSONObject obj = new JSONObject();
				obj.put("id", info.get("id"));
				obj.put("u_name", info.get("u_name"));
				obj.put("s_type_id", info.get("s_type_id"));
				obj.put("s_level", info.get("s_level"));
				obj.put("pnum", info.get("pum"));
				obj.put("j_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD, (Date) info.get("j_date")));
				obj.put("dissetation_name", info.get("dissetation_name"));
				obj.put("j_msg", info.get("j_msg"));
				obj.put("is_send", info.get("is_send"));
				obj.put("remark", info.get("remark"));
				obj.put("papeid", info.get("p_no"));
				obj.put("f_num", info.get("f_num"));
				obj.put("pid", info.get("pid"));
				obj.put("imgList", info.get("imgList"));
				obj.put("activity_id", info.get("activity_id"));
				obj.put("add_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD, (Date) info.get("add_date")));
				// if(webroot!=null)
				// obj.put("url", webroot+"jt/"+info.get("url"));
				jArray.add(obj);
			}
		}
		objs.put("rows", jArray);
		objs.put("total", pageinfo.getTotal());
		objs.put("flag", true);
		objs.put("cause", null);
		System.out.println(objs.toString());
		response.getWriter().write(objs.toString());
	}

	@RequestMapping("/exportPaper")
	public void exportPaper(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ExportExcelUtils<Paper> excel = new ExportExcelUtils<Paper>();
		String[] headers = { "姓名", "身份证号", "申报类别", "申报资格级别", "论文题目", "刊出交流时间", "刊出交流情况", "是否作为送审代表作", "papeId", "pid",
				"被分配次数" };
		List<Paper> data = new ArrayList<Paper>();
		String uid = TextUtil.getString(request.getParameter("uid"));
		response.setCharacterEncoding("utf-8");
		Map<String, Object> params = ResultConstant.paramSet(request);
		if (!"".equals(uid)) {
			params.put("uid", TextUtil.getOInteger(uid));
		}
		List<Map<String, Object>> list = this.zcDissertationInfoService.queryList(params);
		if (list != null && list.size() > 0) {
			for (Map<String, Object> info : list) {
				Paper obj = new Paper();
				obj.setDissetation_name(TextUtil.getString(info.get("dissetation_name")));
				obj.setF_num(TextUtil.getString(info.get("f_num")));
				obj.setIs_send(TextUtil.getString(info.get("is_send")));
				obj.setJ_date(TextUtil
						.getString(DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, (Date) info.get("j_date"))));
				obj.setJ_msg(TextUtil.getString(info.get("j_msg")));
				obj.setPapeId(TextUtil.getString(info.get("p_no")));
				obj.setPid("");
				obj.setF_num(TextUtil.getString(info.get("f_num")));
				obj.setPnum(TextUtil.getString(info.get("pnum")));

				// 替换 申报资格级别 由标识改为中文 2018年1月2日16:22:59
				switch (Integer.valueOf(info.get("s_level").toString())) {
				case 0:
					obj.setS_level("初级");
					break;
				case 1:
					obj.setS_level("中级");
					break;
				case 2:
					obj.setS_level("副高级");
					break;
				case 3:
					obj.setS_level("正高级");
					break;
				default:
					obj.setS_level("其他");
					break;
				}
//                obj.setS_level(TextUtil.getString(info.get("s_level")));

				switch (Integer.valueOf(info.get("s_type_id").toString())) {
				case 0:
					obj.setS_type("职称评审");

					break;
				case 1:
					obj.setS_type("职称确认");

					break;
				default:
					obj.setS_type("其他");
					break;
				}

				// obj.setS_type(TextUtil.getString(info.get("s_type_id")));

				obj.setUserName(TextUtil.getString(info.get("u_name")));
				data.add(obj);
			}
		}
		excel.createExcelFile("申报论文", "申报论文", headers, data, response);
	}

	@RequestMapping("/queryPaperById")
	public void queryPaperById(HttpServletResponse response, HttpServletRequest request, String id) throws Exception {
		JSONObject resObject = new JSONObject();
		resObject.put("flag", false);
		if (StringUtils.isBlank(id)) {
			resObject.put("cause", "用户ID不能为空");
		} else {
			try {
				ZcDissertationInfo info = this.zcDissertationInfoService.selectByPrimaryKey(TextUtil.getOInteger(id));
				JSONObject obj = new JSONObject();
				obj.put("id", info.getId());
				obj.put("dissetation_name", info.getDissetationName());
				obj.put("j_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getjDate()));
				obj.put("j_msg", info.getjMsg());
				obj.put("aboutusDescription", "");
				obj.put("is_send", info.getIsSend());
				obj.put("d_id", info.getD_id());
				resObject.put("data", obj);
				resObject.put("flag", true);
			} catch (Exception e) {
				resObject.put("cause", e.getMessage());
			}
		}
		System.out.println(resObject.toString());
		response.getWriter().write(resObject.toString());
	}

	@RequestMapping("/savePaper")
	public void savePaper(HttpServletResponse response, HttpServletRequest request) throws Exception {
		// 附件列表
		String fjparam = request.getParameter("fjParam");

		ZcDissertationInfo zcDissertationInfo = new ZcDissertationInfo();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		String dissetation_name = TextUtil.getString(request.getParameter("dissetation_name"));
		String j_date = TextUtil.getString(request.getParameter("j_date"));
		String j_msg = TextUtil.getString(request.getParameter("j_msg"));
		String remark = TextUtil.getString(request.getParameter("remark"));
		String isSend = TextUtil.getString(request.getParameter("is_send"));
		Integer is_send = 0;
		if (StringUtils.isNotBlank(isSend)) {
			if (isSend.equals("on") || isSend.equals("1")) {
				is_send = 1;
			}
		}

		String aboutusDescription = TextUtil.getString(request.getParameter("aboutusDescription"));
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null || is_send == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcDissertationInfo.setId(id);
			zcDissertationInfo.setDissetationName(dissetation_name);
			zcDissertationInfo.setjDate(TextUtil.getDateFormate(j_date, null));
			zcDissertationInfo.setjMsg(j_msg);
			zcDissertationInfo.setIsSend(is_send);
			zcDissertationInfo.setRemark(remark);

			int i = this.zcDissertationInfoService.updateZcDissertationInfo(zcDissertationInfo, fjparam);
			if (i > 0) {
				resObject.put("errorMsg", "审核成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "审核失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		System.out.println(resObject.toString());
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/delPaper")
	public void delPaper(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ZcDissertationInfo info = new ZcDissertationInfo();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null) {
				resObject.put("errorMsg", "参数异常");
			}
			info.setId(id);
			info.setDelDate(new Date());
			int i = this.zcDissertationInfoService.updateZcDissertationInfo(info, null);
			if (i > 0) {
				resObject.put("errorMsg", "删除成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "删除失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/saveGet")
	public void saveGet(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ZcActivityGet zcActivityGet = new ZcActivityGet();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		Integer s_uid = TextUtil.getOInteger(request.getParameter("s_uid"));
		Integer sState = TextUtil.getOInteger(request.getParameter("sState"));

		// request.getSession().getAttribute("uid");
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null || s_uid == null || sState == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcActivityGet.setId(id);
			zcActivityGet.setsUid(s_uid);
			zcActivityGet.setsState(sState);
			zcActivityGet.setsDate(new Date());
			zcActivityGet.setRemark(TextUtil.getString(request.getParameter("remark_info")));
			int i = this.zcActivityGetService.updateZcActivityGet(zcActivityGet);
			if (i > 0) {
				resObject.put("errorMsg", "审核成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "审核失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/delGet")
	public void delGet(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ZcDissertationInfo zcActivityGet = new ZcDissertationInfo();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcActivityGet.setId(id);
			zcActivityGet.setDelDate(new Date());
			int i = this.zcDissertationInfoService.updateByPrimaryKeySelective(zcActivityGet);
			if (i > 0) {
				resObject.put("errorMsg", "删除成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "删除失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/delGetNew")
	public void delGetNew(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ZcActivityGet zcActivityGet = new ZcActivityGet();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcActivityGet.setId(id);
			zcActivityGet.setDelDate(new Date());
			int i = this.zcActivityGetService.updateByPrimaryKeySelective(zcActivityGet);
			if (i > 0) {
				resObject.put("errorMsg", "删除成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "删除失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	@RequestMapping("/reloadGet")
	public void reloadGet(HttpServletResponse response, HttpServletRequest request) throws Exception {
		ZcActivityGet zcActivityGet = new ZcActivityGet();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcActivityGet.setId(id);
			zcActivityGet.setsState(0);
			zcActivityGet.setsUid(0);
			int i = this.zcActivityGetService.updateZcActivityGet(zcActivityGet);
			if (i > 0) {
				resObject.put("errorMsg", "重置审核状态成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "重置审核状态失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

//	@RequestMapping("/exportGet")
//	public void exportGet(HttpServletResponse response, HttpServletRequest request) throws Exception {
//			ExportExcelUtils<GetPO> excel = new ExportExcelUtils<GetPO>();
//			// List<CellRangeAddress> cellList= new ArrayList<CellRangeAddress>();
//			String[] headers = { "序号", "工作单位", "姓名", "性别", "出生年月", "学习经历", "参加工作时间", "行政职务", "现技术职务获取时间", "取得时间",
//					"证书编号", "聘用时间", "年度考核 ", "外语成绩 ", "申报级别 ", "申报专业", "身份证号", "手机号码" };
//			// cellList.add(new CellRangeAddress(rowFrom,rowFrom+row-1, 0, 0));//订单编号
//			// excel.createExcelFile("订单列表","订单", headers, data,cellList,response);
//			List<GetPO> data = new ArrayList<GetPO>();
//			String id = TextUtil.getString(request.getParameter("id"));
//			response.setCharacterEncoding("utf-8");
//			Map<String, Object> params = ResultConstant.paramSet(request);
//			if (!"".equals(id)) {
//				params.put("activityId", id);
//			}
//			String zcqr = request.getParameter("zcqr");
//			if (StringUtils.isNotEmpty(zcqr)) {
//				params.put("sType", "职称确认");
//			}
//			String pssb = request.getParameter("pssb");
//			if (StringUtils.isNotEmpty(pssb)) {
//				params.put("sType", "职称评审");
//			}
//			List<Map<String, Object>> list = zcActivityGetService.queryListExcel(params);
//			int i = 0;
//			if (list != null && list.size() > 0) {
//				for (Map<String,Object> info:list ) {
//					if (TextUtil.getInt(info.get("s_state")) != 1) {
//						continue;
//					}
//					GetPO get = new GetPO();
//					get.setXh(Integer.toString(i++));
//					get.setWorkName(TextUtil.getString(info.get("gzdw")));
//					get.setUserName(TextUtil.getString(info.get("xm")));
//					get.setSex(TextUtil.getString(info.get("xb")));
//					get.setBirthDate(
//							TextUtil.getString(DateUtil.getFormatDate(DateUtil.YYYYMM, (Date) info.get("csny"))));
//					get.setGraduation_time(TextUtil.getString(info.get("bysj")));
//					/*
//					 * get.setSchool(TextUtil.getString(info.get("byxx")));
//					 * get.setMajor(TextUtil.getString(info.get("zy")));
//					 * get.setDegree(TextUtil.getString(info.get("xlxx")));
//					 */
//					get.setWork_time(TextUtil.getString(info.get("cjgzsj")));
//					get.setZw(TextUtil.getString(info.get("xzzw")));
//					get.setGet_time2(TextUtil.getString(info.get("xjjzw")));
//					get.setGet_time(TextUtil.getString(info.get("qdsj")));
//					get.setZ_no(TextUtil.getString(info.get("zsbh")));
//					get.setPr_date(TextUtil.getString(info.get("pysjd")));
//					get.setYear_k(TextUtil.getString(info.get("ndkh")));
//					get.setWy(TextUtil.getString(info.get("wycj")));
//					get.setS_level(TextUtil.getString(info.get("sbjb")));
//					get.setS_pro(TextUtil.getString(info.get("sbzy")));
//					get.setPnum(TextUtil.getString(info.get("sfzh")));
//					get.setTel(TextUtil.getString(info.get("sjh")));
//	Object a = info.get("s_state");
//	if (TextUtil.getInt(a) == 1) {
//		get.setS_state("审核通过");
//	}
//	if (TextUtil.getInt(a) == 0) {
//		get.setS_state("未审核");
//	}
//	if (TextUtil.getInt(a) == 2) {
//		get.setS_state("审核未通过");
//	}
//	get.setS_state(TextUtil.getString(info.get("s_state")));
//	get.setRemark(TextUtil.getString(info.get("remark")));
//					data.add(get);
//				}
//			}
//			excel.createExcelFile("申报信息", "申报信息", headers, data, response);
//	}

	// **职称评审导出excel**//
	@RequestMapping("/exportGet")
	public void exportGet(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			System.out.println("进入方法" + " " + new Date());
			ExportExcelUtils<GetPO> excel = new ExportExcelUtils<GetPO>();
			String[] headers = { "序号", "活动编码", "工作单位", "姓名", "性别", "出生年月", "毕业时间、毕业院校、所学专业、学制、学历层次及类型", "参加工作时间", "行政职务",
					"现技术职务及获取时间", "取得时间", "聘用时间", "五年度考核等级 ", "外语成绩 ", "申报何专业", "身份证号", "电话号码", "委托评审机构", "原职称证书号",
					"申报级别","申报资格名称", "审核结果", "审核意见" };
			List<GetPO> data = new ArrayList<GetPO>();
			String id = TextUtil.getString(request.getParameter("id"));
			response.setCharacterEncoding("utf-8");
			Map<String, Object> params = ResultConstant.paramSet(request);
			if (!"".equals(id)) {
				params.put("activityId", id);
			}
			params.put("sType", "职称评审");
			List<Map<String, Object>> list = zcActivityGetService.queryListExcel1(params);
			List<Map<String, Object>> list1 = zcActivityGetService.queryListExcel2(params);
			for (int i = 0; i < list1.size(); i++) {
				Object bysj = list1.get(i).get("bysj");
				list.get(i).put("bysj", bysj);
			}
			System.out.println("list**********" + " " + list.size());
			System.out.println("list**********" + " " + list1.size());
			int i = 0;
			if (list != null && list.size() > 0) {
				for (Map<String, Object> info : list) {
//					if (TextUtil.getInt(info.get("s_state")) != 1) {
//						continue;
//					}
					GetPO get = new GetPO();
					get.setXh(Integer.toString(i++));// 编号
					get.setActivity_id(TextUtil.getString(info.get("hdbh")));// 活动编码
					get.setWorkName(TextUtil.getString(info.get("gzdw")));// 工作单位
					get.setUserName(TextUtil.getString(info.get("xm")));// 姓名
					get.setSex(TextUtil.getString(info.get("xb")));// 性别
					get.setBirthDate(
							TextUtil.getString(DateUtil.getFormatDate(DateUtil.YYYYMM, (Date) info.get("csny"))));// 出生年月
					get.setGraduation_time(TextUtil.getString(info.get("bysj")));// 学习经历
					get.setWork_time(TextUtil.getString(info.get("cjgzsj")));// 参加工作时间
					get.setZw(TextUtil.getString(info.get("xzzw")));// 行政职务
					get.setGet_time2(TextUtil.getString(info.get("xjjzw")));//
					get.setGet_time(TextUtil.getString(info.get("qdsj")));
					get.setPr_date(TextUtil.getString(info.get("pysjd")));
					get.setYear_k(TextUtil.getString(info.get("ndkh")));
					get.setWy(TextUtil.getString(info.get("wycj")));
					get.setS_pro(TextUtil.getString(info.get("sbzy")));
					get.setPnum(TextUtil.getString(info.get("sfzh")));
					get.setTel(TextUtil.getString(info.get("sjh")));
					get.setWtps(TextUtil.getString(info.get("wtps")));
					get.setZ_no(TextUtil.getString(info.get("zsbh")));
					get.setS_level(TextUtil.getString(info.get("sbjb")));// 申报级别
					get.setS_name(TextUtil.getString(info.get("sbzgmc")));// 申报资格名称
					get.setS_state(TextUtil.getString(getStateName((Integer) info.get("shjg"))));// 审核结果
					get.setRemark(TextUtil.getString(info.get("remark_info")));// 审核意见
					data.add(get);

				}
			}
			excel.createExcelFile("申报信息", "申报信息", headers, data, response);
			System.out.println("创建excel*********-*******" + " " + excel);
			System.out.println("结束方法" + " " + new Date());
		} catch (Exception e) {
			e.printStackTrace();
			Log log = Log.getLogger();
			log.logger.error("抛出", e);
			System.out.println("出错了*********-*******");
		}
	}

	// **职称确认导出excel**//
	@RequestMapping("/exportGet1")
	public void exportGet1(HttpServletResponse response, HttpServletRequest request) throws Exception {
		try {
			System.out.println("进入方法" + " " + new Date());
			ExportExcelUtils<GetPO> excel = new ExportExcelUtils<GetPO>();
			String[] headers = { "序号", "工作单位", "姓名", "性别", "出生年月", "毕业时间、毕业院校、所学专业、学制、学历层次及类型", "参加工作时间", "行政职务",
					"现技术职务及获取时间", "取得时间", "聘用时间", "五年度考核等级 ", "外语成绩 ", "申报何专业", "身份证号", "电话号码", "委托评审机构", "原职称证书号" };
			List<GetPO> data = new ArrayList<GetPO>();
			String id = TextUtil.getString(request.getParameter("id"));
			response.setCharacterEncoding("utf-8");
			Map<String, Object> params = ResultConstant.paramSet(request);
			if (!"".equals(id)) {
				params.put("activityId", id);
			}
			params.put("sType", "职称确认");
			System.out.println("params**********" + " " + params);
			List<Map<String, Object>> list = zcActivityGetService.queryListExcel(params);
			System.out.println("list**********" + " " + list.size());
			int i = 0;
			if (list != null && list.size() > 0) {
				for (Map<String, Object> info : list) {
					if (TextUtil.getInt(info.get("s_state")) != 1) {
						continue;
					}
					GetPO get = new GetPO();
					get.setXh(Integer.toString(i++));
					get.setWorkName(TextUtil.getString(info.get("gzdw")));
					get.setUserName(TextUtil.getString(info.get("xm")));
					get.setSex(TextUtil.getString(info.get("xb")));
					get.setBirthDate(
							TextUtil.getString(DateUtil.getFormatDate(DateUtil.YYYYMM, (Date) info.get("csny"))));
					get.setGraduation_time(TextUtil.getString(info.get("bysj")));
					get.setWork_time(TextUtil.getString(info.get("cjgzsj")));
					get.setZw(TextUtil.getString(info.get("xzzw")));
					get.setGet_time2(TextUtil.getString(info.get("xjjzw")));
					get.setGet_time(TextUtil.getString(info.get("qdsj")));
					get.setPr_date(TextUtil.getString(info.get("pysjd")));
					get.setYear_k(TextUtil.getString(info.get("ndkh")));
					get.setWy(TextUtil.getString(info.get("wycj")));
					get.setS_pro(TextUtil.getString(info.get("sbzy")));
					get.setPnum(TextUtil.getString(info.get("sfzh")));
					get.setTel(TextUtil.getString(info.get("sjh")));
					get.setWtps(TextUtil.getString(info.get("wtps")));
					get.setZ_no(TextUtil.getString(info.get("zsbh")));
					System.out.println("get*********-*******" + " " + get.getUserName());
					data.add(get);
				}
			}
			excel.createExcelFile("申报信息", "申报信息", headers, data, response);
			System.out.println("创建excel*********-*******" + " " + excel);
			System.out.println("结束方法" + " " + new Date());
		} catch (Exception e) {
			e.printStackTrace();
			Log log = Log.getLogger();
			log.logger.error("抛出", e);
			System.out.println("出错了*********-*******");
		}
	}

	/**
	 * 查询职称评审基本信息信息
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryZCPSBaseInfo")
	// public @ResponseBody Map<String,Object> queryZCPSBaseInfo(@RequestParam
	// Map<String,Object> params,HttpServletRequest request,HttpServletResponse
	// response)throws Exception{
	/*
	 * public void queryZCPSBaseInfo(ZcActivityGet zag ,String page ,String
	 * rows,HttpServletRequest request,HttpServletResponse response)throws
	 * Exception{ int page_i = TextUtil.getInt(page); page_i= page_i<=0?1:page_i;
	 * int rows_i=TextUtil.getInt(rows); rows_i=rows_i<=0?10:rows_i;
	 * PageHelper.startPage(page_i, rows_i); rs =
	 * zcActivityGetService.queryZCPSBaseInfo1(zag); write( response,rs); }
	 */
	public @ResponseBody Map<String, Object> queryZCPSBaseInfo(ZcActivityGet zag, String page, String rows,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		int page_i = TextUtil.getInt(page);
		page_i = page_i <= 0 ? 1 : page_i;
		int rows_i = TextUtil.getInt(rows);
		rows_i = rows_i <= 0 ? 10 : rows_i;
		PageHelper.startPage(page_i, rows_i);
		List<Map> rs = zcActivityGetMapper.selectZCPSBaseInfoList1(zag);
		Long total = (long) zcActivityGetMapper.selectZCPSBaseInfoList2(zag);
		System.out.println(total + "++++++++++++");
		return resultMap(rs, total, true, "");
	}

	/**
	 * 保存职称评审基本信息信息
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/saveZCPSBaseInfo")
	public void saveZCPSBaseInfo(HttpServletRequest request, HttpServletResponse response) throws Exception {

		ZcActivityGet zcActivityGet = new ZcActivityGet();
		Integer id = TextUtil.getOInteger(request.getParameter("id"));
		Integer s_uid = TextUtil.getOInteger(request.getParameter("s_uid"));
		Integer sState = TextUtil.getOInteger(request.getParameter("sState"));

		// request.getSession().getAttribute("uid");
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		try {
			if (id == null || s_uid == null || sState == null) {
				resObject.put("errorMsg", "参数异常");
			}
			zcActivityGet.setId(id);
			zcActivityGet.setsUid(s_uid);
			zcActivityGet.setsState(sState);
			zcActivityGet.setRemark(TextUtil.getString(request.getParameter("remark")));
			int i = this.zcActivityGetService.updateZcActivityGet(zcActivityGet);
			if (i > 0) {
				resObject.put("errorMsg", "审核成功");
				resObject.put("flag", 0);
			} else {
				resObject.put("errorMsg", "审核失败");
			}
		} catch (Exception e) {
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
	}

	public String zcsbtj(int uid, String path, MultipartFile file, int activityId, String sId, String sType,
			String sLevel, String sName, String sPro, String curPos, String prDate, String zType, String xpPro,
			String pTime, String workNow, String workTime, int jscore, String isOther, String point, String yearK,
			String xzPos) {
		Map p = new HashMap();
		String fileName = "";
		p.put("flag", 1);
		ZcActivityGet record = new ZcActivityGet();
		record.setActivityId(activityId);
		ZcActivityGet zc = zcActivityGetService.selectZcActivityGetById(activityId);
		if (zc != null) {
			p.put("flag", 2);
			return response(p);
		}
		if (file != null) {
			fileName = file.getOriginalFilename();
			if (fileName.endsWith(".zip") || fileName.endsWith(".rar")) {
				// String fileName = new Date().getTime()+".jpg";
				System.out.println(path);
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
				// 保存
				try {
					file.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}
			} else {
				p.put("flag", 3);// 文件格式不正确
				return response(p);
			}
		}

		UserInfo uf = userinfomapper.selectByPrimaryKey(uid);
		ZcActivityGet r = new ZcActivityGet();
		r.setActivityId(activityId);
		r.setsId(sId);
		r.setsType(sType);
		r.setsLevel(sLevel);
		r.setsName(sName);
		r.setsPro(sPro);
		r.setCurPos(curPos);
		r.setUid(uid);
		r.setSbDate(new Date());
		r.setPrDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD, prDate));
		r.setzType(zType);
		r.setXpPro(xpPro);
		r.setpTime(pTime);
		r.setWorkNow(workNow);
		r.setWorkTime(workTime);
		r.setJscore(jscore);
		r.setIsOther(isOther);
		r.setPoint(point);
		r.setYearK(yearK);
		r.setXzPos(xzPos);
		r.setUrl("/upload/" + fileName);

		if (uf != null) {

			r.setName(uf.getName());
			r.setSex(uf.getSex());
			r.setBirthDate(uf.getBirthDate());
			r.setWorkName(uf.getWorkName());
			r.setWorkTime2(uf.getWorkTime());
			r.setdPoint(uf.getdPoint());
			r.setAdr(uf.getAdr());
			r.setEmail(uf.getEmail());
			r.setTechnical(uf.getTechnical());
			r.setTel(uf.getTel());
			r.setzNo(uf.getzNo());
		}
		zcActivityGetService.updateZcActivityGet(r);
		return response(p);
	}

	/**
	 * 固定返回
	 * 
	 * @param obj
	 * @return
	 */
	public String response(Object obj) {

		ObjectMapper mapper = new ObjectMapper();
		Writer strWriter = new StringWriter();
		try {
			mapper.writeValue(strWriter, obj);
		} catch (Exception e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw, true));
			String str = sw.toString();
			System.out.println("==========");
			System.out.println(str);
		}
		return strWriter.toString();
	}

	private String rs = "";

	@RequestMapping("/showxxjlsave")
	public void showxxjlsave(HttpServletRequest request, HttpServletResponse response, String school_name,
			String in_date, String graduation_date, String education, String degree, String certificate,
			String pro_name, String xz, String get_method, String activityId, String xxjlid, String userId)
			throws Exception {
		rs = zcActivityGetService.showxxjlsave(activityId, TextUtil.getInt(userId), xxjlid, school_name, in_date,
				graduation_date, pro_name, xz, get_method, education, degree);
		write(response, rs);
	}

	@RequestMapping("/showxxjldel")
	public void showxxjldel(HttpServletRequest request, HttpServletResponse response, String delid) throws Exception {
		rs = zcActivityGetService.showxxjldel(TextUtil.getInt(delid));
		write(response, rs);
	}

	@RequestMapping("/zcsbsave")
	public void insertSelective(String id, String sLevel, String sName, String sPro, String isOther, String workTime,
			String workNow, String point, String yearK, String url, String wRemark, String zType, String pUrl,
			String xzPos, String jscore, String xpPro, String curPos, String sex, String workName, String workTime2Str,
			String dPoint, String adr, String email, String technical, String tel, String zNo, String sType,
			String name, String pTime, String point1, String birthDate, String mz, String formPlace, String getTime,
			String zipCode, String gTel, String qq, @RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String path = request.getSession().getServletContext().getRealPath("upload");
		ZcActivityGet obj = new ZcActivityGet();
		if (!"".equals(point1)) {
			point = point1;
		}
		Date workTime2 = new Date();
		try {
			obj.setMz(mz);
			obj.setFormPlace(formPlace);
			obj.setGetTime(DateUtil.getDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, getTime));
			obj.setZipCode(zipCode);
			obj.setgTel(gTel);
			obj.setQq(qq);
			obj.setBirthDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD, birthDate));
			obj.setId(TextUtil.getInt(id));
			obj.setsLevel(sLevel);
			obj.setsName(sName);
			obj.setsPro(sPro);
			obj.setIsOther(isOther);
			obj.setWorkTime(workTime);
			obj.setWorkNow(workNow);
			obj.setPoint(point);
			obj.setYearK(yearK);
			// obj.setUrl(url);
			obj.setwRemark(wRemark);
			obj.setzType(zType);
			obj.setpUrl(pUrl);
			obj.setXzPos(xzPos);
			obj.setJscore(TextUtil.getInt(jscore));
			obj.setXpPro(xpPro);
			obj.setCurPos(curPos);
			obj.setSex(sex);
			obj.setpTime(pTime);
			obj.setWorkName(workName);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			workTime2 = sdf.parse(workTime2Str);
			obj.setWorkTime2(workTime2);
			obj.setdPoint(dPoint);
			obj.setAdr(adr);
			obj.setEmail(TextUtil.getString(email));
			obj.setTechnical(TextUtil.getString(technical));
			obj.setTel(TextUtil.getString(tel));
			obj.setzNo(TextUtil.getString(zNo));
			obj.setsType(TextUtil.getString(sType));
			obj.setName(TextUtil.getString(name));
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		rs = zcActivityGetService.zcsbtj(path, file, obj);
		write(response, rs);
	}

	@RequestMapping("/zcsbdel")
	public void zcsbdel(HttpServletRequest request, HttpServletResponse response, String delid) throws Exception {
		rs = zcActivityGetService.zcsbdel(TextUtil.getInt(delid));
		;
		write(response, rs);
	}

	@RequestMapping("/showgzjlsave")
	public void showgzjlsave(HttpServletRequest request, HttpServletResponse response, WorkInfo obj) throws Exception {
		rs = zcActivityGetService.showgzjlsave(obj);
		write(response, rs);
	}

	@RequestMapping("/showjxjysave")
	public void showjxjysave(HttpServletRequest request, HttpServletResponse response, StudyUpInfo obj)
			throws Exception {

		rs = zcActivityGetService.showjxjysave(obj);
		write(response, rs);
	}

	@RequestMapping("/showlwzzsave")
	public void showxxjlsave(HttpServletRequest request, HttpServletResponse response,
			// @RequestParam(value = "file", required = false) MultipartFile file,
			ZcDissertationInfo obj, String isSendStr, String jDateStr, String overDateStr, String fjParam)
			throws Exception {
		String path = request.getSession().getServletContext().getRealPath("upload");

		if ("on".equals(TextUtil.getString(isSendStr))) {
			obj.setIsSend(1);
		} else {
			obj.setIsSend(0);
		}

		Date jDate = new Date();
		Date overDateSt = new Date();
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			jDate = sdf.parse(jDateStr);
			overDateSt = sdf.parse(overDateStr);
			obj.setjDate(jDate);
			obj.setjDate(overDateSt);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}

		// rs = zcActivityGetService.showlwzzsave(path , file , obj,fjParam);
		rs = zcActivityGetService.showlwzzsave(path, obj, fjParam);
		write(response, rs);
	}

	@RequestMapping("/showgzjldel")
	public void showgzjldel(HttpServletRequest request, HttpServletResponse response, String delid) throws Exception {
		rs = zcActivityGetService.showgzjldel(TextUtil.getInt(delid));
		write(response, rs);
	}

	@RequestMapping("/showjxjydel")
	public void showjxjydel(HttpServletRequest request, HttpServletResponse response, String delid) throws Exception {
		rs = zcActivityGetService.showjxjydel(TextUtil.getInt(delid));
		write(response, rs);
	}

	@RequestMapping("/showlwzzdel")
	public void showlwzzdel(HttpServletRequest request, HttpServletResponse response, String delid) throws Exception {
		rs = zcActivityGetService.showlwzzdel(TextUtil.getInt(delid));
		write(response, rs);
	}

	/**
	 * 论文添加附件
	 * 
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/lwUpload")
	public void lwUpload(HttpServletResponse response, HttpServletRequest request) throws Exception {
		String cause = "";
		try {

			// 获取解析器
			CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());
			// 判断是否是文件
			if (resolver.isMultipart(request)) {
				// 进行转换
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) (request);
				// 获取所有文件名称
				Iterator<String> it = multiRequest.getFileNames();
				while (it.hasNext()) {
					// 根据文件名称取文件
					MultipartFile file = multiRequest.getFile(it.next());
					String fileName = file.getOriginalFilename();// 原文件名
					System.out.println(fileName);
					// 上传时生成的临时文件保存目录
					int last = ResultConstant.getWEB_ROOTPath().lastIndexOf("jtrc");
					String webroot = ResultConstant.getWEB_ROOTPath().substring(0, last);
					String tempPath = webroot + "jt/temp/zcsb/upload/";
					File tmpFile = new File(tempPath);
					if (!tmpFile.exists()) {
						// 创建临时目录
						// mkdir创建目录只能创建一级子目录，也就说创建目录一定需要存在父目录
						// tmpFile.mkdir();
						// 创建此抽象路径指定的目录，包括所有必须但不存在的父目录。（及可以创建多级目录，无论是否存在父目录）
						tmpFile.mkdirs();
					}
					String newFileName = ResultConstant.getRandNum(32) + "."
							+ ResultConstant.lastIndexOf(fileName, ".");
					String localPath = tempPath + newFileName;
					File newFile = new File(localPath);
					System.out.println("临时文件保存路径：" + localPath);
					// 上传的文件写入到指定的文件中
					file.transferTo(newFile);
					Map<String, Object> map = new HashMap<String, Object>();
					map.put("name", fileName);
					map.put("url", tempPath + newFileName);
					map.put("flag", true);

					JSONObject jsonObject = new JSONObject();
					jsonObject.put("flag", true);
					jsonObject.put("rows", map);
					jsonObject.put("cause", cause);
					ResultConstant.write(response, jsonObject);

				}

			}

		} catch (Exception e) {
			e.printStackTrace();
			cause = "数据上传异常";
			JSONObject jsonObject = new JSONObject();
			jsonObject.put("flag", true);
			jsonObject.put("rows", null);
			jsonObject.put("cause", cause);
			ResultConstant.write(response, jsonObject);

		}
		// return ResultConstant.resultMap(flag,cause);

	}

	/**
	 * 附件列表
	 * 
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/lwglfjList")
	public @ResponseBody Map<String, Object> lwglfjList(HttpServletResponse response, HttpServletRequest request) {
		boolean flag = false;
		String cause = "";
		List<Map> list = null;
		try {
			String aid = request.getParameter("aid");
			if (StringUtils.isNotBlank(aid)) {
				List<Map<String, Object>> fjlist = new ArrayList<Map<String, Object>>();
				Map<String, Object> m1 = new HashMap<String, Object>();
				m1.put("aid", aid);
				m1.put("fileType", 1);// 附件类型（2：后台z职称评审论文列表）
				list = zcActivityGetService.selectfj(m1);
				if (list != null && list.size() > 0) {
					for (Map<String, Object> fjMap : list) {
						fjMap.put("url", "/jt/" + fjMap.get("file_url"));
						fjMap.put("name", fjMap.get("file_name"));
						fjMap.put("aid", fjMap.get("aid"));
						fjMap.put("id", fjMap.get("id"));
						fjlist.add(fjMap);
					}
				}
				return ResultConstant.resultMap(fjlist, flag, cause);

			}
			return ResultConstant.resultMap(null, flag, cause);

		} catch (Exception e) {
			e.printStackTrace();
			flag = false;
			cause = "数据异常";
		}
		return ResultConstant.resultMap(list, flag, cause);

	}

	/**
	 * 职称申报附件下载
	 * 
	 * @param response
	 * @param request
	 */
	@RequestMapping("/downFjFuc")
	@ResponseBody
	public void downFjFuc(HttpServletResponse response, HttpServletRequest request) {

		try {
			String url = request.getParameter("file");
			String path = "";
			String name = url.substring(url.lastIndexOf("/") + 1, url.length());
			name = new String(name.getBytes("ISO-8859-1"), "UTF-8");
			/*
			 * path = request.getSession().getServletContext().getRealPath("upload").
			 * replace("\\jtrc\\", "\\jt\\")+"/";
			 */
			path = request.getSession().getServletContext().getRealPath("/upload").replace("/jtrc", "/jt") + "/";
			String realDir = path + name;
			System.out.println("职称申报下载：" + path + name);

			// 设置文件MIME类型
			response.setContentType("multipart/form-data");
			// 设置Content-Disposition
			// response.setHeader("Content-Disposition", "attachment;filename="+filename);
			// name = "filename=\"" + name;
			response.setHeader("Content-Disposition", "attachment;" + ResultConstant.encodeFilename2(request, name));
			// response.setHeader("Content-Disposition", "attachment;"+name);
			// 读取目标文件，通过response将目标文件写到客户端
			// 获取目标文件的绝对路径
			String fullFileName = realDir;

			// 读取文件
			InputStream in = new FileInputStream(fullFileName);
			OutputStream out = response.getOutputStream();
			// 写文件
			int b;
			while ((b = in.read()) != -1) {
				out.write(b);
			}

			in.close();
			out.close();

		} catch (Exception e) {
			// e.printStackTrace();

		}

	}

	@RequestMapping("/downFjExists")
	@ResponseBody
	public void downFjExists(HttpServletResponse response, HttpServletRequest request) {
		JSONObject resObject = new JSONObject();
		resObject.put("flag", -1);
		String url = request.getParameter("file");
		String path = "";
		String name = url.substring(url.lastIndexOf("/") + 1, url.length());
		path = request.getSession().getServletContext().getRealPath("/upload").replace("/jtrc", "/jt") + "/";
		/*
		 * path =request.getSession().getServletContext().getRealPath("upload").
		 * replace("\\jtrc\\", "\\jt\\")+"\\";
		 */
		String realDir = path + name;
		File dir = new File(realDir);
		if (dir.exists()) {
			resObject.put("flag", 0);
		}
		ResultConstant.write(response, resObject);
		System.out.println(url);
		System.out.println(path);
		System.out.println(name);
		System.out.println(realDir);
	}

}
