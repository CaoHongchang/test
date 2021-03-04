package com.i84.earnpoint.sjbb.controller;

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
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.sjbb.model.SjExportVo;
import com.i84.earnpoint.sjbb.service.BbtjService;

/**
 * 数据报表
 * @author dengzhen
 *
 */

@Controller
@RequestMapping("/bbtj")
public class TjbbControll extends ResultConstant{
		@Autowired 
		private BbtjService bbtjService;
		
		//统计报表
		@RequestMapping("/turn")
		public ModelAndView jump(HttpServletResponse response,HttpServletRequest request) throws Exception{	
			 
			String  page_type = TextUtil.getString(request.getParameter("page_type"));
			String  ModelAndViewTemp = "pqtjViewIndex";
			//党员数量统计
			if("dysltj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";	
			//企业总数统计
			}else if( "qysltj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				
			//培训人员比较情况统计
			}else if( "pxrybjqktj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				
			//培训人员情况统计
			}else if( "pxryqktj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				 
			//培训完成情况统计
			}else if( "pxwctj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				 
			//经办人办理数量统计
			}else if( "jbrblsltj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				 
			//业务办理数量统计
			}else if( "ywblsltj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
				 
			//业务类型统计
			}else if( "ywlxtj".equals(page_type)){
				ModelAndViewTemp = "pqtjViewIndex";
			}
				 
//			//政治面貌统计
//			}else if( "zzmmtj".equals(page_type)){
//				ModelAndViewTemp = "xbtjViewIndex";
//				 
//			//档案类型统计
//			}else if( "dalxtj".equals(page_type)){
//				ModelAndViewTemp = "xbtjViewIndex";			 
//			}
			ModelAndView mv = new ModelAndView("bbtj/" + ModelAndViewTemp);
			mv.addObject("page_type", page_type);
			return mv;
		}
		
		
		//统计报表
		@RequestMapping("/usertjbb")
		public  @ResponseBody Map<String,Object> pqtj(HttpServletResponse response,HttpServletRequest request) throws Exception{	
			List<Map<String, Object>> list = getDBData(request);  
			return this.resultMap(list,true,"");
		}
		
		//设置参数
		private Map<String, Object> set_params(HttpServletRequest request)
		{
			Map<String, Object> params = new HashMap<String, Object>();	

			
			String t_start_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_start")),"yyyy-MM-dd HH:mm")); //起始时间
			String time_type = TextUtil.getString(request.getParameter("time_type")) ; //按年统计还按月统计
			String t_end_str = TextUtil.getLongDateTime(TextUtil.getDateFormate(TextUtil.getString(request.getParameter("t_end")),"yyyy-MM-dd HH:mm")); //结束时间
			String file_type = TextUtil.getString(request.getParameter("file_type")) ; //统计类型
			String page_type = TextUtil.getString(request.getParameter("page_type")) ; 
			
			int page = TextUtil.getInt(request.getParameter("page"));
			if (page == 0)
				page = 1;
			int rows = TextUtil.getInt(request.getParameter("rows"));
			
			params.put("page", page);
			params.put("rows", rows);
			params.put("page_type", page_type);
			params.put("file_type", file_type);
			params.put("t_start", t_start_str);
			params.put("t_end", t_end_str);
			params.put("time_type", time_type);
				
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
			
			//党员数量统计
			if( "dysltj".equals(page_type)){
				tempxlsname = "templates/zzt_tj.xls";
				list = bbtjService.countdysl(params);
		
			//企业总数统计
			}else if("qysltj".equals(page_type)){
				tempxlsname = "templates/zzt_tj.xls";
				list = bbtjService.countqysltj(params);
			//培训人员比较情况统计
//			}else if("pxrybjqktj".equals(page_type)){
//				tempxlsname = "templates/zzt_tj.xls";
//				list = userInfoService.countuResidenceQsInfoList(params);
			//培训人情况统计
			}else if("pxryqktj".equals(page_type)){
				tempxlsname = "templates/zzt_tj.xls";
				list = bbtjService.countpxryqktj(params);
			//培训完成情况统计
			}else if("pxwctj".equals(page_type)){
				tempxlsname = "templates/zzt_tj.xls";
				list = bbtjService.countpxwcqk(params);
			
//			//经办人办理数量统计
//			}else if( "jbrblsltj".equals(page_type)){
//				tempxlsname = "templates/bzt_tj.xls";
//				list = userInfoService.countuResidenceQsInfoListBySex(params);
			//业务办理数量统计
			}else if("ywblsltj".equals(page_type)){
				tempxlsname = "templates/zzt_tj.xls";
				list = bbtjService.countywblsltj(params);
			
			//业务类型统计
			}else if("ywlxtj".equals(page_type)){
				tempxlsname = "templates/bzt_tj.xls";
				list = bbtjService.countywlxtj(params);
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
