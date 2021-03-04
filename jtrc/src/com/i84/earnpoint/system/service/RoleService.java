package com.i84.earnpoint.system.service;

import java.util.List;

import com.i84.earnpoint.model.Role;


/**
 * 角色
 * @author liu_q
 *
 */
public interface RoleService {
    int deleteByPrimaryKey(Integer roleid);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Integer roleid);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);
    
    List<Role> selectListByPrimary(Role record);
    
    List<Role> selectAllRoleList(Role record);
}