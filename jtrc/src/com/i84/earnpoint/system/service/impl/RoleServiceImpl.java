package com.i84.earnpoint.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.mapper.RoleMapper;
import com.i84.earnpoint.model.Auth;
import com.i84.earnpoint.model.Role;
import com.i84.earnpoint.system.service.AuthService;
import com.i84.earnpoint.system.service.RoleService;

/** 角色
 * @author liu_q
 *
 */
@Service
public class RoleServiceImpl implements RoleService {

	@Autowired
	private RoleMapper roleMapper;

	@Override
	public int deleteByPrimaryKey(Integer roleid) {
		return 0;
	}

	@Override
	public int insert(Role record) {
		
		Role r = roleMapper.selectByPrimaryKey(record.getRoleid());
		if(r!=null){
			r.setRolename(record.getRolename());
		    r.setRoledescription(record.getRoledescription());
			return roleMapper.updateByPrimaryKeySelective(record);
			
		}
		else
			return roleMapper.insert(record);
	}

	@Override
	public int insertSelective(Role record) {
		return 0;
	}

	@Override
	public Role selectByPrimaryKey(Integer roleid) {
		return roleMapper.selectByPrimaryKey(roleid);

	}

	@Override
	public int updateByPrimaryKeySelective(Role record) {
		// TODO Auto-generated method stub
		return roleMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(Role record) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<Role> selectListByPrimary(Role record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		List<Role> list =roleMapper.selectListByPrimary(record);

		return list;
	}
	@Override
	public List<Role> selectAllRoleList(Role record){
		return roleMapper.selectListByPrimary(record);
	}
}
