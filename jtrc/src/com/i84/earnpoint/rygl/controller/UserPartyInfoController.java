package com.i84.earnpoint.rygl.controller;

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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
import com.i84.earnpoint.model.ClassActionImportInfo;
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
 * ??????????????????
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/userPartyInfoTrol")
public class UserPartyInfoController   extends ResultConstant{

	@Autowired 
	public RyglService ryglService;
	
	/**
     * 	??????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryPartyUserList")
	public  @ResponseBody Map<String, Object> queryPartyUserList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		String pnoSear = request.getParameter("pnoSear");
		String pnumSear = request.getParameter("pnumSear");
		String nameSear = request.getParameter("nameSear");
		String sexSear = request.getParameter("sexSear");
		String isStateSear = request.getParameter("isStateSear");
		String isInSear = request.getParameter("isInSear");
		String companySear = request.getParameter("companySear");
		params.put("pno", pnoSear);
		params.put("pnum", pnumSear);
		params.put("name", nameSear);
		params.put("sex", sexSear);
		params.put("isState", isStateSear);
		params.put("company", companySear);
		params.put("isIn", isInSear);
		List<Map<String, Object>> list = ryglService.queryPartyUserList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/getNextPno")
	public void getNextPno(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pno = ryglService.getNextPno();
		ResultConstant.write(response,pno);
	}
	
	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		ryglService.delPartyInfo(ids,response);
	}
	

	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserPartyInfo userPartyInfo = new UserPartyInfo();
		List<UserPartyIn> userPartyInList = new ArrayList<UserPartyIn>();
		List<UserPartyOut> userPartyOutList = new ArrayList<UserPartyOut>();
		UserInfo userInfo = new UserInfo();
		String pno = request.getParameter("pno");
		String name = request.getParameter("name");	
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String jg_name = request.getParameter("jg_name");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String birth_date = request.getParameter("birth_date");
		String degree = request.getParameter("degree");
		String da_id = request.getParameter("da_id");
		String is_state = request.getParameter("is_state");
		String party_date = request.getParameter("party_date");
		String his_date = request.getParameter("his_date");
		String full_date = request.getParameter("full_date");
		String j_name1 = request.getParameter("j_name1");
		String j_name2 = request.getParameter("j_name2");
		String qq = request.getParameter("qq");
		String wx = request.getParameter("wx");
		
		String sq_status = request.getParameter("sq_status");
		String rd_status = request.getParameter("rd_status");
		String zz_mtr = request.getParameter("zz_mtr");
		String py_mtr = request.getParameter("py_mtr");
		String full_rq = request.getParameter("full_rq");
		String zrInTimes = request.getParameter("zrInTimes");
		String zrZpnos = request.getParameter("zrZpnos");
		String zrInPlaces = request.getParameter("zrInPlaces");
		String zcInTimes = request.getParameter("zcInTimes");
		String zcZpnos = request.getParameter("zcZpnos");
		String zcInPlaces = request.getParameter("zcInPlaces");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String uid = String.valueOf(request.getSession().getAttribute("id"));
		if(null == uid || "null".equals(uid) || "".equals(uid)){
			uid = "1";
		}
		Date endInTime = null;
		Date endOutTime = null;
		if(StringUtils.isNotBlank(zrInTimes)){
			String[] zrInTimeArr = zrInTimes.split(",");
			String[] zrZpnoArr = zrZpnos.split(",");
			String[] zrInPlaceArr = zrInPlaces.split(",");
			for(int i=0;i<zrInTimeArr.length;i++){
				UserPartyIn in = new UserPartyIn();
				try {
					in.setInDate(sdf.parse(zrInTimeArr[i]));
					if(i == zrInTimeArr.length-1){
						endInTime = sdf.parse(zrInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				in.setZpno(zrZpnoArr[i]);
				in.setInPlace(zrInPlaceArr[i]);
				in.setAddDate(new Date());
				in.setStaff(Integer.parseInt(uid));
				userPartyInList.add(in);
			}
		}
		if(StringUtils.isNotBlank(zcInTimes)){
			String[] zcInTimeArr = zcInTimes.split(",");
			String[] zcZpnoArr = zcZpnos.split(",");
			String[] zcInPlaceArr = zcInPlaces.split(",");
			for(int i=0;i<zcInTimeArr.length;i++){
				UserPartyOut out = new UserPartyOut();
				try {
					out.setInDate(sdf.parse(zcInTimeArr[i]));
					if(i == zcInTimeArr.length-1){
						endOutTime = sdf.parse(zcInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				out.setZpno(zcZpnoArr[i]);
				out.setInPlace(zcInPlaceArr[i]);
				out.setAddDate(new Date());
				out.setStaff(Integer.parseInt(uid));
				userPartyOutList.add(out);
			}
		}
		
		if(null == endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
		}else if(null == endInTime && null != endOutTime){
			userPartyInfo.setIsIn("0");
			userPartyInfo.setOutDate(endOutTime);
		}else if(null != endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
			userPartyInfo.setInDate(endInTime);
		}else{
			userPartyInfo.setOutDate(endOutTime);
			userPartyInfo.setInDate(endInTime);
			if(endInTime.after(endOutTime)){
				userPartyInfo.setIsIn("1");
			}else{
				userPartyInfo.setIsIn("0");
			}
		}
		
		userPartyInfo.setPno(pno);
//		userPartyInfo.setIsIn(is_in);
		userInfo.setJgName(jg_name);
		if(StringUtils.isNotBlank(birth_date)){
			userInfo.setBirthDate(sdf.parse(birth_date));
		}
		userInfo.setDegree(degree);
		userInfo.setDaId(da_id);
		userPartyInfo.setIsState(is_state);
		if(StringUtils.isNotBlank(party_date)){
			userPartyInfo.setPartyDate(sdf.parse(party_date));
		}
		if(StringUtils.isNotBlank(full_date)){
			userPartyInfo.setFullDate(sdf.parse(full_date));
		}
		if(StringUtils.isNotBlank(his_date)){
			userPartyInfo.setHisDate(sdf.parse(his_date));
		}
		userPartyInfo.setjName1(j_name1);
		userPartyInfo.setjName2(j_name2);
		userInfo.setQq(qq);
		userInfo.setWx(wx);
		userPartyInfo.setSqStatus(sq_status);
		userPartyInfo.setCompany(company);
		userPartyInfo.setRdStatus(rd_status);
		userPartyInfo.setZzMtr(zz_mtr);
		userPartyInfo.setPyMtr(py_mtr);
		userPartyInfo.setFullRq(full_rq);
//		if(StringUtils.isNotBlank(in_date)){
//			userPartyInfo.setInDate(sdf.parse(in_date));
//		}
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setAddDate(new Date());
		userInfo.setWorkName(company);
		ryglService.addPartyInfo(userPartyInfo,userInfo,userPartyInList,userPartyOutList,response);
	}

	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserPartyInfo userPartyInfo = new UserPartyInfo();
		List<UserPartyIn> userPartyInList = new ArrayList<UserPartyIn>();
		List<UserPartyOut> userPartyOutList = new ArrayList<UserPartyOut>();
		UserInfo userInfo = new UserInfo();
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String pno = request.getParameter("pno");
		String is_in = request.getParameter("is_in");
		String name = request.getParameter("name");	
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String jg_name = request.getParameter("jg_name");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String birth_date = request.getParameter("birth_date");
		String degree = request.getParameter("degree");
		String da_id = request.getParameter("da_id");
		String is_state = request.getParameter("is_state");
		String party_date = request.getParameter("party_date");
		String his_date=request.getParameter("his_date");
		String full_date = request.getParameter("full_date");
		String j_name1 = request.getParameter("j_name1");
		String j_name2 = request.getParameter("j_name2");
		String qq = request.getParameter("qq");
		String wx = request.getParameter("wx");
		
		String sq_status = request.getParameter("sq_status");
		String rd_status = request.getParameter("rd_status");
		String zz_mtr = request.getParameter("zz_mtr");
		String py_mtr = request.getParameter("py_mtr");
		String full_rq = request.getParameter("full_rq");
		String zrInTimes = request.getParameter("zrInTimes");
		String zrZpnos = request.getParameter("zrZpnos");
		String zrInPlaces = request.getParameter("zrInPlaces");
		String zcInTimes = request.getParameter("zcInTimes");
		String zcZpnos = request.getParameter("zcZpnos");
		String zcInPlaces = request.getParameter("zcInPlaces");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date endInTime = null;
		Date endOutTime = null;
		if(StringUtils.isNotBlank(zrInTimes)){
			String[] zrInTimeArr = zrInTimes.split(",");
			String[] zrZpnoArr = zrZpnos.split(",");
			String[] zrInPlaceArr = zrInPlaces.split(",");
			for(int i=0;i<zrInTimeArr.length;i++){
				UserPartyIn in = new UserPartyIn();
				try {
					in.setInDate(sdf.parse(zrInTimeArr[i]));
					if(i == zrInTimeArr.length-1){
						endInTime = sdf.parse(zrInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				in.setZpno(zrZpnoArr[i]);
				in.setInPlace(zrInPlaceArr[i]);
				in.setParty(Integer.parseInt(id));
				userPartyInList.add(in);
			}
		}
		if(StringUtils.isNotBlank(zcInTimes)){
			String[] zcInTimeArr = zcInTimes.split(",");
			String[] zcZpnoArr = zcZpnos.split(",");
			String[] zcInPlaceArr = zcInPlaces.split(",");
			for(int i=0;i<zcInTimeArr.length;i++){
				UserPartyOut out = new UserPartyOut();
				try {
					out.setInDate(sdf.parse(zcInTimeArr[i]));
					if(i == zcInTimeArr.length-1){
						endOutTime = sdf.parse(zcInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				out.setZpno(zcZpnoArr[i]);
				out.setInPlace(zcInPlaceArr[i]);
				out.setParty(Integer.parseInt(id));
				userPartyOutList.add(out);
			}
		}
		
		if(null == endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
		}else if(null == endInTime && null != endOutTime){
			userPartyInfo.setIsIn("0");
			userPartyInfo.setOutDate(endOutTime);
		}else if(null != endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
			userPartyInfo.setInDate(endInTime);
		}else{
			userPartyInfo.setOutDate(endOutTime);
			userPartyInfo.setInDate(endInTime);
			if(endInTime.after(endOutTime)){
				userPartyInfo.setIsIn("1");
			}else{
				userPartyInfo.setIsIn("0");
			}
		}
		
		
		userPartyInfo.setPno(pno);
		userPartyInfo.setIsIn(is_in);
		userInfo.setJgName(jg_name);
		if(StringUtils.isNotBlank(birth_date)){
			userInfo.setBirthDate(sdf.parse(birth_date));
		}
		userInfo.setDegree(degree);
		userInfo.setDaId(da_id);
		userPartyInfo.setIsState(is_state);
		if(StringUtils.isNotBlank(party_date)){
			userPartyInfo.setPartyDate(sdf.parse(party_date));
		}
		if(StringUtils.isNotBlank(full_date)){
			userPartyInfo.setFullDate(sdf.parse(full_date));
		}
		if(StringUtils.isNotBlank(his_date)){
			userPartyInfo.setHisDate(sdf.parse(his_date));
		}
		userPartyInfo.setjName1(j_name1);
		userPartyInfo.setjName2(j_name2);
		userInfo.setQq(qq);
		userInfo.setWx(wx);
		userPartyInfo.setSqStatus(sq_status);
		userPartyInfo.setCompany(company);
		userPartyInfo.setRdStatus(rd_status);
		userPartyInfo.setZzMtr(zz_mtr);
		userPartyInfo.setPyMtr(py_mtr);
		userPartyInfo.setFullRq(full_rq);
//		if(StringUtils.isNotBlank(in_date)){
//			userPartyInfo.setInDate(sdf.parse(in_date));
//		}
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setAddDate(new Date());
		userInfo.setWorkName(company);
		userInfo.setId(Integer.parseInt(uid));
		userPartyInfo.setId(Integer.parseInt(id));
		ryglService.updatePartyInfo(userPartyInfo,userInfo,userPartyInList,userPartyOutList, response);
	}
	
	/**
     * 	??????????????????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryPartyInListByParty")
	public  @ResponseBody Map<String, Object> queryPartyInListByParty(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String party = request.getParameter("party");
		List<Map<String, Object>> list = ryglService.queryPartyInListByParty(Integer.parseInt(party));
		return resultMap(list, null, true, null);
	}
	/**
     * 	??????????????????????????????
     * @param response
     * @param request
     * @return
     * @throws Exception
     */	
	@RequestMapping("/queryPartyOutListByParty")
	public  @ResponseBody Map<String, Object> queryPartyOutListByParty(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String party = request.getParameter("party");
		List<Map<String, Object>> list = ryglService.queryPartyOutListByParty(Integer.parseInt(party));
		return resultMap(list, null, true, null);
	}
	
