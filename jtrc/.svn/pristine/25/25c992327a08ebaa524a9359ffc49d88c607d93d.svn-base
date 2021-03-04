package com.i84.earnpoint.zcps.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.ZcDissertationInfoMapper;
import com.i84.earnpoint.mapper.ZcOtherInfoMapper;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.model.ZcOtherInfo;
import com.i84.earnpoint.zcps.service.ZcDissertationInfoService;
@Service
public class ZcDissertationInfoServiceImpl implements ZcDissertationInfoService{
	@Autowired
	private ZcDissertationInfoMapper zcDissertationInfoMapper;
	@Autowired
	private ZcOtherInfoMapper zcOtherInfoMapper;

	@Override
	public List<Map<String,Object>> queryList(
			Map<String,Object> zcDissertationInfo) {
		List<Map<String,Object>> list=zcDissertationInfoMapper.queryList(zcDissertationInfo);
		if(list!=null && list.size()>0){
			String root = ResultConstant.getWEB_ROOTPath();
			System.out.println(" root=" + root);
			int last = root.lastIndexOf("jtrc");
			String webroot = ResultConstant.getWEB_ROOTPath().substring(0, last);

			for(Map m: list){
//				m.put("fileType", 1);
				m.put("aid", m.get("d_id"));
				List<Map> list2=zcOtherInfoMapper.selectfj(m);
				if(list2 !=null && list2.size()>0){
					for(Map m2:list2){
						String file_url=m2.get("file_url")==null?"":m2.get("file_url").toString();
						m2.clear();
						m2.put("file_url", "../../../jt/"+file_url);

					}
					m.put("imgList",JsonUtil.getJsonArray4JavaList(list2));
				}
				else {
					m.put("imgList", null);
				}
			}

		}
		return list;
	}
	@Override
	public ZcDissertationInfo selectByPrimaryKey(Integer id){
		return this.zcDissertationInfoMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateZcDissertationInfo(ZcDissertationInfo zcDissertationInfo,String fjparam) {
		int c= this.zcDissertationInfoMapper.updateByPrimaryKeySelective(zcDissertationInfo);
		if(c>0){
			ZcOtherInfo z=new ZcOtherInfo();
			z.setAid(zcDissertationInfo.getId());
			z.setDelDate(new Date());
			z.setFileType(2);//2：后台职称评审论文列表
			zcOtherInfoMapper.updateByPrimaryKeySelective(z);
			//附件操作
			if(StringUtils.isNotEmpty(fjparam)){
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjparam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);

					ZcOtherInfo zc=new ZcOtherInfo();
					zc.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
					zc.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
					zc.setAid(zcDissertationInfo.getId());
					zc.setAddDate(new Date());
					zc.setFileType(2);//2：后台职称评审论文列表
					zc.setStuff(zcDissertationInfo.getUid());
					zcOtherInfoMapper.insertSelective(zc);
				}
			}
		}
		return c;
	}
	@Override
	public int updateByPrimaryKeySelective(ZcDissertationInfo zcDissertationInfo) {
		// TODO Auto-generated method stub
		return zcDissertationInfoMapper.updateByPrimaryKeySelective(zcDissertationInfo);
	}

}
