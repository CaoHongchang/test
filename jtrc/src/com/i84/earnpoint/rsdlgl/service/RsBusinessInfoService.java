package com.i84.earnpoint.rsdlgl.service;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.model.Auth;
import com.i84.earnpoint.model.Role;


/**人事代理信息管理
 * @author zhengqr
 *
 */
public interface RsBusinessInfoService {
    
    List<RsBusinessInfo> selectListByPrimary(RsBusinessInfo rsBusinessInfo);
	
    void insert(RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;
	
    void updateByPrimaryKey(RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;
	
    void deleteByPrimaryKeys(String ids,HttpServletResponse response) throws Exception;
    
    void kdAdd(RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;
    
    void shBusinessInfo(RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;
    
    void bjBusinessInfo(RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception;

}