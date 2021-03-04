package com.i84.earnpoint.daxt.service.impl;


import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.daxt.service.UserMgInfoService;
import com.i84.earnpoint.mapper.ArchivesLogMapper;
import com.i84.earnpoint.mapper.UserMgInfoMapper;
import com.i84.earnpoint.model.DaExportAllVo;
import com.i84.earnpoint.model.DaExportVo;
import com.i84.earnpoint.rygl.service.RyglService;
 
/**
 * 人才管理信息具体实现类
 * @author wangsc
 *
 */
@Service
public class UserMgInfoServiceImpl implements UserMgInfoService {

	@Autowired
	private UserMgInfoMapper userMgInfoMapper;
	@Autowired
	private ArchivesLogMapper archivesLogMapper;
	@Autowired 
	public RyglService ryglService;
	
	@Override
	public List<Map<String, Object>> queryResidenceQsInfoList(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return userMgInfoMapper.selectUserMgInfoList(record);
	}
	
	@Override
	public List<Map<String, Object>> countuResidenceQsInfoList(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		return userMgInfoMapper.countuUserMgInfoList(record);
	}

	@Override
	public List<Map<String, Object>> countuResidenceQsInfoListBySex(Map<String, Object> params) {
		return userMgInfoMapper.countuUserMgInfoListBySex(params);
	}


	@Override
	public List<Map<String, Object>> countuResidenceQsInfoListByBirthday(Map<String, Object> params) {	 
		return userMgInfoMapper.countuUserMgInfoListByBirthday(params);
	}

	@Override
	public List<Map<String, Object>> countuResidenceQsInfoListByDegree(Map<String, Object> params) {
		return userMgInfoMapper.countuUserMgInfoListByDegree(params);
	}

	@Override
	public List<Map<String, Object>> countuResidenceQsInfoListByZzmm(Map<String, Object> params) {	
		return userMgInfoMapper.countuUserMgInfoListByZzmm(params);
	}

