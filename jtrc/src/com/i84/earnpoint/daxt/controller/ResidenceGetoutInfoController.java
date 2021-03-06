package com.i84.earnpoint.daxt.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.math.BigDecimal;
import java.text.ParseException;
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

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.commons.lang.time.DateUtils;
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
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.daxt.service.ResidenceGetoutInfoService;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ResidenceGetoutImportInfo;
import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyImportInfo;
import com.i84.earnpoint.model.UserPartyInImport;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.UserPartyOutImport;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * ????????????????????????
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/residenceGetoutInfoTrol")
public class ResidenceGetoutInfoController   extends ResultConstant{

	@Autowired 
	public ResidenceGetoutInfoService residenceGetoutInfoService;
	
	/**
     * 	????????????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryResidenceGetoutInfoList")
	public  @ResponseBody Map<String, Object> queryResidenceGetoutInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String dept = request.getParameter("dept");
		if(StringUtils.isNotBlank(dept)){
			String key = request.getParameter("key");
			if("daNum".equals(dept) && StringUtils.isNotBlank(key)){
				params.put("d_no", key);
			}
		}
		String startTime = request.getParameter("startTime");
		String endTime = request.getParameter("endTime");
		String isBack = request.getParameter("isBack");
		if(StringUtils.isNotBlank(startTime)){
			params.put("startTime", startTime);
		}
		if(StringUtils.isNotBlank(endTime)){
			params.put("endTime", endTime);
		}
		if(StringUtils.isNotBlank(isBack)){
			params.put("isBack", isBack);
		}
		List<Map<String, Object>> list = residenceGetoutInfoService.queryResidenceGetoutInfoList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
     * 	??????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ResidenceGetoutInfo residenceGetoutInfo = new ResidenceGetoutInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String dPoint = request.getParameter("d_point");
		String dUid = request.getParameter("d_uid");
		String outUid = request.getParameter("out_uid");
		String dNo = request.getParameter("d_no");
		String dContent = request.getParameter("d_content");
		String dDate = request.getParameter("d_date");
		String backDate = request.getParameter("back_date");
		String tName = request.getParameter("t_name");
		String remark = request.getParameter("remark");
		residenceGetoutInfo.setdPoint(dPoint);
		residenceGetoutInfo.setdUid(dUid);
		residenceGetoutInfo.setOutUid(outUid);
		residenceGetoutInfo.setdNo(dNo);
		residenceGetoutInfo.setdContent(dContent);
		residenceGetoutInfo.setAddDate(new Date());
		if(StringUtils.isNotBlank(dDate)){
			residenceGetoutInfo.setdDate(sdf.parse(dDate));
		}
		if(StringUtils.isNotBlank(backDate)){
			residenceGetoutInfo.setBackDate(sdf.parse(backDate));
		}
		residenceGetoutInfo.settName(tName);
		residenceGetoutInfo.setRemark(remark);
		residenceGetoutInfoService.addResidenceGetoutInfo(residenceGetoutInfo, response);
	}
	
	/**
     * 	??????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ResidenceGetoutInfo residenceGetoutInfo = new ResidenceGetoutInfo();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String id = request.getParameter("id");
		String dPoint = request.getParameter("d_point");
		String dUid = request.getParameter("d_uid");
		String outUid = request.getParameter("out_uid");
		String dNo = request.getParameter("d_no");
		String dContent = request.getParameter("d_content");
		String dDate = request.getParameter("d_date");
		String backDate = request.getParameter("back_date");
		String tName = request.getParameter("t_name");
		String remark = request.getParameter("remark");
		String sUid = request.getParameter("s_uid");
		residenceGetoutInfo.setId(Integer.parseInt(id));
		residenceGetoutInfo.setdPoint(dPoint);
		residenceGetoutInfo.setdUid(dUid);
		residenceGetoutInfo.setOutUid(outUid);
		residenceGetoutInfo.setdNo(dNo);
		residenceGetoutInfo.setdContent(dContent);
		if(StringUtils.isNotBlank(dDate)){
			residenceGetoutInfo.setdDate(sdf.parse(dDate));
		}
		if(StringUtils.isNotBlank(backDate)){
			residenceGetoutInfo.setBackDate(sdf.parse(backDate));
		}
		residenceGetoutInfo.settName(tName);
		residenceGetoutInfo.setRemark(remark);
		residenceGetoutInfo.setsUid(sUid);
		residenceGetoutInfoService.backResidenceGetoutInfo(residenceGetoutInfo, response);
	}
	
	
	/**
	 * ????????????
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	 @RequestMapping("/importExcel")  
	 public void importExcel(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,  
	            HttpServletRequest request, HttpServletResponse response)  
	            throws Exception {
	  	JSONObject resObject = new JSONObject();
	  	JSONArray array = new JSONArray();
	  	System.out.println("----------type-------------" + request.getParameter("type"));
		try {
			/*????????????????????????*/
			DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem(); 
	        File f = fi.getStoreLocation();/**/
	        String type = request.getParameter("type");
	      
