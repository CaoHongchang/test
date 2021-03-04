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
import com.i84.earnpoint.gdcl.service.ArchivesKhInfoService;
import com.i84.earnpoint.model.ArchivesKhInfo;
/**
 * 鉴定考核考察材料
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesKhInfoController extends ResultConstant{
     @Autowired
     private ArchivesKhInfoService archivesKhInfoService;
     
     @RequestMapping("/saveArchivesKhInfo")
     public void saveArchivesKhInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 ArchivesKhInfo record=new ArchivesKhInfo();response.setCharacterEncoding("utf-8");
    	 JSONObject object=new JSONObject();
    	 //获取请求参数
    	 String type=(String)param.get("type");
    	 String pname=(String)param.get("pname"); //材料名称
    	 String uploadFile=request.getParameter("uploadFile");
    	 String pdate=(String)param.get("pdate");//真实时间
    	 String remark=(String)param.get("remark");//备注
    	 String pno=(String)param.get("pno");//档案号
    	 String staff=(String) request.getSession().getAttribute("uid");
    	 String pointname=(String)param.get("pointname");//单位名称
    	 String khdate=(String)param.get("khdate");//考核日期
    	 String zzstate=(String)param.get("zzstate");//政治态度与遵纪守法
    	 String workstate=(String)param.get("workstate");//工作态度
    	 String workresult=(String)param.get("workresult");//工作成果
    	 String dealmsg=(String)param.get("dealmsg");//解决实际问题能力
    	 String cxability=(String)param.get("cxability");//创新能力
    	 String gtability=(String)param.get("gtability");//沟通能力
    	 String zzability=(String)param.get("zzability");//组织能力
    	 String khresult=(String)param.get("khresult");//考核结果
    	 String khadvice=(String)param.get("khadvice");//被考核人意见
    	 String yearkh=(String)param.get("yearkh");//年度考核
    	 String zgadvice=(String)param.get("zgadvice");//主管意见
    	 String grall=(String)param.get("grall");//个人总结
    	 String pagenum=(String)param.get("page_num");
    	 
    	 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
    	 //获取参数结束
    	 //设置
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
    	 record.setPointName(pointname);
    	 record.setZzState(zzstate);
    	 record.setWorkState(workstate);
    	 record.setWorkResult(workresult);
    	 record.setDealMsg(dealmsg);
    	 record.setCxAbility(cxability);
    	 record.setGtAbility(gtability);
    	 record.setZzAbility(zzability);
    	 record.setKhResult(khresult);
    	 record.setKhAdvice(khadvice);
    	 record.setYearKh(yearkh);
    	 record.setZgAdvice(zgadvice);
    	 record.setGrAll(grall);
    	 record.setpName(pname);
    	 record.setpNo(pno);
 		 record.setRemark(remark);
 		//录入时间
    	 record.setAddDate(new Date());
    	 //真实时间
    	 if(pdate!=null&&!pdate.trim().isEmpty()){
    		 record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
    	 }
    	 if(khdate!=null&&!khdate.trim().isEmpty()){
    		 record.setKhDate(DateUtil.stringToDate(khdate, DateUtil.OYYYY_MM_DD));
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
 					if(size/1024/1024>3){//判断文件大小是否大于3M，删除文件
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
    		// 设置文件编码
				record.setFileCode(new SimpleDateFormat(
						DateUtil.YYYYMMDDHHMISS).format(new Date()));
    		int count= archivesKhInfoService.insertArchivesKhInfoSelective(record,fjparam,ptype);
    		if(count>0){
    			object.put("flag", true);
    			object.put("cause", "保存鉴定考核材料成功！");
    		}else{
    			object.put("flag", false);
    			object.put("cause", "保存鉴定考核材料失败！");
    		}
    		 
    	 }else{//修改
    	    record.setId(TextUtil.getInt(type));
    		int count=archivesKhInfoService.updateArchivesKhInfoSelective(record,fjparam,ptype);
     		if(count>0){
     			object.put("flag", true);
     			object.put("cause", "修改鉴定考核材料成功！");
     		}else{
     			object.put("flag", false);
     			object.put("cause", "修改鉴定考核材料失败！");
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
     
     @RequestMapping("/queryArchivesKhInfo")
     public @ResponseBody Map<String,Object> queryArchivesKhInfo(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesKhInfo record=new ArchivesKhInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesKhInfoService.listArchivesKhInfos(record); 
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
     }
}