	/**
	 * ????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportModel")
	public String exportModel(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String type = request.getParameter("typeExport");
		String name = "";
		if("1".equals(type)){
			name = "party.xlsx";
		}else if("2".equals(type)){
			name = "party_in.xlsx";
		}else if("3".equals(type)){
			name = "party_out.xlsx";
		}else if("4".equals(type)){
			name = "expert.xlsx";
		}
		else if("5".equals(type)){
			name = "pickexpert.xlsx";
		}
		else{
			name = "party.xlsx";
		}
		//String path = request.getSession().getServletContext().getRealPath(name);
		 
		// ???????????????????????????ID?????????????????????
		try{
			//InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
			//InputStream is = new BufferedInputStream(new FileInputStream(path));
            //			ResultConstant.fileDownload(request, response, "temp/hygsgl/down", "ygdrmb.xlsx","??????????????????.xlsx");//??????????????????
			String finalFileName ="????????????.xlsx";
			if("2".equals(type)){
				finalFileName = "????????????.xlsx";
			}else if("3".equals(type)){
				finalFileName = "????????????.xlsx";
			}else if("4".equals(type)){
				finalFileName = "????????????.xlsx";
			}
			else if("5".equals(type)){
				finalFileName = "????????????.xlsx";
			}
			ResultConstant.fileDownload(request, response, "templates",name,finalFileName);//??????????????????

			
			/*
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// ?????????????????????
			response.reset();
		
			System.out.println("----------------" + finalFileName);
			response.setHeader("Content-Disposition","attachment; filename=\""+finalFileName+"\"");
			response.setContentType("application/octet-stream;charset=UTF-8");

			// ??????????????????????????????
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * ????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportDataInfoBak")
	public String exportDataInfoBak(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String id = request.getParameter("id");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("id", id);
		List<Map<String, Object>> list = ryglService.queryPartyUserList(params);
		if(null != list && list.size() > 0){
			Map<String, Object> resMap = list.get(0);
			/*????????????????????????excel???????????????*/
			OutputStream out = response.getOutputStream();
			HSSFWorkbook bookWorkbook = new HSSFWorkbook();// ??????excel??????
		    HSSFSheet sheet = bookWorkbook.createSheet("????????????");
		    HSSFCell cell;
		    HSSFRow row;
		    HSSFCellStyle style = bookWorkbook.createCellStyle();// ???????????????????????????
		    // ??????????????????
		    //style.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
		    // ??????????????????
		    // style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
		  
