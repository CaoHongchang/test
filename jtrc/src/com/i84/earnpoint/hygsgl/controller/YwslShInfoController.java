package com.i84.earnpoint.hygsgl.controller;



import java.io.File;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringEscapeUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ImportExcel;

import com.i84.earnpoint.hygsgl.service.YwglInfoService;
import com.i84.earnpoint.hygsgl.service.YwslShInfoService;
import com.i84.earnpoint.model.Page;
import com.i84.earnpoint.model.YgImportVo;

import freemarker.template.Template;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.OutputStreamWriter;  
import java.io.Writer;  
import java.util.ArrayList;  
import java.util.HashMap;  
import java.util.List;  
import java.util.Map;  

import com.i84.earnpoint.common.ResultConstant;

import freemarker.template.Configuration;  
import freemarker.template.Template;  
import freemarker.template.TemplateException;  


/**
 * 业务受理审核
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/ywslsh")
public class YwslShInfoController {
	@Autowired 
	private YwslShInfoService ywslShInfoService;
	/**业务受理新增
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addYwsl")  
	public  @ResponseBody Map<String, Object> addYwsl(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			Map<String,Object>m=ResultConstant.paramSetAdd(request);
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			m.put("sUid2", uid);
			m.put("slr", uid);//如果为第一环节则受理人即为当前登录
		    if(StringUtils.isEmpty(uid)){
		    
		    	return ResultConstant.resultMap(false,"非登录用户无法进行操作");
		    }
		    String curRemark=m.get("curRemark")==null?"":m.get("curRemark").toString();
		    if(curRemark.equals("1")){
		    	m.put("sstate", m.get("sstate2"));
		    	m.put("sMsg", m.get("sMsg2"));
		    	m.put("remark", m.get("remark2"));
		    	m.put("zdSUid", m.get("zdSUid2"));
		    }
		    
		    
			boolean c=ywslShInfoService.addYwsl(m);
			if(c)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}


	/** 业务受理人员表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywslUserData")  
	public  @ResponseBody List<Map<String,Object>> ywslUserData(HttpServletResponse response,HttpServletRequest request){  

		List<Map<String,Object>> list=null;
		try {
			String roleId=request.getParameter("roleId")==null?"":request.getParameter("roleId").toString();
			String roleName="";
			if(roleId.equals("2")){//关联业务经办人
				roleName="关联业务经办人";
			}
			else if(roleId.equals("3")){//宏业公司
				roleName="宏业公司";
			}
            else if(roleId.equals("4")){//指定相关部门
            	roleName="相关部门";
			}
            else if(roleId.equals("5")){//领导
            	roleName="领导";
			}
            else if(roleId.equals("6")){//宏业业务受理人
            	roleName="宏业业务受理人";
			}
			Map<String,Object>pmap=new HashMap<String, Object>();
			pmap.put("roleName", roleName);
			list=ywslShInfoService.selectRoleByUser(pmap);		
			return list;

		}catch (Exception e) {
			e.printStackTrace();

		}
		return list;

	}


	/** 业务受理列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywslView")  
	public  @ResponseBody Map<String, Object> ywglView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			Map<String, Object>m=ResultConstant.paramSet(request);
			m.put("remark", "1");//1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			list=ywslShInfoService.selectYwslshList(m);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}


	/**关联业务经办人审核列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/glywjbrView")  
	public  @ResponseBody Map<String, Object> glywjbrView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			Map<String, Object>m=ResultConstant.paramSet(request);
			m.put("remark", "2");//1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			list=ywslShInfoService.selectYwslByGlywjbList(m);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}

	/**宏业公司审核列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/hygsshView")  
	public  @ResponseBody Map<String, Object> hygsshView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			Map<String, Object>m=ResultConstant.paramSet(request);
			m.put("remark", "3");//1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			list=ywslShInfoService.selectYwslByHyList(m); //宏业公司多次提交只显示最后一条记录
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}
	/**相关部门审核审核列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/xgbmshView")  
	public  @ResponseBody Map<String, Object> xgbmshView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			Map<String, Object>m=ResultConstant.paramSet(request);
			m.put("remark", "4");//1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			list=ywslShInfoService.selectYwslByXgList(m);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}

	/**领导审核列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ldshView")  
	public  @ResponseBody Map<String, Object> ldshView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		try {
			Map<String, Object>m=ResultConstant.paramSet(request);
			m.put("remark", "5");//1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			list=ywslShInfoService.selectYwslByLdList(m);
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,total,flag, dateFlag,cause);

	}

	/**单个业务受理记录查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getYwslMsg")  
	public  @ResponseBody Map<String, Object> getYwslMsg(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String id=request.getParameter("id");

			if(StringUtils.isNotBlank(id)){
				Map<String, Object>paramMap=new HashMap<String, Object>();
				paramMap.put("id", id);
				Map<String, Object>map=ywslShInfoService.selectYwslMsg(paramMap);


				return ResultConstant.resultMap(map,true,cause);
			}

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据加载异常";
		}
		return ResultConstant.resultMap(null,flag,cause);


	}


	/**结办
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ldshEnd")  
	public  @ResponseBody Map<String, Object> ldshEnd(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String pno=request.getParameter("pno");
			String id=request.getParameter("id");
			Map<String, Object> m=new HashMap<String, Object>();
			m.put("pno", pno);
			m.put("id", id);
			Map<String, Object>map=ywslShInfoService.selectYwslMsg(m);
			if(map!=null){
				String sstate=map.get("sstate")==null?"":map.get("sstate").toString();
				if(sstate.equals("5")){
					return ResultConstant.resultMap(false,"审核状态已为办结");
				}
			}
			m.put("sstate", "5");//结办
			if(StringUtils.isEmpty(pno)){
				return ResultConstant.resultMap(false,"受理编码有误");
			}
			boolean c=ywslShInfoService.ldshEnd(m);
			if(c)
				return ResultConstant.resultMap(true,"");

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}

	/** 业务查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywView")  
	public  ModelAndView  ywView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";
		Map<String,Object> resultMap=null;
		List<Map<String, Object>> fj=null;
		try {
			Map<String, Object>m=new HashMap<String, Object>();
			String id=request.getParameter("id");
			if(StringUtils.isNotEmpty(id)){
				m.put("id", id);
				resultMap=ywslShInfoService.selectYwView(m);
				ResultConstant.mapToDate(resultMap, "sqsj");

				String ywid=resultMap.get("ywid")==null?null:resultMap.get("ywid").toString();
				fj=new ArrayList<Map<String,Object>>();
				//根据业务基础信息id查询附件列表
				if(StringUtils.isNotEmpty(id)){
					Map<String, Object> m1=	new HashMap<String, Object>();
					m1.put("bid", id);
					m1.put("bType",1);//业务类型（1：业务受理信息，2：业务基础信息）
					List<Map<String, Object>> fjList=ywslShInfoService.selectByfjList(m1);
					if(fjList!=null &&fjList.size()>0){
						
						
						for(Map<String, Object> fjMap:fjList){
							fjMap.put("fjUrl", "../"+fjMap.get("fjUrl"));//此处为前端业务受理的附件
							fj.add(fjMap);
						}
					}

				}
				resultMap.put("fjList", fj);
				//业务受理
				String pno=resultMap.get("pno")==null?null:resultMap.get("pno").toString();
				m=new HashMap<String, Object>();
				m.put("pno", pno);
				m.put("remark", "1");
				m.put("id", id);
				Map<String, Object>sl=ywslShInfoService.selectYwViewZt(m);
				if(sl!=null){
				resultMap.put("slr", sl.get("zdUserName"));
				resultMap.put("slsj", sl.get("s_date"));
				ResultConstant.mapToDate(resultMap, "slsj");
				resultMap.put("slzt", sl.get("zt"));
				String smsg=sl.get("s_msg")==null?"":sl.get("s_msg").toString();
				smsg=ResultConstant.StringFilter(smsg);
				resultMap.put("slrshyj", smsg);
				
				}
				//业务经办审核
				m.put("remark", "2");
				sl=ywslShInfoService.selectYwViewZt(m);
				if(sl!=null){
				resultMap.put("zdglywjbr", sl.get("zdUserName")==null?null:sl.get("zdUserName"));
				resultMap.put("glywjbr", sl.get("userName"));
				resultMap.put("glywjbrshzt", sl.get("zt"));
				resultMap.put("glywjbrshsj", sl.get("sb_date"));
				ResultConstant.mapToDate(resultMap, "glywjbrshsj");
				String smsg=sl.get("s_msg")==null?"":sl.get("s_msg").toString();
				smsg=ResultConstant.StringFilter(smsg);
				resultMap.put("glywjbrshyj", smsg);
				}
				//宏业公司审核
				Map<String, Object>hyParam=new HashMap<String, Object>();
				hyParam.put("remark", "3");
				hyParam.put("pno", pno);
				hyParam.put("isHy", "true");
				Map<String, Object>hy=ywslShInfoService.selectYwViewZt(hyParam);
				if(hy!=null&&StringUtils.isNotEmpty(pno)){
					resultMap.put("zdhygsshr", hy.get("zdUserName"));
					resultMap.put("hygsshr", hy.get("userName"));
					resultMap.put("hygsshzt", hy.get("zt"));
					resultMap.put("hygsshsj", hy.get("sb_date"));
					ResultConstant.mapToDate(resultMap, "hygsshsj");
					String smsg=hy.get("s_msg")==null?"":hy.get("s_msg").toString();
					smsg=ResultConstant.StringFilter(smsg);
					resultMap.put("hygsshyj", smsg);
				}
				
				//相关部门
				m.put("remark", "4");
				List<Map<String, Object>> xgList=ywslShInfoService.selectYwViewZtList(m);
				if(xgList!=null&&xgList.size()>0&&StringUtils.isNotEmpty(pno)){
					
				//for(int i=0;i<xgList.size();i++){
					sl=xgList.get(xgList.size()-1);	
					resultMap.put("zdxgbmshr", sl.get("zdUserName"));
					resultMap.put("xgbmshr", sl.get("userName"));
					resultMap.put("xgbmshzt", sl.get("zt"));
					resultMap.put("xgbmfzrshsj", sl.get("sb_date"));
					if(resultMap.get("xgbmfzrshsj")!=null){
					ResultConstant.mapToDate(resultMap, "xgbmfzrshsj");
					
					}
					String smsg=sl.get("s_msg")==null?"":sl.get("s_msg").toString();
					smsg=ResultConstant.StringFilter(smsg);
					resultMap.put("xgbmshyj", smsg);
					//break;
				//}
				for(int i=0;i<xgList.size();i++){
					Map<String,Object> xgMap=xgList.get(i);	
					ResultConstant.mapToDate(xgMap, "sb_date");
					ResultConstant.mapToDate(xgMap, "s_date");
					ResultConstant.mapToDate(xgMap, "add_date");
				}
				
				System.out.println(JsonUtil.getJsonArray4JavaList(xgList));
				resultMap.put("xgbmList", JsonUtil.getJsonArray4JavaList(xgList) );
				}else{
					//相关部门列表
					resultMap.put("xgbmList", "");
				}
				
				

				//领导
				m.put("remark", "5");
				sl=ywslShInfoService.selectYwViewZt(m);
				if(sl!=null&&StringUtils.isNotEmpty(pno)){
				resultMap.put("zdld", sl.get("zdUserName"));
				resultMap.put("ld", sl.get("userName"));
				resultMap.put("ldshzt", sl.get("zt"));
				resultMap.put("ldshsj", sl.get("sb_date"));
				ResultConstant.mapToDate(resultMap, "ldshsj");
				String smsg=sl.get("s_msg")==null?"":sl.get("s_msg").toString();
				smsg=ResultConstant.StringFilter(smsg);
				resultMap.put("ldshyj", smsg);
				}
				flag=true;
			}
			
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return new ModelAndView("hygsgl/ywslshAdd").addObject("rows", resultMap)
				.addObject("fjList", fj);

	}
	/**导出受理单
	 * @param response
	 * @param request
	 */
	@RequestMapping("/sldExport")  
	public  void sldExport(HttpServletResponse response,HttpServletRequest request){  


		try {
			String pno=request.getParameter("pno");//受理编号:SL5748172

			Configuration configuration= new Configuration();  
			configuration.setDefaultEncoding("UTF-8"); 
			//生成的临时文件保存目录
			String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/hygsgl/upload/";
			File tmpFile = new File(tempPath);
			if (!tmpFile.exists()) {//不存在则创建
				//创建目录
				tmpFile.mkdir();

			}

			configuration.setDirectoryForTemplateLoading(new File(ResultConstant.getWEB_ROOTPath() +"temp/hygsgl/down/" ));  //FTL文件模板所在的位置  
			Template t = configuration.getTemplate("sldmb.ftl"); //受理单模板   文件名  
			String fileName=ResultConstant.getRandNum(32)+".doc";
			File outFile = new File(tempPath+fileName);  
			Writer out = null;
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8")); 
			Map<String,Object> dataMap=new HashMap<String,Object>();  
			if(StringUtils.isNotEmpty(pno)){
				dataMap=getData(pno);
			}
			t.process(dataMap, out);  
			//关闭流
			out.flush();
			out.close();
			//文件下载
			ResultConstant.fileDownload(request, response, "temp/hygsgl/upload/", fileName,"受理单.doc");
			//删除零时文件
			outFile.delete();

		} catch (Exception e) {
			e.printStackTrace();

		}


	}


	private Map<String, Object> getData(String pno) {
		Map<String, Object> pramMap=new HashMap<String, Object>();
		pramMap.put("pno", pno);
		pramMap.put("remark", "1");
		Map<String, Object> resultMap=new HashMap<String, Object>();
		resultMap.putAll(pramMap);
		//业务受理
		Map<String, Object> slMap=ywslShInfoService.selectExportYwsl(pramMap);
		slMap.put("msg", "");
		if(slMap!=null&&slMap.get("sqsj")!=null){
			String date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$, (Date) slMap.get("sqsj"));					
			slMap.put("sqsj", date==null?"":date);
		}
		if(slMap!=null&&slMap.get("slsj")!=null){
			String date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$_HH_MI_SS, (Date) slMap.get("slsj"));					
			slMap.put("slsj", date==null?"":date);
		}
		if(slMap!=null)
		resultMap.putAll(slMap);

		//关联业务经办人
		pramMap.put("remark", "2");
		Map<String,Object> glMap=new HashMap<String, Object>();
		List<Map<String,Object>> list=ywslShInfoService.selectExportYwslList(pramMap);
		if(list!=null&&list.size()>0){
			glMap=list.get(0);
			String date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$, (Date) glMap.get("glywjbrshsj"));					
			glMap.put("glywjbrshsj", date==null?"":date);


		}
		resultMap.put("glywjbryj",glMap.get("glywjbryj")==null?"":glMap.get("glywjbryj"));
		resultMap.put("glywjbrshczr",glMap.get("glywjbrshczr")==null?"":glMap.get("glywjbrshczr"));
		resultMap.put("glywjbrshsj",glMap.get("glywjbrshsj")==null?"":glMap.get("glywjbrshsj"));


		//宏业公司<取最后审核的那一条记录>
		pramMap.put("remark", "3");
		Map<String,Object> map= ywslShInfoService.selectExportYwslHy(pramMap);
		String date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$, (Date) map.get("hygsshsj"));					
		map.put("hygsshsj", date==null?"":date);

		resultMap.put("hygsshsj", date);
		resultMap.put("hygsczr", map.get("hygsczr")==null?"":map.get("hygsczr"));
		resultMap.put("hygsyj", map.get("hygsyj")==null?"":map.get("hygsyj"));

		//相关部门审核
		pramMap.put("remark", "4");
		List<Map<String,Object>> xglist=new ArrayList<Map<String,Object>>();
		Map<String,Object> xgMaps=new HashMap<String, Object>();
		list=ywslShInfoService.selectExportYwslList(pramMap);
		if(list!=null&&list.size()>0){
            for(int i=0;i<list.size();i++){
            map=list.get(i);	
			date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$, (Date) map.get("xgbmshsj"));					
			map.put("xgbmshsj", date==null?"":date);
			xgMaps.put("xgbmyj", map.get("xgbmyj")==null?"":map.get("xgbmyj"));
			xgMaps.put("xgbmczr", map.get("xgbmczr")==null?"":map.get("xgbmczr"));
			xgMaps.put("xgbmshsj", date);
			xglist.add(xgMaps);
            }

		}else{
			xgMaps.put("xgbmyj", "");
			xgMaps.put("xgbmczr", "");
			xgMaps.put("xgbmshsj", "");
			xglist.add(xgMaps);
		}

		resultMap.put("xgList", xglist);
		//领导
		pramMap.put("remark", "5");
		Map<String,Object> ldMap=new HashMap<String, Object>();
		list=ywslShInfoService.selectExportYwslList(pramMap);
		ldMap=new HashMap<String, Object>();
		if(list!=null&&list.size()>0){
			ldMap=list.get(0);
			date=DateUtil.getFormatDate(DateUtil.YYYY$MM$DD$, (Date) ldMap.get("ldsj"));					
			ldMap.put("ldsj", date==null?"":date);
		
		
		}
		resultMap.put("ldyj", ldMap.get("ldyj")==null?"":ldMap.get("ldyj"));
		resultMap.put("ldczr", ldMap.get("ldczr")==null?"":ldMap.get("ldczr"));
		resultMap.put("ldsj", ldMap.get("ldsj")==null?"":ldMap.get("ldsj"));

/*		 Map<String, Object> m3=new HashMap<String, Object>();

		 Map<String, Object> m4=new HashMap<String, Object>();

		 m4.put("hygsyj", "12");
		 m4.put("hygsczr", "13");
		 m4.put("hygsshsj", "14");

		 m4.put("xgbmyj", "1");
		 m4.put("xgbmczr", "1");
		 m4.put("xgbmshsj", "1");


		 m3.put("ldyj", "1");
		 m3.put("ldczr", "1");
		 m3.put("ldsj", "1");
		 List< Map<String, Object>>list3=new ArrayList<Map<String,Object>>();
		 list3.add(m4);
		 list3.add(m4);
		 resultMap.put("jbList", list3);
		 resultMap.putAll(m3);*/
//将所有为null转为""

/*	          
	        List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();  
	        for (int i = 0; i < 10; i++) {  
	            Map<String,Object> map = new HashMap<String,Object>();  
	           // map.put("number", i);  
	            map.put("author", "作者"+i);  
	            list.add(map);  
	        }  


	        m.put("newsList", list);*/
return resultMap;  
}  

}
