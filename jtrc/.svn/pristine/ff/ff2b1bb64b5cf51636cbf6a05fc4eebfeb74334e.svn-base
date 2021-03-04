package com.i84.earnpoint.aqsczxy.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.ContractModel;
import com.i84.earnpoint.model.EnterpriseCheck;
import com.i84.earnpoint.model.SafetyProductionConsult;
import com.i84.earnpoint.model.SafetyProductionConsultMaterial;


/**
 * 安全生产咨询服务接口
 * @author zhengqr
 *
 */
public interface AqsczxService {
	
	/**
	 * 修改安全生产标准化咨询
	 * @return
	 */
	void updSafetyProductionConsult(HttpServletResponse response,SafetyProductionConsult safetyProductionConsult);
	
	/**
	 * 修改安全生产标准化咨询合同确认
	 * @return
	 */
	void htqrSafetyProductionConsult(HttpServletResponse response,SafetyProductionConsult safetyProductionConsult);
	
	/**
	 * 企业审核培训完成（批量）
	 * @return
	 */
	void pxwcSafetyProductionConsult(HttpServletResponse response,SafetyProductionConsult safetyProductionConsult);
	
	/**
     * 	安全生产标准化咨询列表
     */
	List<Map<String, Object>> queryAqsczxList(Map<String, Object> record);
	
	/**
	 * 保存合同模板
	 * @param contractModel
	 */
	void insertContractModel(HttpServletResponse response,ContractModel contractModel);
	
	/**
	 * 根据条件搜索合同模板
	 * @return
	 */
	List<Map<String, Object>> qryContractModel(Map<String, Object> record);
	
	/**
	 * 根据条件搜索排查列表
	 * @return
	 */
	List<Map<String, Object>> qryEnterpriseCheck(Map<String, Object> record);
	
	/**
	 * 修改合同模板
	 * @param updateObj
	 */
	void updateContractModel(HttpServletResponse response,ContractModel contractModel);
	/**
	 * 获取下一编号
	 * @return
	 */
	public String getNextMid();
	
	/**
	 * 根据条件查询安全标准化咨询材料
	 * @param record
	 * @return
	 */
	public List<Map<String, Object>> queryAqsczxClList(Map<String, Object> record);
	
	/**
	 * 删除安全生产标准化咨询材料
	 * @return
	 */
	void updSafetyProductionConsultMaterial(HttpServletResponse response,SafetyProductionConsultMaterial safetyProductionConsultMaterial);

	/**
	 * 排查审核
	 * @return
	 */
	void pcsh(HttpServletResponse response,SafetyProductionConsult safetyProductionConsult);
	
	/**
	 * 保存材料
	 * @param contractModel
	 */
	void insertSafetyProductionConsultMaterial(SafetyProductionConsultMaterial safetyProductionConsultMaterial);
	
	/**
	 * 根据年份统计
	 * @return
	 */
	List<Map<String, Object>> countByYear(Map<String, Object> record);
}