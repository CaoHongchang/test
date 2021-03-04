package com.i84.earnpoint.tjbb.controller;

import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
/**
 * 人才库统计报表
 * @author Administrator
 *
 */
import com.i84.earnpoint.rckgl.service.PersonInfoService;
import com.i84.earnpoint.sjbb.model.SjExportVo;
@Controller
@RequestMapping("/rckbb")
public class RckbbController extends ResultConstant {
	
	@Autowired
	private PersonInfoService personInfoService;
	
	@RequestMapping("/jump")
	public ModelAndView jump(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String page_type = TextUtil.getString(request.getParameter("page_type"));
		String  ModelAndViewTemp = "pqtjViewIndex";
		//技术等级
		if("jsdj".equals(page_type)){
			ModelAndViewTemp = "bztjViewIndex";	
		//学历统计
		}else if( "xltj".equals(page_type)){
			ModelAndViewTemp = "bztjViewIndex";
		//学位统计
		}else if( "xwtj".equals(page_type)){
			ModelAndViewTemp = "bztjViewIndex";
		//专业技术
		}else if( "zyjs".equals(page_type)){
			ModelAndViewTemp = "bztjViewIndex"; 
		//奖惩统计
		}else if( "jctj".equals(page_type)){
			ModelAndViewTemp = "bztjViewIndex";
		//证书统计
		}else if( "zstj".equals(page_type)){
			ModelAndViewTemp = "zstjViewIndex";	 
		//总人数统计
		}else if( "zrstj".equals(page_type)){
			ModelAndViewTemp = "sztjViewIndex";
		//按录入人统计
		}else if( "lrrtj".equals(page_type)){
			ModelAndViewTemp = "zstjViewIndex";
		}
		ModelAndView mv = new ModelAndView("tjbb/" + ModelAndViewTemp);
		mv.addObject("page_type", page_type);
		return mv;
	}
	
	//统计报表
	@RequestMapping("/tjbb")
	public  @ResponseBody Map<String,Object> pqtj(HttpServletResponse response,HttpServletRequest request) throws Exception{	
		List<Map<String, Object>> list = getDBData(request);  
		return this.resultMap(list,true,"");
	}
	
	// 设置参数
	private Map<String, Object> set_params(HttpServletRequest request) {
		Map<String, Object> params = new HashMap<String, Object>();

		String time_type = TextUtil.getString(request.getParameter("time_type")); // 按年统计还按月统计

		String t_start_str = TextUtil.getLongDateTime(
				TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_start")), "yyyy-MM-dd HH:mm")); // 起始时间

		String t_end_str = TextUtil.getLongDateTime(
				TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_end")), "yyyy-MM-dd HH:mm")); // 结束时间

		String page_type = TextUtil.getString(request.getParameter("page_type"));

		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));

		params.put("page", page);
		params.put("rows", rows);

		params.put("page_type", page_type);

		params.put("time_type", time_type);
		params.put("t_start", t_start_str);
		params.put("t_end", t_end_str);

		return params;
	}
	private String tempxlsname = null;
	// 获取服务器数据
	private List<Map<String, Object>> getDBData(HttpServletRequest request) {
		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();

		Map<String, Object> params = this.set_params(request);
		// 哪个页面
		String page_type = TextUtil.getString(request.getParameter("page_type"));		
		// 技术等级
		if ("jsdj".equals(page_type)) {
			tempxlsname = "templates/zzt_tj.xls";
			list = personInfoService.countJsdjList(params);
		//学历统计
		} else if ("xltj".equals(page_type)) {
			list = personInfoService.countXlList(params);
			tempxlsname = "templates/zzt_tj.xls";
		//学位统计
		} else if ("xwtj".equals(page_type)) {
			list = personInfoService.countXwList(params);
			tempxlsname = "templates/zzt_tj.xls";
		//专业技术
		} else if ("zyjs".equals(page_type)) {
			list = personInfoService.countZyjsList(params);
			tempxlsname = "templates/zzt_tj.xls";
		//奖惩统计
		} else if ("jctj".equals(page_type)) {
			list = personInfoService.countJctjList(params);
			tempxlsname = "templates/zzt_tj.xls";
		//证书统计
		} else if ("zstj".equals(page_type)) {
			list = personInfoService.countZstjList(params);
			tempxlsname = "templates/zzt_tj.xls";
		// 总人数统计
		} else if ("zrstj".equals(page_type)) {
			list = personInfoService.countZrsList(params);
			tempxlsname = "templates/zzt_tj.xls";
		//按录入人统计
		} else if ("lrrtj".equals(page_type)) {
			list = personInfoService.countByUnitList(params);
			tempxlsname = "templates/zzt_tj.xls";
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
