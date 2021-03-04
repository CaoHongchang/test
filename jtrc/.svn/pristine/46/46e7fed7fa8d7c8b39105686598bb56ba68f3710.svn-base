package com.i84.earnpoint.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.MsgFromInfoMapper;
import com.i84.earnpoint.mapper.PartyMoneyInfoMapper;
import com.i84.earnpoint.mapper.UserPartyInfoMapper;
import com.i84.earnpoint.model.PartyMoneyInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.service.PartyMoneyInfoService;
@Service
public class PartyMoneyInfoServiceImpl implements PartyMoneyInfoService {
	@Autowired
	private PartyMoneyInfoMapper partyMoneyInfoMapper;

	@Autowired
	private UserPartyInfoMapper userPartyInfoMapper;
	@Autowired
	private MsgFromInfoMapper msgFromInfoMapper;

	@Override
	public List<Map<String,Object>> queryPartyMoneyInfos(
			Map<String,Object> record) {
		// TODO Auto-generated method stub
		return partyMoneyInfoMapper.selectPartyMoneyByMap(record);
	}
	
//	@Override
//	public List<PartyMoneyInfo> queryPartyMoneyInfos(
//			PartyMoneyInfo record) {
//		// TODO Auto-generated method stub
//		return partyMoneyInfoMapper.selectBySelective(record);
//	}
    /**
     * 更新已经缴费及还需缴费
     */
	@Override
	public void updateUserPartyInfo(String pnum) {
		// TODO Auto-generated method stub
		    Map<String,Object> m=new HashMap<String, Object>();
		    m.put("pnum", pnum);
			List<Map<String, Object>> infos=userPartyInfoMapper.selectUserPartyInfoWidthPnum(m);
			if(infos.size()>0){
				Float sum=partyMoneyInfoMapper.selectUserPartyMoneySum(pnum);
				Float addM=(Float) infos.get(0).get("add_m");
				Integer id=TextUtil.getInt(infos.get(0).get("id"));
				UserPartyInfo userPartyInfo=new UserPartyInfo();
				userPartyInfo.setId(id);
				userPartyInfo.setM(sum==null?0:sum);
				userPartyInfo.setNeedM(addM-(sum==null?0:sum));
				userPartyInfoMapper.updateByPrimaryKeySelective(userPartyInfo);
			}
	}
   /**
    * 保存党员缴费信息
    */
	@Override
	public int savePartyMoneyInfo(PartyMoneyInfo partyMoneyInfo) {
		int count=partyMoneyInfoMapper.insertSelective(partyMoneyInfo);
		
		return count;
	}

	@Override
	public void checkIsOrderNoExist(String orderNo, HttpServletResponse response)
			throws Exception {
		response.setCharacterEncoding("utf-8");
		// TODO Auto-generated method stub
		PartyMoneyInfo partyMoneyInfo=partyMoneyInfoMapper.selectPartyMoneyInfoByOrderNo(orderNo);
		JSONObject object=new JSONObject();
		if(partyMoneyInfo!=null){
			object.put("flag", true);
		}else{
			object.put("flag", false);
		}
		response.getWriter().write(object.toString());
		response.getWriter().flush();
	}
   /**
    * 更新党员缴费信息
    */
	@Override
	public int updatePartyMoneyInfo(PartyMoneyInfo partyMoneyInfo) {
		// TODO Auto-generated method stub
		int count=partyMoneyInfoMapper.updateByPrimaryKeySelective(partyMoneyInfo);
		
		return count;
	}
/**
 * 删除党员缴费信息
 */
@Override
public void deletePartyMoneyInfos(String[] array, HttpServletResponse response)
		throws Exception {
	// TODO Auto-generated method stub
	response.setCharacterEncoding("utf-8");
	int count=partyMoneyInfoMapper.deletePartyMoneyInfoByIds(array);
	JSONObject object=new JSONObject();
	if(count>0){
		object.put("flag", true);
		object.put("cause", "删除党员缴费信息成功！");
	}else{
		object.put("flag", false);
		object.put("cause", "删除党员缴费信息失败！");
	}
	response.getWriter().write(object.toString());
	response.getWriter().flush();
}
}
