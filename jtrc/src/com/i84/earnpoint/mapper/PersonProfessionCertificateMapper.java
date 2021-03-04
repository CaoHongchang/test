package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonProfessionCertificate;
/**
 * 职业资格证书
 * @author Administrator
 *
 */
public interface PersonProfessionCertificateMapper {
	/**
	 * 查询人员列表
	 * @param personBasicInfo
	 * @return
	 */
	List<PersonProfessionCertificate> queryProfessionList(PersonProfessionCertificate personProfessionCertificate);
	int queryProfessionCnt(PersonProfessionCertificate personProfessionCertificate);
	List<PersonProfessionCertificate> qryProfessionInfo(Integer pid);
	
	void delete(PersonProfessionCertificate personProfessionCertificate);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int insert(PersonProfessionCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int insertSelective(PersonProfessionCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    PersonProfessionCertificate selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int updateByPrimaryKeySelective(PersonProfessionCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_profession_certificate
     *
     * @mbggenerated Tue Sep 20 23:11:14 CST 2016
     */
    int updateByPrimaryKey(PersonProfessionCertificate record);
    int countZyzgzs(Map<String, Object> params);
}