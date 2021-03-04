package com.i84.earnpoint.system.service.impl;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.mapper.AuthMapper;
import com.i84.earnpoint.model.Auth;
import com.i84.earnpoint.system.service.AuthService;


/**菜单
 * @author liu_q
 *
 */
@Service
public class AuthServiceImpl extends BaseService implements AuthService {
	@Autowired
	private AuthMapper authMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer authid) {
		return 0;
	}

	@Override
	public int insert(Auth record) {
		return 0;
	}

	@Override
	public int insertSelective(Auth record) {
		return 0;
	}

	@Override
	public Auth selectByPrimaryKey(Integer authid) {
		return authMapper.selectByPrimaryKey(authid);
	}

	@Override
	public int updateByPrimaryKeySelective(Auth record) {
		return 0;
	}

	@Override
	public int updateByPrimaryKey(Auth record) {
		return 0;
	}

	@Override
	public List<Auth> selectListByPrimaryKey(Auth auth) {
		return authMapper.selectListByPrimaryKey(auth);
	}
	@Override
	public List<Auth> selectListByPrimaryKeyAll(Auth auth) {
		return authMapper.selectListByPrimaryKeyAll(auth);
	}

	@Override
	public void deleteMunu(Auth record,HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		String authId=record.getAuthid().toString();
		if(isLeaf(authId)){
			result.put("errorMsg", "该菜单节点有子节点，不能删除！");
		}else{
			int delNums=0;
			Auth at=new Auth();
			at.setParentid(Integer.valueOf(record.getParentid()));
			at.setIsshow(0);
			List<Auth> authList=authMapper.selectListByPrimaryKey(at);
			
			if(authList!=null && authList.size()==1){
				Auth at2=new Auth();
				at2.setState("open");
				at2.setAuthid(record.getAuthid());
				authMapper.updateByPrimaryKeySelective(at2);
				delNums=authMapper.deleteByPrimaryKey( record.getAuthid());
			}else{
				delNums=authMapper.deleteByPrimaryKey( record.getAuthid());
			}
			if(delNums>0){
				result.put("success", true);
			}else{
				result.put("errorMsg", "删除失败");
			}
		   }
		   ResultConstant.write(response, result);
		
	}
	public boolean isLeaf(String authId)throws Exception{
		Auth at=new Auth();
		at.setParentid(Integer.valueOf(authId));
		at.setIsshow(0);
		List<Auth> authList=authMapper.selectListByPrimaryKey(at);
		if(authList!=null&&authList.size()>0){
			return true;
		}
		return false;
	}

	@Override
	public void saveMunu(Auth record, HttpServletResponse response)throws Exception {
		boolean isLeaf=false;
		
			JSONObject result=new JSONObject();
			
			int saveNums=0;
			if(record.getAuthid()!=null){
				saveNums=authMapper.updateByPrimaryKeySelective(record);
			}else{
				isLeaf=isLeaf(record.getParentid()==null?null:record.getParentid().toString());
				if(isLeaf){
					Auth at=new Auth();
					at.setState("closed");
					at.setParentid(record.getParentid()==null?null:Integer.valueOf(record.getParentid()));
					authMapper.updateByPrimaryKeySelective(at);
					
					record.setState("open");
					saveNums=authMapper.insertSelective(record);
				}else{
					record.setState("open");
					saveNums=authMapper.insertSelective(record);
				}
			}
			if(saveNums>0){
				result.put("success", true);
			}else{
				result.put("success", true);
				result.put("errorMsg", "保存失败");
			}
			ResultConstant.write(response, result);
		}

	@Override
	public String check(HttpServletRequest request) {
		
		List r = (ArrayList)request.getSession().getAttribute(SystemContant.PRIVILEGES);
		
		return response(r);
	}

	
}
