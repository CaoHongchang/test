package com.i84.earnpoint.rckgl.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.PersonBasicInfoMapper;
import com.i84.earnpoint.mapper.PersonEducationInfoMapper;
import com.i84.earnpoint.mapper.PersonMajorCertificateMapper;
import com.i84.earnpoint.mapper.PersonProfessionCertificateMapper;
import com.i84.earnpoint.mapper.PersonRewardMapper;
import com.i84.earnpoint.mapper.PersonSkillCertificateMapper;
import com.i84.earnpoint.mapper.PersonStateAllowanceMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.PersonBasicInfo;
import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonProfessionCertificate;
import com.i84.earnpoint.model.PersonReward;
import com.i84.earnpoint.model.PersonSkillCertificate;
import com.i84.earnpoint.model.PersonStateAllowance;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.rckgl.service.PersonInfoService;

@Service
public class PersonInfoServiceImpl implements PersonInfoService {
	@Autowired
	private PersonBasicInfoMapper personBasicInfoMapper;
	@Autowired
	private PersonEducationInfoMapper personEducationInfoMapper;
	@Autowired
	private PersonStateAllowanceMapper personStateAllowanceMapper;
	@Autowired
	private PersonMajorCertificateMapper personMajorCertificateMapper;
	@Autowired
	private PersonProfessionCertificateMapper personProfessionCertificateMapper;
	@Autowired
	private PersonSkillCertificateMapper personSkillCertificateMapper;
	@Autowired
	private PersonRewardMapper personRewardMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public PersonBasicInfo selectBasicInfoById(Integer id) {
		// TODO Auto-generated method stub
		return personBasicInfoMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public List<Map<String, Object>> selectPersonList(Map<String, Object> record) {
		if(null != record.get("page")){
			PageHelper.startPage(Integer.parseInt(record.get("page")+""),Integer.parseInt(record.get("rows")+""));
		}
		// TODO Auto-generated method stub
		return personBasicInfoMapper.selectPersonList(record);
	}

	@Override
	public Map<String, Object> qryPersonBasic(String pid) {
		Map<String,Object> param = new HashMap<String, Object>();
		param.put("id", pid);
		param= personBasicInfoMapper.qryPersonBasic(param);
		if(param!=null){
			try {
				ResultConstant.mapToDate(DateUtil.OYYYY_MM,param, "birthday");
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return param;
	}
	
	@Override
	public int updateByPrimaryKeySelective(PersonBasicInfo record) {
		// TODO Auto-generated method stub
		return personBasicInfoMapper.updateByPrimaryKeySelective(record);
	}
	/**
	 *  查询学历教育列表
	 * @param pnum
	 * @return
	 */
	@Override
	public List<PersonEducationInfo> qryEducationInfo(Integer pid) {
		List<PersonEducationInfo> list = new ArrayList<PersonEducationInfo>();
		list = personEducationInfoMapper.qryEducationInfo(pid);
		return list;
	}

	@Override
	public List<PersonStateAllowance> qryAllowanceInfo(Integer pid) {
		List<PersonStateAllowance> list = new ArrayList<PersonStateAllowance>();
		list = personStateAllowanceMapper.qryAllowanceInfo(pid);
		return list;
	}

	@Override
	public List<PersonMajorCertificate> qryMajorInfo(Integer pid) {
		List<PersonMajorCertificate> list = new ArrayList<PersonMajorCertificate>();
		list = personMajorCertificateMapper.qryMajorInfo(pid);
		return list;
	}

	@Override
	public List<PersonProfessionCertificate> qryProfessionInfo(Integer pid) {
		List<PersonProfessionCertificate> list = new ArrayList<PersonProfessionCertificate>();
		list = personProfessionCertificateMapper.qryProfessionInfo(pid);
		return list;
	}

	@Override
	public List<PersonSkillCertificate> qrySkillInfo(Integer pid) {
		List<PersonSkillCertificate> list = new ArrayList<PersonSkillCertificate>();
		list = personSkillCertificateMapper.qrySkillInfo(pid);
		return list;
	}

	@Override
	public List<PersonReward> qryRewardInfo(Integer pid) {
		List<PersonReward> list = new ArrayList<PersonReward>();
		list = personRewardMapper.qryRewardInfo(pid);
		return list;
	}

	@Override
	public void insertUser(PersonBasicInfo basicInfo) {
		UserInfo userInfo = null;
		userInfo = userInfoMapper.getUserByPnum(basicInfo.getIdentityNumber());
		if(userInfo==null){
			userInfo = new UserInfo();
			userInfo.setName(basicInfo.getPersonName());
			userInfo.setPnum(basicInfo.getIdentityNumber());
			userInfo.setTel(basicInfo.getTelephone());
			int length = basicInfo.getIdentityNumber().length();
			if(length>6)
				userInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code(basicInfo.getIdentityNumber().substring(length-6, length))));
			userInfo.setSex(basicInfo.getSex());
			userInfo.setAddDate(new Date());
			userInfo.setBirthDate(DateUtil.getDate(DateUtil.YYYYMM, basicInfo.getBirthday()));
			
			userInfo.setMz(basicInfo.getEthnic());
			userInfo.setZzmm(basicInfo.getPoliticalStatus());
			userInfo.setAdr(basicInfo.getAddress());
			userInfo.setEmail(basicInfo.getEmail());
			userInfo.setQq(basicInfo.getQq());
			userInfo.setWx(basicInfo.getWechat());
			userInfoMapper.insertSelective(userInfo);
		}else{
			userInfo.setName(basicInfo.getPersonName());
			userInfo.setPnum(basicInfo.getIdentityNumber());
			userInfo.setTel(basicInfo.getTelephone());
			userInfo.setSex(basicInfo.getSex());
			userInfo.setBirthDate(DateUtil.getDate(DateUtil.YYYYMM, basicInfo.getBirthday()));
			userInfo.setMz(basicInfo.getEthnic());
			userInfo.setZzmm(basicInfo.getPoliticalStatus());
			userInfoMapper.updateByPrimaryKeySelective(userInfo);
		}
	}

	@Override
	public List<Map<String, Object>> countJsdjList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personSkillCertificateMapper.countJsdjList(record);
	}

