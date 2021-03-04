package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ResidenceGetoutInfo;
import com.i84.earnpoint.model.UserInfo;

public interface ResidenceGetoutInfoMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    int deleteByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    int insert(ResidenceGetoutInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    int insertSelective(ResidenceGetoutInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    ResidenceGetoutInfo selectByPrimaryKey(Integer id);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKeySelective(ResidenceGetoutInfo record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table residence_getout_info
     *
     * @mbggenerated
     */
    int updateByPrimaryKey(ResidenceGetoutInfo record);
    
    /**
	 * 获取借阅信息列表
	 * @mbggenerated
	 */
	List<Map<String,Object>> selectResidenceGetoutInfoList(Map<String,Object> record);
	
	
	ResidenceGetoutInfo selectYg(ResidenceGetoutInfo record);
}