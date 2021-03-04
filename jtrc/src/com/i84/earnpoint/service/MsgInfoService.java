package com.i84.earnpoint.service;

import java.util.List;
import java.util.Map;

import com.i84.earnpoint.model.MsgInfo;

public interface MsgInfoService{
	/**
	 * 插入资讯信息
	 * @param msgInfo
	 * @return
	 */
	int insertMsgInfo(MsgInfo msgInfo,String fjParam);

	/**
	 * 更新资讯信息
	 * @param msgInfo
	 * @return
	 */
	int updateMsgInfo(MsgInfo msgInfo,String fjParam);

	/**
	 * 根据资讯分流id获取最大的序列
	 */
	int selectMaxSeqByTypeId(Integer typeInfoId);
	/**
	 * 根据资讯信息列出资讯信息
	 * @param msgInfo
	 * @return
	 */
	List<MsgInfo> listMsgInfo(MsgInfo msgInfo);
	
	int deleteMsgInfo(String ids);
	
	boolean hasMsgInfoSeq(Integer id, int typeId,int seq);
	
	  List<Map> selectfj(Map map);
}