	@Override
	public List<Map<String, Object>> countXlList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personEducationInfoMapper.countXlList(record);
	}

	@Override
	public List<Map<String, Object>> countXwList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personEducationInfoMapper.countXwList(record);
	}

	@Override
	public List<Map<String, Object>> countZyjsList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personMajorCertificateMapper.countZyjsList(record);
	}

	@Override
	public List<Map<String, Object>> countJctjList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personRewardMapper.countJctjList(record);
	}

	@Override
	public List<Map<String, Object>> countZrsList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personBasicInfoMapper.countZrsList(record);
	}

	@Override
	public List<Map<String, Object>> countZstjList(Map<String, Object> record) {
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		int tstj = personStateAllowanceMapper.countTsjtzsList(record);
		int zyjs = personMajorCertificateMapper.countZyjszsList(record);
		int xw = personEducationInfoMapper.countXwzs(record);
		int xl = personEducationInfoMapper.countXlzs(record);
		int jsdj = personSkillCertificateMapper.countJsdjzs(record);
		int jc = personRewardMapper.countJczs(record);
		int zyzg = personProfessionCertificateMapper.countZyzgzs(record);
		Map<String, Object> map1 = new HashMap<String, Object>();
		map1.put("name", "特殊津贴证书");
		map1.put("num", tstj);
		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("name", "专业技术证书");
		map2.put("num", zyjs);
		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("name", "学位证书");
		map3.put("num", xw);
		Map<String, Object> map4 = new HashMap<String, Object>();
		map4.put("name", "学历证书");
		map4.put("num", xl);
		Map<String, Object> map5 = new HashMap<String, Object>();
		map5.put("name", "技术等级证书");
		map5.put("num", jsdj);
		Map<String, Object> map6 = new HashMap<String, Object>();
		map6.put("name", "奖惩证书");
		map6.put("num", jc);
		Map<String, Object> map7 = new HashMap<String, Object>();
		map7.put("name", "职业资格证书");
		map7.put("num", zyzg);
		list.add(map1);
		list.add(map2);
		list.add(map3);
		list.add(map4);
		list.add(map5);
		list.add(map6);
		list.add(map7);
		return list;
	}

	@Override
	public List<Map<String, Object>> countByUnitList(Map<String, Object> record) {
		// TODO Auto-generated method stub
		return personBasicInfoMapper.countByUnitList(record);
	}

	@Override
	public List<Map<String, Object>> degree() {
		List<Map<String, Object>> list=personBasicInfoMapper.degree();
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> education() {
		List<Map<String, Object>> list=personBasicInfoMapper.education();
		return list;
	}
	
	@Override
	public List<Map<String, Object>> level() {
		List<Map<String, Object>> list=personBasicInfoMapper.level();
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> professionalLevel() {
		List<Map<String, Object>> list=personBasicInfoMapper.professionalLevel();
		return list;
	}
	
	@Override
	public List<Map<String, Object>> rewardsAndPunishments() {
		List<Map<String, Object>> list=personBasicInfoMapper.rewardsAndPunishments();
		return list;
	}

	@Override
	public Integer certificateStatistics1() {
		Integer rp=personBasicInfoMapper.certificateStatistics1();
		return rp;
	}

	@Override
	public Integer certificateStatistics2() {
		Integer jsdj=personBasicInfoMapper.certificateStatistics2();
		return jsdj;
	}

	@Override
	public Integer certificateStatistics3() {
		Integer zyzg=personBasicInfoMapper.certificateStatistics3();
		return zyzg;
	}

	@Override
	public Integer certificateStatistics4() {
		Integer zyjs=personBasicInfoMapper.certificateStatistics4();
		return zyjs;
	}

	@Override
	public Integer certificateStatistics5() {
		Integer tsjt=personBasicInfoMapper.certificateStatistics5();
		return tsjt;
	}

	@Override
	public Integer certificateStatistics6() {
		Integer xlxx=personBasicInfoMapper.certificateStatistics6();
		return xlxx;
	}

	@Override
	public Integer certificateStatistics7() {
		Integer xwzs=personBasicInfoMapper.certificateStatistics7();
		return xwzs;
	}
	
	@Override
	public List<Map<String, Object>> totalNumber(String year1, String year2, String timeType) {
		List<Map<String, Object>> list = personBasicInfoMapper.totalNumber(year1, year2,timeType);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> testLevel(String year1, String year2) {
		List<Map<String, Object>> list = personBasicInfoMapper.testLevel(year1, year2);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> unitStatistical() {
		List<Map<String, Object>> list = personBasicInfoMapper.unitStatistical();
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> formsOfLearning(String year1, String year2) {
		List<Map<String, Object>> list = personBasicInfoMapper.formsOfLearning(year1, year2);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> school(String year1, String year2) {
		List<Map<String, Object>> list = personBasicInfoMapper.school(year1, year2);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> major(String year1, String year2) {
		List<Map<String, Object>> list = personBasicInfoMapper.major(year1, year2);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> countman(String year1, String year2, String timeType) {
		List<Map<String, Object>> list = personBasicInfoMapper.countman(year1, year2,timeType);
		return list;
	}
	
	
	@Override
	public List<Map<String, Object>> llr(String year1, String year2) {
		List<Map<String, Object>> list = personBasicInfoMapper.llr(year1, year2);
		return list;
	}
	
}
