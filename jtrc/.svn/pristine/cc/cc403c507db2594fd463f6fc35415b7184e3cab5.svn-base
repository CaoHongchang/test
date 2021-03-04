package com.i84.earnpoint.rckgl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.PersonBasicInfo;
import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonProfessionCertificate;
import com.i84.earnpoint.model.PersonReward;
import com.i84.earnpoint.model.PersonSkillCertificate;
import com.i84.earnpoint.model.PersonStateAllowance;

/**
 * 人员信息管理service
 * @author Administrator
 *
 */
public interface PersonInfoService {
	PersonBasicInfo selectBasicInfoById(Integer id);
	/**
	 * 获取人员基本信息列表
	 * @mbggenerated
	 */
	List<Map<String,Object>> selectPersonList(Map<String,Object> record);
	
	Map<String,Object> qryPersonBasic(String pid);
	
	int updateByPrimaryKeySelective(PersonBasicInfo record);
	
	/*学习经历*/
	List<PersonEducationInfo> qryEducationInfo(Integer pid);
	
	/*享受国务院津贴*/
	List<PersonStateAllowance> qryAllowanceInfo(Integer pid);
	
	/*专业技术职务资格证书*/
	List<PersonMajorCertificate> qryMajorInfo(Integer pid);
	
	/*职业资格证书*/
	List<PersonProfessionCertificate> qryProfessionInfo(Integer pid);
	
	/*技术等级岗位证书*/
	List<PersonSkillCertificate> qrySkillInfo(Integer pid);
	
	/*奖惩情况*/
	List<PersonReward> qryRewardInfo(Integer pid);
	
	public void insertUser(PersonBasicInfo basicInfo);
	
	/**
	 * 技术等级统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countJsdjList(Map<String, Object> record);
	/**
	 * 学历统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countXlList(Map<String, Object> record);
	/**
	 * 学位统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countXwList(Map<String, Object> record);
	/**
	 * 专业技术统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countZyjsList(Map<String, Object> record);
	/**
	 * 奖惩统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countJctjList(Map<String, Object> record);
	/**
	 * 总人数统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countZrsList(Map<String, Object> record);
	/**
	 * 证书统计
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> countZstjList(Map<String, Object> record);
	
	public List<Map<String, Object>> countByUnitList(Map<String, Object> record);

	public List<Map<String, Object>> degree();
	
	public List<Map<String, Object>> education();
	
	public List<Map<String, Object>> level();
	
	public List<Map<String, Object>> professionalLevel();
	
	public List<Map<String, Object>> rewardsAndPunishments();
	
	public Integer certificateStatistics1();
	public Integer certificateStatistics2();
	public Integer certificateStatistics3();
	public Integer certificateStatistics4();
	public Integer certificateStatistics5();
	public Integer certificateStatistics6();
	public Integer certificateStatistics7();
	public List<Map<String, Object>> totalNumber(String year1,String year2,String timeType);
	public List<Map<String, Object>> testLevel(String year1,String year2);
	public List<Map<String, Object>> unitStatistical();
	public List<Map<String, Object>> formsOfLearning(String year1,String year2);
	public List<Map<String, Object>> school(String year1,String year2);
	public List<Map<String, Object>> major(String year1,String year2);
	public List<Map<String, Object>> countman(String year1,String year2,String timeType);
	public List<Map<String, Object>> llr(String year1,String year2);

	
	
	
	
	
}
