package com.i84.earnpoint.hygsgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




/**业务分类管理
 * @author liu_quan
 *
 */
public interface YwflInfoService {
	
	/**业务分类新增
	 * @param map
	 * @return
	 */
	int addYwfl(Map<String, Object> map)throws Exception; 
	int editYwfl(Map<String, Object> map)throws Exception;
	
	/**工资列表
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectYwflList(Map<String,Object> obj); 

	List<Map<String,Object>>selectYwflData(Map<String,Object> obj); 
    Map<String,Object>selectIsExist(Map<String,Object>map); 


}
