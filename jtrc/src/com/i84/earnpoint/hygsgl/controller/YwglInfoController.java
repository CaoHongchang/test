package com.i84.earnpoint.hygsgl.controller;



import java.io.File;
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

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ImportExcel;

import com.i84.earnpoint.hygsgl.service.YwglInfoService;
import com.i84.earnpoint.hygsgl.service.YwslShInfoService;
import com.i84.earnpoint.model.BusinessOtherInfo;
import com.i84.earnpoint.model.Page;
import com.i84.earnpoint.model.YgImportVo;



/**
 * 业务管理
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/ywgl")
public class YwglInfoController {
	@Autowired 
	private YwglInfoService ywglInfoService;
	@Autowired
	private YwslShInfoService ywslShInfoService;
	/**业务管理新增
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addYwgl")  
	public  @ResponseBody Map<String, Object> addYwgl(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			String id=request.getParameter("id");
			//附件列表
			String fjparam=request.getParameter("fjParam");
			System.out.println(fjparam);
			//用户id
			//用户id
			HttpSession session = request.getSession();
			//登录用户id
			String uid=session.getAttribute("uid")==null?null:session.getAttribute("uid").toString();	
			
			if(StringUtils.isEmpty(uid)){
				return ResultConstant.resultMap(flag,"获取用户信息失败，请重新登录！");  

			}
			boolean c=false;
			if(StringUtils.isNotEmpty(id)){
				c=ywglInfoService.editYwgl(id,uid,ResultConstant.paramSetAdd(request), fjparam);
				
			}else{
			  c=ywglInfoService.addYwgl(ResultConstant.paramSetAdd(request),fjparam);
			}
			if(c){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
    
	/** 业务列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywglView")  
	public  @ResponseBody Map<String, Object> ywglView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> list=null;
		try {
			String typeId=request.getParameter("typeId");
			Map m=ResultConstant.paramSet(request);
			m.put("typeId", typeId);
			list=ywglInfoService.selectYwglList(m);
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
	/**删除业务
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delYwglFuc")  
	public  @ResponseBody Map<String, Object> delYwglFuc(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			
			String id=request.getParameter("id");
			Map<String,Object>m=new HashMap<String, Object>();
			m.put("businessId", id);
			m=ywglInfoService.selectIsExistYwsl(m);
			if(m!=null){
				if(Long.valueOf(m.get("total").toString())>0){
					return ResultConstant.resultMap(flag,"该业务下已有业务申请，不能删除！");

				}
				
			}
			
			boolean c=ywglInfoService.editYwgl(id);
			
			
			
			if(c){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	
	/**附件列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ywglfjList")  
	public  @ResponseBody Map<String, Object> ywglfjList(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";
		List<Map<String,Object>> list=null;
		try {
			String bid=request.getParameter("bid");
			if(StringUtils.isNotBlank(bid)){
			List<Map<String,Object>> fjlist=new ArrayList<Map<String,Object>>();
			Map<String, Object> m1=	new HashMap<String, Object>();
			m1.put("bid", bid);
			m1.put("bType", 2);//业务类型（1：业务受理信息，2：业务基础信息）
			list=ywslShInfoService.selectByfjList(m1);
			if(list!=null &&list.size()>0){
				for(Map<String, Object> fjMap:list){
					fjMap.put("url", fjMap.get("fjUrl"));
					fjMap.put("name", fjMap.get("fjName"));
					fjMap.put("bid", fjMap.get("bid"));
					fjMap.put("id", fjMap.get("id"));
					//fjMap.put("fjUrl", fjMap.get("fjUrl"));
					fjlist.add(fjMap);
				}
			}
			return ResultConstant.resultMap(fjlist,flag,cause);

			}
			return ResultConstant.resultMap(null,flag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据异常"; 
		}
		return ResultConstant.resultMap(list,flag,cause);

	}
	
	/**添加附件
	 * @param response
	 * @param request
	 */
	@RequestMapping("/ywUpload")  
	public  void ywUpload(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String cause="";

		try {
			
			//获取解析器  
			CommonsMultipartResolver resolver = new CommonsMultipartResolver(request.getSession().getServletContext());  
			//判断是否是文件  
			if(resolver.isMultipart(request)){  
				//进行转换  
				MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest)(request);  
				//获取所有文件名称  
				Iterator<String> it = multiRequest.getFileNames();  
				while(it.hasNext()){  
					//根据文件名称取文件  
					MultipartFile file = multiRequest.getFile(it.next());  
					String fileName = file.getOriginalFilename();//原文件名  
					System.out.println(fileName);
					//上传时生成的临时文件保存目录
					String tempPath = ResultConstant.getWEB_ROOTPath() +"temp/hygsgl/upload/";
					File tmpFile = new File(tempPath);
					if (!tmpFile.exists()) {
						//创建临时目录
						tmpFile.mkdir();

					}
					String newFileName=ResultConstant.getRandNum(32)+"."+ResultConstant.lastIndexOf(fileName, ".");
					String localPath =ResultConstant.getWEB_ROOTPath() +"temp/hygsgl/upload/"+ newFileName; 
					File newFile = new File(localPath);  
					System.out.println("临时文件保存路径："+localPath);
					//上传的文件写入到指定的文件中  
					file.transferTo(newFile); 
					Map<String, Object>map=new HashMap<String, Object>();
					map.put("name", fileName);
					map.put("url", "temp/hygsgl/upload/"+newFileName);
					map.put("flag", true);
					//return ResultConstant.resultMap(map,true,cause);
//					Map<String, Object> resultMap = new HashMap<String, Object>();
//			    	resultMap.put("rows", map);
//					resultMap.put("flag", true);
//					resultMap.put("cause", cause);
					
					//String json=ResultConstant.mapToJson(map);
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", true);
					jsonObject.put("rows", map);
					jsonObject.put("cause", cause);
					ResultConstant.write(response, jsonObject);
					
				}
				
				
			}
			
		
			
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		//return ResultConstant.resultMap(flag,cause);

	}

	
	/**附件下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/downFj")  
	@ResponseBody
	public void downFj(HttpServletResponse response,HttpServletRequest request){  
		try {
			String id=request.getParameter("id");
			if(StringUtils.isNotEmpty(id)){
			BusinessOtherInfo businessOtherInfo=ywglInfoService.selectBusinessOther(Integer.valueOf(id));	
			ResultConstant.fileDownload(request, response, "",businessOtherInfo.getUrl() ,businessOtherInfo.getName());//员工导入模板
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

	}
	
}
