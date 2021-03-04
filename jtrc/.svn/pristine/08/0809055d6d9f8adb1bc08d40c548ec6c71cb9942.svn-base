package com.i84.earnpoint.system.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.Auth;


/**菜单
 * @author liu_q
 *
 */
public interface AuthService {
    int deleteByPrimaryKey(Integer authid);

    int insert(Auth record);

    int insertSelective(Auth record);

    Auth selectByPrimaryKey(Integer authid);
    
    List<Auth> selectListByPrimaryKey(Auth auth);

    int updateByPrimaryKeySelective(Auth record);

    int updateByPrimaryKey(Auth record);
    
    void deleteMunu(Auth record,HttpServletResponse response)throws Exception ;
    
    void saveMunu(Auth record,HttpServletResponse response)throws Exception ;
    
	List<Auth> selectListByPrimaryKeyAll(Auth auth);
	
	String check(HttpServletRequest request);
}