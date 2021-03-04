package com.i84.earnpoint.sydwzp.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.BgActivityUserPayInfoMapper;
import com.i84.earnpoint.model.BgActivityUserPayInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityUserPayInfoService;
@Service
public class BgActivityUserPayInfoServiceImpl extends BaseService implements BgActivityUserPayInfoService {
    @Autowired
    private BgActivityUserPayInfoMapper bgActivityUserPayInfoMapper;
 
	
	@Override
	public String orderInfo(int uid,String need_m) {
		
		Map params = new HashMap();
		params.put("isIn", 1);
		params.put("id", uid);
		Map p = new HashMap();
		p.put("flag",1);
		String orderid = uid+new SimpleDateFormat("yyyyMMdd") .format(new Date());
		BgActivityUserPayInfo pm = bgActivityUserPayInfoMapper.getActivityPayInfo(orderid);
		if(pm==null){
			BgActivityUserPayInfo record = new BgActivityUserPayInfo();
			record.setUid(uid);
			record.setOrderId(orderid);
			record.setState("未付款");
			record.setMsgFromId("支付宝");
			record.setpDate(new Date());
			record.setM(TextUtil.getFloat(need_m));//need_m
			int rt = bgActivityUserPayInfoMapper.insertSelective(record);
			if(rt<=0){
				p.put("flag", 0);
			}
		}else if(!"未付款".equals(pm.getState())){
			p.put("flag",0);
		}
	
		
		return response(p);
	}


	@Override
	public List<Map<String, Object>> userPayList(Map<String, Object> param) {
		return bgActivityUserPayInfoMapper.userPayList(param);
	}


	@Override
	public void test() {
		bgActivityUserPayInfoMapper.test1();
		bgActivityUserPayInfoMapper.test2();
	}
	

	
}
