package com.i84.earnpoint.aqsczxy.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.aqsczxy.service.AqscbzhshService;
import com.i84.earnpoint.common.RequestUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.model.AqsczxInfo;
/**
 * 安全生产标准化咨询 修改
 * @author qiuwm
 *
 */
@Controller
@RequestMapping("/aqscbzhsh")
public class AqscbzhshController extends ResultConstant {
	
	private final static Logger logger = Logger.getLogger(AqscbzhshController.class);
	
	@Autowired
	private AqscbzhshService aqscbzhshService;
	
	
	/**
	 * 标准化咨询或安全培训报名审核首页
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/index")
	@ResponseBody
	public Object index(HttpServletRequest request,HttpServletResponse response){
		Map<String,Object> params = RequestUtil.resolveParams(request);
		List<AqsczxInfo> infos = aqscbzhshService.selectByParam(params);
		PageInfo<AqsczxInfo> pageinfo=new PageInfo<AqsczxInfo>(infos);
		return resultMap(infos, pageinfo.getTotal(), true, null);
	}
	
	
	/***
	 * 确认合同
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/confirmContract")
	@ResponseBody
	public Object confirmContract(HttpServletRequest request,HttpServletResponse response){
		try {
			int id = Integer.parseInt(request.getParameter("id"));
			int contractStatus = 1; //确认合同状态
			aqscbzhshService.updateContractStatus(id,contractStatus);
			return resultMap(true, null);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("确认合同失败:"+e.getLocalizedMessage(),e);
			return resultMap(false, e.getMessage());
		}
	}
	
	
	/***
	 * 审核安全生产标准化报名或审核安全类型培训报名
	 * @param request
	 * @param response
	 * @return
	 */
	@RequestMapping("/audit")
	@ResponseBody
	public Object audit(HttpServletRequest request,HttpServletResponse response){
		
		try {
			HttpSession session = request.getSession();
			Object uid = session.getAttribute("uid");
			
			if(uid == null ){
				return resultMap(false, "请先登入");
			}
			
			int id = Integer.parseInt(request.getParameter("id"));                  //审核id
			int applyStatus = Integer.parseInt(request.getParameter("applyStatus")); //审核状态
			String auditInstructions = request.getParameter("auditInstructions");    //审核说明
			String auditor = session.getAttribute("userName").toString();            //审核人
			
			aqscbzhshService.audit(id, applyStatus, auditInstructions, auditor);
			
			return resultMap(true,null);
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("审核安全生产标准化报名(安全类型培训报名):"+e.getLocalizedMessage(),e);
			return resultMap(false, e.getMessage());
		}
		
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
