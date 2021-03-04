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
import com.i84.earnpoint.gdcl.service.ArchivesRewardInfoService;
import com.i84.earnpoint.model.ArchivesRewardInfo;

/**
 * 奖励材料
 * 
 * @author CHEN
 * 
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesRewardInfoController extends ResultConstant {
	@Autowired
	private ArchivesRewardInfoService archivesRewardInfoService;

	@RequestMapping("/saveArchivesRewardInfo")
	public void saveArchivesRewardInfo(@RequestParam Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {response.setCharacterEncoding("utf-8");
		ArchivesRewardInfo record = new ArchivesRewardInfo();
		JSONObject object = new JSONObject();
		String type = (String) param.get("type");
		String pname = (String) param.get("pname");// 材料名称
		String uploadFile = request.getParameter("uploadFile");
		String pdate = (String) param.get("pdate");// 真实时间
		String remark = (String) param.get("remark");// 备注
		String pno = (String) param.get("pno");// 档案号
		String staff = (String) request.getSession().getAttribute("uid");
		String readname = (String) param.get("readname");// 奖励名称
		String pzname = (String) param.get("pzname");// 奖励批准机构
		String zzdate = (String) param.get("zzdate");// 奖励颁发日期
		String outdate = (String) param.get("outdate");// 奖励撤销日期
		String reardinfo = (String) param.get("reardinfo");// 奖励原因
		 String pagenum=(String)param.get("page_num");
		 
		 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
    	 
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
		record.setpName(pname);
		record.setReadName(readname);
		record.setPzName(pzname);
		record.setReardInfo(reardinfo);
		record.setpNo(pno);
		record.setRemark(remark);
		// 录入时间
		record.setAddDate(new Date());
		// 真实时间
		if (pdate != null && !pdate.trim().isEmpty()) {
			record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
		}
		if (zzdate != null && !zzdate.trim().isEmpty()) {
			record.setZzDate(DateUtil
					.stringToDate(zzdate, DateUtil.OYYYY_MM_DD));
		}
		// 真实时间
		if (outdate != null && !outdate.trim().isEmpty()) {
			record.setOutDate(DateUtil.stringToDate(outdate,
					DateUtil.OYYYY_MM_DD));
		}

		// 录入人
		if (staff != null && !staff.trim().isEmpty()) {
			record.setStuff(Integer.valueOf(staff));
		}
		try {
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
			// 插入
			if (type != null && type.trim().equals("")) {
				// 设置文件编码
					record.setFileCode(new SimpleDateFormat(
							DateUtil.YYYYMMDDHHMISS).format(new Date()));
				int count = archivesRewardInfoService
						.insertArchivesRewardInfoSelective(record,fjparam,ptype);
				if (count > 0) {
					object.put("flag", true);
					object.put("cause", "保存奖励材料成功！");
				} else {
					object.put("flag", false);
					object.put("cause", "保存奖励材料失败！");
				}

			} else {// 修改
				record.setId(TextUtil.getInt(type));
				int count = archivesRewardInfoService
						.updateArchivesRewardInfoSelective(record,fjparam,ptype);
				if (count > 0) {
					object.put("flag", true);
					object.put("cause", "修改奖励材料成功！");
				} else {
					object.put("flag", false);
					object.put("cause", "修改奖励材料失败！");
				}
			}
			write( response,object);
		} catch (Exception e) {
			e.printStackTrace();
			object.put("flag", false);
			object.put("cause", e.getMessage());
			write( response,object);
		}
	}

	@RequestMapping("/queryArchivesRewardInfo")
	public @ResponseBody
	Map<String, Object> queryArchivesRewardInfo(
			@RequestParam Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesRewardInfo record=new ArchivesRewardInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesRewardInfoService.listArchivesRewardInfos(record); 
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
	}
}
