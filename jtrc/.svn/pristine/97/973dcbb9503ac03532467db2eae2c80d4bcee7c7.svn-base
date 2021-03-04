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
import com.i84.earnpoint.gdcl.service.ArchivesDisciplinedInfoService;
import com.i84.earnpoint.model.ArchivesDisciplinedInfo;

/**
 * 处分材料
 * 
 * @author CHEN
 * 
 */
@Controller
@RequestMapping("/gdcl")
public class ArchivesDisciplinedInfoController extends ResultConstant {
	@Autowired
	private ArchivesDisciplinedInfoService archivesDisciplinedInfoService;

	@RequestMapping("/saveArchivesDisciplinedInfo")
	public void saveArchivesDisciplinedInfo(
			@RequestParam Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {response.setCharacterEncoding("utf-8");
		ArchivesDisciplinedInfo record = new ArchivesDisciplinedInfo();
		JSONObject object = new JSONObject();
		String type = (String) param.get("type");//插入或修改
		String pname = (String) param.get("pname"); // 材料名称
		String uploadFile = request.getParameter("uploadFile");//上传的文件名称
		String pdate = (String) param.get("pdate");//真实时间
		String remark = (String) param.get("remark");// 备注
		String pno = (String) param.get("pno"); // 档案号
		String staff = (String) request.getSession().getAttribute("uid");
		String discipname = (String) param.get("discipname");// 处分名称
		String pzname = (String) param.get("pzname");// 处分批准机关
		String pzdate = (String) param.get("zzdate");// 处分批准日期
		String outdate = (String) param.get("outdate");// 撤销日期
		String discipinfo = (String) param.get("discipinfo");// 处分原因
		
		 String fjparam=request.getParameter("fjParam");
    	 String ptype=(String)param.get("ptype");
		
		record.setDiscipName(discipname);
		record.setPzName(pzname);
		record.setDiscipInfo(discipinfo);
		record.setpName(pname);
		record.setpNo(pno);
		record.setRemark(remark);
		// 录入时间
		record.setAddDate(new Date());
		 String pagenum=(String)param.get("page_num");
    	 if(pagenum!=null&&!pagenum.trim().isEmpty()){
    		 record.setPageNum(TextUtil.getInt(pagenum));
    	 }
		if (pzdate != null && !pzdate.trim().isEmpty()) {
			record.setZzDate(DateUtil.stringToDate(pzdate, DateUtil.OYYYY_MM_DD));
		}
		if (outdate != null && !outdate.trim().isEmpty()) {
			record.setOutDate(DateUtil.stringToDate(outdate,
					DateUtil.OYYYY_MM_DD));
		}
		// 真实时间
		if (pdate != null && !pdate.trim().isEmpty()) {
			record.setpDate(DateUtil.stringToDate(pdate, DateUtil.OYYYY_MM_DD));
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
			// 插入
			if (type != null && type.trim().equals("")) {
				// 设置文件编码
					record.setFileCode(new SimpleDateFormat(
							DateUtil.YYYYMMDDHHMISS).format(new Date()));
				int count = archivesDisciplinedInfoService
						.insertDisciplinedInfoSelective(record,fjparam,ptype);
				if (count > 0) {
					object.put("flag", true);
					object.put("cause", "保存处分材料成功！");
				} else {
					object.put("flag", false);
					object.put("cause", "保存处分材料失败！");
				}

			} else {// 修改
				record.setId(TextUtil.getInt(type));
				int count = archivesDisciplinedInfoService
						.updateDisciplinedInfoSelective(record,fjparam,ptype);
				if (count > 0) {
					object.put("flag", true);
					object.put("cause", "修改处分材料成功！");
				} else {
					object.put("flag", false);
					object.put("cause", "修改处分材料失败！");
				}
			}
			write(response, object);
		} catch (Exception e) {
			e.printStackTrace();
			object.put("flag", false);
			object.put("cause", e.getMessage());
			write( response,object);
		}
	}

	@RequestMapping("/queryArchivesDisciplinedInfo")
	public @ResponseBody
	Map<String, Object> queryArchivesDisciplinedInfo(
			@RequestParam Map<String, Object> param,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		 String pno=(String)param.get("pno");
    	 int page=TextUtil.getInt(param.get("page"));
    	 page=page==0?1:page;
    	 int rows=TextUtil.getInt(param.get("rows"));
    	 PageHelper.startPage(page, rows);
    	 ArchivesDisciplinedInfo record=new ArchivesDisciplinedInfo();
    	 record.setpNo(pno);
    	 List<Map<String,Object>> list= archivesDisciplinedInfoService.listArchivesDisciplinedInfos(record);
    	 PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
    	 return resultMap(list, pageInfo.getTotal(), true, "");
	}

}
