package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;

/**
 * 专业技术职务资格证书
 * @author Administrator
 *
 */
public interface PersonMajorCertificateMapper {
	/**
	 * 查询专业技术职务资格证书列表
	 * @param personBasicInfo
	 * @return
	 */
	List<PersonMajorCertificate> queryMajorList(PersonMajorCertificate personMajorCertificate);
	int queryMajorCnt(PersonMajorCertificate personMajorCertificate);
	List<PersonMajorCertificate> qryMajorInfo(Integer id);
	
	
	void delete(PersonMajorCertificate personMajorCertificate);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int insert(PersonMajorCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int insertSelective(PersonMajorCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    PersonMajorCertificate selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int updateByPrimaryKeySelective(PersonMajorCertificate record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_major_certificate
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int updateByPrimaryKey(PersonMajorCertificate record);
    
    List<Map<String, Object>> countZyjsList(Map<String, Object> params);
    int countZyjszsList(Map<String, Object> params);
}