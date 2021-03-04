package com.i84.earnpoint.sjbb.controller;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.daxt.service.UserMgInfoService;
import com.i84.earnpoint.model.GzExportVo;
import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.rsdlgl.service.RsBusinessInfoService;
import com.i84.earnpoint.rsdlgl.service.TypeInfoService;
import com.i84.earnpoint.sjbb.model.SjExportVo;

/**
 * 数据报表
 * @author lixin
 *
 */
@Controller
@RequestMapping("/sjbb")
public class SjbbController extends ResultConstant {
 	
	@Autowired 
	private UserMgInfoService userMgInfoService;
	
	
	//统计报表
	@RequestMapping("/jump")
	public ModelAndView jump(HttpServletResponse response,HttpServletRequest request) throws Exception{	
		 
		String  page_type = TextUtil.getString(request.getParameter("page_type"));
		String  ModelAndViewTemp = "pqtjViewIndex";
		//派遣统计
		if("pqtj".equals(page_type)){
			ModelAndViewTemp = "pqtjViewIndex";	
		//实际档案统计
		}else if( "sjdasltj".equals(page_type)){
			ModelAndViewTemp = "sjdasltjViewIndex";
		//人事外包统计
		}else if( "rswbtj".equals(page_type)){
			ModelAndViewTemp = "rswbtjViewIndex";
		//代理单位统计
		}else if( "dwdltj".equals(page_type)){
			ModelAndViewTemp = "dwdltjViewIndex";
		//录入日期统计
		}else if( "lrrqtj".equals(page_type)){
			ModelAndViewTemp = "lrrqtjViewIndex";
		//性别统计
		}else if( "xbtj".equals(page_type)){
			ModelAndViewTemp = "xbtjViewIndex";
		//出生年月统计
		}else if( "csnytj".equals(page_type)){
			ModelAndViewTemp = "csnytjViewIndex";
		//学历统计
		}else if( "xltj".equals(page_type)){
			ModelAndViewTemp = "xltjViewIndex";
		//政治面貌统计
		}else if( "zzmmtj".equals(page_type)){
			ModelAndViewTemp = "zzmmtjViewIndex";
		//档案类型统计
		}else if( "dalxtj".equals(page_type)){
			ModelAndViewTemp = "dalxtjViewIndex";			 
		}
		ModelAndView mv = new ModelAndView("sjbb/" + ModelAndViewTemp);
		mv.addObject("page_type", page_type);
		return mv;
	}
	
	
	
	
	
	
	//统计报表
	@RequestMapping("/tjbb")
	public  @ResponseBody Map<String,Object> pqtj(HttpServletResponse response,HttpServletRequest request) throws Exception{	
		List<Map<String, Object>> list = getDBData(request);  
		return this.resultMap(list,true,"");
	}
	
	//设置参数
	private Map<String, Object> set_params(HttpServletRequest request)
	{
		Map<String, Object> params = new HashMap<String, Object>();	

		String time_type = TextUtil.getString(request.getParameter("time_type")) ; //按年统计还按月统计
		
		String file_type = TextUtil.getString(request.getParameter("file_type")) ; //档案状态
		String t_start_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_start")),"yyyy-MM-dd HH:mm")); //起始时间
		
		String t_end_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_end")),"yyyy-MM-dd HH:mm")); //结束时间
		
		String page_type = TextUtil.getString(request.getParameter("page_type")) ; 
		
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		
		params.put("page", page);
		params.put("rows", rows);
		
		params.put("page_type", page_type);
 
		params.put("time_type", time_type);
		params.put("file_type", file_type);
		params.put("t_start", t_start_str);
		params.put("t_end", t_end_str);
			
		return params;
	}
	
	private String tempxlsname = null;
	
	
	
	//获取服务器数据
	private List<Map<String, Object>> getDBData(HttpServletRequest request)
	{
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
				
		Map<String, Object> params = this.set_params(request);
		//哪个页面
		String page_type = TextUtil.getString(request.getParameter("page_type")) ; 
		
		//派遣统计
		if( "pqtj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoList(params);
		//实际档案统计
		}else if("sjdasltj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoList(params);
		//人事外包统计
		}else if("rswbtj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoList(params);
		//代理单位统计
		}else if("dwdltj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoList(params);
		//录入日期统计
		}else if("lrrqtj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoList(params);
		//性别统计
		}else if( "xbtj".equals(page_type)){
			tempxlsname = "templates/bzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoListBySex(params);
		//出生年月统计
		}else if("csnytj".equals(page_type)){
			tempxlsname = "templates/zzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoListByBirthday(params);
		//学历统计
		}else if("xltj".equals(page_type)){
			tempxlsname = "templates/bzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoListByDegree(params);
		//政治面貌统计
		}else if( "zzmmtj".equals(page_type)){
			tempxlsname = "templates/bzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoListByZzmm(params);
		//档案类型统计
		}else if("dalxtj".equals(page_type)){
			tempxlsname = "templates/bzt_tj.xls";
			list = userMgInfoService.countuResidenceQsInfoListByDtype(params);
		}
		
		return list;
	}
	
	
	/**统计导出
	 * @param response
	 * @param request
	 */
	@RequestMapping("/tjExport")  
	@ResponseBody
	public void gzExport(HttpServletResponse response,HttpServletRequest request){  
		try {
			
			String fileName = "统计导出.xls";
			
			OutputStream output = ResultConstant.outputStream(request, response, fileName);
					
			List<Map<String, Object>> list = getDBData(request);
			if(tempxlsname != null)
			{	
				List<SjExportVo> listVo = new ArrayList<SjExportVo>();
	 
				for(int i = 0; i < list.size(); i++)
				{
					Map<String, Object> _map = list.get(i);
					SjExportVo vo = new SjExportVo();
	
					String name_str = "";
					String _month = "";
					if  (_map.get("month")!=null)
					{
						_month =  "-" + _map.get("month");
					}						
					name_str = _map.get("name") + _month;
		
					int num  = 0;
					if  (_map.get("num")!=null)
					{
						num =  Integer.parseInt(_map.get("num").toString()) ;
					}
					
					vo.setIndex((i+1)+"");
					vo.setName(name_str);
					vo.setNum(num);
					listVo.add(vo);
				}
					
				String tempPath = request.getSession().getServletContext().getRealPath(tempxlsname);
		
				ExcelExport<SjExportVo> ex = new ExcelExport<SjExportVo>();
				
				ex.exportExcelByTemp(tempPath, listVo,output);
			}	
		} catch (Exception e) {
			e.printStackTrace();
		}

	}
}
