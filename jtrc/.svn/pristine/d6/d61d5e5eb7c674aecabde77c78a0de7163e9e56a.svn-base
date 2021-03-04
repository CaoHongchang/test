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
import com.i84.earnpoint.gdcl.service.ArchivesProInfoService;
import com.i84.earnpoint.model.ArchivesProInfo;
/**
 * 学历和评聘专业职务材料
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesProInfoController extends ResultConstant{
     @Autowired
     private ArchivesProInfoService archivesProInfoService;
     
     @RequestMapping("/saveArchivesProInfo")
     public void saveArchivesProInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 response.setCharacterEncoding("utf-8");
    	 ArchivesProInfo record=new ArchivesProInfo();
    	 JSONObject object=new JSONObject();
    	 //获取
    	 String type=(String)param.get("type");
    	 String pname=(String)param.get("pname"); //材料名称
    	 String uploadFile=request.getParameter("uploadFile");
    	 String pdate=(String)param.get("pdate");//真实时间
    	 String remark=(String)param.get("remark");//备注
    	 String pno=(String)param.get("pno");//档案号
    	 String staff=(String) request.getSession().getAttribute("uid");
    	 String stype=(String)param.get("stype");//教育类型
    	 String onlinestage=(String)param.get("onlinestage");//在学年级
    	 String schoolname=(String)param.get("schoolname");//学习（培训单位）名称
    	 String indate=(String)param.get("indate");//入学日期
    	 String outdate=(String)param.get("sdate");//毕业（授予）日期
    	 String content=(String)param.get("content");//新学专业（培训内容）
    	 String education=(String)param.get("education");//学历
    	 String degree=(String)param.get("degree");//学位
    	 String zname=(String)param.get("zname");//证书名称
    	 String zno=(String)param.get("zno");//证书编号
    	 String fzname=(String)param.get("fzname");//发证机关
    	 String ptypeName=(String)param.get("ptypeName");//材料类型
    	 
    	 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
    	 //设置
    	 record.setsType(stype);
    	 record.setOnlineStage(onlinestage);
    	 record.setSchoolName(schoolname);
    	 record.setContent(content);
    	 record.setEducation(education);
    	 record.setDegree(degree);
    	 record.setzName(zname);
    	 record.setzNo(zno);
    	 record.setFzName(fzname);
    	 record.setpType(ptypeName);
    	 record.setpName(pname);
    	 record.setpNo(pno);
		 record.setRemark(remark);
		 String pagenum=(String)param.get("page_num");
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
    	 //真实时间
    	 if(pdate!=null&&!pdate.trim().isEmpty()){
    		 record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
    	 }
    	 if(indate!=null&&!indate.trim().isEmpty()){
    		 record.setInDate(DateUtil.stringToDate(indate, DateUtil.OYYYY_MM_DD));
    	 }
    
    	 if(outdate!=null&&!outdate.trim().isEmpty()){
    		 record.setsDate(DateUtil.stringToDate(outdate, DateUtil.OYYYY_MM_DD));
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
 						object.put("flag", false);//判断文件大小是否大于3M，删除文件
 	 					object.put("cause", "文件大小不能大于3M！");
 	 					write( response,object);
 	 					stream.close();
 	 					upload.delete();
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
    		int count= archivesProInfoService.insertArchivesProInfoSelective(record,fjparam,ptype);
    		if(count>0){
    			object.put("flag", true);
    			object.put("cause", "保存学历和评聘专业职务材料成功！");
    		}else{
    			object.put("flag", false);
    			object.put("cause", "保存学历和评聘专业职务材料失败！");
    		}
    		 
    	 }else{//修改
    	    record.setId(TextUtil.getInt(type));
    		int count=archivesProInfoService.updateArchivesProInfoSelective(record,fjparam,ptype);
     		if(count>0){
     			object.put("flag", true);
     			object.put("cause", "修改学历和评聘专业职务材料成功！");
     		}else{
     			object.put("flag", false);
     			object.put("cause", "修改学历和评聘专业职务材料失败！");
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
     
     @RequestMapping("/queryArchivesProInfo")
     public @ResponseBody Map<String,Object> queryArchivesProInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesProInfo record=new ArchivesProInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesProInfoService.listArchivesProInfos(record); 
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
     }
}
