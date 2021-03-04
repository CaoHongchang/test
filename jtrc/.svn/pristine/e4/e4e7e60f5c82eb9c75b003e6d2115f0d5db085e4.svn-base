package com.i84.earnpoint.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.mapper.MsgInfoMapper;
import com.i84.earnpoint.mapper.ZcOtherInfoMapper;
import com.i84.earnpoint.model.MsgInfo;
import com.i84.earnpoint.model.ZcOtherInfo;
import com.i84.earnpoint.service.MsgInfoService;
@Service
public class MsgInfoServiceImpl implements MsgInfoService{

	@Autowired
	private MsgInfoMapper msgInfoMapper;
	@Autowired
	private ZcOtherInfoMapper zcOtherInfoMapper;
	@Override
	public int insertMsgInfo(MsgInfo msgInfo,String fjParam) {
		// TODO Auto-generated method stub
		int c= msgInfoMapper.insertSelective(msgInfo);
		if(c>0){
			//附件操作
			if(StringUtils.isNotEmpty(fjParam)){
				ZcOtherInfo z=new ZcOtherInfo();
				z.setAid(msgInfo.getId());
			    z.setDelDate(new Date());
			    z.setFileType(4);//4：后台咨询新增列表
				zcOtherInfoMapper.updateByPrimaryKeySelective(z);
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjParam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					
					ZcOtherInfo zc=new ZcOtherInfo();
					zc.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
					zc.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
					zc.setAid(msgInfo.getId());
					zc.setAddDate(new Date());
					zc.setFileType(4);//4：后台咨询新增列表
					zc.setStuff(msgInfo.getUid());
					zcOtherInfoMapper.insertSelective(zc);
				}
			}
			//
			
		}
		return c;
		
		
		
	}

	@Override
	public int updateMsgInfo(MsgInfo msgInfo,String fjParam) {
		// TODO Auto-generated method stub
		int c= msgInfoMapper.updateByPrimaryKeyWithBLOBs(msgInfo);
		if(c>0){
			//附件操作
			if(StringUtils.isNotEmpty(fjParam)){
				ZcOtherInfo z=new ZcOtherInfo();
				z.setAid(msgInfo.getId());
			    z.setDelDate(new Date());
			    z.setFileType(4);//4：后台咨询新增列表
				zcOtherInfoMapper.updateByPrimaryKeySelective(z);
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjParam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					
					ZcOtherInfo zc=new ZcOtherInfo();
					zc.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
					zc.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
					zc.setAid(msgInfo.getId());
					zc.setAddDate(new Date());
					zc.setFileType(4);//4：后台咨询新增列表
					zc.setStuff(msgInfo.getUid());
					zcOtherInfoMapper.insertSelective(zc);
				}
			}
		
		}//
		return c;
			
		
	}

	@Override
	public int selectMaxSeqByTypeId(Integer typeInfoId) {
		// TODO Auto-generated method stub
		Integer result=msgInfoMapper.selectMaxSeqByTypeId(typeInfoId);
		return result==null?0:result;
	}

	@Override
	public List<MsgInfo> listMsgInfo(MsgInfo msgInfo) {
		// TODO Auto-generated method stub
		return msgInfoMapper.selectByPrimaryKeySelective(msgInfo);
	}

	@Override
	public int deleteMsgInfo(String ids) {
		// TODO Auto-generated method stub
		String []idArray=ids.split(",");
		int count=0;
		for(int i=0;i<idArray.length;i++){
			MsgInfo msgInfo=new MsgInfo();
			msgInfo.setId(Integer.valueOf(idArray[i]));
			msgInfo.setDelDate(new Date());
			count+=msgInfoMapper.updateByPrimaryKeyWithBLOBs(msgInfo);
		}
		return count;
	}

	@Override
	public boolean hasMsgInfoSeq(Integer id,int typeInfoId,int seq) {
		int count = msgInfoMapper.selectSeqCountByTypeIdAndSeq(id,typeInfoId,seq);
		return count>0?true:false;
	}
	public  List<Map> selectfj(Map map){
		return zcOtherInfoMapper.selectfj(map);
		
	}
}