package com.i84.earnpoint.mapper;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.User;



/**
 * 用户信息
 * @author liu_q
 *
 */
public interface UserMapper {
    
    int deleteByPrimaryKey(Integer userid);

    int insert(User record);

    int insertSelective(User record);

    User selectByPrimaryKey(Integer userid);
    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);
    
    Map login(User record);
    
    User selectByUserName(String username);
    
    List<Map<String,Object>> selectUserBySelective(Map<String,Object> record);
    
    Map<String,Object> selectUserAndDepartment(Integer userId);
}