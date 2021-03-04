package com.i84.earnpoint.hygsgl.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.BusinessOtherInfo;




/**业务管理
 * @author liu_quan
 *
 */
public interface YwglInfoService {
	
	/**业务管理新增
	 * @param map
	 * @return
	 */
	boolean addYwgl(Map<String, Object> map,String fjparam)throws Exception; 
	
	boolean editYwgl(String id,String uid,Map<String, Object> map,String fjparam)throws Exception; 

	public boolean editYwgl(String id)throws Exception;
	/**业务管理列表
	 * @param obj
	 * @return
	 */
	List<Map<String,Object>>selectYwglList(Map<String,Object> obj); 

	BusinessOtherInfo selectBusinessOther(Integer id);
	
    Map<String,Object>selectIsExistYwsl(Map<String,Object>map);

}
