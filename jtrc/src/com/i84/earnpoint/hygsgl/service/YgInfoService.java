package com.i84.earnpoint.hygsgl.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.HyBusinessInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.YgImportVo;


/**员工导入
 * @author liu_quan
 *
 */
public interface YgInfoService {
    
	public void insertYgList(List<YgImportVo> ygList)throws Exception;
	/**员工列表
	 * @param userInfo
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> selectYgList(Map<String,Object> userInfo)throws Exception;
	public List<Map<String,Object>> selectYgList2(Map<String,Object> userInfo)throws Exception;

	/**员工信息
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public Map<String,Object> getYgMsg(Map<String,Object>map)throws Exception;
	/**员工审核
	 * @param hyBusinessInfo
	 * @return
	 * @throws Exception
	 */
	int yyglExamine(HyBusinessInfo hyBusinessInfo)throws Exception;
	/**合同列表
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> agreementList(Map<String,Object> map)throws Exception;
	/**企业列表
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map<String,Object>> enterpriseList(Map<String,Object> map)throws Exception;
	/**员工修改
	 * @param paramSetAdd
	 * @param htParam
	 * @return
	 */
	public boolean yyglEdit(Map<String, Object> paramSetAdd, String htParam)throws Exception;
	
	public boolean delYgFuc( String id)throws Exception;

	public Map<String, Object> isCode(Map<String, Object> map)throws Exception;
	UserInfo selectYg(UserInfo record)throws Exception;
	/**获取企业名称
	 * @param map
	 * @return
	 * @throws Exception
	 */
	public List<Map<String, Object>> selectEnterpriseName(Map<String, Object> map)throws Exception;



}
