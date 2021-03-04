package com.i84.earnpoint.hygsgl.service.impl;



import java.io.BufferedOutputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.formula.functions.T;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.hygsgl.service.GzInfoService;

import com.i84.earnpoint.mapper.UserBMoneyInfoMapper;
import com.i84.earnpoint.mapper.UserBgMoneyInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.UserMoneyInfoMapper;
import com.i84.earnpoint.model.GzExportVo;
import com.i84.earnpoint.model.GzImportQyVo;
import com.i84.earnpoint.model.GzImportSyVo;
import com.i84.earnpoint.model.Page;
import com.i84.earnpoint.model.UserBMoneyInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMoneyInfo;


/**
 * @author liu_quan
 *
 */
@Service
public class GzInfoServiceImpl implements GzInfoService{
	@Autowired
	private UserMoneyInfoMapper userMoneyInfoMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;
	@Autowired
	private UserBMoneyInfoMapper userBMoneyInfoMapper;
	@Override
	public int addGzSy(Map<String, Object> map) {
		if(map!=null&&map.size()>0){
			map.put("addDate", new Date());
			map.put("fromId", map.get("sUid"));//操作人
			return userMoneyInfoMapper.insertUserMoney(map);
		}
		return 0;

	}
	@Override
	public int addGzQy(Map<String, Object> map) {
		if(map!=null&&map.size()>0){
		map.put("addDate", new Date());
		map.put("fromId", map.get("sUid"));
		return userBMoneyInfoMapper.insertUserBmoney(map);
		}
		return 0;
	}
	
	public void addGz(String dataSy,String dataQy,String uid) throws Exception{
		if(StringUtils.isNotEmpty(dataSy)){
			List<GzImportSyVo> list=JsonUtil.getList4Json(dataSy, GzImportSyVo.class);
            if(list!=null&&list.size()>0){
            	for(int i=0;i<list.size();i++){
            		GzImportSyVo v=list.get(i);
            		UserMoneyInfo u=new UserMoneyInfo();
            		u.setSalaryDate(v.getGzffsj()==null?null:ResultConstant.parseDateTime(v.getGzffsj(), "yyyy-MM-dd"));
            		u.setUid(v.getUid()==null?null:Integer.valueOf(v.getUid()));
            		u.setFromId(uid==null?null:Integer.valueOf(uid));
            		u.setEnterpriseId(v.getQyId()==null?null:Integer.valueOf(v.getQyId()));
            		u.setSalary(v.getGzxd()==null?null:Float.valueOf(v.getGzxd()));
            		u.setAllowance(v.getGwjt()==null?null:Float.valueOf(v.getGwjt()));
            		u.setSubsistence(v.getShbt()==null?null:Float.valueOf(v.getShbt()));
            		u.setBasic(v.getJcjx()==null?null:Float.valueOf(v.getJcjx()));
            		u.setHigher(v.getGcjx()==null?null:Float.valueOf(v.getGcjx()));
            		u.setKeepSalary(v.getBlgz()==null?null:Float.valueOf(v.getBlgz()));
            		u.setOtherWages(v.getQtgz()==null?null:Float.valueOf(v.getQtgz()));
            		u.setSubsidy(v.getTzbt()==null?null:Float.valueOf(v.getTzbt()));
            		u.setOther(v.getQt()==null?null:Float.valueOf(v.getQt()));
            		u.setAllSalary(v.getGzze()==null?null:Float.valueOf(v.getGzze()));
            		u.setAddDate(new Date());
            		u.setPos(v.getZwgw()==null?null:v.getZwgw());
            		userMoneyInfoMapper.insertSelective(u);
            		
            	}
            	
            }
		
		}
		if(StringUtils.isNotEmpty(dataQy)){
			List<GzImportQyVo> list=JsonUtil.getList4Json(dataQy, GzImportQyVo.class);
            if(list!=null&&list.size()>0){
            	for(int i=0;i<list.size();i++){
            		GzImportQyVo v=list.get(i);
            		UserBMoneyInfo u=new UserBMoneyInfo();
            		u.setSalaryDate(v.getGzffsj()==null?null:ResultConstant.parseDateTime(v.getGzffsj(), "yyyy-MM-dd"));
            		u.setUid(v.getUid()==null?null:Integer.valueOf(v.getUid()));
            		u.setFromId(uid==null?null:Integer.valueOf(uid));
            		u.setEnterpriseId(v.getQyId()==null?null:Integer.valueOf(v.getQyId()));
            		u.setOther(v.getQt()==null?null:Float.valueOf(v.getQt()));
            		u.setAllSalary(v.getGzze()==null?null:Float.valueOf(v.getGzze()));
                    u.setSalaryBase(v.getJbgz()==null?null:Float.valueOf(v.getJbgz()));
                    u.setSalary(v.getGlgz()==null?null:Float.valueOf(v.getGlgz()));
                    u.setAllowance(v.getJtbt()==null?null:Float.valueOf(v.getJtbt()));
                    u.setSubsistence(v.getYjj()==null?null:Float.valueOf(v.getYjj()));
                    u.setBasic(v.getJbgz2()==null?null:Float.valueOf(v.getJbgz2()));
                    u.setHigher(v.getJxgz()==null?null:Float.valueOf(v.getJxgz()));
                    u.setKeepSalary(v.getQtgz1()==null?null:Float.valueOf(v.getQtgz1()));
                    u.setOtherWages(v.getQtgz2()==null?null:Float.valueOf(v.getQtgz2()));
                    u.setAddDate(new Date());
                    u.setPos(v.getZwgw()==null?null:v.getZwgw());
                    userBMoneyInfoMapper.insertSelective(u);
            		
            	}
            	
            }
			
		}
		

	}

	
	@Override
	public List<Map<String, Object>> selectGzglList(Map<String, Object> obj) {
		ResultConstant.pageSet(obj);
		return userMoneyInfoMapper.selectGzglList(obj);
	}
	public Map<String, Object> selectQyOrSy(Map<String, Object> obj) {
		if(obj.get("gzlxId").toString().equals("1")){
			return  userBMoneyInfoMapper.selectQyGz(obj);
		}
		if(obj.get("gzlxId").toString().equals("2"))
			return  userBMoneyInfoMapper.selectSyGz(obj);
		return null;
	}

