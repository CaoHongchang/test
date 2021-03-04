package com.i84.earnpoint.aqsczxy.controller;

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
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.aqsczxy.service.AqscbzhshService;
import com.i84.earnpoint.aqsczxy.service.AqsczxService;
import com.i84.earnpoint.common.RequestUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.model.AqsczxInfo;
import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyOut;
/**
 * 安全生产标准化咨询合同模板
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/aqsczx")
public class ContractModelController extends ResultConstant {
	
	private final static Logger logger = Logger.getLogger(ContractModelController.class);
	
	@Autowired
	private AqsczxService aqsczxService;
	
	
	/**
	 * 安全咨询合同管理
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/qryContractModel")
	@ResponseBody
	public Object qryContractModel(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = RequestUtil.resolveParams(request);
		List<Map<String, Object>> infos = aqsczxService.qryContractModel(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(infos);
		System.out.println("------------" + resultMap(infos, pageinfo.getTotal(), true, null));
		return resultMap(infos, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/getNextMid")
	public void getNextMid(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String mid = aqsczxService.getNextMid();
		ResultConstant.write(response,mid);
	}
	
	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String result = isValidImgFile(request);
		if(null != result){
			ResultConstant.write(response, result);
		}else{
			ContractModel contractModel = new ContractModel();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String mid = request.getParameter("mid");
			String name = request.getParameter("contractName");	
	//		String path = request.getParameter("path");
			String addDate = request.getParameter("addDate");
			contractModel.setMid(mid);
			contractModel.setName(name);
			File newFile=ResultConstant.fileupload(request, response, "temp/aqsczxy/upload/model/",null);
			if(null != newFile){
				String filename = newFile.getName();
				contractModel.setPath(filename);
			}
			Date date = new Date();
			try{
				date = sdf.parse(addDate);
			}catch(Exception e){
			}
			contractModel.setAddDate(date);
			aqsczxService.insertContractModel(response, contractModel);
		}
	}
	
	private String isValidImgFile(HttpServletRequest request){
    	MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest)request;
    	long imgSize = Long.parseLong(request.getParameter("imgSize"));
    	String imgTypes = "|doc|docx|";
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
		contractModel.setId(Integer.parseInt(id));
		contractModel.setMid(mid);
		contractModel.setName(name);
		File newFile=ResultConstant.fileupload(request, response, "temp/aqsczxy/upload/model/",null);
		if(null != newFile){
			String filename = newFile.getName();
			contractModel.setPath(filename);
		}
		aqsczxService.updateContractModel(response, contractModel);
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
