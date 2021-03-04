package com.i84.earnpoint.daxt.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.ParseException;
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

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.Region;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.aqsczxy.controller.AqscbzhshController;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.daxt.service.ArchivesBaseInfoService;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesDisciplinedInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesKhInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesMaterialInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesMyInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesOtherInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesOutInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesPoliticalInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesProInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesPtInfoService;
import com.i84.earnpoint.gdcl.service.ArchivesRewardInfoService;
import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.ArchivesDisciplinedInfo;
import com.i84.earnpoint.model.ArchivesKhInfo;
import com.i84.earnpoint.model.ArchivesMaterialInfo;
import com.i84.earnpoint.model.ArchivesMyInfo;
import com.i84.earnpoint.model.ArchivesOtherInfo;
import com.i84.earnpoint.model.ArchivesOutInfo;
import com.i84.earnpoint.model.ArchivesPoliticalInfo;
import com.i84.earnpoint.model.ArchivesProInfo;
import com.i84.earnpoint.model.ArchivesPtInfo;
import com.i84.earnpoint.model.ArchivesRewardInfo;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.Statistical;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyImportInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * 档案基础信息管理
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/archivesBaseInfoTrol")
public class ArchivesBaseInfoController   extends ResultConstant{

	private static final int Map = 0;

	private static final int ArrayList = 0;

	private static final int String = 0;

	@Autowired 
	public ResidenceGetoutInfoService residenceGetoutInfoService;
	
	@Autowired 
	public ArchivesBaseInfoService archivesBaseInfoService;
	
	private final static Logger logger = Logger.getLogger(ArchivesBaseInfoController.class);