		    // ??????????????????????????????
		    style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
		    style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
		    style.setBorderRight(HSSFCellStyle.BORDER_THIN);
		    style.setBorderTop(HSSFCellStyle.BORDER_THIN);
		    // ????????????
		    HSSFFont font = bookWorkbook.createFont();
		    font.setFontName("??????");
		    font.setFontHeightInPoints((short) 22);
		    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		    
		    String[] headRow1 = { "", "", "", "","?????????????????????",""};
			String[] headRow2 = {"????????????", "", "", "","", ""};
			String[] headRow3 = { "????????????", String.valueOf(resMap.get("pno")), "", "???????????????", String.valueOf(resMap.get("is_in")), ""};
			String[] headRow4 = { "????????????", String.valueOf(resMap.get("name")), "", "???????????????", String.valueOf(resMap.get("pnum")), ""};
			String[] headRow5 = { "??????", String.valueOf(resMap.get("sex")), "", "??????", String.valueOf(resMap.get("jg_name")), ""};
		    String[] headRow6 = { "????????????", String.valueOf(resMap.get("birth_date")), "", "??????", String.valueOf(resMap.get("degree")), ""};
			String[] headRow7 = { "?????????", String.valueOf(resMap.get("da_id")), "", "????????????", String.valueOf(resMap.get("company")), ""};
			String[] headRow8=   { "??????????????????", String.valueOf(resMap.get("his_date")), "", "", "", ""};
			String[] headRow9 = { "???/???", String.valueOf(resMap.get("is_state")), "", "????????????", String.valueOf(resMap.get("party_date")), ""};
			String[] headRow10 = { "????????????", String.valueOf(resMap.get("full_date")), "", "???????????????1", String.valueOf(resMap.get("j_name1")), ""};
			String[] headRow11 = { "???????????????2", String.valueOf(resMap.get("j_name2")), "", "", "", ""};
			String[] headRow12 = {"????????????", "", "", "","", ""};
			String[] headRow13 = {"?????????", String.valueOf(resMap.get("tel")), "", "QQ???",String.valueOf(resMap.get("qq")), ""};
			String[] headRow14 = {"?????????", String.valueOf(resMap.get("wx")), "", "","", ""};
			String[] headRow15 = {"????????????", "", "", "","", ""};
			String[] headRow16 = {"???????????????", String.valueOf(resMap.get("sq_status")), "", "???????????????",String.valueOf(resMap.get("rd_status")), ""};
			String[] headRow17 = {"??????????????????", String.valueOf(resMap.get("zz_mtr")), "", "????????????????????????",String.valueOf(resMap.get("py_mtr")), ""};
			String[] headRow18 = {"???????????????", String.valueOf(resMap.get("full_rq")), "", "","", ""};
		    
			List<String[]> headList = new ArrayList<String[]>();
			headList.add(headRow1);
			headList.add(headRow2);
			headList.add(headRow3);
			headList.add(headRow4);
			headList.add(headRow5);
			headList.add(headRow6);
			headList.add(headRow7);
			headList.add(headRow8);
			headList.add(headRow9);
			headList.add(headRow10);
			headList.add(headRow11);
			headList.add(headRow12);
			headList.add(headRow13);
			headList.add(headRow14);
			headList.add(headRow15);
			headList.add(headRow16);
			headList.add(headRow17);
			headList.add(headRow18);
			for(int k=0; k<18; k++){
				  row = sheet.createRow(k);
				  row.setHeight((short) (25 * 20));
				  String[] headRow = headList.get(k);
				  for (int i = 0; i < headRow.length; i++) {
					   cell = row.createCell((short) i);
					   cell.setCellValue(headRow[i]);
					   cell.setCellStyle(style);
					  }
			}
			style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // ????????????  
			sheet.setColumnWidth(0, 5000);  //??????
			sheet.setColumnWidth(1, 5000);  //??????
			sheet.setColumnWidth(2, 5000);  //??????
			sheet.setColumnWidth(3, 7000);  //??????
			sheet.setColumnWidth(4, 5000);  //??????
			sheet.setColumnWidth(5, 5000);  //??????
			// ?????????????????????????????????????????????????????????????????????      
			sheet.addMergedRegion(new Region(0, (short) (0), 0, (short) (5))); 
            sheet.addMergedRegion(new Region(1, (short) (0), 1, (short) (5))); 
            sheet.addMergedRegion(new Region(2, (short) (1), 2, (short) (2))); 
            sheet.addMergedRegion(new Region(2, (short) (4), 2, (short) (5)));
            sheet.addMergedRegion(new Region(3, (short) (1), 3, (short) (2))); 
            sheet.addMergedRegion(new Region(3, (short) (4), 3, (short) (5))); 
            sheet.addMergedRegion(new Region(4, (short) (1), 4, (short) (2))); 
            sheet.addMergedRegion(new Region(4, (short) (4), 4, (short) (5))); 
            sheet.addMergedRegion(new Region(5, (short) (1), 5, (short) (2))); 
            sheet.addMergedRegion(new Region(5, (short) (4), 5, (short) (5))); 
            sheet.addMergedRegion(new Region(6, (short) (1), 6, (short) (2))); 
            sheet.addMergedRegion(new Region(6, (short) (4), 6, (short) (5))); 
            sheet.addMergedRegion(new Region(7, (short) (1), 7, (short) (2))); 
            sheet.addMergedRegion(new Region(7, (short) (4), 7, (short) (5)));
            sheet.addMergedRegion(new Region(8, (short) (1), 8, (short) (2))); 
            sheet.addMergedRegion(new Region(8, (short) (4), 8, (short) (5))); 
            sheet.addMergedRegion(new Region(9, (short) (1), 9, (short) (2))); 
            sheet.addMergedRegion(new Region(9, (short) (4), 9, (short) (5))); 
            sheet.addMergedRegion(new Region(10, (short) (0), 10, (short) (5))); 
            sheet.addMergedRegion(new Region(11, (short) (1), 11, (short) (2))); 
            sheet.addMergedRegion(new Region(11, (short) (4), 11, (short) (5))); 
            sheet.addMergedRegion(new Region(12, (short) (1), 12, (short) (2))); 
            sheet.addMergedRegion(new Region(12, (short) (4), 12, (short) (5))); 
            sheet.addMergedRegion(new Region(13, (short) (0), 13, (short) (5))); 
            sheet.addMergedRegion(new Region(14, (short) (1), 14, (short) (2))); 
            sheet.addMergedRegion(new Region(14, (short) (4), 14, (short) (5))); 
            sheet.addMergedRegion(new Region(15, (short) (1), 15, (short) (2))); 
            sheet.addMergedRegion(new Region(15, (short) (4), 15, (short) (5))); 
            sheet.addMergedRegion(new Region(16, (short) (1), 16, (short) (2))); 
            sheet.addMergedRegion(new Region(16, (short) (4), 16, (short) (5))); 
            

            List<Map<String, Object>> inList = ryglService.queryPartyInListByParty(Integer.parseInt(id));
//            String[] headRow18 = {"????????????", "", "", "","", ""};
//            int  i = 18;
//            if(null != inList && inList.size() > 0){
//            	for(Map<String, Object> in:inList){
//            		i++;
//            		String[] i = {"???????????????", String.valueOf(resMap.get("full_rq")), "", "","", ""};
//            	}
//            }
            List<Map<String, Object>> outList = ryglService.queryPartyOutListByParty(Integer.parseInt(id));
		    
