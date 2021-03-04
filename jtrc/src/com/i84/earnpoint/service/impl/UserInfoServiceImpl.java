package com.i84.earnpoint.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.ArchivesLogMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.ArchivesLog;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.service.UserInfoService;

@Service
@Transactional(propagation = Propagation.REQUIRED)  
public class UserInfoServiceImpl extends BaseService implements UserInfoService {
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Autowired
	private ArchivesLogMapper archiveslogmapper;

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NEVER)
	public List<UserInfo> selectUserInfoBySelective1(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectUserInfoBySelective1(userInfo);
	}
	@Override
	@Transactional(readOnly=true,propagation=Propagation.NEVER)
	public List<UserInfo> selectUserInfoBySelective(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectUserInfoBySelective(userInfo);
	}

	@Override
	@Transactional(readOnly=true,propagation=Propagation.NEVER)
	public UserInfo selectById(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int insertUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertSelective(userInfo);
	}

	@Override
	public int updateUserInfo(UserInfo userInfo) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKeySelective(userInfo);
	}

	public void insertLog(HttpServletRequest request, String mColumn,
			String mBefore, String mAfter, String mdTable, int orgUid,
			String dNo,String mColumnName) {

		ArchivesLog record = new ArchivesLog();
		record.setIp(TextUtil.getIpAddr(request));
		record.setMdDate(new Date());
		record.setmColumnName(mColumnName);
		record.setMdTableName("");
		record.setmColumn(mColumn);
		record.setmBefore(mBefore);
		record.setmAfter(mAfter);
		record.setMdTable(mdTable);
		record.setMdUid(TextUtil.getInt(request.getSession().getAttribute("uid")
				+ ""));
		record.setOrgUid(orgUid);
		record.setdNo(dNo);
		record.setmDate(new Date());
		archiveslogmapper.insert(record);
	}

	@Override
	public void ufcheck(HttpServletRequest request, String dNo, int orgUid,
			Object uf1, Object uf2) {
		TextUtil a = new TextUtil();
		List<Map<String,String>> rs = a.getFiledsInfo(uf1);
		List<Map<String,String>> rs1 = a.getFiledsInfo(uf2);
		if (rs != null && rs.size() > 0) {
			for (int i = 0; i < rs.size(); i++) {
				Map<String,String> p = rs.get(i);
				Map<String,String> p1 = rs1.get(i);
				Set<String> keys = p.keySet();

				if (keys != null) {

					for(String key :keys){

						//System.out.println(key);
						if("type".equals(key+"")||"king".equals(key+"")){
							continue;
						}
						///System.out.println(p.get("type")+":"+key+":"+p.get(key)+":"+p1.get(key));
						if((p.get("type")+"").indexOf("Integer")!=-1){
						
							if(TextUtil.getInt(p.get(key))!=TextUtil.getInt(p1.get(key)) &&p1.get(key)!=null){
								
								insertLog(
										request,
										key+"",
										p.get(key)+"",
										p1.get(key)+"", uf1.getClass().getSimpleName(), orgUid, dNo,p.get("king")+"");
							}
						}else if((p.get("type")+"").indexOf("Date")!=-1 &&p1.get(key)!=null){
							if((p.get(key)==null)||(!((p.get(key))).equals((p1.get(key))))){
								
								String a1 ="";
								if(p.get(key)!=null && !"null".equals(p.get(key)))
									a1 = DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,new Date(p.get(key)));
								
								String a2 ="";
								if(p1.get(key)!=null && !"null".equals(p1.get(key)))
								a2 = DateUtil.getFormatDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,new Date(p1.get(key)));
								insertLog(
										request,
										key+"",
										a1,
										a2, uf1.getClass().getSimpleName(), orgUid, dNo,p.get("king")+"");
							}
						}else if((p.get("type")+"").indexOf("String")!=-1 &&p1.get(key)!=null &&(p.get(key)!=null && !"".equals(p1.get(key)+""))){
							if(!(p.get(key)+"").equals(p1.get(key)+"")){
								
								insertLog(
										request,
										key+"",
										p.get(key)+"",
										p1.get(key)+"", uf1.getClass().getSimpleName(), orgUid, dNo,p.get("king")+"");
							}
						}
						

					}

				}

			}
		}


	}

	@Override
	public UserInfo getUserByPnum(String pnum) {
		return userInfoMapper.getUserByPnum(pnum);
	}
	@Override
	public List<Map<String, Object>> getxltjlist(
			Map<String, Object> param) {
		if(null != param.get("page")){
			PageHelper.startPage(Integer.parseInt(param.get("page")+""),Integer.parseInt(param.get("rows")+""));
		}
		List<Map<String, Object>> list = userInfoMapper.getxltjlist(param);
		
		return list;
	}
	
	
	@Override
	public void ExportXltjList(HttpServletResponse response) {
		
		String[] title={"机构名称","姓名","档案号","身份证","性别","出生年月","政治面貌","户籍地","外包单位","派遣单位","代理单位","工作单位","调入单位","调入时间","最高学历","博士研究生毕业院校","博士研究生毕业时间","学习专业","硕士研究生毕业学校","硕士研究生毕业时间","学习专业","大学本科毕业学校","大学本科毕业时间","学习专业","大学专科毕业学校","大学专科毕业时间","学习专业","高中毕业学校","高中毕业时间","中专毕业学校","中专毕业时间","学习专业"};
		HSSFWorkbook workbook = new HSSFWorkbook();
		HSSFSheet sheet = workbook.createSheet("根据学历筛选表");
		for (int i = 0; i < title.length; i++) {
			sheet.setColumnWidth(i, 3000);
		}
		
		// 标题栏
		HSSFRow execl_title = sheet.createRow(0);
		//创建样式
		HSSFCellStyle titleCellStyle = workbook.createCellStyle();
		//创建字体样式，并加粗
		HSSFFont boldFont = workbook.createFont();
		boldFont.setFontHeightInPoints((short)10);
		boldFont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);
		//设置字体居中显示
		titleCellStyle.setAlignment(HSSFCellStyle.VERTICAL_CENTER);
		titleCellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleCellStyle.setVerticalAlignment(HSSFCellStyle.ALIGN_CENTER);
		titleCellStyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);
		titleCellStyle.setFont(boldFont);
		//设置高度
		execl_title.setHeight((short) 850);
		
		for (int i = 0; i < title.length; i++) {
			HSSFCell cell = execl_title.createCell(i);// 创建单元格
			cell.setCellStyle(titleCellStyle);// 设置标题栏样式加粗并居中
			cell.setCellValue(title[i]);
		}
		Map<String, Object> param=new HashMap<String, Object>();
		List<Map<String,Object>> list =userInfoMapper.getxltjlist(param);
	
		int j=1;
		HSSFCell cell_content;
		for (Map<String, Object> map : list) {
			HSSFRow tableRow = sheet.createRow(j);
			cell_content=tableRow.createCell(0);
			cell_content.setCellValue((String)(map.get("org_name")==null?"":map.get("org_name")));
			cell_content=tableRow.createCell(1);
			cell_content.setCellValue((String)(map.get("name")==null?"":map.get("name")));
			cell_content=tableRow.createCell(2);
			cell_content.setCellValue((String)(map.get("dpno")==null?"":map.get("dpno")));
			cell_content=tableRow.createCell(3);
			cell_content.setCellValue((String)(map.get("pnum")==null?"":map.get("pnum")));
			cell_content=tableRow.createCell(4);
			cell_content.setCellValue((String)(map.get("sex")==null?"":map.get("sex")));
			cell_content=tableRow.createCell(5);
			cell_content.setCellValue((String)(map.get("zzmm")==null?"":map.get("zzmm")));
			cell_content=tableRow.createCell(6);
			cell_content.setCellValue((String)(map.get("domicile")==null?"":map.get("domicile")));
			cell_content=tableRow.createCell(7);
			cell_content.setCellValue((String)(map.get("human_out1")==null?"":map.get("human_out1")));
			cell_content=tableRow.createCell(8);
			cell_content.setCellValue((String)(map.get("bd_unit")==null?"":map.get("bd_unit")));
			cell_content=tableRow.createCell(9);
			cell_content.setCellValue((String)(map.get("point_proxy1")==null?"":map.get("point_proxy1")));
			cell_content=tableRow.createCell(10);
			cell_content.setCellValue((String)(map.get("work_name")==null?"":map.get("work_name")));
			cell_content=tableRow.createCell(11);
			cell_content.setCellValue((String)(map.get("in_point")==null?"":map.get("in_point")));
			cell_content=tableRow.createCell(12);
			cell_content.setCellValue((String)(map.get("in_date")==null?"":map.get("in_date")));
			cell_content=tableRow.createCell(13);
			cell_content.setCellValue((String)(map.get("doctor_school_name")==null?"":map.get("doctor_school_name")));
			cell_content=tableRow.createCell(14);
			cell_content.setCellValue((String)(map.get("doctor_graduation_date")==null?"":map.get("doctor_graduation_date")));
			cell_content=tableRow.createCell(15);
			cell_content.setCellValue((String)(map.get("doctor_major")==null?"":map.get("doctor_major")));
			cell_content=tableRow.createCell(16);
			cell_content.setCellValue((String)(map.get("master_school_name")==null?"":map.get("master_school_name")));
			cell_content=tableRow.createCell(17);
			cell_content.setCellValue((String)(map.get("master_graduation_date")==null?"":map.get("master_graduation_date")));
			cell_content=tableRow.createCell(18);
			cell_content.setCellValue((String)(map.get("master_major")==null?"":map.get("master_major")));
			cell_content=tableRow.createCell(19);
			cell_content.setCellValue((String)(map.get("bachelor_school_name")==null?"":map.get("bachelor_school_name")));
			cell_content=tableRow.createCell(20);
			cell_content.setCellValue((String)(map.get("bachelor_graduation_date")==null?"":map.get("bachelor_graduation_date")));
			cell_content=tableRow.createCell(21);
			cell_content.setCellValue((String)(map.get("bachelor_major")==null?"":map.get("bachelor_major")));
			cell_content=tableRow.createCell(22);
			cell_content.setCellValue((String)(map.get("specialized_school_name")==null?"":map.get("specialized_school_name")));
			cell_content=tableRow.createCell(23);
			cell_content.setCellValue((String)(map.get("specialized_graduation_date")==null?"":map.get("specialized_graduation_date")));
			cell_content=tableRow.createCell(24);
			cell_content.setCellValue((String)(map.get("specialized_major")==null?"":map.get("specialized_major")));
			cell_content=tableRow.createCell(25);
			cell_content.setCellValue((String)(map.get("high_school_name")==null?"":map.get("high_school_name")));
			cell_content=tableRow.createCell(26);
			cell_content.setCellValue((String)(map.get("high_graduation_date")==null?"":map.get("high_graduation_date")));
			cell_content=tableRow.createCell(27);
			cell_content.setCellValue((String)(map.get("technical_school_name")==null?"":map.get("technical_school_name")));
			cell_content=tableRow.createCell(28);
			cell_content.setCellValue((String)(map.get("technical_graduation_date")==null?"":map.get("technical_graduation_date")));
			cell_content=tableRow.createCell(29);
			cell_content.setCellValue((String)(map.get("technical_major")==null?"":map.get("technical_major")));
			j++;
		}
		try {
			response.setHeader("Content-Type", "application/force-download;"); 
			String filename="根据学历筛选表"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+".xls";
			response.setHeader("Content-disposition", "attachment;filename="+new String(filename.getBytes("GBK"),"ISO-8859-1"));
			response.setContentType("application/ms-excel");
			OutputStream out=response.getOutputStream();
			workbook.write(out);//写到响应流里面
			out.flush();
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	@Override
	public Map<String, Object> getuserBydpno(Map<String, Object> param) {

		return userInfoMapper.getuserBydpno(param);
	}
	@Override
	public Map<String,Object> getUserById(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.getUserById(id);
	}

}
