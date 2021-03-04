package com.i84.earnpoint.rsdlgl.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.RsBusinessInfoMapper;
import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.rsdlgl.service.RsBusinessInfoService;


/**人事代理信息管理
 * @author zhengqr
 *
 */
@Service
public class RsBusinessInfoServiceImpl implements RsBusinessInfoService {
	@Autowired
	private RsBusinessInfoMapper rsBusinessInfoMapper;

	@Override
	public void deleteByPrimaryKeys(String ids, HttpServletResponse response)
			throws Exception {
		JSONObject result=new JSONObject();
		String[] idArray = ids.split(",");
		int delNums = rsBusinessInfoMapper.deleteByPrimaryKeys(idArray);
		if(delNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "删除失败");
		}
		
	}

	@Override
	public void insert(RsBusinessInfo rsBusinessInfo,
			HttpServletResponse response) throws Exception {
        JSONObject result=new JSONObject();
		
		int saveNums = rsBusinessInfoMapper.insert(rsBusinessInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "保存失败");
		}
		
	}

	@Override
	public List<RsBusinessInfo> selectListByPrimary(
			RsBusinessInfo rsBusinessInfo) {
		
		//已审核状态且过了15天的自动改为已办结
		PageHelper.startPage(rsBusinessInfo.getPage(),rsBusinessInfo.getRows());
		List<RsBusinessInfo> list2 = rsBusinessInfoMapper.selectListByPrimary(rsBusinessInfo);
		Date now= new Date();
		SimpleDateFormat dfs = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		RsBusinessInfo rb = new RsBusinessInfo();
		for(RsBusinessInfo businessInfo2:list2){
		if(businessInfo2.getSstate()==1){
			try{
			long between=(now.getTime()- dfs.parse(businessInfo2.getAddDate()).getTime())/(1000*24*3600);
			if(between>15){
				rb.setBjDate(dfs.format(now));
				rb.setSstate(3);
				rb.setId(businessInfo2.getId());
				rsBusinessInfoMapper.updateByBj(rb);
			}
			}catch(Exception e){
			e.printStackTrace();
			}
			}
		}
		
//		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		PageHelper.startPage(rsBusinessInfo.getPage(),rsBusinessInfo.getRows());
		List<RsBusinessInfo> list = rsBusinessInfoMapper.selectListByPrimary(rsBusinessInfo);
		
		for(RsBusinessInfo businessInfo:list){
			if(businessInfo.getBusinessId()==99999){
				businessInfo.setBusinessName(businessInfo.getOtherName());
			}
		}
		return list;
	}

	@Override
	public void updateByPrimaryKey(RsBusinessInfo rsBusinessInfo,
			HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		int saveNums = rsBusinessInfoMapper.updateByPrimaryKey(rsBusinessInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
		
	}

	@Override
	public void kdAdd(RsBusinessInfo rsBusinessInfo,
			HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		int saveNums = rsBusinessInfoMapper.updateByAddKd(rsBusinessInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "新增快递单号失败");
		}
	}

	@Override
	public void shBusinessInfo(RsBusinessInfo rsBusinessInfo,
			HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		int saveNums = rsBusinessInfoMapper.updateBySh(rsBusinessInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "审核失败");
		}
	}
	
	@Override
	public void bjBusinessInfo(RsBusinessInfo rsBusinessInfo,
			HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		int saveNums = rsBusinessInfoMapper.updateByBj(rsBusinessInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "办结失败");
		}
	}

	
}
