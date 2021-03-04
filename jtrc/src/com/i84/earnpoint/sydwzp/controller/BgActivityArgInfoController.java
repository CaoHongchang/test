package com.i84.earnpoint.sydwzp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.record.MMSRecord;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.BgActivityArgInfo;
import com.i84.earnpoint.model.ZcActivityInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityArgInfoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * 活动参数信息
 * @author linyj
 *
 */
@Controller
@RequestMapping("/bgActivityArgInfo")
public class BgActivityArgInfoController extends ResultConstant{
	@Autowired
	private BgActivityArgInfoService bgActivityArgInfoService;
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		
	    // 活动列表
		@RequestMapping("/list")
		public void list(String pno, String pname, HttpServletResponse response,HttpServletRequest request) throws Exception{
			response.setCharacterEncoding("utf-8");
			int page = TextUtil.getInt(request.getParameter("page"));
			page = page <= 0 ? 1 : page;
			int rows = TextUtil.getInt(request.getParameter("rows"));
			rows = rows <= 0 ? 10 : rows;
			BgActivityArgInfo queryInfo = new BgActivityArgInfo();
			queryInfo.setPage(page);
			queryInfo.setRows(rows);
			queryInfo.setPno(pno);
			queryInfo.setPname(pname);
			PageHelper.startPage(page, rows); //分页
			List<BgActivityArgInfo> list = this.bgActivityArgInfoService.queryBgActivityArgInfo4List(queryInfo);
			PageInfo<BgActivityArgInfo> pageinfo=new PageInfo<BgActivityArgInfo>(list);
			JSONArray jArray = new JSONArray();
			JSONObject objs = new JSONObject();
			if(list !=null && list.size()>0){
				for (BgActivityArgInfo info : list){
					JSONObject obj = new JSONObject();
					obj.put("id", info.getId());
					obj.put("pno", info.getPno());
					obj.put("pname", info.getPname());
					obj.put("start_date",DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getStartDate()));
					obj.put("end_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getEndDate()));
					obj.put("sh_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getShDate()));
					obj.put("se_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getSeDate()));
					obj.put("dy_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getDyDate()));
					obj.put("de_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getDeDate()));
					obj.put("ss_start_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getSsStartDate()));
					obj.put("ss_end_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getSsEndDate()));
					obj.put("ck_start_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getCkStartDate()));
					obj.put("ck_end_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getCkEndDate()));
					obj.put("m", info.getM()+"");
					System.out.println(info.getM());
					obj.put("ks_start_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getKsStartDate()));
					obj.put("ks_end_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getKsEndDate()));
					obj.put("ms_start_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getMsStartDate()));
					obj.put("ms_end_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, info.getMsEndDate()));
					obj.put("a_ks_users", info.getaKsUsers());
					obj.put("b_ks_users", info.getbKsUsers());
					obj.put("zkz_top", info.getZkzTop());
					obj.put("activity_id", info.getActivityId());
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
		
		
		//编辑
		@RequestMapping("/edit")
		public @ResponseBody Map<String, Object> edit(String id, String pno, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			Map<String, Object> result = null;
			try {
				result = bgActivityArgInfoService.queryBgActivityArgInfo4Bean("id",id);
				
				System.out.println(result.size());
				
				/****/
				System.out.println(result.get("start_date"));
				System.out.println(result.get("start_date").toString().split(".").length);
				Map<String, Object> result2 = new HashMap<String, Object>();
				try {
					result2.put("id", result.get("id"));
					result2.put("pno", result.get("pno"));
					result2.put("pname", result.get("pname"));
					result2.put("start_date", DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS, sdf.parse(result.get("start_date").toString())));
					result2.put("end_date", sdf.parse(result.get("end_date").toString()));
					result2.put("sh_date", sdf.parse(result.get("sh_date").toString()));
					result2.put("se_date", sdf.parse(result.get("se_date").toString()));
					result2.put("dy_date", sdf.parse(result.get("dy_date").toString()));
					result2.put("de_date", sdf.parse(result.get("de_date").toString()));
					result2.put("ss_start_date", sdf.parse(result.get("ss_start_date").toString()));
					result2.put("ss_end_date", sdf.parse(result.get("ss_end_date").toString()));
					result2.put("ck_start_date", sdf.parse(result.get("ck_start_date").toString()));
					result2.put("ck_end_date", sdf.parse(result.get("ck_end_date").toString()));
					result2.put("m", result.get("m"));
					System.out.println(result.get("m"));
					result2.put("ks_start_date", sdf.parse(result.get("ks_start_date").toString()));
					result2.put("ks_end_date", sdf.parse(result.get("ks_end_date").toString()));
					result2.put("ms_start_date", sdf.parse(result.get("ms_start_date").toString()));
					result2.put("ms_end_date", sdf.parse(result.get("ms_end_date").toString()));
					result2.put("a_ks_users", result.get("a_ks_users"));
					result2.put("b_ks_users", result.get("b_ks_users"));
					result2.put("zkz_top", result.get("zkz_top"));
					result2.put("activity_id", result.get("activity_id"));
				} catch (Exception e) {
					e.printStackTrace();
				}
				
				System.out.println(result.get("zkz_content"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return result;
		}
		
		//保存
		@RequestMapping("/save")
		public void save(String startDate,String endDate,String shDate,String seDate,String dyDate,String deDate,String ssStartDate,String ssEndDate,
				String ckStartDate,String ckEndDate,String ksStartDate,String ksEndDate,String msStartDate,String msEndDate,String aKsUsers,String bKsUsers,
				String zkzTop,String m,String pno,String pname,String activityId,String id,HttpServletResponse response,HttpServletRequest hr) throws IOException {
			String result = "";
			int sum = 0;
			BgActivityArgInfo bgActivityArgInfo = new BgActivityArgInfo();
			System.out.println(startDate);
			System.out.println(id);
			try {
				bgActivityArgInfo.setActivityId(Integer.parseInt(activityId));
				bgActivityArgInfo.setStartDate(sdf.parse(startDate));
				bgActivityArgInfo.setEndDate(sdf.parse(endDate));
				bgActivityArgInfo.setShDate(sdf.parse(shDate));
				bgActivityArgInfo.setSeDate(sdf.parse(seDate));
				bgActivityArgInfo.setDyDate(sdf.parse(dyDate));
				bgActivityArgInfo.setDeDate(sdf.parse(deDate));
				bgActivityArgInfo.setSsStartDate(sdf.parse(ssStartDate));
				bgActivityArgInfo.setSsEndDate(sdf.parse(ssEndDate));
				bgActivityArgInfo.setCkStartDate(sdf.parse(ckStartDate));
				bgActivityArgInfo.setCkEndDate(sdf.parse(ckEndDate));
				bgActivityArgInfo.setKsStartDate(sdf.parse(ksStartDate));
				bgActivityArgInfo.setKsEndDate(sdf.parse(ksEndDate));
				bgActivityArgInfo.setMsStartDate(sdf.parse(msStartDate));
				bgActivityArgInfo.setMsEndDate(sdf.parse(msEndDate));
				bgActivityArgInfo.setaKsUsers(Integer.parseInt(aKsUsers));
				bgActivityArgInfo.setbKsUsers(Integer.parseInt(bKsUsers));
				bgActivityArgInfo.setZkzTop(zkzTop);
				System.out.println("m="+m);
				System.out.println("float(m)="+Float.parseFloat(m));
				bgActivityArgInfo.setM(Float.parseFloat(m));
				bgActivityArgInfo.setPno(pno);
				bgActivityArgInfo.setPname(pname);
				bgActivityArgInfo.setActivityId(Integer.parseInt(activityId));
				bgActivityArgInfo.setWhStatus("已维护");
				
//				System.out.println(bgActivityArgInfo.getStartDate());
				if(null != id && !"".equals(id)) {
					bgActivityArgInfo.setId(Integer.parseInt(id));
					sum = bgActivityArgInfoService.updateByPrimaryKeySelective(bgActivityArgInfo);
				} else {
					sum = bgActivityArgInfoService.insertSelective(bgActivityArgInfo);
				}
				
				result = sum+"";
			} catch (Exception e) {
				e.printStackTrace();
				result = "修改活动参数信息异常!";
			}
			write(response,result);
		}
		
		
		//编辑
		@RequestMapping("/editZkz")
		public @ResponseBody Map<String, Object> editZkz(String id,String activity_id,HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			System.out.println(id);
			Map<String, Object> result = null;
			try {
				result = bgActivityArgInfoService.queryBgActivityArgInfo4Bean("id",id);
				System.out.println(result.get("zkz_content"));
			} catch (Exception e) {
				e.printStackTrace();
			}
			return result;
		}
		
		//保存
		@RequestMapping("/saveZkz")
		public void saveZkz(String id, String zkzContent,HttpServletResponse response,HttpServletRequest hr) throws IOException {
			String result = "";
			BgActivityArgInfo bgActivityArgInfo = new BgActivityArgInfo();
			int sum = 0;
			bgActivityArgInfo.setZkzContent(zkzContent);
			try {
				if(null != id && !"".equals(id)) {
					bgActivityArgInfo.setId(Integer.parseInt(id));
					sum = bgActivityArgInfoService.updateByPrimaryKeySelective(bgActivityArgInfo);
				} else {
					sum = bgActivityArgInfoService.insertSelective(bgActivityArgInfo);
				}
				result = sum+"";
			} catch (Exception e) {
				e.printStackTrace();
				result = "修改活动参数信息异常!";
			}
			write(response,result);
		}
		
}
