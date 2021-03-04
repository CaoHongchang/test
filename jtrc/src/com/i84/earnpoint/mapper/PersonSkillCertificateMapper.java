package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonSkillCertificate;

/**
 * 技术等级岗位证书
 * @author Administrator
 *
 */
public interface PersonSkillCertificateMapper {
	/**
	 * 查询人员列表
	 * @param personBasicInfo
	 * @return
	 */
	List<PersonSkillCertificate> querySkillList(PersonSkillCertificate personEducationInfo);
	int querySkillCnt(PersonSkillCertificate personBasicInfo);
	List<PersonSkillCertificate> qrySkillInfo(Integer pid);
	
	void delete(PersonSkillCertificate personBasicInfo);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int insert(PersonSkillCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int insertSelective(PersonSkillCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    PersonSkillCertificate selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int updateByPrimaryKeySelective(PersonSkillCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_skill_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int updateByPrimaryKey(PersonSkillCertificate record);
    
    List<Map<String, Object>> countJsdjList(
			Map<String, Object> params);
    int countJsdjzs(Map<String, Object> params);
}