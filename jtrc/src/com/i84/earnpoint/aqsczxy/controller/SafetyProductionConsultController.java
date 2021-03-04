package com.i84.earnpoint.aqsczxy.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.Writer;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.aqsczxy.service.AqscbzhshService;
import com.i84.earnpoint.aqsczxy.service.AqsczxService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.FileUtil;
import com.i84.earnpoint.common.RequestUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.AdverInfo;
import com.i84.earnpoint.model.AqsczxInfo;
import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.EnterpriseCheck;
import com.i84.earnpoint.model.SafetyProductionConsult;
import com.i84.earnpoint.model.SafetyProductionConsultMaterial;
import com.i84.earnpoint.model.ScoreExportVo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.model.YgImportVo;

import freemarker.template.Configuration;
import freemarker.template.Template;
/**
 * 安全生产标准化咨询
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/safetyProductionConsultController")
public class SafetyProductionConsultController extends ResultConstant {
	
	private final static Logger logger = Logger.getLogger(SafetyProductionConsultController.class);
	
	@Autowired
	private AqsczxService aqsczxService;
	
	
	/**
	 * 安全咨询合同管理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/qrySafetyProductionConsultList")
	@ResponseBody
	public Object qrySafetyProductionConsultList(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = RequestUtil.resolveParams(request);
		List<Map<String,Object>> infos = aqsczxService.queryAqsczxList(params);
		System.out.println("------------" + infos.toString());
		PageInfo<Map<String,Object>> pageinfo=new PageInfo<Map<String,Object>>(infos);
		System.out.println("------------" + resultMap(infos, pageinfo.getTotal(), true, null));
		return resultMap(infos, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/sh")
	public  @ResponseBody void sh(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
		String id = request.getParameter("id");
		String checkState = request.getParameter("checkState");
		String checkRemark = request.getParameter("checkRemark");
		String trainMsg = request.getParameter("trainMsg");
		safetyProductionConsult.setId(Integer.parseInt(id));
		safetyProductionConsult.setCheckState(Integer.parseInt(checkState));
		safetyProductionConsult.setCheckRemark(checkRemark);
		safetyProductionConsult.setTrainMsg(trainMsg);
		safetyProductionConsult.setCheckDate(new Date());
		aqsczxService.updSafetyProductionConsult(response, safetyProductionConsult);
	}
	
	@RequestMapping("/htqr")
	public  @ResponseBody void htqr(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
		String id = request.getParameter("id");
		
		if(StringUtils.isBlank(id)){
			String ids = request.getParameter("ids");
			safetyProductionConsult.setIds(ids);
			safetyProductionConsult.setContractState(1);
			safetyProductionConsult.setContractDate(new Date());
			aqsczxService.htqrSafetyProductionConsult(response, safetyProductionConsult);
		}else{
			safetyProductionConsult.setId(Integer.parseInt(id));
			safetyProductionConsult.setContractState(1);
			safetyProductionConsult.setContractDate(new Date());
			aqsczxService.updSafetyProductionConsult(response, safetyProductionConsult);
		}
	}
	
	//材料列表
	@RequestMapping("/pxclList")
	public  @ResponseBody Map<String, Object> pxclList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("safeId", id);
		List<Map<String, Object>> list = aqsczxService.queryAqsczxClList(params);
		return resultMap(list, null, true, null);
	}
	
	//删除材料
	@RequestMapping("/delCl")
	public  @ResponseBody void delCl(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsultMaterial safetyProductionConsultMaterial = new SafetyProductionConsultMaterial();
		String id = request.getParameter("id");
//		String contractState = request.getParameter("contractState");
		safetyProductionConsultMaterial.setId(Integer.parseInt(id));
		safetyProductionConsultMaterial.setDelDate(new Date());
		aqsczxService.updSafetyProductionConsultMaterial(response, safetyProductionConsultMaterial);
	}
	
	//保存更新材料
	@RequestMapping("/updateCl")
	public  @ResponseBody void updateCl(HttpServletResponse response,HttpServletRequest request) throws Exception{
		
		try{
			
			String id = request.getParameter("id");
			Map<String,Object> params = new HashMap<String,Object>();
			params.put("safeId", id);
			List<Map<String, Object>> list = aqsczxService.queryAqsczxClList(params);
			
			
			//先删除
			if(null != list && list.size() > 0){
				for(int i=0;i<list.size();i++){
					SafetyProductionConsultMaterial material = (SafetyProductionConsultMaterial)list.get(i);
					material.setDelDate(new Date());
					aqsczxService.updSafetyProductionConsultMaterial(response, material);
				}
			}
			//后保存
			String paths = request.getParameter("paths");
			if(StringUtils.isNotBlank(paths)){
				String[] pathArray = paths.split(",");
				for(String path:pathArray){
					if(StringUtils.isNotBlank(path)){
						//后保存
						SafetyProductionConsultMaterial safetyProductionConsultMaterial = new SafetyProductionConsultMaterial();
						safetyProductionConsultMaterial.setAddDate(new Date());
						safetyProductionConsultMaterial.setName(path);
						safetyProductionConsultMaterial.setPath(path);
						safetyProductionConsultMaterial.setSafeId(Integer.parseInt(id));
						aqsczxService.insertSafetyProductionConsultMaterial(safetyProductionConsultMaterial);
					}
				}
			}
			ResultConstant.write(response, "1");
		}catch(Exception e){
			e.printStackTrace();
			ResultConstant.write(response, "0");
		}
		
	}
	
	//合同模板搜索
	@RequestMapping("/htmbList")
	public  @ResponseBody Map<String, Object> htmbList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String key = request.getParameter("key");
		Map<String,Object> params = new HashMap<String,Object>();
		if(StringUtils.isNotBlank(key)){
			params.put("key", key.trim());
		}
		List<Map<String, Object>> infos = aqsczxService.qryContractModel(params);
		System.out.println("=======htmbList======" + infos.toString());
		return resultMap(infos, null, true, null);
	}
	
	//排查列表搜索
	@RequestMapping("/pcList")
	public  @ResponseBody Map<String, Object> pcList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("safeId",id);
		List<Map<String, Object>> infos = aqsczxService.qryEnterpriseCheck(params);
		System.out.println("=======pcList======" + infos.toString());
		return resultMap(infos, null, true, null);
	}
	
	//培训审核
	@RequestMapping("/pxsh")
	public  @ResponseBody void pxsh(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
		String id = request.getParameter("id");
		String trainCheckState = request.getParameter("trainCheckState");
		String trainRemark = request.getParameter("trainRemark");
		String trainMsg = request.getParameter("trainMsg");
		safetyProductionConsult.setId(Integer.parseInt(id));
		safetyProductionConsult.setTrainCheckState(Integer.parseInt(trainCheckState));
		safetyProductionConsult.setTrainRemark(trainRemark);
		safetyProductionConsult.setTrainMsg(trainMsg);
		safetyProductionConsult.setTrainCheckDate(new Date());
		aqsczxService.updSafetyProductionConsult(response, safetyProductionConsult);
	}
	
	//培训完成
	@RequestMapping("/pxwc")
	public  @ResponseBody void pxwc(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
		String id = request.getParameter("id");
		

		if(StringUtils.isBlank(id)){
			String ids = request.getParameter("ids");
			safetyProductionConsult.setIds(ids);
			safetyProductionConsult.setTrainState(1);
			safetyProductionConsult.setTrainDate(new Date());
			aqsczxService.pxwcSafetyProductionConsult(response, safetyProductionConsult);
		}else{
			safetyProductionConsult.setId(Integer.parseInt(id));
			safetyProductionConsult.setTrainState(1);
			safetyProductionConsult.setTrainDate(new Date());
			aqsczxService.updSafetyProductionConsult(response, safetyProductionConsult);
		}
	}
	
	//排查审核
	@RequestMapping("/pcsh")
	public  @ResponseBody void pcsh(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
		String id = request.getParameter("id");
		String lastCheckId = request.getParameter("lastCheckId");
		String pcState = request.getParameter("pcState");
		String pcRemark = request.getParameter("pcRemark");
		safetyProductionConsult.setId(Integer.parseInt(id));
		safetyProductionConsult.setLastCheckState(Integer.parseInt(pcState));
		safetyProductionConsult.setLastCheckRemark(pcRemark);
		safetyProductionConsult.setLastCheckDate(new Date());
		safetyProductionConsult.setLastCheckId(Integer.parseInt(lastCheckId));
		aqsczxService.pcsh(response, safetyProductionConsult);
	}
	
	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ContractModel contractModel = new ContractModel();
		String id = request.getParameter("id");
		contractModel.setId(Integer.parseInt(id));
		contractModel.setDelDate(new Date());
		aqsczxService.updateContractModel(response, contractModel);
	}
	
	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		ContractModel contractModel = new ContractModel();
		String id = request.getParameter("id");
		String mid = request.getParameter("mid");
		String name = request.getParameter("name");	
		String path = request.getParameter("path");
		contractModel.setId(Integer.parseInt(id));
		contractModel.setMid(mid);
		contractModel.setName(name);
		contractModel.setPath(path);
		aqsczxService.updateContractModel(response, contractModel);
	}
	
	/**文件导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/wjUpload")  
	public  void wjUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=false;
        String cause = "";
		try {
			String result = isValidImgFile(request);
			if(null != result){
				flag = false;
				cause=result;
			}else{
				String id = request.getParameter("id");
				File newFile=ResultConstant.fileupload(request, response, "temp/aqsczxy/upload/",null);
				if(null != newFile){
					cause = "##"+newFile.getName();
//					SafetyProductionConsultMaterial safetyProductionConsultMaterial = new SafetyProductionConsultMaterial();
//					safetyProductionConsultMaterial.setAddDate(new Date());
//					safetyProductionConsultMaterial.setName(newFile.getName());
//					safetyProductionConsultMaterial.setPath(newFile.getName());
//					safetyProductionConsultMaterial.setSafeId(Integer.parseInt(id));
//					aqsczxService.insertSafetyProductionConsultMaterial(safetyProductionConsultMaterial);
				}else{
					cause="数据上传异常";
				}
//				flag = true;
//				cause = "1";
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
//		JSONObject jsonObject=new JSONObject();
//		jsonObject.put("flag", flag);
//		jsonObject.put("cause", cause);
		ResultConstant.write(response, cause);

	}
	
	private String isValidImgFile(HttpServletRequest request){
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
    	long imgSize = Long.parseLong(request.getParameter("imgSize"));
    	String imgTypes ="|jpg|png|pdf|";
    	Long size = imgSize * 1024 * 1024;
    	for(Iterator<String> fileNameIterator = multipartRequest.getFileNames(); fileNameIterator.hasNext();){
                String name = fileNameIterator.next();
                MultipartFile file = multipartRequest.getFile(name);
                String fileName = file.getOriginalFilename();
                if(file.getSize() > size){
                	return "上传文件超过限定大小";
                }
                int index = -1;
                String ext = "||";
                if((index = fileName.lastIndexOf(".")) > -1){
                    ext = "|" + fileName.substring(index + 1).toLowerCase() + "|";
                }
                if(imgTypes.indexOf(ext) == -1){
                	return "格式限定为" + imgTypes;
                }
    	}
    	return null;
    }
	
	/**
	 * 导出模板
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportModel")
	public String exportModel(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String name = request.getParameter("path");
		if(StringUtils.isNotBlank(name)){
			name = new String(name.getBytes("iso8859-1"),"UTF-8");
		}
		try{
			String finalFileName = name;
			ResultConstant.fileDownload(request, response, "temp/aqsczxy/upload/model/",name,finalFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	/**
	 * 合同下载
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/downloadHt")
	public String downloadHt(HttpServletResponse response,HttpServletRequest request) throws IOException{
		String name = request.getParameter("path");
		if(StringUtils.isNotBlank(name)){
			name = new String(name.getBytes("iso8859-1"),"UTF-8");
		}
		try{
			String finalFileName = name;
			ResultConstant.fileDownload(request, response, "temp/aqsczxy/upload/",name,finalFileName);
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	
	//合同上传
	@RequestMapping("/htsc")
	public void htsc(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String id = request.getParameter("id");
		String cause = "";
		try{
			String result = isValidImgFile(request);
			if(null != result){
				ResultConstant.write(response, result);
			}else{
				File newFile=ResultConstant.fileupload(request, response, "temp/aqsczxy/upload/",null);
				if(null != newFile){
					String filename = newFile.getName();
					if (filename != null) {
						SafetyProductionConsult safetyProductionConsult = new SafetyProductionConsult();
						safetyProductionConsult.setId(Integer.parseInt(id));
						safetyProductionConsult.setContractName(filename);
						safetyProductionConsult.setContractPath(filename);
						aqsczxService.updSafetyProductionConsult(response, safetyProductionConsult);
					}
				}else{
					cause="上传文件为空";
					ResultConstant.write(response, cause);
				}
			}
		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}
	
	//统计年份数据
	@RequestMapping("/countByYear")
	public  @ResponseBody Map<String, Object> countByYear(HttpServletResponse response,HttpServletRequest request) throws Exception{
		Map<String,Object> params = new HashMap<String,Object>();
		List<Map<String,Object>> infos = aqsczxService.countByYear(params);
		Map<String, Object> result = new HashMap<String, Object>();
		if(null != infos){
			Object[] values = new Object[infos.size()];
			Object[] yueas = new Object[infos.size()];
			for(int i=0;i<infos.size();i++){
				values[i] = infos.get(i).get("VALUE");
				yueas[i] = infos.get(i).get("YEAR");
			}
			result.put("values", values);
			result.put("years", yueas);
		}
		
		return result;
	}
	
	//统计年份数据
	@RequestMapping("/exportList")
	public  @ResponseBody void exportList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		try{
			Map<String,Object> params = new HashMap<String,Object>();
			List<Map<String,Object>> infos = aqsczxService.countByYear(params);
			if(null != infos && infos.size() > 0){
				OutputStream out = response.getOutputStream();
				HSSFWorkbook bookWorkbook = new HSSFWorkbook();// 创建excel文件
			    HSSFSheet sheet = bookWorkbook.createSheet("咨询企业统计数据");
			    HSSFCell cell;
			    HSSFRow row;
			    HSSFCellStyle style = bookWorkbook.createCellStyle();// 创建一个单元的样式
			    // 设置字体
			    HSSFFont font = bookWorkbook.createFont();
			    font.setFontName("黑体");
			    font.setFontHeightInPoints((short) 22);
			    font.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
			    String[] headRow1 = { "年份", "总数"};
			    row = sheet.createRow(0);
				row.setHeight((short) (25 * 20));
				for (int i = 0; i < headRow1.length; i++) {
					   cell = row.createCell((short) i);
					   cell.setCellValue(headRow1[i]);
					   cell.setCellStyle(style);
			    }
				String value="";
			    String year="";
				for(int i = 1;i<=infos.size();i++){
			    	Map<String, Object> resMap = infos.get(i-1);
			    	HSSFRow row2 = sheet.createRow(i);
			    	
			    	value =	String.valueOf(resMap.get("value"));
			    	year = String.valueOf(resMap.get("year"));
			    	
			    	String[] headRow = { year,value};
			    	for (int j = 0; j < headRow.length; j++) {
			    		   HSSFCell cell2 = row2.createCell((short) j);
						   cell2.setCellValue(headRow[j]);
						   cell2.setCellStyle(style);
				    }
				}
				style.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 文件居中  
			    for(int i=0;i<23;i++){
			    	sheet.setColumnWidth(i, 5000);  //列宽
			    }
				/*文件名编码*/
	            String finalFileName = new String("咨询企业统计数据".getBytes(), "ISO8859-1");
			    response.setContentType("application/vnd.ms-excel;charset=UTF-8");
			    response.setHeader("Content-disposition", "attachment;filename="+finalFileName+".xls");   
			    bookWorkbook.write(out);
			    out.close();
			}
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	
	//企业排查打印
	@RequestMapping("/qypcExport")
	public  @ResponseBody void qypcExport(HttpServletResponse response,HttpServletRequest request) throws Exception{
		try{
			String id=request.getParameter("id");//受理编号:SL5748172

			Configuration configuration= new Configuration();  
			configuration.setDefaultEncoding("UTF-8"); 
			//生成的临时文件保存目录
			String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/aqsczxy/upload/";
			File tmpFile = new File(tempPath);
			if (!tmpFile.exists()) {//不存在则创建
				//创建目录
				tmpFile.mkdir();

			}

			configuration.setDirectoryForTemplateLoading(new File(ResultConstant.getWEB_ROOTPath() +"temp/aqsczxy/down/" ));  //FTL文件模板所在的位置  
			Template t = configuration.getTemplate("wordModel.ftl"); //受理单模板   文件名  
			String fileName=ResultConstant.getRandNum(32)+".doc";
			File outFile = new File(tempPath+fileName);  
			Writer out = null;
			out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(outFile),"UTF-8")); 
			Map<String,Object> dataMap=new HashMap<String,Object>();  
			if(StringUtils.isNotEmpty(id)){
				dataMap=getData(id);
			}
			t.process(dataMap, out);  
			//关闭流
			out.flush();
			out.close();
			//文件下载
			ResultConstant.fileDownload(request, response, "temp/aqsczxy/upload/", fileName,"企业排查记录.doc");
			//删除零时文件
			outFile.delete();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	
	private Map<String, Object> getData(String id) {
		Map<String, Object> resultMap=new HashMap<String, Object>();
		Map<String,Object> params = new HashMap<String,Object>();
		params.put("safeId",id);
		List<Map<String, Object>> infos = aqsczxService.qryEnterpriseCheck(params);
		Map<String,Object> record = new HashMap<String,Object>();
		record.put("id", id);
		List<Map<String,Object>> safeList = aqsczxService.queryAqsczxList(record);
		if(null != safeList){
			Map<String,Object> map = safeList.get(0);
			resultMap.put("lastCheckDate", map.get("lastCheckDate"));
			resultMap.put("cCode", map.get("cCode"));
			resultMap.put("name", map.get("name"));
		}
		List<Map<String,Object>> list = new ArrayList<Map<String,Object>>();
		if(null != infos){
			for(int i=0;i<infos.size();i++){
				Map<String, Object> enterpriseCheck = infos.get(i);
				Map<String,Object> map = new HashMap<String,Object>();
				map.put("Number", i+1);
				map.put("addDate", enterpriseCheck.get("addDate") == null ? " ":enterpriseCheck.get("addDate"));
				String tem = " ";
				String state = (enterpriseCheck.get("state") == null ? " ":enterpriseCheck.get("state").toString());
				if("2".equals(state)){
					tem = "审核未通过";
				}else if("1".equals(state)){
					tem = "审核通过";
				}else{
					tem = "待审核";
				}
				map.put("state", tem);
				map.put("remark", enterpriseCheck.get("remark") == null ? " ":enterpriseCheck.get("remark"));
				list.add(map);
			}
		}
		resultMap.put("table2", list);
        return resultMap;  
    }
	
	
	/***
	 * 下载图片
	 * @param request
	 * @param response
	 * @throws IOException 
	 * @throws Exception 
	 */
	@RequestMapping("/downloadImg")
	public void downloadImg(HttpServletRequest request,HttpServletResponse response) throws IOException {
		
		//设置文件MIME类型  
		response.setContentType("application/octet-stream;charset=UTF-8");  
		
		//设置Content-Disposition  
		InputStream inputStream = null;
		OutputStream outputStream = null;
		try {
			String url = request.getParameter("url");
			int findIndex = url.indexOf(".");
			String extendName = findIndex!=-1 ? url.substring(findIndex,url.length()) : ""; 
			
			response.setHeader("Content-Disposition", "attachment;"+ResultConstant.encodeFilename2(request,"image_"+new Date().getTime()+extendName));  
			String path = ResultConstant.getWebApps()
					+ (url.startsWith("/") ? url : "/" + url);
			inputStream = new BufferedInputStream(new FileInputStream(path));
			outputStream = new BufferedOutputStream(response.getOutputStream());
			byte[] buf = new byte[1024];
			int len = 0;
			while((len=inputStream.read(buf))!=-1){
				outputStream.write(buf, 0, len);
			}
			outputStream.flush();
		} catch (Exception e) {
			logger.error("下载异常:"+e.getLocalizedMessage(),e);
			response.setContentType("text/html;charset=UTF-8");
			response.getWriter().print(e.getMessage());
		} finally {
			IOUtils.closeQuietly(inputStream);
			IOUtils.closeQuietly(outputStream);
		}
	}
}
