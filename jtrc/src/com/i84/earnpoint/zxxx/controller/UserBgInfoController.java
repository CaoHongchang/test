package com.i84.earnpoint.zxxx.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.UserScoreImportInfo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.zxxx.service.ClassService;
import com.i84.earnpoint.zxxx.service.UserBgInfoService;

import freemarker.template.SimpleDate;

/**
 * 用户报名
 * @author wangsc
 *
 */
@Controller
@RequestMapping("/userBgTrol")
public class UserBgInfoController extends ResultConstant{
	@Autowired 
	public UserBgInfoService userBgInfoService;
	@Autowired 
	public ClassService classService;
	
	/**
     * 	获取报名表列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryBmbList")
	public  @ResponseBody Map<String, Object> queryBmbList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		BmbInfo record=new BmbInfo();
		record.setPage(page);
		record.setRows(rows);
		record.setbName(request.getParameter("bName"));
		record.setName(request.getParameter("name"));
		record.setPnum(request.getParameter("pnum"));
		record.setTel(request.getParameter("tel"));
        record.setWorkName(request.getParameter("workName"));
        if(StringUtils.isNotBlank(request.getParameter("isState"))){
        	record.setRs(Integer.parseInt(request.getParameter("isState")));
        }
        
		List<BmbInfo> list = userBgInfoService.queryBmbList(record);
		PageInfo<BmbInfo> pageinfo = new PageInfo<BmbInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
	 * 根据条件获取报名用户的信息
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/queryUserBgInfoByParam")
	public void queryUserBgInfoByParam(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		Map<String, Object> map = new HashMap<String, Object>();
		/*获取查询条件*/
		String pnum = request.getParameter("pnum");
		map.put("pnum", pnum);
		/*查询表*/
		resObject = userBgInfoService.queryUserBgInfoByParam(map);
		ResultConstant.write(response, resObject);
	}
	/**
	 * 审核报名用户操作
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@RequestMapping("/checkUserBgInfo")
	public void checkUserBgInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		JSONObject resObject = new JSONObject();
		String checkUserId = request.getParameter("checkUserId");
		String checkStatus = request.getParameter("checkStatus");
		String checkRemark = request.getParameter("checkRemark");
		String checkDate = request.getParameter("checkDate");
		String id = request.getParameter("id");
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("checkUserId", checkUserId);
		params.put("checkStatus", checkStatus);
		params.put("checkRemark", checkRemark);
		params.put("id", id);
		resObject = userBgInfoService.checkUserBgInfo(params);
		
		ResultConstant.write(response, resObject);
	}
	/**
	 * 导出学员模板
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws Exception
	 */
	@RequestMapping("/exportModel")
	public String exportModel(HttpServletResponse response,HttpServletRequest request) throws IOException{
		//String path = request.getSession().getServletContext().getRealPath("templates/student.xlsx");
		 
		// 从请求参数获取附件ID并查询附件信息
		try{
			ResultConstant.fileDownload(request, response, "templates", "student.xlsx","学员模板.xlsx");//员工导入模板

			//InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
			/*InputStream is = new BufferedInputStream(new FileInputStream(path));

			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// 设置响应类型为
			response.reset();
			String finalFileName = ResultConstant.encodeFilename2(request, "学员模板.xlsx");
			response.setHeader("Content-Disposition","attachment; filename=\""+finalFileName+"\"");
			
			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();*/
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
	}
	 
	  @RequestMapping("/importBmb")  
		 public @ResponseBody Map<String, Object> importBmb(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,  
		            HttpServletRequest request, HttpServletResponse response)  
		            throws Exception {
		    boolean dataFlag = true;
		  	JSONObject resObject = new JSONObject();
		  	JSONArray array = new JSONArray();
			try {
				DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem(); 
		        File f = fi.getStoreLocation();/**/
		        ImportExcel<BmbImport> excelUtil = new ImportExcel<BmbImport>(BmbImport.class);
				List<BmbImport> results = (List<BmbImport>) excelUtil.importExcel(f); 
				List<BmbImport> returnList = new ArrayList<BmbImport>();
				for (BmbImport tempVo : results) {
					String errMsg = "";
					String pnum = tempVo.getPnum();
					if(StringUtils.isNotBlank(pnum)){
						JSONObject checkObj = classService.checkImportUserBmInfo(tempVo);
						String flag = (String)checkObj.get("flag");
						if(flag == "1"){ 
							dataFlag = false;
							errMsg += ","+( String)checkObj.get("errMsg");
						} 
					}
					if(StringUtils.isBlank(pnum)){
						dataFlag = false;
						errMsg += "," + "身份证错误";
					}
					
					try {
						String brith = tempVo.getBrith();
						 if (brith.contains("-")) {
							String[] arr = brith.split("-");
							if(arr.length != 2){
								dataFlag = false;
								errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
							}else{
								int year = Integer.parseInt(arr[0]);
								if(year<1800){
									dataFlag = false;
									errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
								}
								int month = Integer.parseInt(arr[1]);
								if(month<1 || month>12){
									dataFlag = false;
									errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
								}
							}
						}else{
							dataFlag = false;
							errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
						}
					} catch (Exception e) {
						dataFlag = false;
						errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
					}
					if(StringUtils.isNotBlank(errMsg)){
						tempVo.setErrMsg(errMsg.substring(1));
					}
					
					returnList.add(tempVo); 
				}
				
				//userBgInfoService.insertUserInfo(results);
				return ResultConstant.resultMap(returnList, dataFlag, null);
			} catch (Exception e) {
				e.printStackTrace();
				resObject.put("flag", "1");
				resObject.put("errorMsg", e.getMessage());
			}
			
			ResultConstant.write(response, resObject);
			return resObject;
		  }	
	  
	  /**添加报名信息
		 * @param response
		 * @param request
		 * @return
		 */
		@RequestMapping("/saveBm")  
		public  @ResponseBody Map<String, Object> saveBm(@RequestBody List<BmbImport> list){
			boolean flag = false;
			String cause="";
			try {
				userBgInfoService.insertUserInfo(list);
				flag=true;
			} catch (Exception e) {
				e.printStackTrace();
				cause= e.getMessage();
			}
			return ResultConstant.resultMap(flag,cause);  
		}
		
		/**报名导入兼容ie
		 * @param response
		 * @param request
		 * @throws Exception 
		 */
		@RequestMapping("/bmbUpload")  
		public  @ResponseBody void bmbUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
			boolean flag = true;
			String cause="";
			List<YgImportVo> yglist=null;
			Long total=null;
            boolean dataFlag = true;
            List<BmbImport> returnList = new ArrayList<BmbImport>();
			try {
				String newFileName=ResultConstant.getRandNum(32)+".xlsx";
				File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
				if(newFile!=null){
					//读取导入的文件
					ImportExcel<BmbImport> importExcel = new ImportExcel<BmbImport>(BmbImport.class);
					List<BmbImport> results = (List<BmbImport>) importExcel.importExcel(newFile);
					if(results!=null&&results.size()>0){
						
						for (BmbImport tempVo : results) {
							String errMsg = "";
							String pnum = tempVo.getPnum();
							if(StringUtils.isNotBlank(pnum)){
								JSONObject checkObj = classService.checkImportUserBmInfo(tempVo);
								String flag1 = (String)checkObj.get("flag");
								if(flag1 == "1"){ 
									dataFlag = false;
									errMsg += ","+( String)checkObj.get("errMsg");
								} 
							}
							if(StringUtils.isBlank(pnum)){
								dataFlag = false;
								errMsg += "," + "身份证错误";
							}
							
							String brith = tempVo.getBrith();
							if(StringUtils.isNotBlank(brith)){
								try {
									
									 if (brith.contains("-")) {
										String[] arr = brith.split("-");
										if(arr.length != 2){
											dataFlag = false;
											errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
										}else{
											int year = Integer.parseInt(arr[0]);
											if(year<1800){
												dataFlag = false;
												errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
											}
											int month = Integer.parseInt(arr[1]);
											if(month<1 || month>12){
												dataFlag = false;
												errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
											}
										}
									}else{
										dataFlag = false;
										errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
									}
								} catch (Exception e) {
									dataFlag = false;
									errMsg += ",出生年月的格式不正确，正确格式：YYYY-MM";
								}
							}
							
							if(StringUtils.isNotBlank(errMsg)){
								tempVo.setErrMsg(errMsg.substring(1));
							}
							
							returnList.add(tempVo); 
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
				flag = false;
				cause = e.getMessage();
			}
			JSONObject jsonObject=new JSONObject();
			jsonObject.put("rows", returnList);
			jsonObject.put("flag", flag);//错误标识
			jsonObject.put("cause", cause);
			jsonObject.put("dateFlag", dataFlag);//文件里的数据错误标识
			ResultConstant.write(response, jsonObject);
		}
		
		
		/**导出excel
		 * @param response
		 * @param request
		 */
		@RequestMapping("/bmExport")  
		@ResponseBody
		public void bmExport(HttpServletResponse response,HttpServletRequest request){  
			try {
				userBgInfoService.bmExport(response, request);
			} catch (Exception e) {
				e.printStackTrace();
			}

		}

		
		
}
