package com.i84.earnpoint.hkxxgl.service;

import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.ResidenceHisInfoMapper;
import com.i84.earnpoint.mapper.ResidenceInfoMapper;
import com.i84.earnpoint.model.ResidenceInfo;
import com.i84.earnpoint.service.UserInfoService;

@Service
public class HkxxServiceImple implements HkxxService {

	@Autowired
	private ResidenceInfoMapper residenceInfoMapper;
	
	@Autowired
	private UserInfoService userInfoService;
	
	@Autowired
	private ResidenceHisInfoMapper hisInfoMapper;
	/**
	 * 获取户口信息列表，其中type标识目前户口的状态，0-借出，1-归还，2-新增 ，null-表示档案系统原有的导入的数据
	 */
	@Override
	public List<Map<String, Object>> GetHkxxList(Map<String, Object> params) {
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
		return residenceInfoMapper.getHkxxList(params);
	}
	
	
	@Override
	@Transactional
	public Map<String, Object> AddHkxx(Map<String, Object> params) throws Exception {
		Map<String,Object> resultMap=new HashMap<String, Object>();
		ResidenceInfo residenceInfo =new ResidenceInfo();
		if(params.get("residenceNo")!=null&&!params.get("residenceNo").equals(""))
		residenceInfo.setResidenceNo(params.get("residenceNo").toString());
		if(params.get("relName")!=null&&!params.get("relName").equals(""))
		residenceInfo.setRelName(params.get("relName").toString());
		if(params.get("otherAdr")!=null&&!params.get("otherAdr").equals(""))
		residenceInfo.setOtherAdr(params.get("otherAdr").toString());
		if(params.get("blood")!=null&&!params.get("blood").equals(""))
		residenceInfo.setBlood(params.get("blood").toString());
		if(params.get("stature")!=null&&!params.get("stature").equals(""))
		residenceInfo.setStature(Integer.valueOf(params.get("stature").toString()));
		if(params.get("xyName")!=null&&!params.get("xyName").equals(""))
		residenceInfo.setXyName(params.get("xyName").toString());
		if(params.get("byState")!=null&&!params.get("byState").equals(""))
		residenceInfo.setByState(params.get("byState").toString());
		if(params.get("serviceAdr")!=null&&!params.get("serviceAdr").equals(""))
		residenceInfo.setServiceAdr(params.get("serviceAdr").toString());
		if(params.get("proName")!=null&&!params.get("proName").equals(""))
		residenceInfo.setProName(params.get("proName").toString());
		if(params.get("hPro")!=null&&!params.get("hPro").equals(""))
		residenceInfo.sethPro(params.get("hPro").toString());
		if(params.get("police")!=null&&!params.get("police").equals(""))
		residenceInfo.setPolice(params.get("police").toString());
		if(params.get("r_date")!=null&&!params.get("r_date").equals(""))
		residenceInfo.setrDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("r_date").toString()));
		if(params.get("rAdr")!=null&&!params.get("rAdr").equals(""))
		residenceInfo.setrAdr(params.get("rAdr").toString());
		if(params.get("orgAdr")!=null&&!params.get("orgAdr").equals(""))
		residenceInfo.setOrgAdr(params.get("orgAdr").toString());
		if(params.get("q_date")!=null&&!params.get("q_date").toString().equals(""))
		residenceInfo.setqDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("q_date").toString()));
		if(params.get("qAdr")!=null&&!params.get("qAdr").equals(""))
		residenceInfo.setqAdr(params.get("qAdr").toString());
		if(params.get("sessionRealName")!=null&&!params.get("sessionRealName").equals(""))
		residenceInfo.setcName(params.get("sessionRealName").toString());
		if(params.get("addDate")!=null&&!params.get("addDate").equals(""))
		residenceInfo.setAddDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("addDate").toString()));
		
		if(params.get("uid")==null||params.get("uid").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "没有找到档案号对应的用户，请确认档案号是否输入错误！");
			return resultMap;
		}
		
		Integer uid=Integer.valueOf(params.get("uid").toString());
		if(residenceInfoMapper.getresidencebyuid(uid)!=null&&residenceInfoMapper.getresidencebyuid(uid).size()>0){
			resultMap.put("flag", false);
			resultMap.put("message", "该档案号已经存在户口信息，无法重复添加！");
			return resultMap;
		}
		
		residenceInfo.setUid(uid);
		residenceInfoMapper.insertSelective(residenceInfo);
		//往户口信息历史记录表插入
		Map<String,Object> his=new HashMap<String, Object>();
		his.put("residenceId", residenceInfo.getId());
		//设置类型为：新增
		his.put("type", 2);
		residenceInfoMapper.insertToResidenceHis(his);
		resultMap.put("flag", true);
		resultMap.put("message", "添加成功");
		return resultMap;
	}


	@Override
	@Transactional
	public Map<String, Object> UpdateHkxx(Map<String, Object> params) throws Exception {
		Map<String,Object> resultMap=new HashMap<String, Object>();
		ResidenceInfo residenceInfo =new ResidenceInfo();
		if(params.get("residenceNo")!=null&&!params.get("residenceNo").equals(""))
		residenceInfo.setResidenceNo(params.get("residenceNo").toString());
		if(params.get("relName")!=null&&!params.get("relName").equals(""))
		residenceInfo.setRelName(params.get("relName").toString());
		if(params.get("otherAdr")!=null&&!params.get("otherAdr").equals(""))
		residenceInfo.setOtherAdr(params.get("otherAdr").toString());
		if(params.get("blood")!=null&&!params.get("blood").equals(""))
		residenceInfo.setBlood(params.get("blood").toString());
		if(params.get("stature")!=null&&!params.get("stature").equals(""))
		residenceInfo.setStature(Integer.valueOf(params.get("stature").toString()));
		if(params.get("xyName")!=null&&!params.get("xyName").equals(""))
		residenceInfo.setXyName(params.get("xyName").toString());
		if(params.get("byState")!=null&&!params.get("byState").equals(""))
		residenceInfo.setByState(params.get("byState").toString());
		if(params.get("serviceAdr")!=null&&!params.get("serviceAdr").equals(""))
		residenceInfo.setServiceAdr(params.get("serviceAdr").toString());
		if(params.get("proName")!=null&&!params.get("proName").equals(""))
		residenceInfo.setProName(params.get("proName").toString());
		if(params.get("hPro")!=null&&!params.get("hPro").equals(""))
		residenceInfo.sethPro(params.get("hPro").toString());
		if(params.get("police")!=null&&!params.get("police").equals(""))
		residenceInfo.setPolice(params.get("police").toString());
		if(params.get("r_date")!=null&&!params.get("r_date").equals(""))
		residenceInfo.setrDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("r_date").toString()));
		if(params.get("rAdr")!=null&&!params.get("rAdr").equals(""))
		residenceInfo.setrAdr(params.get("rAdr").toString());
		if(params.get("orgAdr")!=null&&!params.get("orgAdr").equals(""))
		residenceInfo.setOrgAdr(params.get("orgAdr").toString());
		if(params.get("q_date")!=null&&!params.get("q_date").toString().equals(""))
		residenceInfo.setqDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("q_date").toString()));
		if(params.get("qAdr")!=null&&!params.get("qAdr").equals(""))
		residenceInfo.setqAdr(params.get("qAdr").toString());
		if(params.get("sessionRealName")!=null&&!params.get("sessionRealName").equals(""))
		residenceInfo.setcName(params.get("sessionRealName").toString());
		if(params.get("addDate")!=null&&!params.get("addDate").equals(""))
		residenceInfo.setAddDate(new SimpleDateFormat("yyyy-MM-dd").parse(params.get("addDate").toString()));
		
		if(params.get("id")==null||params.get("id").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "传递的参数异常！");
			return resultMap;
		}
		
		residenceInfo.setId(Integer.valueOf(params.get("id").toString()));
		residenceInfoMapper.updateByPrimaryKeySelective(residenceInfo);
		resultMap.put("flag", true);
		resultMap.put("message", "修改成功！");
		return resultMap;
	}


	@Override
	public Map<String, Object> GetHkxxInformation(Integer id) {
		return residenceInfoMapper.GetHkxxInformation(id);
	}


	@Override
	@Transactional
	public Map<String, Object> Hkjc(String hkjcdata) throws Exception {
		Map<String,Object> resultMap=new HashMap<String, Object>();
		Map<String, Object> params= ResultConstant.fmSeriDecodeToMap(hkjcdata);
		Map<String, Object> insertMap=new HashMap<String, Object>();
		if(params.get("rec_id_hkjc")==null||params.get("rec_id_hkjc").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：没有找到户口信息！");
			return resultMap;
		}else{
			insertMap.put("residenceId", Integer.valueOf(params.get("rec_id_hkjc").toString()));
		}
		if(params.get("out_date")==null||params.get("out_date").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：借出时间不能为空！");
			return resultMap;
		}else{
			
			insertMap.put("date", new SimpleDateFormat("yyyy-MM-dd").parse(params.get("out_date").toString()));
			insertMap.put("jDate", new SimpleDateFormat("yyyy-MM-dd").parse(params.get("out_date").toString()));
		}
		if(params.get("out_use")==null||params.get("out_use").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：借出用途不能为空！");
			return resultMap;
		}else{
			insertMap.put("userIn",params.get("out_use").toString());
		}
		if(params.get("out_name")==null||params.get("out_name").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：借出人不能为空！");
			return resultMap;
		}else{
			insertMap.put("name",params.get("out_name").toString());
			insertMap.put("jUid",params.get("out_name").toString());
		}
		insertMap.put("type", 0);
		residenceInfoMapper.insertToResidenceHis(insertMap);
		hisInfoMapper.insertintohis(insertMap);
		resultMap.put("flag", true);
		resultMap.put("message", "操作成功！");
		return resultMap;
	}


	@Override
	public Map<String, Object> GetLatestHkjc(Integer id) {
		
		return residenceInfoMapper.getlatesthkjc(id);
	}


	@Override
	@Transactional
	public Map<String, Object> Hkgh(String hkghdata) throws Exception {
		Map<String,Object> resultMap=new HashMap<String, Object>();
		Map<String, Object> params= ResultConstant.fmSeriDecodeToMap(hkghdata);
		Map<String, Object> insertMap=new HashMap<String, Object>();
		if(params.get("hid")==null||params.get("hid").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，错误原因：没有找到借出的户口！");
			return resultMap;
		}else{
			insertMap.put("hid",Integer.valueOf(params.get("hid").toString()));
		}
		if(params.get("residenceId")==null||params.get("residenceId").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：没有找到借出的户口！");
			return resultMap;
		}else{
			insertMap.put("residenceId",Integer.valueOf(params.get("residenceId").toString()));
		}
		if(params.get("back_date")==null||params.get("back_date").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：归还时间不能为空！");
			return resultMap;
		}else{
			insertMap.put("date",new SimpleDateFormat("yyyy-MM-dd").parse(params.get("back_date").toString()));
		}
		if(params.get("sign_name")==null||params.get("sign_name").equals("")){
			resultMap.put("flag", false);
			resultMap.put("message", "操作失败，失败原因：借出人不能为空！");
			return resultMap;
		}else{
			insertMap.put("name",params.get("sign_name").toString());
		}
		insertMap.put("type", 1);
		residenceInfoMapper.insertToResidenceHis(insertMap);
		hisInfoMapper.hkgh(insertMap);
		resultMap.put("flag", true);
		resultMap.put("message", "操作成功！");
		return resultMap;
	}


	@Override
	public List<Map<String, Object>> GetHkxxHisInformation(
			Map<String, Object> params) {
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
		return residenceInfoMapper.GetHkxxHisInformation(params);
	}


	@Override
	public List<Map<String, Object>> GetHkxxHisInformation1(
			Map<String, Object> params) {
		if(null != params.get("page")){
			PageHelper.startPage(Integer.parseInt(params.get("page")+""),Integer.parseInt(params.get("rows")+""));
		}
		return residenceInfoMapper.GetHkxxHisInformation1(params);
	}

}
