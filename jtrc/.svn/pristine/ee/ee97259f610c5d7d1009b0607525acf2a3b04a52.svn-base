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
import com.i84.earnpoint.gdcl.service.ArchivesOutInfoService;
import com.i84.earnpoint.model.ArchivesOutInfo;
/**
 * 工资、任免、出国、会议等材料
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesOutInfoController extends ResultConstant{
     @Autowired
     private ArchivesOutInfoService archivesOutInfoService;
     
     @RequestMapping("/saveArchivesOutInfo")
     public void saveArchivesOutInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 ArchivesOutInfo record=new ArchivesOutInfo();response.setCharacterEncoding("utf-8");
    	 JSONObject object=new JSONObject();
    	 //获取
    	 String type=(String)param.get("type");
    	 String pname=(String)param.get("pname");//材料名称
    	 String uploadFile=request.getParameter("uploadFile");
    	 String pdate=(String)param.get("pdate");//真实时间
    	 String remark=(String)param.get("remark");//备注
    	 String pno=(String)param.get("pno");//档案号
    	 String staff=(String) request.getSession().getAttribute("uid");
    	 String changedate=(String)param.get("changedate");//变动时间
    	 String salarylevel=(String)param.get("salarylevel");//工资职级
    	 String zwsalary=(String)param.get("zwsalary");//职务岗位工资
    	 String jsalary=(String)param.get("jsalary");//津贴
    	 String xjsalary=(String)param.get("xjsalary");//薪级工资
    	 String jxsalary=(String)param.get("jxsalary");//绩效工资
    	 String gwsalary=(String)param.get("gwsalary");//岗位津贴
    	 String possalary=(String)param.get("possalary");//职务津贴
    	 String areasalary=(String)param.get("areasalary");//地区补贴
    	 String kqsalary=(String)param.get("kqsalary");//考勤奖
    	 String spsalary=(String)param.get("spsalary");//特岗津贴
    	 String tzsalary=(String)param.get("tzsalary");//提租补贴
    	 String nlevel=(String)param.get("nlevel");//未定级工资
    	 String changeorder=(String)param.get("changeorder");//变动依据
    	 String ptypeName=(String)param.get("ptypeName");//材料类型
    	 
    	 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
    	 
    	 
    	 //设置
    	 record.setSalaryLevel(salarylevel);
    	 record.setChangeOrder(changeorder);
    	 record.setpType(ptypeName);
    	 record.setpName(pname);
    	 record.setpNo(pno);
    	 record.setRemark(remark);
    	 String pagenum=(String)param.get("page_num");
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
    		//录入时间
        	 record.setAddDate(new Date());
    	 if(zwsalary!=null&&!zwsalary.trim().isEmpty()){
    		 record.setZwSalary(Float.parseFloat(zwsalary));
    	 }
    	 if(jsalary!=null&&!jsalary.trim().isEmpty()){
    		 record.setjSalary(Float.parseFloat(jsalary));
    	 }
    	 if(xjsalary!=null&&!xjsalary.trim().isEmpty()){
    		 record.setXjSalary(Float.parseFloat(xjsalary));
    	 }
    	 if(jxsalary!=null&&!jxsalary.trim().isEmpty()){
    		 record.setJxSalary(Float.parseFloat(jxsalary));
    	 }
    	 if(gwsalary!=null&&!gwsalary.trim().isEmpty()){
    		 record.setGwSalary(Float.parseFloat(gwsalary));
    	 }
    	 
    	 if(possalary!=null&&!possalary.trim().isEmpty()){
    		 record.setPosSalary(Float.parseFloat(possalary));
    	 }
    	 if(areasalary!=null&&!areasalary.trim().isEmpty()){
    		 record.setAreaSalary(Float.parseFloat(areasalary));
    	 }
    	 if(kqsalary!=null&&!kqsalary.trim().isEmpty()){
    		 record.setKqSalary(Float.parseFloat(kqsalary));
    	 }
    	 if(tzsalary!=null&&!tzsalary.trim().isEmpty()){
    		 record.setTzSalary(Float.parseFloat(tzsalary));
    	 }
    	 if(spsalary!=null&&!spsalary.trim().isEmpty()){
    		 record.setSpSalary(Float.parseFloat(spsalary));
    	 }
    	 if(nlevel!=null&&!nlevel.trim().isEmpty()){
    		 record.setnLevel(Float.parseFloat(nlevel));
    	 }

    	 if(pdate!=null&&!pdate.trim().isEmpty()){
    		 record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
    	 }
    	
    	 if(changedate!=null&&!changedate.trim().isEmpty()){
    		 record.setChangeDate(DateUtil.stringToDate(changedate, DateUtil.OYYYY_MM_DD));
    	 }
    	 //录入人
    	 if(staff!=null&&!staff.trim().isEmpty()){
    		 record.setStuff(Integer.valueOf(staff));
    	 }
    	 
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
    		 record.setFileCode(new SimpleDateFormat(
						DateUtil.YYYYMMDDHHMISS).format(new Date()));
    		int count= archivesOutInfoService.insertArchivesOutInfoSelective(record,fjparam,ptype);
    		if(count>0){
    			object.put("flag", true);
    			object.put("cause", "保存工资、任免、出国、会议等材料材料成功！");
    		}else{
    			object.put("flag", false);
    			object.put("cause", "保存工资、任免、出国、会议等材料材料失败！");
    		}
    		 
    	 }else{//修改
    	    record.setId(TextUtil.getInt(type));
    		int count=archivesOutInfoService.updateArchivesOutInfoSelective(record,fjparam,ptype);
     		if(count>0){
     			object.put("flag", true);
     			object.put("cause", "修改工资、任免、出国、会议等材料材料成功！");
     		}else{
     			object.put("flag", false);
     			object.put("cause", "修改工资、任免、出国、会议等材料材料失败！");
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
     
     @RequestMapping("/queryArchivesOutInfo")
     public @ResponseBody Map<String,Object> queryArchivesOutInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesOutInfo record=new ArchivesOutInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesOutInfoService.listArchivesOutInfos(record); 
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
     }
}