			/*???????????????*/
            String finalFileName = new String("????????????".getBytes(), "ISO8859-1");
		    response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		    response.setHeader("Content-disposition", "attachment;filename="+finalFileName+".xls");   
		    bookWorkbook.write(out);
		    out.close();
		}else{
			try {
				ResultConstant.write(response, "<script>????????????</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
	}
	
	/**
	 * ????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportDataInfo")
	public String exportDataInfo(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String ids = request.getParameter("ids");
		Map<String, Object> params = new HashMap<String, Object>();
		if(!StringUtils.isEmpty(ids))
		params.put("ids", ids.split(","));
		List<Map<String, Object>> list = ryglService.queryPartyUserList(params);
		if(null != list && list.size() > 0){
			/*????????????????????????excel???????????????*/
			
			OutputStream out = response.getOutputStream();
			HSSFWorkbook bookWorkbook = new HSSFWorkbook();// ??????excel??????
		    HSSFSheet sheet = bookWorkbook.createSheet("????????????");
		    HSSFCell cell;
		    HSSFRow row;
		    HSSFCellStyle style = bookWorkbook.createCellStyle();// ???????????????????????????
		    // ????????????
		    HSSFFont font = bookWorkbook.createFont();
		    font.setFontName("??????");
		    font.setFontHeightInPoints((short) 22);
		    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		    
		    String[] headRow1 = { "????????????", "???????????????", "??????", "????????????", "??????", "??????", "????????????","??????", "?????????", "????????????", "???/???", "????????????", "??????????????????"
		    		, "????????????", "???????????????1", "???????????????2", "????????????", "QQ???", "?????????", "???????????????", "???????????????", "??????????????????", "????????????????????????", "???????????????"};
		    row = sheet.createRow(0);
			row.setHeight((short) (25 * 20));
		    for (int i = 0; i < headRow1.length; i++) {
				   cell = row.createCell((short) i);
				   cell.setCellValue(headRow1[i]);
				   cell.setCellStyle(style);
		    }
		    String is_inb="";
		    String sexb="";
		    String is_stateb="";
		    String sq_statusb="";
		    String rd_statusb="";
		    String zz_mtrb="";
		    String py_mtrb="";
		    String full_rqb="";

		    for(int i = 1;i<=list.size();i++){
		    	Map<String, Object> resMap = list.get(i-1);
		    	HSSFRow row2 = sheet.createRow(i);
		    	
		    	//???????????????????????????
		    	
		    	is_inb =	String.valueOf(resMap.get("is_in"));
		    	sexb=String.valueOf(resMap.get("sex"));
		    	is_stateb=String.valueOf(resMap.get("is_state"));
		    	sq_statusb=String.valueOf(resMap.get("sq_status"));
		    	rd_statusb=String.valueOf(resMap.get("rd_status"));
		    	zz_mtrb=String.valueOf(resMap.get("zz_mtr"));
		    	py_mtrb=String.valueOf(resMap.get("py_mtr"));
		    	full_rqb=String.valueOf(resMap.get("full_rq"));

		    	
		    	if(is_inb == "0"){
		    		is_inb= "???";
          	      }else{
          	    	is_inb= "???";
              	  }
		    	if(sexb == "0"){
		    		sexb= "???";
          	      }else{
          	    	sexb= "???";
              	  }
		    	if(is_stateb == "0"){
		    		is_stateb= "???";
          	      }else{
          	    	is_stateb= "???";
              	  }
		    	if("1".equals(sq_statusb) || "???".equals(sq_statusb)){
		    		sq_statusb= "???";
        	      }else{
        	    	  sq_statusb= "???";
              	  }
		    	if("1".equals(rd_statusb) || "???".equals(rd_statusb)){
		    		rd_statusb= "???";
      	      }else{
      	    	rd_statusb= "???" ;
              	  }
		    	if("1".equals(zz_mtrb) || "???".equals(zz_mtrb)){
		    		zz_mtrb= "???";
      	      }else{
      	    	zz_mtrb= "???";
              	  }
		    	if("1".equals(py_mtrb) || "???".equals(py_mtrb)){
		    		py_mtrb= "???";
      	      }else{
      	    	py_mtrb= "???";
              	  }
		    	if("1".equals(full_rqb) || "???".equals(full_rqb)){
		    		full_rqb= "???";
      	      }else{
      	    	full_rqb= "???";
              	  }
		    	row2.setHeight((short) (25 * 20));
		    	
		    	String[] headRow = { TextUtil.getStringNull(resMap.get("pno")), is_inb, TextUtil.getStringNull(resMap.get("name")),
		    			TextUtil.getStringNull(resMap.get("pnum")), sexb, TextUtil.getStringNull(resMap.get("jg_name")), TextUtil.getStringNull(resMap.get("birth_date"))
		    			, TextUtil.getStringNull(resMap.get("degree")), TextUtil.getStringNull(resMap.get("da_id")), TextUtil.getStringNull(resMap.get("company")), is_stateb
		    			, TextUtil.getStringNull(resMap.get("party_date")),TextUtil.getStringNull(resMap.get("his_date"))
			    		, TextUtil.getStringNull(resMap.get("full_date")), TextUtil.getStringNull(resMap.get("j_name1")), TextUtil.getStringNull(resMap.get("j_name2"))
			    		, TextUtil.getStringNull(resMap.get("tel")), TextUtil.getStringNull(resMap.get("qq")), TextUtil.getStringNull(resMap.get("wx")), sq_statusb
			    		, rd_statusb, zz_mtrb,py_mtrb, full_rqb};
		    	for (int j = 0; j < headRow.length; j++) {
		    		   HSSFCell cell2 = row2.createCell((short) j);
					   cell2.setCellValue(headRow[j]);
					   cell2.setCellStyle(style);
			    }
		    }
		    style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // ????????????  
		    for(int i=0;i<23;i++){
		    	sheet.setColumnWidth(i, 5000);  //??????
		    }
			/*???????????????*/
            String finalFileName = new String("????????????".getBytes(), "ISO8859-1");
		    response.setContentType("application/vnd.ms-excel;charset=UTF-8");
		    response.setHeader("Content-disposition", "attachment;filename="+finalFileName+".xls");   
		    bookWorkbook.write(out);
		    out.close();
		}else{
			try {
				ResultConstant.write(response, "<script>????????????</script>");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return null;
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
	        if("in".equals(type)){
	        	boolean dataFlag = true;
	    	  	String tipMsg = "";//????????????
	    		ImportExcel<UserPartyInImport> excelUtil = new ImportExcel<UserPartyInImport>(UserPartyInImport.class);
	    		List<UserPartyInImport> results = (List<UserPartyInImport>) excelUtil.importExcel(f); 
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	    		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
	    	
	    		if(results!=null && results.size()>0){
	    			//??????????????????1000???
	    			/*if(results.size()>1000){
	    				JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "????????????????????????????????????1000???");
						ResultConstant.write(response, jsonObject);
						return;
	    				//return ResultConstant.resultMap(false, "????????????????????????????????????1000???");
	    			}*/
	    			List<UserPartyInImport> resList = new ArrayList<UserPartyInImport>(); 
	    			for (UserPartyInImport tempVo : results) {
	    				String errMsg = "";
	    				String pnum = tempVo.getPnum();//????????????
	    				try{
	    					Integer.parseInt(pnum);
	    				}catch(Exception e){
	    					BigDecimal db = new BigDecimal(pnum);
	    					pnum = db.toPlainString();
	    				}
	    				String inDate = tempVo.getInDate();//????????????
	    				if(StringUtils.isNotBlank(pnum)){
	    					if(pnum.length() > 18 || pnum.length() < 15){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "?????????????????????15???18?????????";
	    						}else{
	    							errMsg += ",?????????????????????15???18?????????";
	    						}
	    					}else{
	    						//????????????????????????
	    						Map<String, Object> partyMap = new HashMap<String, Object>();
	    						partyMap.put("PNUM", pnum);
	    						List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
	    						if(null != userList && userList.size() > 0){
	    							Map<String,Object> map = userList.get(0);
	    							if(null != map.get("PY")){
	    								tempVo.setParty(""+map.get("PY"));
	    								tempVo.setPnum(pnum);
	    							}else{
	    								dataFlag = false;
	    								if(StringUtils.isBlank(errMsg)){
	    									errMsg = pnum + "???????????????????????????????????????";
	    								}else{
	    									errMsg += ","+pnum+":???????????????????????????????????????";
	    								}
	    							}
	    						}else{
	    							dataFlag = false;
	    							if(StringUtils.isBlank(errMsg)){
	    								errMsg = pnum + "???????????????????????????????????????";
	    							}else{
	    								errMsg += ","+pnum+":???????????????????????????????????????";
	    							}
	    						}
	    					}
	    				}else{
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    				}
	    				
	    				if(StringUtils.isBlank(inDate)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    					if(inDate.length()!=10){
	    						errMsg = "????????????????????????";
	    					}
	    				}else{
	    					try{
	    						String date = sdf.format(sdf.parse(inDate));
	    						tempVo.setInDate(date);
	    					}catch(Exception e){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "???????????????????????????";
	    						}else{
	    							errMsg += ",???????????????????????????";
	    						}
	    						if(inDate.length()!=10){
		    						errMsg = "????????????????????????";
		    					}
	    					}
	    				}
	    				tempVo.setErrMsg(errMsg);
	    				resList.add(tempVo);
	    			}
	    			System.out.println("----------tipMsg--------" + tipMsg);
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("rows", resList);
					jsonObject.put("flag", dataFlag);
					jsonObject.put("cause", tipMsg);
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
	    		}else{
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "??????????????????????????????");
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(false,"??????????????????????????????");

	    		}
	        }else if("out".equals(type)){
	        	boolean dataFlag = true;
	    	  	String tipMsg = "";//????????????
	    		ImportExcel<UserPartyOutImport> excelUtil = new ImportExcel<UserPartyOutImport>(UserPartyOutImport.class);
	    		List<UserPartyOutImport> results = (List<UserPartyOutImport>) excelUtil.importExcel(f); 
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	    		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
	    		
	    		if(results!=null && results.size()>0){
	    			//??????????????????1000???
	    			/*if(results.size()>1000){
	    				JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "????????????????????????????????????1000???");
						ResultConstant.write(response, jsonObject);
						return;
	    				//return ResultConstant.resultMap(false, "????????????????????????????????????1000???");
	    			}*/
	    			List<UserPartyOutImport> resList = new ArrayList<UserPartyOutImport>(); 
	    			for (UserPartyOutImport tempVo : results) {
	    				String errMsg = "";
	    				String pnum = tempVo.getPnum();//????????????
	    				try{
	    					Integer.parseInt(pnum);
	    				}catch(Exception e){
	    					BigDecimal db = new BigDecimal(pnum);
	    					pnum = db.toPlainString();
	    				}
	    				String outDate = tempVo.getOutDate();//????????????
	    				if(StringUtils.isNotBlank(pnum)){
	    					if(pnum.length() > 18 || pnum.length() < 15){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "?????????????????????15???18?????????";
	    						}else{
	    							errMsg += ",?????????????????????15???18?????????";
	    						}
	    					}else{
	    						//????????????????????????
	    						Map<String, Object> partyMap = new HashMap<String, Object>();
	    						partyMap.put("PNUM", pnum);
	    						List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
	    						if(null != userList && userList.size() > 0){
	    							Map<String,Object> map = userList.get(0);
	    							if(null != map.get("PY")){
	    								tempVo.setParty(""+map.get("PY"));
	    								tempVo.setPnum(pnum);
	    							}else{
	    								dataFlag = false;
	    								if(StringUtils.isBlank(errMsg)){
	    									errMsg = pnum + "???????????????????????????????????????";
	    								}else{
	    									errMsg += ","+pnum+":???????????????????????????????????????";
	    								}
	    							}
	    						}else{
	    							dataFlag = false;
	    							if(StringUtils.isBlank(errMsg)){
	    								errMsg = pnum + "???????????????????????????????????????";
	    							}else{
	    								errMsg += ","+pnum+":???????????????????????????????????????";
	    							}
	    						}
	    					}
	    				}else{
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    				}
	    				
	    				if(StringUtils.isBlank(outDate)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    					if(outDate.length()!=10){
	    						errMsg = "????????????????????????";
	    					}
	    				}else{
	    					try{
	    					//	String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(outDate)-2));
	    						String date = sdf.format(sdf.parse(outDate));
	    						tempVo.setOutDate(date);
	    					}catch(Exception e){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "???????????????????????????";
	    						}else{
	    							errMsg += ",???????????????????????????";
	    						}
	    						if(outDate.length()!=10){
		    						errMsg = "????????????????????????";
		    					}
	    					}
	    				}
	    				tempVo.setErrMsg(errMsg);
	    				resList.add(tempVo);
	    			}
	    			System.out.println("----------tipMsg--------" + tipMsg);
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("rows", resList);
					jsonObject.put("flag", dataFlag);
					jsonObject.put("cause", tipMsg);
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
	    		}else{
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "??????????????????????????????");
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(false,"??????????????????????????????");

	    		}
	        }else{
	        	boolean dataFlag = true;
	    	  	String tipMsg = "";//????????????
	    		ImportExcel<UserPartyImportInfo> excelUtil = new ImportExcel<UserPartyImportInfo>(UserPartyImportInfo.class);
	    		List<UserPartyImportInfo> results = (List<UserPartyImportInfo>) excelUtil.importExcel(f); 
	    		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	    	//  SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
	    	//	SimpleDateFormat sdfY_M_D=new SimpleDateFormat("yyyy-MM-dd");
	    		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
	    		SimpleDateFormat sdfY_M_D=new SimpleDateFormat("yyyy/MM");
	    		if(results!=null && results.size()>0){
	    			//??????????????????1000???
	    			/*if(results.size()>1000){
	    				JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "????????????????????????????????????1000???");
						ResultConstant.write(response, jsonObject);
						return;
	    				//return ResultConstant.resultMap(false, "????????????????????????????????????1000???");
	    			}*/
	    			//????????????????????????
//	    			Map<String, String> lackMap= excelUtil.isTitle(f); 
//	    			if(lackMap != null && lackMap.size() > 0){
//	    				String title="";
//	    				for(Map.Entry<String, String>  m : lackMap.entrySet()){
//	    					title+=" "+m.getValue();
//	    				}
//	    				return ResultConstant.resultMap(false, "???????????????????????????"+title);
	    //
//	    			}
	    			List<UserPartyImportInfo> resList = new ArrayList<UserPartyImportInfo>(); 
	    			for (UserPartyImportInfo tempVo : results) {
	    				String errMsg = "";
	    				String pnum = tempVo.getPnum();//????????????
	    				String name = tempVo.getName();//??????
	    				String partyDate = tempVo.getPartyDate();//????????????
	    				if(partyDate!=null)
	    					partyDate=partyDate.replace("-", "/");
	    				String fullDate = tempVo.getFullDate();//????????????
	    				if(fullDate!=null)
	    					fullDate=fullDate.replace("-", "/");
	    				String birthDate = tempVo.getBirthDate();//????????????
	    				if(birthDate!=null)
	    					birthDate=birthDate.replace("-", "/");
	    				String isState = tempVo.getIsState();//???/???
	    				String tel = tempVo.getTel();
	    				String hisDate = tempVo.getHisDate();//??????????????????
	    				if(hisDate!=null)
	    					hisDate=hisDate.replace("-", "/");
	    				if(StringUtils.isBlank(name)){
	    					dataFlag = false;
	    					errMsg = "????????????????????????";
	    				} 
	    				if(StringUtils.isNotBlank(pnum)){
	    					if(pnum.length() > 18 || pnum.length() < 15){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "?????????????????????15???18?????????";
	    						}else{
	    							errMsg += ",?????????????????????15???18?????????";
	    						}
	    					}else{
	    						//????????????????????????
	    						Map<String, Object> partyMap = new HashMap<String, Object>();
	    						partyMap.put("PNUM", pnum);
	    						List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
	    						if(null != userList && userList.size() > 0){
	    							Map<String,Object> map = userList.get(0);
	    							if(null != map.get("PY")){
	    								if(StringUtils.isBlank(errMsg)){
	    									errMsg = name + ":???"+pnum+"???????????????????????????";
	    								}else{
	    									errMsg += ","+name+":???"+pnum+"???????????????????????????";
	    								}
	    							}
	    						}
	    					}
	    				}else{
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    				}
	    				if(StringUtils.isBlank(partyDate)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    					
	    				}else if(partyDate.length()!=10){
	    					dataFlag = false;
	    					if(partyDate.length()!=10){
	    						errMsg = "??????????????????";
	    					}else{
	    						errMsg += ",??????????????????";
	    					}
	    				}else{
	    					try{
	    						//String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(partyDate)-2));
	    						String date = sdf.format(sdf.parse(partyDate));
	    						
	    						tempVo.setPartyDate(date);
//	    						sdf.parse(partyDate);
	    					}catch(Exception e){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "???????????????????????????";
	    						}else{
	    							errMsg += ",???????????????????????????";
	    						}
	    						if(partyDate.length()!=10){
		    						errMsg = "??????????????????";
		    					}else{
		    						errMsg += ",??????????????????";
		    					}
	    						
	    					}
	    				}
	    				
	    				if(StringUtils.isBlank(hisDate)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "??????????????????????????????";
	    					}else{
	    						errMsg += ",??????????????????????????????";
	    					}
	    				}else if(hisDate.length()!=7){
	    					dataFlag = false;
    						if(StringUtils.isBlank(errMsg)){
    							errMsg = "??????????????????";
    						}else{
    							errMsg += ",?????????????????????";
    						}
	    				}else{
	    					try{
	    						String date=sdf.format(sdfY_M_D.parse(hisDate));
	    						//String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(hisDate)-2));
	    						tempVo.setHisDate(date);
//	    						sdf.parse(partyDate);
	    					}catch(Exception e){
	    						e.printStackTrace();
	    						dataFlag = false;
	    						String date=sdf.format(DateUtils.addDays(sdf.parse("1900/01"), Integer.parseInt(hisDate)-2));
	    						if(DateUtil.getYear().compareTo(date)<0){
	    							tempVo.setHisDate(hisDate);
	    						}else{
	    							tempVo.setHisDate(date);
	    						}
//	    						if(StringUtils.isBlank(errMsg)){
//	    							errMsg = "?????????????????????????????????";
//	    						}else{
//	    							errMsg += ",?????????????????????????????????";
//	    						}
	    					}
	    				}
	    				
	    				if(StringUtils.isNotBlank(fullDate)){
	    					try{
	    						//String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(fullDate)-2));
	    						String date = sdf.format(sdfY_M_D.parse(fullDate));
	    						tempVo.setFullDate(date);
//	    						sdf.parse(partyDate);
	    					}catch(Exception e){
	    						e.printStackTrace();
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "???????????????????????????";
	    						}else{
	    							errMsg += ",???????????????????????????";
	    						}
	    						
	    					}
	    				}
	    				if(fullDate.length()!=10){
	    					dataFlag = false;
    						if(StringUtils.isBlank(errMsg)){
    							errMsg = "??????????????????";
    						}else{
    							errMsg += ",??????????????????";
    						}
	    				}
	    				if(StringUtils.isBlank(fullDate)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "????????????????????????";
	    					}else{
	    						errMsg += ",????????????????????????";
	    					}
	    					
	    				}
	    				if(StringUtils.isNotBlank(birthDate)){
	    					try{
	    					//	String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(birthDate)-2));
	    						String date = sdf.format(sdfY_M_D.parse(birthDate));
	    						tempVo.setBirthDate(date);
//	    						sdf.parse(partyDate);
	    					}catch(Exception e){
	    						e.printStackTrace();
	    						try{
	    							sdfBirth.parse(birthDate);
	    						}catch(Exception e2){
	    							e2.printStackTrace();
	    							dataFlag = false;
	    							if(StringUtils.isBlank(errMsg)){
	    								errMsg = "???????????????????????????";
	    							}else{
	    								errMsg += ",???????????????????????????";
	    							}
	    						}
	    					}
	    				}
	    				if(birthDate.length()!=10){
	    					dataFlag = false;
    						if(StringUtils.isBlank(errMsg)){
    							errMsg = "??????????????????";
    						}else{
    							errMsg += ",??????????????????";
    						}
	    				}
	    				
	    				if(StringUtils.isBlank(isState)){
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "???/???????????????";
	    					}else{
	    						errMsg += ",???/???????????????";
	    					}
	    				}
	    				if(StringUtils.isNotBlank(tel)){
	    					if(!isMobile(tel)){
	    						dataFlag = false;
	    						if(StringUtils.isBlank(errMsg)){
	    							errMsg = "???????????????????????????????????????";
	    						}else{
	    							errMsg += ",???????????????????????????????????????";
	    						}
	    					}
	    				}else{
	    					dataFlag = false;
	    					if(StringUtils.isBlank(errMsg)){
	    						errMsg = "??????????????????";
	    					}else{
	    						errMsg += ",??????????????????";
	    					}
	    				}
	    				
	    				tempVo.setErrMsg(errMsg);
	    				resList.add(tempVo);
	    			}
	    			System.out.println("----------tipMsg--------" + tipMsg);
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("rows", resList);
					jsonObject.put("flag", dataFlag);
					jsonObject.put("cause", tipMsg);
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(resList, dataFlag, tipMsg);
	    		}else{
	    			JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "??????????????????????????????");
					ResultConstant.write(response, jsonObject);
					return;
	    			//return ResultConstant.resultMap(false,"??????????????????????????????");

	    		}
	        }
		} catch (Exception e) {
			e.printStackTrace();
			resObject.put("flag", "1");
			resObject.put("errorMsg", e.getMessage());
		}
		ResultConstant.write(response, resObject);
		return;
		//return resObject;
	  }
	 

	 /** 
	      * ??????????????? 
	      *  
	      * @param  str 
	      * @return ??????????????????true 
	      */  
	     public static boolean isMobile(String str) {   
	         Pattern p = null;  
	         Matcher m = null;  
	         boolean b = false;   
	         p = Pattern.compile("^[1][3,4,5,7,8][0-9]{9}$"); // ???????????????  
	         m = p.matcher(str);  
	         b = m.matches();   
	         return b;  
	     }  

	 /**??????????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/saveDy")  
	public  @ResponseBody Map<String, Object> saveDy(@RequestBody List<UserPartyImportInfo> list,HttpServletResponse response) throws Exception{
		boolean flag=false;
		String cause="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
	//	SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
	//	SimpleDateFormat sdfHis = new SimpleDateFormat("yyyyMM");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfHis =new SimpleDateFormat("yyyy/MM/dd");

		try {
			List<UserPartyInfo> userPartyInfoList = new ArrayList<UserPartyInfo>();
			List<UserInfo> userInfoList = new ArrayList<UserInfo>();
			for(UserPartyImportInfo userPartyImportInfo:list){
				UserPartyInfo userPartyInfo = new UserPartyInfo();
				UserInfo userInfo = new UserInfo();
				
				userPartyInfo.setIsIn(userPartyImportInfo.getIsIn());
				
				userPartyInfo.setPno(userPartyImportInfo.getPno());
				userInfo.setJgName(userPartyImportInfo.getJgName());
				if(StringUtils.isNotBlank(userPartyImportInfo.getBirthDate())){
					try{
						userInfo.setBirthDate(sdf.parse(userPartyImportInfo.getBirthDate()));
					}catch(Exception e){
						userInfo.setBirthDate(sdfBirth.parse(userPartyImportInfo.getBirthDate()));
					}
				}
				userInfo.setDegree(userPartyImportInfo.getDegree());
				userInfo.setDaId(userPartyImportInfo.getDaId());
				if("???".equals(userPartyImportInfo.getIsState())){
					userPartyInfo.setIsState("???");
				}else if("???".equals(userPartyImportInfo.getIsState())){
					userPartyInfo.setIsState("???");
				}else{
					userPartyInfo.setIsState(userPartyImportInfo.getIsState());
				}
				if(StringUtils.isNotBlank(userPartyImportInfo.getPartyDate())){
					userPartyInfo.setPartyDate(sdf.parse(userPartyImportInfo.getPartyDate()));
				}
				if(StringUtils.isNotBlank(userPartyImportInfo.getFullDate())){
					userPartyInfo.setFullDate(sdf.parse(userPartyImportInfo.getFullDate()));
				}
				if(StringUtils.isNotBlank(userPartyImportInfo.getHisDate())){
					userPartyInfo.setHisDate(sdfHis.parse(userPartyImportInfo.getHisDate()));
				}
				userPartyInfo.setjName1(userPartyImportInfo.getRdName1());
				userPartyInfo.setjName2(userPartyImportInfo.getRdName2());
				userInfo.setQq(userPartyImportInfo.getQq());
				userInfo.setWx(userPartyImportInfo.getWx());
				if("???".equals(userPartyImportInfo.getSqStatus())){
					userPartyInfo.setSqStatus("???");
				}else if("???".equals(userPartyImportInfo.getSqStatus())){
					userPartyInfo.setSqStatus("???");
				}else{
					userPartyInfo.setSqStatus(userPartyImportInfo.getSqStatus());
				}
				userPartyInfo.setCompany(userPartyImportInfo.getCompany());
				if("???".equals(userPartyImportInfo.getRdStatus())){
					userPartyInfo.setRdStatus("???");
				}else if("???".equals(userPartyImportInfo.getRdStatus())){
					userPartyInfo.setRdStatus("???");
				}else{
					userPartyInfo.setRdStatus(userPartyImportInfo.getRdStatus());
				}
				if("???".equals(userPartyImportInfo.getZzMtr())){
					userPartyInfo.setZzMtr("???");
				}else if("???".equals(userPartyImportInfo.getZzMtr())){
					userPartyInfo.setZzMtr("???");
				}else{
					userPartyInfo.setZzMtr(userPartyImportInfo.getZzMtr());
				}
				if("???".equals(userPartyImportInfo.getPyMtr())){
					userPartyInfo.setPyMtr("???");
				}else if("???".equals(userPartyImportInfo.getPyMtr())){
					userPartyInfo.setPyMtr("???");
				}else{
					userPartyInfo.setPyMtr(userPartyImportInfo.getPyMtr());
				}
				if("???".equals(userPartyImportInfo.getFullRq())){
					userPartyInfo.setFullRq("???");
				}else if("???".equals(userPartyImportInfo.getFullRq())){
					userPartyInfo.setFullRq("???");
				}else{
					userPartyInfo.setFullRq(userPartyImportInfo.getFullRq());
				}
				userInfo.setName(userPartyImportInfo.getName());
				userInfo.setTel(userPartyImportInfo.getTel());
				if("???".equals(userPartyImportInfo.getSex())){
					userInfo.setSex("???");
				}else if("???".equals(userPartyImportInfo.getSex())){
					userInfo.setSex("???");
				}else{
					userInfo.setSex(userPartyImportInfo.getSex());
				}
				userInfo.setPnum(userPartyImportInfo.getPnum());
				userInfo.setAddDate(new Date());
				userInfo.setWorkName(userPartyImportInfo.getCompany());
				userInfoList.add(userInfo);
				userPartyInfoList.add(userPartyInfo);
			}
			ryglService.addPartyInfoList(userPartyInfoList, userInfoList, null, null, response);
//			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="??????????????????";
			ResultConstant.write(response, "????????????,??????????????????????????????");
			return null;
		}
		return null;
//		return ResultConstant.resultMap(flag,cause);  
	}
	
	 /**????????????????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/saveDyIn")  
	public  @ResponseBody Map<String, Object> saveDyIn(@RequestBody List<UserPartyInImport> list,HttpServletRequest request,HttpServletResponse response) throws Exception{
		boolean flag=false;
		String cause="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
		String uid = request.getSession().getAttribute("uid") == null ? "":String.valueOf(request.getSession().getAttribute("uid"));
		try {
			List<UserPartyIn> userPartyInList = new ArrayList<UserPartyIn>();
			for(UserPartyInImport userPartyInImport:list){
				UserPartyIn userPartyIn = new UserPartyIn();
				userPartyIn.setAddDate(new Date());
				userPartyIn.setInDate(sdf.parse(userPartyInImport.getInDate()));
				userPartyIn.setInPlace(userPartyInImport.getInPlace());
				userPartyIn.setParty(Integer.parseInt(userPartyInImport.getParty()));
				if(StringUtils.isNotBlank(uid)){
					userPartyIn.setStaff(Integer.parseInt(uid));
				}
				userPartyIn.setZpno(userPartyInImport.getZpno());
				userPartyInList.add(userPartyIn);
			}
			ryglService.addPartyInList(userPartyInList, response);
//			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="??????????????????";
			ResultConstant.write(response, "????????????,??????????????????????????????");
			return null;
		}
		return null;
//		return ResultConstant.resultMap(flag,cause);  
	}
	
	 /**????????????????????????
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 */
	@RequestMapping("/saveDyOut")  
	public  @ResponseBody Map<String, Object> saveDyOut(@RequestBody List<UserPartyOutImport> list,HttpServletRequest request,HttpServletResponse response) throws Exception{
		boolean flag=false;
		String cause="";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
		String uid = request.getSession().getAttribute("uid") == null ? "":String.valueOf(request.getSession().getAttribute("uid"));
		try {
			List<UserPartyOut> userPartyOutList = new ArrayList<UserPartyOut>();
			for(UserPartyOutImport userPartyOutImport:list){
				UserPartyOut userPartyOut = new UserPartyOut();
				userPartyOut.setAddDate(new Date());
				userPartyOut.setInDate(sdf.parse(userPartyOutImport.getOutDate()));
				userPartyOut.setInPlace(userPartyOutImport.getOutPlace());
				userPartyOut.setParty(Integer.parseInt(userPartyOutImport.getParty()));
				if(StringUtils.isNotBlank(uid)){
					userPartyOut.setStaff(Integer.parseInt(uid));
				}
				userPartyOut.setZpno(userPartyOutImport.getZpno());
				userPartyOutList.add(userPartyOut);
			}
			ryglService.addPartyOutList(userPartyOutList, response);
//			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="??????????????????";
			ResultConstant.write(response, "????????????,??????????????????????????????");
			return null;
		}
		return null;
//		return ResultConstant.resultMap(flag,cause);  
	}
	
	
	
	Map<String,Object> importDyList(File f){
		boolean dataFlag = true;
	  	String tipMsg = "";//????????????
		ImportExcel<UserPartyImportInfo> excelUtil = new ImportExcel<UserPartyImportInfo>(UserPartyImportInfo.class);
		List<UserPartyImportInfo> results = (List<UserPartyImportInfo>) excelUtil.importExcel(f); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy/MM");
		
		if(results!=null && results.size()>0){
			//??????????????????1000???
			if(results.size()>1000){
				return ResultConstant.resultMap(false, "????????????????????????????????????1000???");
			}
			//????????????????????????
//			Map<String, String> lackMap= excelUtil.isTitle(f); 
//			if(lackMap != null && lackMap.size() > 0){
//				String title="";
//				for(Map.Entry<String, String>  m : lackMap.entrySet()){
//					title+=" "+m.getValue();
//				}
//				return ResultConstant.resultMap(false, "???????????????????????????"+title);
//
//			}
			List<UserPartyImportInfo> resList = new ArrayList<UserPartyImportInfo>(); 
			for (UserPartyImportInfo tempVo : results) {
				String errMsg = "";
				String pnum = tempVo.getPnum();//????????????
				String name = tempVo.getName();//??????
				String partyDate = tempVo.getPartyDate();//????????????
				String fullDate = tempVo.getFullDate();//????????????
				String birthDate = tempVo.getBirthDate();//????????????
				String isState = tempVo.getIsState();//???/???
				String tel = tempVo.getTel();
				String hisDate = tempVo.getHisDate();//??????????????????
				if(StringUtils.isBlank(name)){
					dataFlag = false;
					errMsg = "????????????????????????";
				} 
				if(StringUtils.isNotBlank(pnum)){
					if(pnum.length() > 18 || pnum.length() < 15){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "?????????????????????15???18?????????";
						}else{
							errMsg += ",?????????????????????15???18?????????";
						}
					}else{
						//????????????????????????
						Map<String, Object> partyMap = new HashMap<String, Object>();
						partyMap.put("PNUM", pnum);
						List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
						if(null != userList && userList.size() > 0){
							Map<String,Object> map = userList.get(0);
							if(null != map.get("PY")){
								if(StringUtils.isBlank(tipMsg)){
									tipMsg = name + ":???????????????????????????????????????";
								}else{
									tipMsg += ","+name+":???????????????????????????????????????";
								}
							}
						}
					}
				}else{
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "????????????????????????";
					}else{
						errMsg += ",????????????????????????";
					}
				}
				if(StringUtils.isBlank(partyDate)){
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "????????????????????????";
					}else{
						errMsg += ",????????????????????????";
					}
				}else{
					try{
						String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(partyDate)-2));
						tempVo.setPartyDate(date);
