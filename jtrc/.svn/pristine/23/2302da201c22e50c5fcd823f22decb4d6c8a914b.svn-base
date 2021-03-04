package com.i84.earnpoint.sydwzp.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.model.ScoreExportVo;
import com.i84.earnpoint.model.UserPayExportVo;
import com.i84.earnpoint.sydwzp.service.BgActivityUserPayInfoService;

@Controller
@RequestMapping("/bgActivityUserPayInfo")
public class BgActivityUserPayInfoController extends ResultConstant {
	@Autowired
	private BgActivityUserPayInfoService bgActivityUserPayInfoService;

	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
	@RequestMapping("/order")
	public void order(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String need_m = request.getParameter("need_m");
		String rs = bgActivityUserPayInfoService.orderInfo(TextUtil.getInt(request.getSession().getAttribute("id")),need_m);
		write( response,rs);
	}
	
	// 缴费列表
	@RequestMapping("/userPayList")
	public @ResponseBody Map<String,Object> userPayList(@RequestParam Map<String,Object> params,HttpServletRequest request,
			HttpServletResponse response) throws IOException {
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		PageInfo<Map<String,Object>> pageInfo = null;
		List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
		System.out.println(params.get("state"));
		if(params.get("activityPlaceId") != null){
			infos = bgActivityUserPayInfoService.userPayList(params);
			pageInfo=new PageInfo<Map<String,Object>>(infos);
			return resultMap(infos, pageInfo.getTotal(), true, "");
		}else{
			return resultMap(infos, 0L, true, "");
		}
		
		
	}	
	
	/**导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/userPayExport")  
	@ResponseBody
	public void userPayExport(HttpServletResponse response,HttpServletRequest request){  
		String id = request.getParameter("id");	
		try {
			Map<String,Object> params = new HashMap<String, Object>();
			params.put("activityPlaceId", id);
			List<Map<String,Object>> infos = bgActivityUserPayInfoService.userPayList(params);
				List<UserPayExportVo> da= new ArrayList<UserPayExportVo>();
				ExcelExport<UserPayExportVo> ex = new ExcelExport<UserPayExportVo>();
				for(int i = 0; i < infos.size(); i++) {
					UserPayExportVo user = new UserPayExportVo();
					user.setDdh(infos.get(i).get("order_id").toString());
					user.setFksj(infos.get(i).get("p_date").toString());
//					user.setFksj(sdf.format(new Date(Long.parseLong(infos.get(i).get("p_date").toString()))));
					if(null != infos.get(i).get("order_no")) {
						user.setFkjyh(infos.get(i).get("order_no").toString());
					}
					
					user.setJfzt(infos.get(i).get("state").toString());
					user.setDh(infos.get(i).get("phone").toString());
					user.setXm(infos.get(i).get("name").toString());
					user.setSfzh(infos.get(i).get("sfzh").toString());
					
					da.add(user);
				}
				
				List resultList=new ArrayList(); 
				resultList.add(da);
				
				String fileName = "缴费信息列表导出.xls";  
				OutputStream output =ResultConstant.outputStream(request, response, fileName);
				List<String> titleList=new ArrayList<String>(); 
				titleList.add("缴费信息列表");
				String syDelTitle="";
				
				Map<String,Object>title=new HashMap<String, Object>();
				title.put("1", syDelTitle);
				
			
				ex.exportExcel2(titleList, resultList, title,output);



			} catch (IOException e) {
				e.printStackTrace();
			}

	}
	
	@RequestMapping("/test")
	public void test(HttpServletRequest request, HttpServletResponse response) throws Exception {
		bgActivityUserPayInfoService.test();
	}
}
