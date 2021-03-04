package com.i84.earnpoint.mapper;

import com.i84.earnpoint.model.BgEnterprisePlace;
import com.i84.earnpoint.model.BgEnterprisePlaceExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface BgEnterprisePlaceMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int countByExample(BgEnterprisePlaceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int deleteByExample(BgEnterprisePlaceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int insert(BgEnterprisePlace record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int insertSelective(BgEnterprisePlace record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    List<BgEnterprisePlace> selectByExample(BgEnterprisePlaceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    BgEnterprisePlace selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int updateByExampleSelective(@Param("record") BgEnterprisePlace record, @Param("example") BgEnterprisePlaceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int updateByExample(@Param("record") BgEnterprisePlace record, @Param("example") BgEnterprisePlaceExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int updateByPrimaryKeySelective(BgEnterprisePlace record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table bg_enterprise_place
     *
     * @mbggenerated Wed Aug 31 00:43:21 CST 2016
     */
    int updateByPrimaryKey(BgEnterprisePlace record);
}