	        	boolean dataFlag = true;
	    	  	String tipMsg = "";//????????????
	    		ImportExcel<ResidenceGetoutImportInfo> excelUtil = new ImportExcel<ResidenceGetoutImportInfo>(ResidenceGetoutImportInfo .class);
	    		List<ResidenceGetoutImportInfo > results = (List<ResidenceGetoutImportInfo >) excelUtil.importExcel(f); 
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	    		if(results!=null && results.size()>0){
	    			//??????????????????1000???
	    			if(results.size()>1000){
	    				JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "????????????????????????????????????1000???");
						ResultConstant.write(response, jsonObject);
						return;
	    			}
	    			List<ResidenceGetoutImportInfo > resList = new ArrayList<ResidenceGetoutImportInfo >(); 
	    			for (ResidenceGetoutImportInfo  tempVo : results) {
	    				String errMsg = "";
	    				String dNo = tempVo.getdNo();//?????????
	    				String dContent = tempVo.getdContent();//??????????????????
	    				String dUid = tempVo.getdUid();//?????????
	    				String outUid = tempVo.getOutUid();//????????????
	    				String dDate = tempVo.getdDate();//????????????
	    				String backDate = tempVo.getBackDate();//????????????
	    				/*if(dDate!=null)
	    					dDate=dDate.replace("-", "/");*/
	    				String dPoint = tempVo.getdPoint();//????????????
	    				String remark = tempVo.getRemark();//??????
	    				String tName = tempVo.gettName();//?????????
	    				if(StringUtils.isBlank(dUid)){
	    					dataFlag = false;
	    					errMsg = "????????????????????????";
	    				} 
	    				if(StringUtils.isNotBlank(dNo)){
	    					
	    						//????????????????????????
	    						Map<String, Object> residenceMap = new HashMap<String, Object>();
	    						residenceMap.put("dNo", dNo);
	    						List<Map<String,Object>> userList = residenceGetoutInfoService.queryResidenceGetoutInfoList(residenceMap);
	    						if(null != userList && userList.size() > 0){
	    							Map<String,Object> map = userList.get(0);
	    							if(null != map.get("PY")){
	    								if(StringUtils.isBlank(errMsg)){
	    									errMsg = "?????????????????????"+ ":???"+dNo+"???";
	    								}else{
	    									errMsg += ","+"?????????????????????"+ ":???"+dNo+"???";
	    								}
	    							}
	    						}
	    					
	    				}
//	    				if(StringUtils.isNotBlank(dDate.toString())){
//	    					dataFlag = false;
//	    					if(StringUtils.isBlank(errMsg)){
//	    						errMsg = "????????????????????????";
//	    					}else{
//	    						errMsg += ",????????????????????????";
//	    					}
//	    				}else{
//	    					try{
//	    						//String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(partyDate)-2));
//	    						String date = sdf.format(sdf.parse(dDate.toString()));
//	    						
//	    						tempVo.setDDate(dDate);
////	    						sdf.parse(partyDate);
//	    					}catch(Exception e){
//	    						dataFlag = false;
//	    						if(StringUtils.isBlank(errMsg)){
//	    							errMsg = "???????????????????????????";
//	    						}else{
//	    							errMsg += ",???????????????????????????";
//	    						}
//	    					}
//	    				}
	    				
	    			
	    				tempVo.setErrMsg(errMsg);
	    				resList.add(tempVo);
	    			}
	    			System.out.println("----------tipMsg--------" + tipMsg);
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("rows", resList);
					jsonObject.put("flag", dataFlag);
					jsonObject.put("cause", tipMsg);
					ResultConstant.write(response, jsonObject);
	    			System.out.println("----------tipMsg-2-------" + tipMsg);
//					return;
	    			//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
	    		}else{
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "??????????????????????????????");
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(false,"??????????????????????????????");

	    		}
	        
		} catch (Exception e) {
			e.printStackTrace();
			resObject.put("flag", "1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
		System.out.println("----------tipMsg3--------");
		return;
		//return resObject;
	  }
	 
	 /**??????????????????
		 * @param response
		 * @param request
		 * @return
		 * @throws Exception 
		 */
		@RequestMapping("/saveDy")  
		public  @ResponseBody Map<String, Object> saveDy(@RequestBody List<ResidenceGetoutImportInfo> list,HttpServletResponse response) throws Exception{
			boolean flag=false;
			String cause="";
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");

			try {
				List<ResidenceGetoutInfo> residenceGetoutInfoList = new ArrayList<ResidenceGetoutInfo>();
				for(ResidenceGetoutImportInfo residenceGetoutImportInfo:list){
					ResidenceGetoutInfo residenceGetoutInfo = new ResidenceGetoutInfo();
					
					residenceGetoutInfo.setdNo(residenceGetoutImportInfo.getdNo());
					residenceGetoutInfo.setdContent(residenceGetoutImportInfo.getdContent());
					residenceGetoutInfo.setdPoint(residenceGetoutImportInfo.getdPoint());
					residenceGetoutInfo.setdUid(residenceGetoutImportInfo.getdUid());
					residenceGetoutInfo.setOutUid(residenceGetoutImportInfo.getOutUid());
					residenceGetoutInfo.setRemark(residenceGetoutImportInfo.getRemark());
					residenceGetoutInfo.setdDate(sdf.parse(residenceGetoutImportInfo.getdDate()));
					if(residenceGetoutImportInfo.getBackDate()==""){
						residenceGetoutInfo.setBackDate(null);
					}else{
					residenceGetoutInfo.setBackDate(sdf.parse(residenceGetoutImportInfo.getBackDate()));
					}
					residenceGetoutInfo.settName(residenceGetoutImportInfo.gettName());
					residenceGetoutInfoList.add(residenceGetoutInfo);
				}
				residenceGetoutInfoService.addResidenceGetoutInfoList(residenceGetoutInfoList, response);
//				classService.insertUserScoreInfo(list);
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
				flag=false;
				cause="??????????????????";
				ResultConstant.write(response, "????????????,??????????????????????????????");
				return null;
			}
			return null;
//			return ResultConstant.resultMap(flag,cause);  
		}
	
}
