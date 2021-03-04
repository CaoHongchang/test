package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.gdcl.BO.SerchBO;
import com.i84.earnpoint.model.ArchivesOtherInfo;

public interface ArchivesOtherInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    int insert(ArchivesOtherInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    int insertSelective(ArchivesOtherInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    ArchivesOtherInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ArchivesOtherInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_other_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ArchivesOtherInfo record);
    
    List<Map<String,Object>> selectByPno(ArchivesOtherInfo record);

	int sort(SerchBO serchBO);
	
    Map<String,Object> getsort(Map<String,Object> map);
}