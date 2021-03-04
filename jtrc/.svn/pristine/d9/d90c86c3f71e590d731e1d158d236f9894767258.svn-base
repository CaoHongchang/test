package com.i84.earnpoint.hygsgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.UserInfo;




/**工资管理
 * @author liu_quan
 *
 */
public interface GzInfoService {
	
	/**工资新增（事业）
	 * @param map
	 * @return
	 */
	int addGzSy(Map<String, Object> map); 
	/**工资新增（企业）
	 * @param map
	 * @return
	 */
	int addGzQy(Map<String, Object> map); 
	 /**工资导入
	 * @param dataSy
	 * @param dataQy
	 * @throws Exception
	 */
	void addGz(String dataSy,String dataQy,String uid) throws Exception;
	/**工资列表
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectGzglList(Map<String,Object> obj); 

	/**工资导出
	 * @param response
	 * @param request
	 */
	void gzExport(HttpServletResponse response,HttpServletRequest request)throws Exception;
	/**企业工资详情
	 * @param obj
	 * @return
	 */
	public Map<String, Object> selectQyOrSy(Map<String, Object> obj);
	
	int updateBmoneyBySelective(Map<String,Object>obj)throws Exception;
	int updateMoneyBySelective(Map<String, Object> obj)throws Exception;
	int deleteByBmoney(Map<String, Object> obj)throws Exception;
	int deleteByMoney(Map<String,Object>obj)throws Exception;
	UserInfo selectYg(UserInfo record)throws Exception;
	Integer isQyGz(String salaryDate,String uid);
	Integer isSyGz(String salaryDate,String uid);
}
