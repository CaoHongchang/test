package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.i84.earnpoint.model.ArchivesBaseInfo;
import com.i84.earnpoint.model.Statistical;

public interface ArchivesBaseInfoMapper {

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	int deleteByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	int insert(ArchivesBaseInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	int insertSelective(ArchivesBaseInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	ArchivesBaseInfo selectByPrimaryKey(Integer id);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	int updateByPrimaryKeySelective(ArchivesBaseInfo record);

	/**
	 * This method was generated by MyBatis Generator. This method corresponds to the database table archives_base_info
	 * @mbggenerated
	 */
	int updateByPrimaryKey(ArchivesBaseInfo record);
	
	 /**
		 * 获取档案管理列表
		 * @mbggenerated
		 */
		List<Map<String,Object>> selectArchivesBaseInfoList(Map<String,Object> record);
		
		 /**
			 * 获取档案管理列表
			 * @mbggenerated
			 */
	List<Map<String,Object>> selectArchivesBaseInfoList1(Map<String,Object> record);
	
	List<Map<String,Object>> getcllist(Map<String,Object> record);
	
	List<Map<String,Object>> getcheckllist(Map<String,Object> record);
	//派遣统计图
	List<Map<String,Object>> sendByYear(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType,@Param("fileType")String fileType);
	//实际档案数量统计
	List<Map<String,Object>> sjdasltj(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType);
	//人事外包统计
	List<Map<String,Object>> rswbtj(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType,@Param("fileType")String fileType);
	//单位代理统计
	List<Map<String,Object>> dwdltj(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType,@Param("fileType")String fileType);
	//录入日期统计
	List<Map<String,Object>> xbtj(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType,@Param("fileType")String fileType);
	//性别统计
	List<Map<String,Object>> sex(@Param("year1")String year1,@Param("year2")String year2,@Param("fileType")String fileType);
	//出生年月日统计
	List<Map<String,Object>> birthDate(@Param("year1")String year1,@Param("year2")String year2,@Param("timeType")String timeType,@Param("fileType")String fileType);
	//学历统计
	List<Map<String,Object>> degree(@Param("year1")String year1,@Param("year2")String year2,@Param("fileType")String fileType);
	//政治面貌统计
	List<Map<String,Object>> zzmm(@Param("year1")String year1,@Param("year2")String year2,@Param("fileType")String fileType);
	//档案类型统计
	List<Map<String,Object>> dtype(@Param("year1")String year1,@Param("year2")String year2,@Param("fileType")String fileType);


	
	
	/*List<Statistical> sendByYear2(@Param("year1")String year1,@Param("year2")String year2);
	List<Statistical> sendByYear3(@Param("year1")String year1,@Param("year2")String year2);*/
	
	
	/*List<Map<String,Object>> sendByMonth(@Param("year1")String year1,@Param("year2")String year2);
	List<Map<String,Object>> sendByMonth1(@Param("year1")String year1,@Param("year2")String year2);*/
}