//						sdf.parse(partyDate);
					}catch(Exception e){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "???????????????????????????";
						}else{
							errMsg += ",???????????????????????????";
						}
					}
				}
				
				if(StringUtils.isBlank(hisDate)){
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "??????????????????????????????";
					}else{
						errMsg += ",??????????????????????????????";
					}
				}else{
					try{
						String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01"), Integer.parseInt(hisDate)-2));
						tempVo.setHisDate(date);
//						sdf.parse(partyDate);
					}catch(Exception e){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "?????????????????????????????????";
						}else{
							errMsg += ",?????????????????????????????????";
						}
					}
				}
				
				if(StringUtils.isNotBlank(fullDate)){
					try{
						String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(fullDate)-2));
						tempVo.setFullDate(date);
//						sdf.parse(partyDate);
					}catch(Exception e){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "???????????????????????????";
						}else{
							errMsg += ",???????????????????????????";
						}
					}
				} 
				if(StringUtils.isNotBlank(birthDate)){
					try{
						String date = sdf.format(DateUtils.addDays(sdf.parse("1900/01/01"), Integer.parseInt(birthDate)-2));
						tempVo.setBirthDate(date);
//						sdf.parse(partyDate);
					}catch(Exception e){
						try{
							sdfBirth.parse(birthDate);
						}catch(Exception e2){
							dataFlag = false;
							if(StringUtils.isBlank(errMsg)){
								errMsg = "???????????????????????????";
							}else{
								errMsg += ",???????????????????????????";
							}
						}
					}
				}
				
				if(StringUtils.isBlank(isState)){
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "???/???????????????";
					}else{
						errMsg += ",???/???????????????";
					}
				}
				if(StringUtils.isNotBlank(tel)){
					if(!isMobile(tel)){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "???????????????????????????????????????";
						}else{
							errMsg += ",???????????????????????????????????????";
						}
					}
				}else{
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "??????????????????";
					}else{
						errMsg += ",??????????????????";
					}
				}
				
				tempVo.setErrMsg(errMsg);
				resList.add(tempVo);
			}
			System.out.println("----------tipMsg--------" + tipMsg);
			return ResultConstant.resultMap(resList, dataFlag, tipMsg);
		}else{
			return ResultConstant.resultMap(false,"??????????????????????????????");

		}
	}
	
	Map<String,Object> importInTimeList(File f){
		boolean dataFlag = true;
	  	String tipMsg = "";//????????????
		ImportExcel<UserPartyInImport> excelUtil = new ImportExcel<UserPartyInImport>(UserPartyInImport.class);
		List<UserPartyInImport> results = (List<UserPartyInImport>) excelUtil.importExcel(f); 
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
		
		if(results!=null && results.size()>0){
			//??????????????????1000???
			if(results.size()>1000){
				return ResultConstant.resultMap(false, "????????????????????????????????????1000???");
			}
			List<UserPartyInImport> resList = new ArrayList<UserPartyInImport>(); 
			for (UserPartyInImport tempVo : results) {
				String errMsg = "";
				String pnum = tempVo.getPnum();//????????????
				String inDate = tempVo.getInDate();//????????????
				if(StringUtils.isNotBlank(pnum)){
					if(pnum.length() > 18 || pnum.length() < 15){
						dataFlag = false;
						if(StringUtils.isBlank(errMsg)){
							errMsg = "?????????????????????15???18?????????";
						}else{
							errMsg += ",?????????????????????15???18?????????";
						}
					}else{
						//????????????????????????
						Map<String, Object> partyMap = new HashMap<String, Object>();
						partyMap.put("PNUM", pnum);
						List<Map<String,Object>> userList = ryglService.queryUserList(partyMap);
						if(null != userList && userList.size() > 0){
							Map<String,Object> map = userList.get(0);
							if(null != map.get("PY")){
							}else{
								dataFlag = false;
								if(StringUtils.isBlank(tipMsg)){
									tipMsg = pnum + "???????????????????????????????????????";
								}else{
									tipMsg += ","+pnum+":???????????????????????????????????????";
								}
							}
						}else{
							dataFlag = false;
							if(StringUtils.isBlank(tipMsg)){
								tipMsg = pnum + "???????????????????????????????????????";
							}else{
								tipMsg += ","+pnum+":???????????????????????????????????????";
							}
						}
					}
				}else{
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "????????????????????????";
					}else{
						errMsg += ",????????????????????????";
					}
				}
				if(StringUtils.isBlank(inDate)){
					dataFlag = false;
					if(StringUtils.isBlank(errMsg)){
						errMsg = "????????????????????????";
					}else{
						errMsg += ",????????????????????????";
					}
				}else{
//					try{
////						sdf.parse(partyDate);
//					}catch(Exception e){
//						dataFlag = false;
//						if(StringUtils.isBlank(errMsg)){
//							errMsg = "???????????????????????????";
//						}else{
//							errMsg += ",???????????????????????????";
//						}
//					}
				}
				tempVo.setErrMsg(errMsg);
				resList.add(tempVo);
			}
			System.out.println("----------tipMsg--------" + tipMsg);
			return ResultConstant.resultMap(resList, dataFlag, tipMsg);
		}else{
			return ResultConstant.resultMap(false,"??????????????????????????????");

		}
	}
}
