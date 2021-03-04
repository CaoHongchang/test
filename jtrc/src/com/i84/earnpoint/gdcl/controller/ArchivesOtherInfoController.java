package com.i84.earnpoint.gdcl.controller;

import java.io.File;
import java.io.FileInputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.gdcl.service.ArchivesOtherInfoService;
import com.i84.earnpoint.model.ArchivesOtherInfo;
/**
 * 其他材料
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesOtherInfoController extends ResultConstant{
     @Autowired
     private ArchivesOtherInfoService archivesOtherInfoService;
     
     @RequestMapping("/saveArchivesOtherInfo")
     public void saveArchivesOtherInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 JSONObject object=new JSONObject();response.setCharacterEncoding("utf-8");
    	 ArchivesOtherInfo record=new ArchivesOtherInfo();
    	 String type=(String)param.get("type");
    	 String pname=(String)param.get("pname");
    	 String uploadFile=request.getParameter("uploadFile");
    	 String pdate=(String)param.get("pdate");
    	 String remark=(String)param.get("remark");
    	 String pno=(String)param.get("pno");
    	 String staff=(String) request.getSession().getAttribute("uid");
    	 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
    	 //材料名称
    	 if(pname!=null&&!pname.trim().isEmpty()){
    		 record.setpName(pname);
    	 }
    	 String pagenum=(String)param.get("page_num");
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
    	 //真实时间
    	 if(pdate!=null&&!pdate.trim().isEmpty()){
    		 record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
    	 }
    	 //档案号
    	 if(pno!=null&&!pno.trim().isEmpty()){
    		record.setpNo(pno);
    	 }
    	 //备注
    	 if(remark!=null){
    		 record.setRemark(remark);
    	 }
    	 //录入人
    	 if(staff!=null&&!staff.trim().isEmpty()){
    		 record.setStuff(Integer.valueOf(staff));
    	 }
    	 //录入时间
    	 record.setAddDate(new Date());
    	 try{
    		 if (uploadFile != null) {
  				String suffix=uploadFile.substring(uploadFile.lastIndexOf("."));
  				String upsufix=suffix.toUpperCase();
  				if(!".JPG".equals(upsufix)&&!".JPEG".equals(upsufix)&&!".PNG".equals(upsufix)&&!".TIFF".equals(upsufix)){
 					object.put("flag", false);
 					object.put("cause", "文件格式需为JPG，JPEG，PNG，TIFF格式！");
 					write(response, object);
 					return;
 				}
  				String newFilename=ResultConstant.getRandNum(32)+suffix;
  				// 上传文件
  				File upload = fileupload(request, response, "upload/archives/",
  						newFilename);
  				if (upload != null) {
  					FileInputStream stream=new FileInputStream(upload);
 					long size=stream.getChannel().size();
 					if(size/1024/1024>3){
 						//判断文件大小是否大于3M，删除文件
 						object.put("flag", false);
 	 					object.put("cause", "文件大小不能大于3M！");
 	 					write( response,object);
 	 					upload.delete();
 	 					stream.close();
 						return ;
 					}
 					stream.close();
  					// 设置文件名
  					record.setFileName(newFilename);
  					// 设置文件路径
  					record.setpUrl("/upload/archives/" + newFilename);
  					// 设置文件编码
  					record.setFileCode(new SimpleDateFormat(
  							DateUtil.YYYYMMDDHHMISS).format(new Date()));
  				}else{
 					object.put("flag", false);
 					object.put("cause", "文件上传失败！");
 					write( response,object);
 					return;
 				}
  			}
    	 //插入
    	 if(type!=null&&type.trim().equals("")){
    		// 设置文件编码
				record.setFileCode(new SimpleDateFormat(
						DateUtil.YYYYMMDDHHMISS).format(new Date()));
    		int count= archivesOtherInfoService.insertArchivesOtherInfoSelective(record, fjparam, ptype);
    		if(count>0){
    			object.put("flag", true);
    			object.put("cause", "保存其他材料成功！");
    		}else{
    			object.put("flag", false);
    			object.put("cause", "保存其他材料失败！");
    		}
    		 
    	 }else{//修改
    	    record.setId(TextUtil.getInt(type));
    		int count=archivesOtherInfoService.updateArchivesOtherInfoSelective(record, fjparam, ptype);
     		if(count>0){
     			object.put("flag", true);
     			object.put("cause", "修改其他材料成功！");
     		}else{
     			object.put("flag", false);
     			object.put("cause", "修改其他材料失败！");
     		}
    	 }
    	 write( response,object);
    	 }catch(Exception e){
    		 e.printStackTrace();
    		 object.put("flag", false);
  			 object.put("cause", e.getMessage());
  			write( response,object);
    	 }
     }
     
     @RequestMapping("/queryArchivesOtherInfo")
     public @ResponseBody Map<String,Object> queryArchivesOtherInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesOtherInfo record=new ArchivesOtherInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesOtherInfoService.listArchivesOtherInfos(record); 
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
     }
}