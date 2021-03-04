package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonReward;
/**
 * 奖惩
 * @author Administrator
 *
 */
public interface PersonRewardMapper {
	/**
	 * 查询人员列表
	 * @param personBasicInfo
	 * @return
	 */
	List<PersonReward> queryRewardList(PersonReward personReward);
	int queryRewardCnt(PersonReward personReward);
	List<PersonReward> qryRewardInfo(Integer pid);
	
	void delete(PersonReward personReward);
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int insert(PersonReward record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int insertSelective(PersonReward record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    PersonReward selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int updateByPrimaryKeySelective(PersonReward record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table person_reward
     *
     * @mbggenerated Tue Sep 20 23:04:10 CST 2016
     */
    int updateByPrimaryKey(PersonReward record);
    List<Map<String, Object>> countJctjList(Map<String, Object> params);
    int countJczs(Map<String, Object> params);
}