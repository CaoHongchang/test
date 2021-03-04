package com.i84.earnpoint.hygsgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**业务受理审核
 * @author liu_quan
 *
 */
public interface YwslShInfoService {
	
	/**业务受理新增
	 * @param map
	 * @return
	 */
	boolean addYwsl(Map<String, Object> map); 
	
	
	/**业务受理列表
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectYwslList(Map<String,Object> obj)throws Exception; 
	List<Map<String,Object>>selectYwslshList(Map<String,Object> obj)throws Exception; 
	List<Map<String,Object>>selectYwslByHyList(Map<String, Object>m)throws Exception; 
	List<Map<String,Object>>selectYwslByLdList(Map<String, Object>m)throws Exception; 

	/**业务受理人员表
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectRoleByUser(Map<String,Object> obj); 
	/**单个业务受理记录查看
	 * @param response
	 * @param request
	 * @return
	 */
	Map<String,Object>selectYwslMsg(Map<String,Object> obj); 

	/**导出业务受理1
	 * @param obj
	 * @return
	 */
	Map<String,Object>selectExportYwsl(Map<String,Object> obj);
	/**导出业务受理2
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectExportYwslList(Map<String, Object>m);
	
	/**宏业公司
	 * @param obj
	 * @return
	 */
	Map<String,Object>selectExportYwslHy(Map<String,Object> obj); 
	
	/**业务查看
	 * @param obj
	 * @return
	 */
	Map<String,Object>selectYwView(Map<String,Object> obj); 
	
	 /**附件列表查看
	 * @param m
	 * @return
	 */
	List<Map<String,Object>>selectByfjList(Map<String, Object>m);

	Map<String,Object>selectYwViewZt(Map<String,Object> obj);
	List<Map<String,Object>>selectYwViewZtList(Map<String, Object>obj);
	/**结办
	 * @param map
	 * @return
	 */
	boolean ldshEnd(Map<String, Object> map); 
	/**关联业务经办查询
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectYwslByGlywjbList(Map<String,Object> obj)throws Exception;
	/**相关部门审核
	 * @param m
	 * @return
	 * @throws Exception
	 */
	List<Map<String,Object>>selectYwslByXgList(Map<String, Object>m)throws Exception;

}
