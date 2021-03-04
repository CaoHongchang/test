package com.i84.earnpoint.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;


import com.i84.earnpoint.model.UserPartyInfo;

public interface UserPartyInfoService {
	

	
	List<Map<String,Object>> selectUserPartyInfoWidthPnum(Map<String,Object> record);
	
	boolean checkUserPartyInfoExist(String pno);
	
	void updateHistoryPartyFee(String [] pnos,String [] hisDate,HttpServletResponse response)throws Exception ;
	
	void updatePartyFeeMsg(String pnum);
	
	void updateUserPartyInfo(UserPartyInfo record);
	/**
	 * 查找中心党员
	 * @param record
	 * @param response
	 * @return
	 */
	Map<String,Object> queryIsInUserPartyInfo(Map<String,Object> record);
	/**
	 * 检查某个党员是否符合缴纳党费的条件
	 * 需缴金额不为空 且已缴总额不大于需缴金额  应缴总额不为空 从历史党费缴至到当前年的基准都存在
	 * @param pnum
	 * @return
	 */
	String checkIsEnablePay(String pnum);
	
}
