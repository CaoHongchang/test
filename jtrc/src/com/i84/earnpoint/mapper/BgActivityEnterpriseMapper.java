package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.BgActivityEnterprise;
import com.i84.earnpoint.model.BgActivityEnterpriseExample;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

public interface BgActivityEnterpriseMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int countByExample(BgActivityEnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int deleteByExample(BgActivityEnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int insert(BgActivityEnterprise record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int insertSelective(BgActivityEnterprise record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    List<BgActivityEnterprise> selectByExample(BgActivityEnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    BgActivityEnterprise selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int updateByExampleSelective(@Param("record") BgActivityEnterprise record, @Param("example") BgActivityEnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int updateByExample(@Param("record") BgActivityEnterprise record, @Param("example") BgActivityEnterpriseExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int updateByPrimaryKeySelective(BgActivityEnterprise record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_activity_enterprise
     *
     * @mbggenerated Wed Aug 31 00:40:46 CST 2016
     */
    int updateByPrimaryKey(BgActivityEnterprise record);
    
    List<Map<String,Object>> selectByCodeOrName(Map<String,Object> record);
    Map<String,Object> selectByCode(Map<String,Object> record);
    
    List<Map<String,Object>> selectNotInActivity(Map<String,Object> record);

	int checkActivityEnterpriseIsExist(Map<String, Object> param);
}