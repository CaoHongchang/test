package com.i84.earnpoint.zcps.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.ExpertAssignWorkPo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.model.ZcDissertationScore;

public interface ExpertDissertationInfoService {
	/**
	 * 获得与某个活动中某个申报人在不同单位但同专业的专家
	 * @param sid    申报人的id
	 * @param activityId 申报人所在的活动
	 * @param expertIds  已经分配的专家id
	 * @return
	 */
	List<Map<String,Object>> listSamePointAndDifferentMajorExperts(Integer sid,Integer activityId,List<Integer> expertIds);
	/**
	 * 自动分配专家
	 * @param param  携带活动id
	 * @return
	 */
	String autoAssignExperts(Map<String,Object> param);

	/**
	 * 查询专家论文信息
	 * @param params
	 * @return
	 */
	List<Map<String,Object>> listExpertDissertationInfos(Map<String,Object> params);
	/**
	 * 查询已经分配任务的专家
	 * @param activityId
	 * @return
	 */
	List<ExpertAssignWorkPo> listExpertAssignWorkPos(Integer activityId);

	/**
	 * 删除所有论文分配的专家，但论文已分配并且专家已登录过的分配无法被删除
	 * @param activityId
	 * @return
	 */
	String deleteAllAssignedExperts(Integer activityId);

	/**
	 * 再次自动分配专家
	 * @param param  携带活动id
	 * @return
	 */
	String autoAssignExpertsAgain(Map<String,Object> param);


	/**
	 * 查询论文分配
	 * @param activityId
	 * @return
	 */
	List<Map<String,Object>> queryDissertationAssign(Map<String,Object> param);
	/**
	 * 根据专家的id查询专家
	 * @param expertId
	 * @return
	 */
	UserExpertInfo selectUserExpertInfoById(Integer expertId);

	/**
	 * 根据论文编号获取论文
	 * @param pno
	 * @return
	 */
	ZcDissertationInfo selectZcDissertationInfoByPno(String pno);
	/**
	 * 删除论文分配专家
	 * @param record
	 * @return
	 */
	int delectDissertationAssign(ZcDissertationScore record);
	/**
	 * 更新论文分配
	 * @param record
	 * @return
	 */
	int updateDissertationAssign(ZcDissertationScore record);
	/**
	 * 新增论文分配
	 * @param record
	 * @return
	 */
	int insertDissertationAssign(ZcDissertationScore record);
	/**
	 * 根据专家编号获取专家
	 * @param zpno
	 * @return
	 */
	UserExpertInfo selectUserExpertInfoByZpno(String zpno);


	String cloaseScore(Map<String, Object> param);

}
