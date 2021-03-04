package com.i84.earnpoint.service.impl;

import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.mapper.PartyBaseInfoMapper;
import com.i84.earnpoint.mapper.PartyMoneyInfoMapper;
import com.i84.earnpoint.mapper.UserPartyInfoMapper;
import com.i84.earnpoint.model.PartyBaseInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.service.UserPartyInfoService;

@Service
public class UserPartyInfoServiceImpl extends BaseService implements UserPartyInfoService {
	@Autowired
	private UserPartyInfoMapper userPartyInfoMapper;
	@Autowired
	private PartyBaseInfoMapper partyBaseInfoMapper;
	@Autowired
	private PartyMoneyInfoMapper partyMoneyInfoMapper;

	

	@Override
	public boolean checkUserPartyInfoExist(String pno) {
		// TODO Auto-generated method stub
		Map<String, Object> record = new HashMap<String, Object>();
		record.put("pnum", pno);
		List<Map<String, Object>> list = selectUserPartyInfoWidthPnum(record);
		return list.size() > 0 && list.get(0).get("his_date") != null ? true: false;
	}

	@Override
	public void updateHistoryPartyFee(String[] pnos, String[] hisDates,
			HttpServletResponse response) throws Exception {
		int count = 0;
		for (int i = 0; i < pnos.length; i++) {
			UserPartyInfo userPartyInfo = new UserPartyInfo();
			Map<String, Object> record = new HashMap<String, Object>();
			record.put("pnum", pnos[i]);
			List<Map<String, Object>> list = selectUserPartyInfoWidthPnum(record);
			if (list.size() > 0) {
				userPartyInfo.setPno(String.valueOf(list.get(0).get("pno")));
				userPartyInfo.setHisDate(DateUtil.stringToDate(hisDates[i],"yyyyMM"));
				count += userPartyInfoMapper.updateHistoryDate(userPartyInfo);
				updatePartyFeeMsg(pnos[i]);//更新历史党费
			}
		
		}
		JSONObject object = new JSONObject();
		if (count > 0) {
			object.put("flag", true);
			object.put("msg", "保存数据成功！");
		} else {
			object = new JSONObject();
			object.put("flag", false);
			object.put("msg", "保存数据失败");
		}
		response.getWriter().write(object.toString());
		response.getWriter().flush();

	}

	@Override
	public List<Map<String, Object>> selectUserPartyInfoWidthPnum(
			Map<String, Object> record) {
		// TODO Auto-generated method stub
		List<Map<String,Object>> list=userPartyInfoMapper.selectUserPartyInfoWidthPnum(record);
		return list;
	}

	/**
	 * 初始化党费信息
	 */
	@Override
	public void updatePartyFeeMsg(String pnum) {
		UserPartyInfo userPartyInfo = userPartyInfoMapper.selectUserPartyInfoByPnum(pnum);
		if (userPartyInfo != null) {
			// 获取入党年月
			Date party_date = userPartyInfo.getPartyDate();
			// 获取历史党费缴至
			Date his_date = userPartyInfo.getHisDate();
			// 获取当前的时间
			Date now_date = new Date();
			if (his_date == null && party_date != null) {
				his_date = party_date;
			}
			if (his_date != null && party_date != null && now_date != null) {
				Calendar calendar=Calendar.getInstance();
				calendar.setTime(party_date);
				int party_year =calendar.get(Calendar.YEAR);
				int party_month = calendar.get(Calendar.MONTH)+1;
				calendar.setTime(his_date);
				int his_year = calendar.get(Calendar.YEAR);
				int his_month = calendar.get(Calendar.MONTH)+1;
				calendar.setTime(now_date);
				int now_year = calendar.get(Calendar.YEAR);
				int now_month = calendar.get(Calendar.MONTH)+1;
				int flag1=0,flag2=0;
				// 入党时间<历史党费缴至<当前时间
				if ((DateUtil.isDateBefore(party_date, his_date)||his_date==party_date)&& DateUtil.isDateBefore(his_date, now_date)) {
					Float m_his = 0.0f; // 历史已交金额
					Float add_m = 0.0f;// 应缴总额
					for (int i = party_year; i <= now_year; i++) {
						PartyBaseInfo p = new PartyBaseInfo();
						p.setPnum(pnum);
						p.setPyear(i + "");
						List<PartyBaseInfo> partyBaseInfos = partyBaseInfoMapper.selectBySelective(p);
						if (partyBaseInfos.size() > 0) {
							Float baseM = Float.valueOf(partyBaseInfos.get(0).getBaseM());
							//计算每年的历史缴费
							if (i <= his_year&&flag1==0) {
							    m_his+=compute(i, party_year, party_month, his_year, his_month, baseM,true);
							}
							//计算每年的缴费总额
							if (i >= his_year&&flag2==0) {
								add_m+=compute(i, his_year, his_month, now_year, now_month, baseM,false);
							}

						}
						else{//有一年的基准不存在则不计算
							if(i<=his_year){
								flag1=1;
							}
							if(i>=his_year){
								flag2=1;
							} 
						}
					}
					 UserPartyInfo record=new UserPartyInfo();
					 record.setId(userPartyInfo.getId());
					 //设置应该缴纳的党费总额
					 if(flag2!=1){
						 record.setAddM(add_m);
						 //查询已经缴费
						 Float m=partyMoneyInfoMapper.selectUserPartyMoneySum(pnum);
						 if(m!=null){
						     //更新需缴金额
							 record.setNeedM(add_m-m);
							 //更新已缴金额
							 record.setM(m);
						 }else{//已缴金额为空，设置需缴金额为应缴总额
							 record.setNeedM(add_m);
						 }
					 }
					 if(flag1!=1){
						 //设置历史已缴党费
						 record.setmHis(m_his);
					 }
					 if(flag1==0&&flag2==0){
						 //更新党员缴费信息
						 updateUserPartyInfo(record);	
					 }

				}
			}

		}
	}