	/**
     * 	获取档案管理列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryArchivesBaseInfoList")
	public  @ResponseBody Map<String, Object> queryArchivesBaseInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String dept = request.getParameter("dept");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String pState = request.getParameter("pState");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if(StringUtils.isNotBlank(dept)){
			String key = request.getParameter("key");
			if("daNum".equals(dept) && StringUtils.isNotBlank(key)){
				params.put("dpno", key);
			}
		}
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(age)){
			params.put("age", age);
		}
		if(StringUtils.isNotBlank(pState)){
			params.put("pState", pState);
		}
		if(StringUtils.isNotBlank(start)){
			params.put("start", start);
		}
		if(StringUtils.isNotBlank(end)){
			params.put("end", end);
		}
		List<Map<String, Object>> list = archivesBaseInfoService.queryArchivesBaseInfoList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	/**
     * 	获取档案管理列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryArchivesBaseInfoList1")
	public  @ResponseBody Map<String, Object> queryArchivesBaseInfoList1(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String dept = request.getParameter("dept");
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String pState = request.getParameter("pState");
		String start = request.getParameter("start");
		String end = request.getParameter("end");
		if(StringUtils.isNotBlank(dept)){
			String key = request.getParameter("key");
			if("daNum".equals(dept) && StringUtils.isNotBlank(key)){
				params.put("dpno", key);
			}
		}
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(age)){
			params.put("age", age);
		}
		if(StringUtils.isNotBlank(pState)){
			params.put("pState", pState);
		}
		if(StringUtils.isNotBlank(start)){
			params.put("start", start);
		}
		if(StringUtils.isNotBlank(end)){
			params.put("end", end);
		}
		List<Map<String, Object>> list = archivesBaseInfoService.queryArchivesBaseInfoList1(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	/**
     * 	新增档案基础信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ArchivesBaseInfo archivesBaseInfo = new ArchivesBaseInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String getN = request.getParameter("getN");
		String getName = request.getParameter("getName");
		String getTel = request.getParameter("getTel");
		String inDate = request.getParameter("inDate");
		String inPoint = request.getParameter("inPoint");
		String outDate = request.getParameter("outDate");
		String outMethod = request.getParameter("outMethod");
		String outP = request.getParameter("outP");
		String outPoint = request.getParameter("outPoint");
		String pM = request.getParameter("pM");
		String pNo = request.getParameter("p_no");
		String pState = request.getParameter("pState");
		String pType = request.getParameter("pType");
		String sCode = request.getParameter("s_code");
		String stuff = request.getParameter("stuff");
		String addDate = request.getParameter("addDate");
		if(!"".equals(addDate) && addDate!=null)
		archivesBaseInfo.setAddDate(sdf.parse(addDate));
		archivesBaseInfo.setGetN(getN);
		archivesBaseInfo.setGetName(getName);
		archivesBaseInfo.setGetTel(getTel);
		if(!"".equals(inDate) && inDate!=null)
		archivesBaseInfo.setInDate(sdf.parse(inDate));
		archivesBaseInfo.setInPoint(inPoint);
		if(!"".equals(outDate) && outDate!=null)
		archivesBaseInfo.setOutDate(sdf.parse(outDate));
		archivesBaseInfo.setOutMethod(outMethod);
		archivesBaseInfo.setOutP(outP);
		archivesBaseInfo.setOutPoint(outPoint);
		archivesBaseInfo.setpM(pM);
		archivesBaseInfo.setpNo(pNo);
		archivesBaseInfo.setpState(pState);
		archivesBaseInfo.setpType(pType);
		archivesBaseInfo.setsCode(sCode);
		if(StringUtils.isNotBlank(stuff)){
			archivesBaseInfo.setStuff(Integer.parseInt(stuff));
		}
		
		archivesBaseInfoService.addArchivesBaseInfo(archivesBaseInfo, response);
	}
	
	/**
     * 	归还档案借阅
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ArchivesBaseInfo archivesBaseInfo = new ArchivesBaseInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String id = request.getParameter("id");
		String getN = request.getParameter("get_n");
		String getName = request.getParameter("get_name");
		String getTel = request.getParameter("get_tel");
		String inDate = request.getParameter("in_date");
		String inPoint = request.getParameter("in_point");
		String outDate = request.getParameter("out_date");
		String outMethod = request.getParameter("out_method");
		String outP = request.getParameter("out_p");
		String outPoint = request.getParameter("out_point");
		String pM = request.getParameter("p_m");
		String pNo = request.getParameter("p_no");
		String pState = request.getParameter("p_state");
		String pType = request.getParameter("p_type");
		String sCode = request.getParameter("s_code");
		String stuff = request.getParameter("stuff");
		String addDate = request.getParameter("add_date");
		
		archivesBaseInfo.setId(Integer.parseInt(id));
		if(!"".equals(addDate))
		archivesBaseInfo.setAddDate(sdf.parse(addDate));
		archivesBaseInfo.setGetN(getN);
		archivesBaseInfo.setGetName(getName);
		archivesBaseInfo.setGetTel(getTel);
		if(!"".equals(inDate))
		archivesBaseInfo.setInDate(sdf.parse(inDate));
		archivesBaseInfo.setInPoint(inPoint);
		if(!"".equals(outDate))
		archivesBaseInfo.setOutDate(sdf.parse(outDate));
		archivesBaseInfo.setOutMethod(outMethod);
		archivesBaseInfo.setOutP(outP);
		archivesBaseInfo.setOutPoint(outPoint);
		archivesBaseInfo.setpM(pM);
		archivesBaseInfo.setpNo(pNo);
		archivesBaseInfo.setpState(pState);
		archivesBaseInfo.setpType(pType);
		archivesBaseInfo.setsCode(sCode);
		if(StringUtils.isNotBlank(stuff)){
			archivesBaseInfo.setStuff(Integer.parseInt(stuff));
		}
		archivesBaseInfoService.updateArchivesBaseInfo(archivesBaseInfo, response);
	}
	/**
     * 	档案借阅删除
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		String ids = request.getParameter("ids");
		String[] idt = ids.split(",");
		HttpSession session = request.getSession();
		String uid = session.getAttribute("uid")+"";
		archivesBaseInfoService.delArchivesBaseInfo(ids, uid, response);
	}
	
	
	
	/**
     * 	获取档案管理列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/querybaseinfolist")
	public  @ResponseBody Map<String, Object> QueryBaseinfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String pnum = request.getParameter("pnum");
		String name=request.getParameter("name");
		String age=request.getParameter("age");
		String key = request.getParameter("key");
		if(StringUtils.isNotBlank(key)){
			params.put("dpno", key);
		}
		if(StringUtils.isNotBlank(pnum)){
			params.put("pnum", pnum);
		}
		if(StringUtils.isNotBlank(name)){
			params.put("name", name);
		}
		if(StringUtils.isNotBlank(age)){
			params.put("age", age);
		}
		List<Map<String, Object>> list = archivesBaseInfoService.QueryBaseinfoList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
	
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	
	@RequestMapping("/statistical")
	public @ResponseBody List<Map<String, Object>> statisticalByYear(String year1,String year2,String timeType,String fileType){
//		List<Map<String, Object>> list =new ArrayList<Map<String, Object>>();
		List<Map<String, Object>> lists = archivesBaseInfoService.sendByYear(year1, year2,timeType,fileType);
//		List<Map<String, Object>> listnum = archivesBaseInfoService.sendByYear1(year1, year2);
//		list.add(lists);
//		list.add((Map<String, Object>) listnum);
		return lists;
	}
	
	@RequestMapping("/statisticalSjdasltj")
	public @ResponseBody List<Map<String, Object>> sjdasltj(String year1,String year2,String timeType){
		List<Map<String, Object>> lists = archivesBaseInfoService.sjdasltj(year1, year2,timeType);
		return lists;
		
	}
	
	@RequestMapping("/statisticalRswbtj")
	public @ResponseBody List<Map<String, Object>> rswbtj(String year1,String year2,String timeType,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.rswbtj(year1, year2,timeType,fileType);
		return lists;
		
	}
	
	@RequestMapping("/statisticalDwdltj")
	public @ResponseBody List<Map<String, Object>> dwdltj(String year1,String year2,String timeType,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.dwdltj(year1, year2,timeType,fileType);
		return lists;
		
	}
	
	
	@RequestMapping("/statisticalLrtj")
	public @ResponseBody List<Map<String, Object>> lrtj(String year1,String year2,String timeType,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.xbtj(year1, year2,timeType,fileType);
		return lists;
	}
	
	@RequestMapping("/statisticalSex")
	public @ResponseBody List<Map<String, Object>> sex(String year1,String year2,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.sex(year1, year2,fileType);
		return lists;
		
	}
	
	@RequestMapping("/statisticalBirthDate")
	public @ResponseBody List<Map<String, Object>> birthDate(String year1,String year2,String timeType,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.birthDate(year1, year2,timeType,fileType);
		return lists;
		
	}

	
	@RequestMapping("/statisticalDegree")
	public @ResponseBody List<Map<String, Object>> degree(String year1,String year2,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.degree(year1, year2,fileType);
		return lists;
		
	}
	
	@RequestMapping("/statisticalZzmm")
	public @ResponseBody List<Map<String, Object>> zzmm(String year1,String year2,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.zzmm(year1, year2,fileType);
		return lists;
		
	}
	
	
	@RequestMapping("/statisticalDtype")
	public @ResponseBody List<Map<String, Object>> dtype(String year1,String year2,String fileType){
		List<Map<String, Object>> lists = archivesBaseInfoService.dtype(year1, year2,fileType);
		return lists;
		
	}
	
	@RequestMapping("/test")
	public void test(HttpServletResponse response,HttpServletRequest request) throws Exception{
	
		test();
		
	}
	///////////////////////////////////////////////////////////////////////
	//@Autowired 
	//public ArchivesBaseInfoService archivesBaseInfoService;
	
     @Autowired
	 private ArchivesMaterialInfoService archivesMaterialInfoService;
     
     @Autowired
     private ArchivesMyInfoService archivesMyInfoService;
     
     @Autowired
     private ArchivesKhInfoService archivesKhInfoService;
     
     @Autowired
     private ArchivesProInfoService archivesProInfoService;
     
     @Autowired
     private ArchivesPoliticalInfoService archivesPoliticalInfoService;
     
 	@Autowired
 	private ArchivesPtInfoService archivesPtInfoService;
 	
	@Autowired
	private ArchivesRewardInfoService archivesRewardInfoService;
	
	@Autowired
	private ArchivesDisciplinedInfoService archivesDisciplinedInfoService;
	
	   @Autowired
	     private ArchivesOutInfoService archivesOutInfoService;
	   
	   @Autowired
	     private ArchivesOtherInfoService archivesOtherInfoService;
	   
	public  void test() throws Exception {
		Map<String, Object> params = new HashMap<String, Object>();
		int page=1;
		
		List<Map<String, Object>> list = archivesBaseInfoService.QueryCheckBaseinfoList(params);
		List<Map<String, Object>> lista = new ArrayList();
		for (int i = 0; i < list.size(); i++) {
			Map m = list.get(i);
			if("1".equals(m.get("p_state"))||"转入".equals(m.get("p_state"))){
				lista.add(m);
				
			}
		}
		getAll(lista);
	}
	public void getAll(List<Map<String, Object>> list) throws Exception{
		if(list.size()>0){
			for (int i = 0; i <list.size(); i++) {
				Map<String,Object> m = list.get(i);
				
				   String pno = m.get("dpno")+"";
				   String pnum = m.get("pnum")+"";
				   int f=0;
				     //履历材料
				    ArchivesMaterialInfo record=new ArchivesMaterialInfo();
			        record.setpNo(pno);
			        List<Map<String,Object>> list2= archivesMaterialInfoService.listArchivesMaterialInfos(record);
			        if(list2.size()>0){
			        	for (int j = 0; j < list2.size(); j++) {
								Map<String,Object> p = list2.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),1,"履历材料",f);	   
						}
			        	
			        }
			        
			      // 自传材料
			   	 ArchivesMyInfo record1=new ArchivesMyInfo();
				 record1.setpNo(pno);
				 List<Map<String,Object>> list4= archivesMyInfoService.listArchivesMyInfos(record1); 
				 if(list4.size()>0){
			        	for (int j = 0; j < list4.size(); j++) {
								Map<String,Object> p = list4.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),2,"自传材料",f);	   
						}
			        	
			     }
				 
				 //鉴定考试材料
				 ArchivesKhInfo record2=new ArchivesKhInfo();
		    	 record2.setpNo(pno);
		    	 List<Map<String,Object>> list5= archivesKhInfoService.listArchivesKhInfos(record2); 
		    	 if(list5.size()>0){
			        	for (int j = 0; j < list5.size(); j++) {
								Map<String,Object> p = list5.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),3,"鉴定考试材料",f);	   
						}
			        	
			     }
		    	 
		    	 //学历职称材料
		    	 ArchivesProInfo record3=new ArchivesProInfo();
		    	 record3.setpNo(pno);
		    	 List<Map<String,Object>> list6= archivesProInfoService.listArchivesProInfos(record3); 
		    	 if(list6.size()>0){
			        	for (int j = 0; j < list6.size(); j++) {
								Map<String,Object> p = list6.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),4,"学历职称材料",f);	   
						}
			        	
			     }
		    	 
		    	 //政审材料
		    	 ArchivesPoliticalInfo record4=new ArchivesPoliticalInfo();
		    	 record4.setpNo(pno);
		    	 List<Map<String,Object>> list7= archivesPoliticalInfoService.listArchivesPoliticalInfos(record4); 
		    	 if(list7.size()>0){
			        	for (int j = 0; j < list7.size(); j++) {
								Map<String,Object> p = list7.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),5,"政审材料",f);	   
						}
			        	
			     }
		    	 
		    	 //党团材料
		    	 ArchivesPtInfo record5=new ArchivesPtInfo();
		    	 record5.setpNo(pno);
		    	 List<Map<String,Object>> list8= archivesPtInfoService.listArchivesPtInfos(record5); 
		    	 if(list8.size()>0){
			        	for (int j = 0; j < list8.size(); j++) {
								Map<String,Object> p = list8.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),6,"党团材料",f);	   
						}
			        	
			     }
		    	 
		    	//奖励材料
		    	 ArchivesRewardInfo record6=new ArchivesRewardInfo();
		    	 record6.setpNo(pno);
		    	 List<Map<String,Object>> list9= archivesRewardInfoService.listArchivesRewardInfos(record6); 
		    	 if(list9.size()>0){
			        	for (int j = 0; j < list9.size(); j++) {
								Map<String,Object> p = list9.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),7,"奖励材料",f);	   
						}
			        	
			     }
		    	 
		    	//处分材料
		    	 ArchivesDisciplinedInfo record7=new ArchivesDisciplinedInfo();
		    	 record7.setpNo(pno);
		    	 List<Map<String,Object>> list10= archivesDisciplinedInfoService.listArchivesDisciplinedInfos(record7);
		    	 if(list10.size()>0){
			        	for (int j = 0; j < list10.size(); j++) {
								Map<String,Object> p = list10.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),8,"处分材料",f);	   
						}
			        	
			     }
		    	 
		    	//工资、任免、出国、会议等材料
		    	 ArchivesOutInfo record8=new ArchivesOutInfo();
		    	 record8.setpNo(pno);
		    	 List<Map<String,Object>> list11= archivesOutInfoService.listArchivesOutInfos(record8); 
		    	 if(list11.size()>0){
			        	for (int j = 0; j < list11.size(); j++) {
								Map<String,Object> p = list11.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),9,"工资、任免、出国、会议等材料",f);	   
						}
			        	
			     }
		    	 
		    		//其他材料
		    	 ArchivesOtherInfo record9=new ArchivesOtherInfo();
		    	 record9.setpNo(pno);
		    	 List<Map<String,Object>> list12= archivesOtherInfoService.listArchivesOtherInfos(record9); 
		    	 if(list12.size()>0){
			        	for (int j = 0; j < list12.size(); j++) {
								Map<String,Object> p = list12.get(j);
								int pageNum = TextUtil.getInt(p.get("page_num"));
								
								f=llcl(pnum,pno, pageNum,TextUtil.getInt(p.get("id")),10,"其他材料",f);	   
						}
			        	
			     }
		    	 
		    	 if(f==0){
		    		 System.out.println("|t|身份证："+pnum+"图片不存在，档案号:|"+pno);
		      		logger.error("|t|身份证："+pnum+"图片不存在，档案号:|"+pno);
		    	 }
			}
		}
		
	}

	//材料
	public int llcl(String pnum,String pno,int pageNum,int aid,int fileType,String name,int f) throws Exception{
		 Map<String, Object> m1=	new HashMap<String, Object>();
         m1.put("aid", aid);
         m1.put("fileType", fileType);
         List<Map<String,Object>> list3=archivesMaterialInfoService.selectByClFjList(m1);
       
         if(list3.size()>0){
        	 ++f;
//     	   if(list3.size()<pageNum){
//     		  System.out.println("|s|身份证："+pnum+"  |"+name+"页数不一致，档案号:|"+pno+"| aid:"+aid+" 原先页数:"+pageNum+" 实际页数:"+list3.size());
//     		  logger.error("|s|身份证："+pnum+"  |"+name+"页数不一致，档案号:|"+pno+"| aid:"+aid+" 原先页数:"+pageNum+" 实际页数:"+list3.size());
//             }
//         	for (int k = 0; k < list3.size(); k++) {
//					Map<String,Object> mf = list3.get(k);
//					String fileUrl ="D:/2017年5月19日 硬盘备份/tomcat7_jtrcArchive/webapps/jtrc/"+ mf.get("file_url")+"";
//					
//					 File file = new File(fileUrl);
//			         if(!file.exists()) {
//			        	 
//			        	    System.out.println("|t|身份证："+pnum+"  |"+name+"图片不存在，档案号:|"+pno+"| 图片ID："+mf.get("id")+" aid:"+aid);
//			        		logger.error("|t|身份证："+pnum+"  |"+name+"图片不存在，档案号:|"+pno+"| 图片ID："+mf.get("id")+" aid:"+aid);
//			            
//			         }
//					
//				}
         }else{
        	
         }
         
         return f;
	}
	
}
