package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.gdcl.BO.SerchBO;
import com.i84.earnpoint.model.ArchivesRewardInfo;

public interface ArchivesRewardInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    int insert(ArchivesRewardInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    int insertSelective(ArchivesRewardInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    ArchivesRewardInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ArchivesRewardInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table archives_reward_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ArchivesRewardInfo record);
    
    List<Map<String,Object>> selectByPno(ArchivesRewardInfo record);

	int sort(SerchBO serchBO);
	
    Map<String,Object> getsort(Map<String,Object> map);
}