	@Override
	public void updateUserPartyInfo(UserPartyInfo record) {
		// TODO Auto-generated method stub
		userPartyInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public Map<String, Object> queryIsInUserPartyInfo(Map<String, Object> record) {
		// TODO Auto-generated method stub
		updatePartyFeeMsg(record.get("pnum")+"");
		List<Map<String, Object>> list = userPartyInfoMapper.selectUserPartyInfoWidthPnum(record);
		return list.size() > 0 ? list.get(0) : null;
	}
    /**
     * 计算每一年需缴纳的党费
     * @param index
     * @param pyear
     * @param pmonth
     * @param year
     * @param month
     * @param baseM
     * @param onemore
     * @return
     */
	public Float compute(int index,int pyear,int pmonth,int year,int month,Float baseM,boolean onemore) {
		Float m=0.0F;
		if(pyear>year) return 0F;
		if (index == pyear) {
			m = baseM * ((pyear==year?month:12) - pmonth)+(onemore?baseM:0.0F);
		}
		else if (index > pyear && index < year) {
			m = 12 * baseM;
		}
		else {
			m = month * baseM;
		}
		return m;
	}

	@Override
	public String checkIsEnablePay(String pnum) {
		// TODO Auto-generated method stub
		JSONObject object=new JSONObject();
		UserPartyInfo userPartyInfo=userPartyInfoMapper.selectUserPartyInfoByPnum(pnum);
		//需缴金额不为空 且已缴总额不大于需缴金额 应缴总额不为空 从历史党费缴至到当前年的基准都存在
		if(userPartyInfo!=null){
			Date partyDate=userPartyInfo.getPartyDate();
			//入党时间为空
			if(partyDate==null){
				object.put("flag", false);
				object.put("cause", "入党时间不能为空！");
				return response(object);
			}
			else{
				Date hisDate=userPartyInfo.getHisDate();
				Date nowDate=new Date();
				//历史党费缴至时间为空
				if(hisDate==null){
					hisDate=partyDate;
				}else{
					if(DateUtil.isDateBefore(hisDate, partyDate)){
						object.put("flag", false);
						object.put("cause", "历史党费缴至时间不能早于入党时间！");
						return response(object);
					}
					if(DateUtil.isDateBefore(nowDate, partyDate)){
						object.put("flag", false);
						object.put("cause", "入党时间不能晚于当前时间！");
						return response(object);
					}
				}
				if((DateUtil.isDateBefore(partyDate, hisDate)||hisDate==partyDate)&&DateUtil.isDateBefore(partyDate, nowDate)){
					Calendar calendar=Calendar.getInstance();
					calendar.setTime(hisDate);
					int hisYear=calendar.get(Calendar.YEAR);
					calendar.setTime(nowDate);
					int nowYear=calendar.get(Calendar.YEAR);
					String cause="";
					for(int i=hisYear;i<=nowYear;i++){
						if(!checkIsPartyBaseInfoExist(pnum, i+"")){
							cause+=i+"年,";
						}
					}
					if(!"".equals(cause)){
						object.put("false", false);
						object.put("cause", cause+"缴费基准尚未导入！\r\n");
						return response(object);
					}
					
				}else{
					object.put("flag", false);
					object.put("cause", "历史党费缴至时间应晚于入党时间，入党时间应晚于当前时间！");
					return response(object);
				}
			}
			Float addM=userPartyInfo.getAddM();
			Float needM=userPartyInfo.getNeedM();
			Float M=userPartyInfo.getM();
			if(needM!=null&&M!=null&&needM<M){
				object.put("flag", false);
				object.put("cause", "应缴总额不能大于需缴金额！");
				return response(object);
			}
			if(needM==null){
				object.put("flag", false);
				object.put("cause", "需缴金额不能为空！");
				return response(object);
			}
			if(addM==null){
				object.put("flag", false);
				object.put("cause", "应缴总额不能为空！");
				return response(object);
			}
			
		}else{
			object.put("flag", false);
			object.put("cause", "传入空参数或者该党员不存在！");
		}
		object.put("flag", true);
		return response(object);
	}
    /**
     * 查询某个党员某一年的基准是否存在
     * @return
     */
	public boolean checkIsPartyBaseInfoExist(String pnum,String pyear){
		PartyBaseInfo record=new PartyBaseInfo();
		record.setPnum(pnum);
		record.setPyear(pyear);
		return partyBaseInfoMapper.selectBySelective(record).size()>0?true:false;
	}
	
	
}