	@Override
	public void gzExport(HttpServletResponse response,HttpServletRequest request) throws Exception {

		try {
			List<GzExportVo> sy=userMoneyInfoMapper.selectGzSyList(null);//事业工资
			List<GzExportVo> qy=userBMoneyInfoMapper.selectGzQyList(null);//企业工资
			ExcelExport<GzExportVo> ex = new ExcelExport<GzExportVo>();

			String fileName = "工资导出.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List resultList=new ArrayList(); 
			resultList.add(sy);
			resultList.add(qy);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("事业工资");
			titleList.add("企业工资");
			
			String syDelTitle="基本工资,工龄工资,津贴补贴,月奖金,加班工资,绩效工资,其它工资1,其它工资2";//不需要生成的标题
			String qyDelTitle="工资薪档,岗位津贴,生活补贴,基础绩效,高出绩效,保留工资,其它工资,提租补贴";

			Map<String,Object>title=new HashMap<String, Object>();
			title.put("1", syDelTitle);
			title.put("2", qyDelTitle);

			ex.exportExcel2(titleList, resultList, title,output);



		} catch (IOException e) {
			e.printStackTrace();
		}



	}
	@Override
	public int updateBmoneyBySelective(Map<String, Object> obj)throws Exception {
		
		return userBMoneyInfoMapper.updateBmoneyBySelective(obj);
	}
    public int updateMoneyBySelective(Map<String, Object> obj)throws Exception {
		
		return userMoneyInfoMapper.updateMoneyBySelective(obj);
	}

   
	@Override
	public int deleteByBmoney(Map<String, Object> obj) throws Exception {
		return userBMoneyInfoMapper.updateBmoneyBySelective(obj);
	}
	@Override
	public int deleteByMoney(Map<String, Object> obj) throws Exception {
		return userMoneyInfoMapper.updateMoneyBySelective(obj);
	}
	@Override
	public UserInfo selectYg(UserInfo record) throws Exception {
		return userInfoMapper.selectYg(record);
	}
	@Override
	public Integer isQyGz(String salaryDate,String uid) {
		return userBMoneyInfoMapper.isQyGz(salaryDate+" 00:00:00",uid);
	}
	@Override
	public Integer isSyGz(String salaryDate,String uid) {
		return userBMoneyInfoMapper.isSyGz(salaryDate+" 00:00:00",uid);
	}
}