	@Override
	public List<Map<String, Object>> countuResidenceQsInfoListByDtype(Map<String, Object> params) {
		return userMgInfoMapper.countuUserMgInfoListByDtype(params);
	}

 
	@Override
	public String getNextDpno(String date,String s) {
		String dpno = "0000001";
		try{
			Map p1 = new HashMap();
			p1.put("s", s);
			dpno = userMgInfoMapper.getNextdPno(p1);
			if(StringUtils.isBlank(dpno) || dpno.length() == 0){
				dpno = "0000001";
			}else{
				int temp = Integer.parseInt(dpno)+1;
				if(temp < 10){
					dpno = "000000" + temp;
				}else if(temp < 100){
					dpno = "00000" + temp;
				}else if(temp < 1000){
					dpno = "0000"+temp;
				}else if(temp < 10000){
					dpno = "000"+temp;
				}else if(temp < 100000){
					dpno = "00"+temp;
				}else if(temp < 1000000){
					dpno = "0"+temp;
				}else if(temp < 10000000){
					dpno = ""+temp;
				}
			}
			
			Map<String, Object> params = new HashMap<String,Object>();
			params.put("dpno", s+date+dpno);
			Map p = userMgInfoMapper.getdabh1(params);
			if(p!=null){
				userMgInfoMapper.updateNextDpno(p1);
				dpno = getNextDpno(date, s);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			dpno = "0000001";
		}
		return dpno;
	}
	
	@Override
	public String getNextPno(String date) {
		String pno = "0000001";
		try{
			pno = userMgInfoMapper.getNextPno();
			
			if(StringUtils.isBlank(pno) || pno.length() == 0){
				pno = "0000001";
			}else{
				int temp = Integer.parseInt(pno)+1;
				if(temp < 10){
					pno = "000000" + temp;
				}else if(temp < 100){
					pno = "00000" + temp;
				}else if(temp < 1000){
					pno = "0000"+temp;
				}else if(temp < 10000){
					pno = "000"+temp;
				}else if(temp < 100000){
					pno = "00"+temp;
				}else if(temp < 1000000){
					pno = "0"+temp;
				}else if(temp < 10000000){
					pno = ""+temp;
				}
			}
			
			Map<String, Object> params = new HashMap<String,Object>();
			params.put("pno", date+pno);
			Map p = userMgInfoMapper.getdabh(params);
			if(p!=null){
				userMgInfoMapper.updateNextPno();
				pno = getNextPno(date);
			}
			
		}catch(Exception e){
			e.printStackTrace();
			pno = "0000001";
		}
		return pno;
	}
	
	/*//全部导出
	@Override
	public void daAllExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
			String record = request.getParameter("ids");
		try {
			
			List<DaExportVo> da=userMgInfoMapper.exportAllDaList();
			
			ExcelExport<DaExportVo> ex = new ExcelExport<DaExportVo>();
			List resultList=new ArrayList(); 
			if(da.size()>0){
				
				List<DaExportVo> da1 = new ArrayList();
				for (int i = 0; i < da.size(); i++) {
					DaExportVo dv = da.get(i);
					da1.add(dv);
				}
				
				resultList.add(da1);
			}
			
			
			
			String fileName = "档案信息导出.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("档案信息");
			String syDelTitle="";
			
			Map<String,Object>title=new HashMap<String, Object>();
			title.put("1", syDelTitle);	
			ex.exportExcel2(titleList, resultList, title,output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}*/
	
	//全部导出
		@Override
		public void daAllExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
//				String record = request.getParameter("ids");
//				OutputStream out = null;  
//			try {
//				
//				List<DaExportVo> da=userMgInfoMapper.exportAllDaList();
//				ExcelExport<DaExportVo> ex = new ExcelExport<DaExportVo>();
//	            out = response.getOutputStream();  
//	            ex.setResponseHeader(response,"档案信息导出");  
//	            String[] headers = { "档案号",  "档案状态", "姓名", "性别","出生年月","身份证号码","毕业学校","所属专业","毕业时间","转入时间"};  
//	            String[] columns = { "bpno", "is_state","name", "sex","birth_date","pnum","school","major","graduation_time","create_date"}; 
//	            ex.exportExcel( headers, columns, da, out, request, "");  
//			} catch (IOException e) {
//				e.printStackTrace();
//			} finally {  
//	            try {  
//	                out.flush();  
//	                out.close();  
//	            } catch (Exception e) {  
//	                e.printStackTrace();  
//	            }  
//	        }
			try {
				
				List<DaExportAllVo> da=userMgInfoMapper.exportAllDaList();
				ExcelExport<DaExportAllVo> ex = new ExcelExport<DaExportAllVo>();
				List resultList=new ArrayList(); 
				if(da.size()>0){
					
					List<DaExportAllVo> da1 = new ArrayList();
					for (int i = 0; i < da.size(); i++) {
						DaExportAllVo dv = da.get(i);
						da1.add(dv);
					}
					
					resultList.add(da1);
				}
				
				
				
				String fileName = "档案信息导出.xls";  
				OutputStream output =ResultConstant.outputStream(request, response, fileName);
				List<String> titleList=new ArrayList<String>(); 
				titleList.add("档案信息");
				String syDelTitle="";
				
				Map<String,Object>title=new HashMap<String, Object>();
				title.put("1", syDelTitle);	
				ex.exportExcel2(titleList, resultList, title,output);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	
	@Override
	public void daExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
			String record = request.getParameter("ids");
			String[] idArray = record.split(",");
		try {
			
			List<DaExportVo> da=userMgInfoMapper.exportDaList(idArray);
			ExcelExport<DaExportVo> ex = new ExcelExport<DaExportVo>();
			List resultList=new ArrayList(); 
			if(da.size()>0){
				
				List<DaExportVo> da1 = new ArrayList();
				for (int i = 0; i < da.size(); i++) {
					DaExportVo dv = da.get(i);
					da1.add(dv);
				}
				
				resultList.add(da1);
			}
			
			
			
			String fileName = "档案信息导出.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("档案信息");
			String syDelTitle="";
			
			Map<String,Object>title=new HashMap<String, Object>();
			title.put("1", syDelTitle);	
			ex.exportExcel2(titleList, resultList, title,output);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<Map<String, Object>> queryuserLogList(Map<String, Object> params) {
		
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
		
		//List<Map<String, Object>> rt = new ArrayList();
		List<Map<String,Object>> rj = archivesLogMapper.getList(params);
		for (int i = 0; i < rj.size(); i++) {
			Map<String,Object> m = rj.get(i);
			if("是否派遣".equals(m.get("m_column_name")+"")||"单位代理".equals(m.get("m_column_name")+"")||"人事外包".equals(m.get("m_column_name")+"")){
			    if("on".equals(m.get("m_before")+""))
			    	m.put("m_before", "是");
			    else
			    	m.put("m_before", "否");
			    
			    if("on".equals(m.get("m_after")+""))
			    	m.put("m_after", "是");
			    else
			    	m.put("m_after", "否");
			
			}
	
		}
		return rj;
	}

	@Override
	public Map<String, Object> checkIsPnumExistInSystem(String pnum) {
		return userMgInfoMapper.getUserMgInfoByPnum(pnum);
	}

	@Override
	public Map<String, Object> selectmaxDpno(Map<String, Object> record) {
		return userMgInfoMapper.selectmaxDpno(record);
	}
 
	public void updatemaxPno(){
		userMgInfoMapper.updateNextPno();
	}

}
