package com.i84.earnpoint.sydwzp.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.BgActivityEnterprise;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.service.EnterpriseInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityEnterpriseService;

/**
 * 报考单位管理
 * @author linyj
 *
 */
@Controller
@RequestMapping("/bgActivityEnterpriseInfo")
public class BgActivityEnterpriseInfoController extends ResultConstant{

	@Autowired
	private BgActivityEnterpriseService activityEnterpriseService;
	
	// 活动列表
	@RequestMapping("/listEnterprise")
	public @ResponseBody Map<String,Object> listEnterprise(@RequestParam Map<String,Object> params,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		PageInfo<Map<String,Object>> pageInfo = null;
		List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
		if(params.get("activityId") != null){
			infos = activityEnterpriseService.listEnterpriseInfoByCodeOrName(params);
			pageInfo=new PageInfo<Map<String,Object>>(infos);
			return resultMap(infos, pageInfo.getTotal(), true, "");
		}else{
			return resultMap(infos, 0L, true, "");
		}
		
		
	}
	
	// 活动列表
	@RequestMapping("/listOtherEnterprise")
	public @ResponseBody Map<String,Object> listOtherEnterprise(@RequestParam Map<String,Object> params,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		PageInfo<Map<String,Object>> pageInfo = null;
		List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
		if(params.get("activityId") != null){
			infos = activityEnterpriseService.listEnterpriseInfoNotInActivity(params);
			pageInfo=new PageInfo<Map<String,Object>>(infos);
			return resultMap(infos, pageInfo.getTotal(), true, "");
		}else{
			return resultMap(infos, 0L, true, "");
		}
		
	}
	
	//删除报考单位
	@RequestMapping("/delete")
	public void deleteEnterprise(BgActivityEnterprise enterprise,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String result = "";
		try {
			if(enterprise.getId() != null){
				activityEnterpriseService.delActivityEnterprise(enterprise.getId());
				result= "1";
			}else{
				result = "删除活动单位异常!";
			}
		} catch (Exception e) {
			result = "删除活动单位异常!";
		}
		write(response,result);
	}
	//新增报考单位
	@RequestMapping("/add")
	public void addEnterprise(BgActivityEnterprise enterprise,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		String result = "";
		String enterpriseIds = request.getParameter("enterpriseIds");
		try {
			if(enterprise.getActivityId() != null && enterpriseIds != null && !"".equals(enterpriseIds)){
				String enterpriseArray[] = enterpriseIds.split(",");
				if(enterpriseArray !=null){
					for (String enterpriseId : enterpriseArray) {
						
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("activityId", Integer.valueOf(enterprise.getActivityId()));
						map.put("enterpriseId", Integer.valueOf(enterpriseId));
						int count = 0;
					    count = activityEnterpriseService.checkActivityEnterpriseIsExist(map);
						if(count == 0){
							BgActivityEnterprise activityEnterprise = new BgActivityEnterprise();
							activityEnterprise.setActivityId(enterprise.getActivityId());
							activityEnterprise.setEnterpriseId(Integer.parseInt(enterpriseId));
							activityEnterpriseService.addActivityEnterprise(activityEnterprise);
						}
						
					}
				}
				result= "1";
			}else{
				result = "添加活动单位异常!";
			}
		} catch (Exception e) {
			result = "添加活动单位异常!";
		}
		write(response,result);
		
	}
	
	
	
}
