package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;

import net.sf.jsqlparser.statement.update.Update;

public interface UserExpertInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	int insert(UserExpertInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	int insertSelective(UserExpertInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	UserExpertInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(UserExpertInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table user_expert_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(UserExpertInfo record);

	List<Map<String,Object>> selectUserExpertList(Map<String,Object> record);
	
	List<Map<String,Object>> selectUserExpertListMore2();//抽专家用
	
	List<Map<String,Object>> selectUserExpertListMore(Map<String,Object> record);//抽专家用
	
	List<Map<String,Object>> selectUserExpertListMoreOrder(Map<String,Object> record);//抽专家用
	
	List<Map<String,Object>> selectUserExpertListByPro_type(String pro_type);//抽专家用
	

	List<String> selectAllCompany();//抽专家用，获得所有公司
	
	List<String> selectCompanyByPro_type(String pro_type);//抽专家用，获得所有公司
	
	int updateEffectedToFalseByzpno(String zpno); //抽专家用
	
	int updateEffectedToTrueByzpno(String zpno);//抽专家用
	
	int updateEffectedToFalse(String pro_Type);//抽专家用
	
	int updateEffectedToTrue(int id);//抽专家用
	
	int updateSelectedToFalse();//抽专家用
	
	int updateSelectedToTrue(int uid);//抽专家用
	
	String selectYg(String pnum);;//抽专家用
	
	int insertPickUp(UserExpertInfoPickUp record);
	
	int updatePickUp(UserExpertInfoPickUp record);
	
	List<Map<String,Object>> selectPro_type();
	
	UserExpertInfo selectUserExpertInfoByZpno(String zpno);

	int updateByPrimaryKeySelective1(UserExpertInfo record);

	void updateActionTime(String aid);
	
	
}