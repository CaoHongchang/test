package com.i84.earnpoint.zxxx.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.fileupload.util.Streams;
import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFPrintSetup;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.ClassActionImportInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.xxgl.service.ResourceService;
import com.i84.earnpoint.zxxx.service.ClassService;

/**
 * 班级
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/classTrol")
public class ClassController extends ResultConstant{
	@Autowired 
	public ClassService classService;
	
	@Autowired 
	public ResourceService resourceService;
	
	/**
     * 	获取班级编码流水号
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qrySeqNo")
	public  @ResponseBody Map<String, Object> qrySeqNo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String, Object> resMap = new HashMap<String, Object>();
		try {
			int resourceId = 181;//班级编码流水
			Resource resource = resourceService.qrySeqNo(resourceId);
			String seqNo = String.valueOf(resource.getExt1());
			String dateStr = new SimpleDateFormat("yyyyMMdd").format(new Date());
			if(seqNo.length() == 1){
				seqNo = dateStr + "00" + seqNo;
			}else if(seqNo.length() == 2){
				seqNo = dateStr + "0" + seqNo;
			}else{
				seqNo = dateStr + seqNo;
			}
			 
			resMap.put("seqNo", seqNo);
			resMap.put("flag", true);
		} catch (Exception e) {
			e.printStackTrace();
			resMap.put("flag", false);
			resMap.put("cause", e.getMessage());
		}
		
		
		return resMap;
	}
    /**
     * 	获取班级列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryClassList")
	public  @ResponseBody Map<String, Object> queryClassList(HttpServletResponse response,HttpServletRequest request)
	throws Exception{
		Map<String,Object> params = ResultConstant.paramSet(request);
		ClassInfo record=new ClassInfo();
		if(params.containsKey("pno")){
			record.setPno(String.valueOf(params.get("pno")));
		}
		if(params.containsKey("name")){
			record.setName("%"+String.valueOf(params.get("name"))+"%");
		}
		if(params.containsKey("enterpriseName")){
			record.setName("%"+String.valueOf(params.get("naenterpriseNameme"))+"%");
		}
		if(params.containsKey("cEnterpriseName")){
			record.setcEnterpriseName("%"+String.valueOf(params.get("cEnterpriseName"))+"%");
		}
		if(params.containsKey("content")){
			record.setContent("%"+String.valueOf(params.get("content"))+"%");
		}
		if(params.containsKey("objId")){//培训对象
			record.setObjId("%"+String.valueOf(params.get("objId"))+"%");
		}
		if(params.containsKey("typeId")){
			record.setTypeId(String.valueOf(params.get("typeId")));
		}
		if(params.containsKey("pDate")){
			record.setsDate(String.valueOf(params.get("pDate")));
		}
		if(params.containsKey("pNum")){
			record.setpNum(Integer.parseInt(String.valueOf(params.get("pNum"))));
		}
		if(params.containsKey("sDate")){
			record.setsDate(String.valueOf(params.get("sDate")));
		}
		if(params.containsKey("eDate")){
			record.seteDate(String.valueOf(params.get("eDate")));
		}
		if(params.containsKey("cstate")){
			record.setCstate(Integer.parseInt(String.valueOf(params.get("cstate"))));
		} 
		if(params.containsKey("isValid")){
			record.setIsValid(Integer.parseInt(String.valueOf(params.get("isValid"))));
		} 
		
		List<ClassInfo> list = classService.queryClassList(params);
		PageInfo<ClassInfo> pageinfo=new PageInfo<ClassInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**添加成绩情况
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveCj")  
	public  @ResponseBody Map<String, Object> saveCj(@RequestBody List<UserScoreImportInfo> list){
		boolean flag=false;
		String cause="";
		try {
			classService.insertUserScoreInfo(list);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**添加执行情况
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/saveZxqk")  
	public  @ResponseBody Map<String, Object> saveZxqk(@RequestBody List<ClassActionImportInfo> classList){
		boolean flag=false;
		String cause="";
		try {
			classService.insertClassActionInfo(classList);
			flag=true;
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	/**
	 * 新增班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 * @throws Exception
	 */
	@RequestMapping("/saveClass")
	public void saveClass(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		try {
			/*获取新增对象值*/
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			String bjbm = param.get("bjbm").toString();
			String bjmc = param.get("bjmc").toString();
			String zbdw = param.get("zbdw").toString();
			String cbdw = param.get("cbdw").toString();
			String pxnr = param.get("pxnr").toString();
			String pxdx = param.get("pxdx").toString();
			String pxlb = param.get("pxlb").toString();
			String pxqx = param.get("pxqx").toString();
			String bqrs = param.get("bqrs").toString();
			String kbsj = param.get("kbsj").toString();
			String jssj = param.get("jssj").toString();
			String pics = request.getParameter("pics").toString();
			
			/*初始化新增对象*/
			ClassInfo classInfo = new ClassInfo();
			classInfo.setPno(bjbm);
			classInfo.setName(bjmc);
			classInfo.setEnterpriseName(zbdw);
			classInfo.setcEnterpriseName(cbdw);
			classInfo.setContent(pxnr);
			classInfo.setObjId(pxdx);
			classInfo.setTypeId(pxlb);
			classInfo.setpDate(pxqx);
			classInfo.setpNum(Integer.parseInt(bqrs));
			classInfo.setsDate(kbsj.substring(0, 10));
			classInfo.seteDate(jssj.substring(0, 10));
			classInfo.setCstate(SystemContant.CLASS_STATE_DBM);
			classInfo.setIsValid(1);
			if(StringUtils.isNotBlank(pics)){
			 classInfo.setUrl1(pics);	 
			}
			/*加入到表里去*/
			classService.saveClassInfo(classInfo);
			
			Resource resource = new Resource();
			String nextId = bjbm.substring(8);
			resource.setExt1(Integer.parseInt(nextId)+1);
			resource.setId(181);//班级流水号号标识
			resourceService.updateResource(resource);
			resObject.put("flag", "0");
		} catch (Exception e) {
			resObject.put("flag", "-1");
			resObject.put("errorMsg", e.getMessage());
		}
		
		ResultConstant.write(response, resObject);
	}
	/**
	 * 编辑班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updateClass")
	public void updateClass(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		/*获取编辑对象值*/
		String pno = request.getParameter("pno");
		String name = request.getParameter("name");
		String enterpriseName = request.getParameter("enterpriseName");
		String cEnterpriseName = request.getParameter("cEnterpriseName");
		String content = request.getParameter("content");
		String objId = request.getParameter("objId");
		String typeId = request.getParameter("typeId");
		String pDate = request.getParameter("pDate");
		String pNum = request.getParameter("pNum");
		String sDate = request.getParameter("sDate");
		String eDate = request.getParameter("eDate");
		String pics = request.getParameter("pics");
		/*初始化编辑对象*/
		ClassInfo classInfo = new ClassInfo();
		classInfo.setPno(pno);
		classInfo.setName(name);
		classInfo.setEnterpriseName(enterpriseName);
		classInfo.setcEnterpriseName(cEnterpriseName);
		classInfo.setContent(content);
		classInfo.setObjId(objId);
		classInfo.setTypeId(typeId);
		classInfo.setpDate(pDate);
		classInfo.setpNum(Integer.parseInt(pNum));
		classInfo.setsDate(sDate);
		classInfo.seteDate(eDate);
		if(StringUtils.isNotBlank(pics)){
			classInfo.setUrl1(pics);
		}
		
		/*更新到到表里去*/
		resObject = classService.updateClass(classInfo);
		ResultConstant.write(response, resObject);
	}
	/**
     * 	根据条件查询到取班级具体信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryClassInfoByParam")
	public void queryClassInfoByParam(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		/*获取查询条件*/
		String id = request.getParameter("id");
		map.put("id", id);
		/*加入到表里去*/
		resObject = classService.queryClassInfoByParam(map);
		ResultConstant.write(response, resObject);
	}
	
	/**
	 * 失效班级
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/disabledClass")
	public void disabledClass(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		/*获取查询条件*/
		String ids = request.getParameter("ids");
		String isValid = request.getParameter("isValid");
		String[] idArray = ids.split(",");
		for(String id : idArray){
			map.put("id", id);
			map.put("isValid", isValid);
			/*失效班级到表里去*/
			resObject = classService.disabledClass(map);
		}
		
		ResultConstant.write(response, resObject);
	}
	/**
	 * 导出执行情况模板
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportImplementation")
	public String exportImplementation(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String path = request.getSession().getServletContext().getRealPath("templates/implementation.xlsx");
		 
		// 从请求参数获取附件ID并查询附件信息
		try{
			//InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
			InputStream is = new BufferedInputStream(new FileInputStream(path));

			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request,  "执行情况模板.xlsx");
            response.setHeader("Content-disposition", "attachment;"+finalFileName);
    		response.setContentType("application/ms-excel");
			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	 
	/**
	 * 导出成绩模板
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportScore")
	public String exportScore(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String path = request.getSession().getServletContext().getRealPath("templates/score.xlsx");
		 
		// 从请求参数获取附件ID并查询附件信息
		try{
			//InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
			InputStream is = new BufferedInputStream(new FileInputStream(path));

			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "成绩模板.xlsx");
			response.setHeader("Content-disposition", "attachment;"+finalFileName);
	        response.setContentType("application/ms-excel");
			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 导出执行情况模板
	 * @param response
	 * @param request
	 * @return
	 * @throws Exception 
	 * @throws Exception
	 */
	@RequestMapping("/exportZxqkInfo")
	public void exportZxqkInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		/*查询班级执行情况*/
		String pno = request.getParameter("pno");
		Map<String, Object> map = new HashMap<String, Object>();
		Map<String, Object> resMap = new HashMap<String, Object>();
		map.put("pno", pno);
		
		
		
		resMap = classService.queryZxqkInfoByParam(map);
		
		//更改班级状态
		map.put("cstate",SystemContant.CLASS_STATE_END );
		classService.updateClassCstate(map);
		/*导出班级执行情况excel，特殊处理*/
		OutputStream out = response.getOutputStream();
        if(resMap != null){
        	// 声明一个工作薄  
    		try {
    	          HSSFWorkbook bookWorkbook = new HSSFWorkbook();// 创建excel文件
    			  HSSFSheet sheet = bookWorkbook.createSheet("第一个");
    			  HSSFCell cell;
    			  HSSFRow row;
    			  HSSFCellStyle style = bookWorkbook.createCellStyle();// 创建一个单元的样式
    			  // 背景色的设定
    			  //style.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
    			  // 前景色的设定
    			 // style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
    			  
    			  // 设置上下左右边框样式
    			  style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
    			  style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
    			  style.setBorderRight(HSSFCellStyle.BORDER_THIN);
    			  style.setBorderTop(HSSFCellStyle.BORDER_THIN);
    			  // 设置字体
    			  HSSFFont font = bookWorkbook.createFont();
    			  font.setFontName("黑体");
    			  font.setFontHeightInPoints((short) 22);
    			  font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
    			  String[] headRow1 = { "", "", "", "","顺序号：",""};
    			  String[] headRow2 = {"福建省交通教育培训班执行情况表", "", "", "","", ""};
    			  String[] headRow3 = { "培训班名称", String.valueOf(resMap.get("NAME")), "", "异地办班审批号", "", ""};
    			  String[] headRow4 = { "培训对象", String.valueOf(resMap.get("OBJ_ID")), "", "总人数", String.valueOf(resMap.get("P_NUM")), ""};
    			  String[] headRow5 = { "培训类别", String.valueOf(resMap.get("TYPE_ID")), "", "办班地点", String.valueOf(resMap.get("ENTERPRISE_NAME")), ""};
    			  String[] headRow6 = { "报到时间", "", "", "计划人/天数", "", ""};
    			  String[] headRow7 = { "起止时间", "", "", "人.天数/标准", "", ""};
    			  String[] headRow8 = { "学习时间", "", "", "收培训费", "", ""};
    			  String[] headRow9 = { "考察时间", "", "", "收资料费", "", ""};
    			  String[] headRow10 = { "培训评价", "", "", "", "", ""};
    			  String[] headRow11 = {"培训班档案材料", "", "", "","", ""};
    			  String[] headRow12 = {"通知文件", "", "学员签到单", "","教材资料", ""};
    			  String[] headRow13 = {"课程表", "", "课堂照片", "","培训小结", ""};
    			  String[] headRow14 = {"组织方案", "", "调查表", "","其他", ""};
    			  
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
    			  
    			  
    			  
    			  for(int k=0; k<14; k++){
    				  row = sheet.createRow(k);
    				  row.setHeight((short) (25 * 20));
    				  String[] headRow = headList.get(k);
    				  for (int i = 0; i < headRow.length; i++) {
    					   cell = row.createCell((short) i);
    					   cell.setCellValue(headRow[i]);
    					   cell.setCellStyle(style);
    					  }
    			  }
    			  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 文件居中  
    			  sheet.setColumnWidth(0, 5000);  //列宽
    			  sheet.setColumnWidth(1, 5000);  //列宽
    			  sheet.setColumnWidth(2, 5000);  //列宽
    			  sheet.setColumnWidth(3, 7000);  //列宽
    			  sheet.setColumnWidth(4, 5000);  //列宽
    			  sheet.setColumnWidth(5, 5000);  //列宽
    			// 四个参数分别是：起始行，起始列，结束行，结束列      
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
                 
                  /*居左样式*/
                  HSSFCellStyle styleLeft = bookWorkbook.createCellStyle();
                  styleLeft.setBorderLeft(HSSFCellStyle.BORDER_THIN);
                  styleLeft.setBorderBottom(HSSFCellStyle.BORDER_THIN);
                  styleLeft.setBorderRight(HSSFCellStyle.BORDER_THIN);
                  styleLeft.setBorderTop(HSSFCellStyle.BORDER_THIN);
                  styleLeft.setAlignment(HSSFCellStyle.ALIGN_LEFT);
                  
                  String[] headRow15 = {"培训班主办单位意见:", "", "", "省交通职工培训中心意见:","", ""};
                  row = sheet.createRow(14);
                  row.setHeight((short) (25 * 20));
                  for (int i = 0; i < headRow15.length; i++) {
       			   cell = row.createCell((short) i);
       			   cell.setCellValue(headRow15[i]);
       			   cell.setCellStyle(styleLeft);
       			  }
                  sheet.addMergedRegion(new Region(14, (short) (0), 14, (short) (2)));
                  sheet.addMergedRegion(new Region(14, (short) (3), 14, (short) (5))); 
                  
                  String[] headRow16 = {String.valueOf(resMap.get("ADVICE2")), "", "", String.valueOf(resMap.get("ADVICE3")),"", ""};
                  row = sheet.createRow(15);
                  row.setHeight((short) (50 * 20));
                  for (int i = 0; i < headRow16.length; i++) {
       			   cell = row.createCell((short) i);
       			   cell.setCellValue(headRow16[i]);
       			   styleLeft.setWrapText(true);
       			   cell.setCellStyle(styleLeft);
       			  }
                  sheet.addMergedRegion(new Region(15, (short) (0), 15, (short) (2)));
                  sheet.addMergedRegion(new Region(15, (short) (3), 15, (short) (5)));
                  
                  String[] headRow17 = {String.valueOf(resMap.get("ADVICE_DATE")), "", "", String.valueOf(resMap.get("ADVICE_SDATE")),"", ""};
                  row = sheet.createRow(16);
                  row.setHeight((short) (25 * 20));
                  for (int i = 0; i < headRow17.length; i++) {
       			   cell = row.createCell((short) i);
       			   cell.setCellValue(headRow17[i]);
       			   cell.setCellStyle(styleLeft);
       			  }
                  sheet.addMergedRegion(new Region(16, (short) (0), 16, (short) (2)));
                  sheet.addMergedRegion(new Region(16, (short) (3), 16, (short) (5)));
                  
                  /*文件名编码*/
                String finalFileName = ResultConstant.encodeFilename2(request, "执行情况.xls");
    		    response.setHeader("Content-disposition", "attachment;"+finalFileName);
    	        response.setContentType("application/ms-excel");
    		    bookWorkbook.write(out);
    		    out.close();
    			  
    		} catch (Exception e) {
    			e.printStackTrace();
    			
    		}
        }else{
        	System.out.println("班级对应的执行情况为空");
        	ResultConstant.result("0",response);
        	// throw new Exception("班级对应的执行情况为空");
        	 
            }
		
	}

	/**
	 * 导入文件
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	 @RequestMapping("/importExcel")  
	 public @ResponseBody Map<String, Object> importExcel(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,  
	            HttpServletRequest request, HttpServletResponse response)  
	            throws Exception {
	  	boolean dataFlag = true;
		try {
			/*获取导入文件类型*/
			String type = request.getParameter("type");
			DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem(); 
	        File f = fi.getStoreLocation();/**/
	        if("zxqk".equals(type)){
	        	ImportExcel<ClassActionImportInfo> excelUtil = new ImportExcel<ClassActionImportInfo>(ClassActionImportInfo.class);
				List<ClassActionImportInfo> results = (List<ClassActionImportInfo>) excelUtil.importExcel(f); 
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					if(results.size()>1000){
						return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
					}
					//校验标题是否存在
					Map<String, String> lackMap= excelUtil.isTitle(f); 
					if(lackMap != null && lackMap.size() > 0){
						String title="";
						for(Map.Entry<String, String>  m : lackMap.entrySet()){
							title+=" "+m.getValue();
						}
						return ResultConstant.resultMap(false, "导入文件标题缺失："+title);

					}
					List<ClassActionImportInfo> resList = new ArrayList<ClassActionImportInfo>(); 
					
					for (ClassActionImportInfo tempVo : results) {
						String errMsg = "";
						String pno = tempVo.getPno();
						String advice2 = tempVo.getAdvice2();//培训班主办单位意见
						String advice3 = tempVo.getAdvice3();//省交通职工培训中心意见
						if(advice2.length() > 50 || advice3.length() > 50){
							dataFlag = false;
							errMsg = "主办单位意见/培训中心意见超过50字";
						} 
						if(StringUtils.isNotBlank(pno)){
							//校验班级是否存在
							Map<String, Object> classMap = new HashMap<String, Object>();
							classMap.put("pno", tempVo.getPno());
							JSONObject jsonObj = classService.queryClassInfoByParam(classMap);
							String flag = (String)jsonObj.get("flag");
							if(flag == "1"){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = (String)jsonObj.get("errorMsg");
								}else{
									dataFlag = false;
									errMsg += (String)jsonObj.get("errorMsg");
								}
							}else{//班级存在，判断班级下面的学生成绩和学时是否已经导入
								 JSONObject classJson = (JSONObject) jsonObj.get("classInfo");
								// ClassInfo classInfo = (ClassInfo)jsonObj.get("classInfo");
								 Integer classId = (Integer)classJson.get("id");
								 int cnt = classService.qryCntScore2StimeNull(classId);
								 if(cnt > 0){
									 if(StringUtils.isBlank(errMsg)){
											dataFlag = false;
											errMsg = "班级下的报名学生成绩和学时为空";
										}else{
											dataFlag = false;
											errMsg += ",班级下的报名学生成绩和学时为空";
										}
								 }
							}
						}
						if(StringUtils.isBlank(pno)){
							if(StringUtils.isBlank(errMsg)){
								dataFlag = false;
								errMsg = "班级编码不能为空";
							}else{
								dataFlag = false;
								errMsg += ",班级编码不能为空";
							}
						}
						
						tempVo.setErrMsg(errMsg);
						resList.add(tempVo);
					}
					return ResultConstant.resultMap(resList, dataFlag, null);
				}else{
					return ResultConstant.resultMap(false,"文件中未上传任何数据");

				}
				//resObject  	= classService.insertClassActionInfo(results);
	        }else if("cj".equals(type)){
	        	ImportExcel<UserScoreImportInfo> excelUtil = new ImportExcel<UserScoreImportInfo>(UserScoreImportInfo.class);
				List<UserScoreImportInfo> results = (List<UserScoreImportInfo>) excelUtil.importExcel(f); 
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					if(results.size()>1000){
						return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
					}
					//校验标题是否存在
					Map<String, String> lackMap= excelUtil.isTitle(f); 
					if(lackMap != null && lackMap.size() > 0){
						String title="";
						for(Map.Entry<String, String>  m : lackMap.entrySet()){
							title+=" "+m.getValue();
						}
						return ResultConstant.resultMap(false, "导入文件标题缺失："+title);

					}
					List<UserScoreImportInfo> resList = new ArrayList<UserScoreImportInfo>(); 
					
					for (UserScoreImportInfo tempVo : results) {
						String remark = "";
						String pnum = tempVo.getPnum();
						if(StringUtils.isBlank(tempVo.getClassId())){
							remark += ",班级编码不能为空";
						}
						//判断用户报名是否已经通过审批
						Map<String, Object> map = new HashMap<String, Object>();
						map.put("pno", tempVo.getClassId());
						map.put("pnum", tempVo.getPnum());
						BmbImport userBm = (BmbImport)classService.qryUserBgInfo(map);
						if((SystemContant.BG_STATE_SUCC+"").equalsIgnoreCase(userBm.getIsState())){
							try {
								Float score = Float.parseFloat(tempVo.getScore());
								if(score.compareTo(new Float(0))<0 || score.compareTo(new Float(100))>0){
									remark += ",成绩必须是0-100之间的小数";
								}
							} catch (Exception e) {
								remark += ",成绩必须是0-100之间的小数";
							}
							try {
								Integer stime = Integer.parseInt(tempVo.getStime());
								if(stime<=0){
									remark += ",学时必须是大于0的数值";
								}
							} catch (Exception e) {
								remark += ",学时必须是大于0的数值";
							}
						}else{
							remark += ",用户报名未通过审核";
						}
						
						if(StringUtils.isNotBlank(pnum)){
							JSONObject checkObj = classService.checkImportUserScoreInfo(tempVo);
							String flag = (String)checkObj.get("flag");
							if(flag == "1"){ 
								remark += "," +( String)checkObj.get("errMsg");
							} 
						}
						if(StringUtils.isBlank(pnum)){
							remark += ",身份证号不能为空";
						}
						
						if(remark.length()>0){
							dataFlag = false;
							tempVo.setRemark(remark.substring(1));
						}
						resList.add(tempVo);
					}
					return ResultConstant.resultMap(resList, dataFlag, null);
				}else{
					return ResultConstant.resultMap(false,"文件中未上传任何数据");

				}
				
				
				//resObject = classService.insertUserScoreInfo(results);
	        }

		} catch (Exception e) {
			e.printStackTrace();
			return ResultConstant.resultMap(false,  e.getMessage());
		}
		//ResultConstant.write(response, resObject);
		return null;
	  }	
	 
	 /**
		 * 导出年度执行情况
		 * @param response
		 * @param request
		 * @return
		 * @throws IOException 
		 * @throws Exception
		 */
		@RequestMapping("/exportNdhz")
		public void exportNdhz(HttpServletResponse response,HttpServletRequest request) throws IOException{
			/*查询班级执行情况*/
			String nd = request.getParameter("nd");
			String cstate = request.getParameter("cstate");
			Map<String, Object> map = new HashMap<String, Object>();
			Map<String, Object> resMap = new HashMap<String, Object>();
			map.put("startDate", nd+"-01-01");
			map.put("endDate", nd+"-12-31");
			map.put("cstate", cstate);//cstate
			List resList = classService.queryNdhz(map);
			
			/*导出班级执行情况excel，特殊处理*/
			OutputStream out = response.getOutputStream();

			// 声明一个工作薄  
			try {
		          HSSFWorkbook bookWorkbook = new HSSFWorkbook();// 创建excel文件
				  HSSFSheet sheet = bookWorkbook.createSheet("年度执行情况");
				  HSSFCell cell;
				  HSSFRow row;
				  HSSFCellStyle style = bookWorkbook.createCellStyle();// 创建一个单元的样式
				  // 背景色的设定
				  //style.setFillBackgroundColor(HSSFColor.GREY_25_PERCENT.index);
				  // 前景色的设定
				 // style.setFillForegroundColor(HSSFColor.GREY_25_PERCENT.index);
				  HSSFPrintSetup ps = sheet.getPrintSetup();
				  ps.setLandscape(false); // 打印方向，true：横向，false：纵向(默认)    
				  ps.setVResolution((short)600);    
				  ps.setPaperSize(HSSFPrintSetup.A4_PAPERSIZE); //纸张类型 
				  // 设置上下左右边框样式
				  style.setBorderLeft(HSSFCellStyle.BORDER_THIN);
				  style.setBorderBottom(HSSFCellStyle.BORDER_THIN);
				  style.setBorderRight(HSSFCellStyle.BORDER_THIN);
				  style.setBorderTop(HSSFCellStyle.BORDER_THIN);
				  // 设置字体
				  HSSFFont font = bookWorkbook.createFont();
				  font.setFontName("黑体");
				  font.setFontHeightInPoints((short) 22);
				  font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
				  String[] headRow1 = { nd+"福建省交通运输厅继续教育培训班计划汇总表", "", "", "","", "", "","", "", "",""};
				  String[] headRow2 = {"序", "主办单位", "培训班名称", "培训天数", "培训地点", "培训目的、内容", "培训对象","总人数", "开班时间", "备注","办班依据"};
				  
				  List<String[]> headList = new ArrayList<String[]>();
				  List<String[]> dataList = new ArrayList<String[]>();
				  headList.add(headRow1);
				  headList.add(headRow2);
				  if(resList.size() > 0){
					  for(int i = 0; i< resList.size(); i++){
						  map = (Map<String, Object>) resList.get(i);
						  String[] resRow = {
								  (i+1+""),
								  String.valueOf(map.get("ENTERPRISE_NAME")),
								  String.valueOf(map.get("NAME")),
								  String.valueOf(map.get("P_DATE")),
								  "",
								  String.valueOf(map.get("CONTENT")),
								  String.valueOf(map.get("OBJ_ID")),
								  String.valueOf(map.get("CNT")),
								  String.valueOf(map.get("S_DATE")),
								  "",
								  ""};
						  dataList.add(resRow);
					  }
				  }

				  for(int k=0; k<2; k++){
					  row = sheet.createRow(k);
					  row.setHeight((short) (25 * 20));
					  String[] headRow = headList.get(k);
					  for (int i = 0; i < headRow.length; i++) {
						   cell = row.createCell((short) i);
						   cell.setCellValue(headRow[i]);
						   cell.setCellStyle(style);
						  }
				  }
				  style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 文件居中  
				  sheet.setColumnWidth(0, 1000);  //列宽
				  sheet.setColumnWidth(1, 7000);  //列宽
				  sheet.setColumnWidth(2, 7000);  //列宽
				  sheet.setColumnWidth(3, 4000);  //列宽
				  sheet.setColumnWidth(4, 4000);  //列宽
				  sheet.setColumnWidth(5, 7000);  //列宽
				  sheet.setColumnWidth(6, 4000);  //列宽
				  sheet.setColumnWidth(7, 4000);  //列宽
				  sheet.setColumnWidth(8, 4000);  //列宽
				  sheet.setColumnWidth(9, 4000);  //列宽
				  sheet.setColumnWidth(10, 4000);  //列宽
				// 四个参数分别是：起始行，起始列，结束行，结束列      
	              sheet.addMergedRegion(new Region(0, (short) (0), 0, (short) (10))); 
	              for(int k=2; k < dataList.size()+2; k++){
					  row = sheet.createRow(k);
					  row.setHeight((short) (25 * 20));
					  String[] dataRow = dataList.get(k-2);
					  for (int i = 0; i < dataRow.length; i++) {
						   cell = row.createCell((short) i);
						   cell.setCellValue(dataRow[i]);
						   cell.setCellStyle(style);
						  }
				  }
	              
	              /*文件名编码*/
	            String finalFileName = ResultConstant.encodeFilename2(request, (nd+"年年度完成情况.xls"));
	            response.setHeader("Content-disposition", "attachment;"+finalFileName);
		        response.setContentType("application/ms-excel");
			    bookWorkbook.write(out);
			    out.close();
				  
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		/**@RequestParam 
		 * 这里这里用的是MultipartFile[] myfiles参数,所以前台就要用<input type="file" name="myfiles"/>
		 * 上传文件完毕后返回给前台[0`filepath],0表示上传成功(后跟上传后的文件路径),1表示失败(后跟失败描述)
		 */
		@RequestMapping("/fileUpload")
		public  @ResponseBody void fileUpload(@RequestParam MultipartFile[] idFile,HttpServletResponse response,HttpServletRequest request) throws Exception{
			//Map<String, Object> resMap = new HashMap<String, Object>();
			//设置响应给前台内容的数据格式
			response.setContentType("text/plain; charset=UTF-8");
			//设置响应给前台内容的PrintWriter对象
			PrintWriter out = response.getWriter();
			try {
				//如果用的是Tomcat服务器，则文件会上传到\\%TOMCAT_HOME%\\webapps\\YourWebProject\\upload\\文件夹中
				//这里实现文件上传操作用的是commons.io.FileUtils类,它会自动判断/upload是否存在,不存在会自动创建
				String realPath = new File(getClass().getClassLoader().getResource("")
						.getPath()).getParentFile().getParentFile().getPath()
						+ "/upload/classFile/";
				//判断路径是否存在，不存在则创建
				File dir = new File(realPath);
				if(!dir.isDirectory())
				    dir.mkdir();
				//上传文件的原名(即上传前的文件名字)
				String originalFilename = null;
				//如果只是上传一个文件,则只需要MultipartFile类型接收文件即可,而且无需显式指定@RequestParam注解
				//如果想上传多个文件,那么这里就要用MultipartFile[]类型来接收文件,并且要指定@RequestParam注解
				//上传多个文件时,前台表单中的所有<input type="file"/>的name都应该是myfiles,否则参数里的myfiles无法获取到所有上传的文件
				SimpleDateFormat sdf= new SimpleDateFormat("yyyyMMddHHmmssSSS");
				String name=sdf.format(new Date());
				for(MultipartFile myfile : idFile){
					if(myfile.isEmpty()){
						out.print("请选择文件后上传!");
						out.flush();
						return ;
						//return null;
					}else if(myfile.getSize() > 1024*1024*2){
						out.print("附件大小超过范围!");
						out.flush();
						return ;
					}else{
						
						originalFilename = myfile.getOriginalFilename();
						System.out.println("文件原名: " + originalFilename);
						System.out.println("文件名称: " + myfile.getName());
						System.out.println("文件长度: " + myfile.getSize());
						System.out.println("文件类型: " + myfile.getContentType());
						name+="."+originalFilename.substring(originalFilename.lastIndexOf(".")+1);;
						String url = realPath+name;
						System.out.println("存放路径 ：" + url);
						System.out.println("========================================");
						try {
							//这里不必处理IO流关闭的问题,因为FileUtils.copyInputStreamToFile()方法内部会自动把用到的IO流关掉
							//此处也可以使用Spring提供的MultipartFile.transferTo(File dest)方法实现文件的上传
//							FileUtils.copyInputStreamToFile(myfile.getInputStream(), new File(realPath, originalFilename));
							BufferedInputStream in = new BufferedInputStream(myfile.getInputStream());//获得文件输入流
							 
			                FileOutputStream a = new FileOutputStream(new File(url));
			                BufferedOutputStream output = new BufferedOutputStream(a);
			                Streams.copy(in, output, true);//开始把文件写到你指定的上传文件夹
						} catch (IOException e) {
							System.out.println("文件[" + originalFilename + "]上传失败,堆栈轨迹如下");
							e.printStackTrace();
							out.print("文件上传失败，请重试！");
							out.flush();
							return;
						}
					}
				}
				//此时在Windows下输出的是[D:\Develop\apache-tomcat-6.0.36\webapps\AjaxFileUpload\\upload\愤怒的小鸟.jpg]
				//System.out.println(realPath + "\\" + originalFilename);
				//此时在Windows下输出的是[/AjaxFileUpload/upload/愤怒的小鸟.jpg]
				//System.out.println(request.getContextPath() + "/upload/" + originalFilename);
				//不推荐返回[realPath + "\\" + originalFilename]的值
				//因为在Windows下<img src="file:///D:/aa.jpg">能被firefox显示,而<img src="D:/aa.jpg">firefox是不认的
				response.setStatus(200);
				
			    String retxt = "0`" + realPath+"\\"+name;
			    response.getWriter().print(retxt);
//				out.print("0`" + request.getContextPath() + "/upload/" + originalFilename);
//				out.flush();
			    //resMap.put("flag", true);
			} catch (Exception e) {
				e.printStackTrace();
				out.print("上传附件失败,请稍后再试!");
				out.flush();
				/*resMap.put("flag", false);
				resMap.put("cause", e.getMessage());*/
				return ;
			}
			//return null;
		}
		
		
		/**执行情况导入兼容ie
		 * @param response
		 * @param request
		 * @throws Exception 
		 */
		@RequestMapping("/zxqkUpload")  
		public  @ResponseBody void zxqkUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
			String cause="";
            boolean dataFlag = true;
            boolean flag = true;
            List<ClassActionImportInfo> resList = new ArrayList<ClassActionImportInfo>(); 
			
			try {
				String newFileName=ResultConstant.getRandNum(32)+".xlsx";
				File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
				if(newFile!=null){ 

		        	ImportExcel<ClassActionImportInfo> excelUtil = new ImportExcel<ClassActionImportInfo>(ClassActionImportInfo.class);
					List<ClassActionImportInfo> results = (List<ClassActionImportInfo>) excelUtil.importExcel(newFile); 
					if(results!=null&&results.size()>0){
						//数量不能超过1000条
						if(results.size()>1000){
							JSONObject jsonObject=new JSONObject();
							jsonObject.put("flag", false);
							jsonObject.put("cause", "导入的记录数最大不能超过1000条");
							ResultConstant.write(response, jsonObject);
							return;
						}
						//校验标题是否存在
						Map<String, String> lackMap= excelUtil.isTitle(newFile); 
						if(lackMap != null && lackMap.size() > 0){
							String title="";
							for(Map.Entry<String, String>  m : lackMap.entrySet()){
								title+=" "+m.getValue();
							}
						    JSONObject jsonObject = new JSONObject();
							jsonObject.put("flag", false);
							jsonObject.put("cause", "导入文件标题缺失："+title);
							ResultConstant.write(response, jsonObject);
							return;
						}
						String adviceDate = null , 
							   adviceSdate = null,
							   adviceDateMsg = null,
							   adviceSdateMsg = null;
						for (ClassActionImportInfo tempVo : results) {
							String errMsg = "";
							String pno = tempVo.getPno();
							adviceDate = tempVo.getAdviceDate();  //主办单位意见日期
							adviceSdate  = tempVo.getAdviceSdate(); //培训中心意见日期 
							String advice2 = tempVo.getAdvice2();//培训班主办单位意见
							String advice3 = tempVo.getAdvice3();//省交通职工培训中心意见
							if(advice2.length() > 50 || advice3.length() > 50){
								dataFlag = false;
								errMsg = "主办单位意见/培训中心意见超过50字";
							} 
							if(StringUtils.isNotBlank(pno)){
								//校验班级是否存在
								Map<String, Object> classMap = new HashMap<String, Object>();
								classMap.put("pno", tempVo.getPno());
								JSONObject jsonObj = classService.queryClassInfoByParam(classMap);
								String flag1 = (String)jsonObj.get("flag");
								if(flag1 == "1"){
									if(StringUtils.isBlank(errMsg)){
										dataFlag = false;
										errMsg = (String)jsonObj.get("errorMsg");
									}else{
										dataFlag = false;
										errMsg += (String)jsonObj.get("errorMsg");
									}
								}else{//班级存在，判断班级下面的学生成绩和学时是否已经导入
									 JSONObject classJson = (JSONObject) jsonObj.get("classInfo");
									// ClassInfo classInfo = (ClassInfo)jsonObj.get("classInfo");
									 Integer classId = (Integer)classJson.get("id");
									 int cnt = classService.qryCntScore2StimeNull(classId);
									 if(cnt > 0){
										 if(StringUtils.isBlank(errMsg)){
												dataFlag = false;
												errMsg = "班级下的报名学生成绩和学时为空";
											}else{
												dataFlag = false;
												errMsg += ",班级下的报名学生成绩和学时为空";
											}
									 }
									 Integer cstage = (Integer)classJson.get("cstate");
									 
									 if( (cstage.intValue() < SystemContant.CLASS_STATE_CJ)  || (cstage.intValue() > SystemContant.CLASS_STATE_ZX ) ){
										 if(StringUtils.isBlank(errMsg)){
												dataFlag = false;
												errMsg = "该班级目前状态不能导入";
											}else{
												dataFlag = false;
												errMsg += ",该班级目前状态不能导入";
											}
									 }
								}
							}
							
							adviceDateMsg = checkDate(adviceDate);
							
							if(adviceDateMsg != null){
								dataFlag = false;
								if(StringUtils.isBlank(errMsg)){
									errMsg = "主办单位意见日期  " + adviceDateMsg;
								}else{
									errMsg = ",主办单位意见日期  " + adviceDateMsg;
								}
							}
							adviceSdateMsg =checkDate(adviceSdate);
							if(adviceSdateMsg != null){
								dataFlag = false;
								if(StringUtils.isBlank(errMsg)){
									errMsg = "培训中心意见日期  " + adviceSdateMsg;
								}else{
									errMsg += ",培训中心意见日期  " + adviceSdateMsg;
								}
							}
							
							
							if(StringUtils.isBlank(pno)){
								if(StringUtils.isBlank(errMsg)){
									dataFlag = false;
									errMsg = "班级编码不能为空";
								}else{
									dataFlag = false;
									errMsg += ",班级编码不能为空";
								}
							}
							
							tempVo.setErrMsg(errMsg);
							resList.add(tempVo);
						}
					}else{
						//return ResultConstant.resultMap(false,"文件中未上传任何数据");
						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "文件中未上传任何数据");
						ResultConstant.write(response, jsonObject);
						return;
					}
				}else{
					cause = "数据上传异常";
				}
			} catch (Exception e) {
				e.printStackTrace();
				flag = false;
				cause="数据上传异常";
			}
			
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("rows", resList);
			jsonObject.put("flag", flag);
			jsonObject.put("dateFlag", dataFlag);//文件里面的数据错误标识
			ResultConstant.write(response, jsonObject);
		}
		/**报名导入兼容ie
		 * @param response
		 * @param request
		 * @throws Exception 
		 */
		@RequestMapping("/cjUpload")  
		public  @ResponseBody void cjUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
			String cause="";
            boolean dataFlag = true;
            boolean flag = true;
            
            List<UserScoreImportInfo> resList = new ArrayList<UserScoreImportInfo>(); 
			
			try {
				String newFileName = ResultConstant.getRandNum(32)+".xlsx";
				File newFile = ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
				if(newFile!=null){ 

		        	ImportExcel<UserScoreImportInfo> excelUtil = new ImportExcel<UserScoreImportInfo>(UserScoreImportInfo.class);
					List<UserScoreImportInfo> results = (List<UserScoreImportInfo>) excelUtil.importExcel(newFile); 
					if(results!=null&&results.size()>0){
						//数量不能超过1000条
						if(results.size()>1000){
							JSONObject jsonObject=new JSONObject();
							jsonObject.put("flag", false);
							jsonObject.put("cause", "导入的记录数最大不能超过1000条");
							ResultConstant.write(response, jsonObject);
							return;
						}
						//校验标题是否存在
						Map<String, String> lackMap= excelUtil.isTitle(newFile); 
						if(lackMap != null && lackMap.size() > 0){
							String title="";
							for(Map.Entry<String, String>  m : lackMap.entrySet()){
								title+=" "+m.getValue();
							}
							JSONObject jsonObject = new JSONObject();
							jsonObject.put("flag", false);
							jsonObject.put("cause", "导入文件标题缺失："+title);
							ResultConstant.write(response, jsonObject);
							return;

						}
						
						for (UserScoreImportInfo tempVo : results) {
							String remark = "";
							String pnum = tempVo.getPnum();
							if(StringUtils.isBlank(tempVo.getClassId())){
								remark += ",班级编码不能为空";
							}
							//判断用户报名是否已经通过审批
							Map<String, Object> map = new HashMap<String, Object>();
							map.put("pno", tempVo.getClassId());
							map.put("pnum", tempVo.getPnum());
							BmbImport userBm = (BmbImport)classService.qryUserBgInfo(map);
							if(userBm!=null &&(SystemContant.BG_STATE_SUCC+"").equalsIgnoreCase(userBm.getIsState())){
								try {
									Float score = Float.parseFloat(tempVo.getScore());
									if(score.compareTo(new Float(0))<0 || score.compareTo(new Float(100))>0){
										remark += ",成绩必须是0-100之间的小数";
									}
								} catch (Exception e) {
									remark += ",成绩必须是0-100之间的小数";
								}
								try {
									Integer stime = Integer.parseInt(tempVo.getStime());
									if(stime<=0){
										remark += ",学时必须是大于0的数值";
									}
								} catch (Exception e) {
									remark += ",学时必须是大于0的数值";
								}
							}else{
								remark += ",用户报名未通过审核";
							}
							
							if(StringUtils.isNotBlank(pnum)){
								JSONObject checkObj = classService.checkImportUserScoreInfo(tempVo);
								String flag1 = (String)checkObj.get("flag");
								if(flag1 == "1"){ 
									remark += "," +( String)checkObj.get("errMsg");
								} 
							}
							if(StringUtils.isBlank(pnum)){
								remark += ",身份证号不能为空";
							}
							
							if(remark.length()>0){
								dataFlag = false;
								tempVo.setRemark(remark.substring(1));
							}
							resList.add(tempVo);
						}
					}else{
						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "文件中未上传任何数据");
						ResultConstant.write(response, jsonObject);
						return;
					}
				}else{
					cause="数据上传异常";
					flag = false;
				}
			} catch (Exception e) {
				e.printStackTrace();
				cause =  e.getMessage();
				flag = false;
			}
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("rows", resList);
			jsonObject.put("flag", flag);//错误标识
			jsonObject.put("cause", cause);
			jsonObject.put("dateFlag", dataFlag);//文件里的数据错误标识
			ResultConstant.write(response, jsonObject);
		}
		
		
		public String checkDate(String dateStr){
			if(StringUtils.isBlank(dateStr)){
				return "日期不能为空";
			}
			try {
				String[] dateStrGroup = dateStr.split("-");
				int year = Integer.parseInt(dateStrGroup[0]);
				int month = Integer.parseInt(dateStrGroup[1]);
				int day  = Integer.parseInt(dateStrGroup[2]);
				if(year < 1970){
					return "年份不能小于1970年";
				}
				
				if(month <1 || month > 12 ){
					return "错误的月份";
				}
				
				if(day<1 || day>getMaxMonthDay(year,month)){
					return "错误的天数";
				}
				
				return null;
			} catch (Exception e) {
				return "日期格式不正确。 格式应为:YYYY-MM-DD";
			}
		}
		
		public int getMaxMonthDay(int year,int month){
			
			if(month==2){
				if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0){
					//闰年
					return 29;
				}else{
					//非闰年
					return 28;
				}
			}else{
				int[] bigMonth = {1,3,5,7,8,10,12};// 二叉树查询必须先排续
				if(Arrays.binarySearch(bigMonth,month)>0){
					return 31;
				}else{
					return 30;
				}
			}
		}
		
}
