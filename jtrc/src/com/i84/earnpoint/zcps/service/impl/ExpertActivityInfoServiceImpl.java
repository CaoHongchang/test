package com.i84.earnpoint.zcps.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.ExpertActivityInfoMapper;
import com.i84.earnpoint.mapper.ResourceMapper;
import com.i84.earnpoint.mapper.UserExpertInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.ZcActivityInfoMapper;
import com.i84.earnpoint.model.ExpertActivityInfo;
import com.i84.earnpoint.model.ImpZjInfo;
import com.i84.earnpoint.model.Resource;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.UserExpertInfoPickUp;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.ZcActivityInfo;
import com.i84.earnpoint.zcps.service.ExpertActivityInfoService;

@Service
public class ExpertActivityInfoServiceImpl extends BaseService implements
ExpertActivityInfoService {

	@Autowired
	private ExpertActivityInfoMapper expertActivityInfoMapper;
	@Autowired
	private ResourceMapper resourceMapper;
	@Autowired
	private UserExpertInfoMapper userExpertInfoMapper;
	@Autowired
	private ZcActivityInfoMapper zcActivityInfoMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;


	@Override
	public String saveExpertAtivityInfos(HttpServletRequest request) {
		// TODO Auto-generated method stub
		JSONObject object = new JSONObject();

		Integer uid = TextUtil.getInt(request.getSession().getAttribute("uid"));
		String activityId = request.getParameter("activityId");
		String expertIds = request.getParameter("expertIds");
		activityId = TextUtil.getString(activityId);
		expertIds = TextUtil.getString(expertIds);
		int count = 0;
		if (!activityId.trim().isEmpty() && !expertIds.trim().isEmpty()) {
			String[] expArray = expertIds.split(",");
			Integer aid = TextUtil.getInt(activityId);
			for (String expertId : expArray) {
				Integer tmpExpertId = Integer.valueOf(expertId);
				Map<String, Object> m = new HashMap<String, Object>();
				m.put("activityId", aid);
				m.put("expertId", tmpExpertId);
				if (expertActivityInfoMapper.listExpertActivityInfo(m).size() > 0) {
					continue;
				}
				ExpertActivityInfo expertActivityInfo = new ExpertActivityInfo();
				expertActivityInfo.setAddDate(new Date());
				expertActivityInfo.setaId(aid);
				expertActivityInfo.setExpertId(tmpExpertId);
				expertActivityInfo.setStaff(uid);
				count += expertActivityInfoMapper
						.insertSelective(expertActivityInfo);
			}
			if (count == expArray.length) {
				object.put("flag", true);
				object.put("cause", "success");
			} else {
				object.put("flag", false);
				object.put("cause", "????????????????????????");
			}
			return response(object);
		} else {
			object.put("flag", false);
			object.put("cause", "??????????????????????????????");
			return response(object);
		}

	}

	@Override
	public List<Map<String, Object>> queryExpertActivitys(
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return expertActivityInfoMapper.listExpertActivityInfo(params);
	}
	@Override
	public Map<String, Object> queryExpertActivitys2(
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return expertActivityInfoMapper.listExpertActivityInfo2(params);
	}
	@Override
	public String deleteExpertActivityInfos(HttpServletRequest request) {
		JSONObject object = new JSONObject();
		String activityIds = request.getParameter("activityIds");
		String expertIds = request.getParameter("expertIds");
		Map<String, Object> record = new HashMap<String, Object>();
		//????????????id????????????
		if (activityIds != null && !activityIds.trim().isEmpty()) {
			String[] array = activityIds.split(",");
			record.put("activityIds", array);
		} else {
			record.put("activityIds", null);
		}
		//????????????id????????????
		if (expertIds != null && !expertIds.trim().isEmpty()) {
			String[] array = expertIds.split(",");
			record.put("expertIds", array);
		} else {
			record.put("expertIds", null);
		}
		int count = expertActivityInfoMapper.deleteExpertActivityInfos(record);
		if (count > 0) {
			object.put("flag", true);
		} else {
			object.put("flag", false);
			object.put("cause", "???????????????");
		}
		return response(object);

	}

	@Override
	public String initExpertReviewTime(HttpServletRequest request) {
		String ids=request.getParameter("ids");
		String aid = request.getParameter("aid");
		JSONObject object=new JSONObject();
		if(ids==null){
			object.put("flag", false);
			object.put("cause", "????????????????????????");
		}
		else if (aid != null) {

			Resource resource = resourceMapper.selectParameterByCode("CSPSSJ");
			if (resource == null) {
				object.put("flag", false);
				object.put("cause", "??????????????????????????????????????????CSPSSJ???????????????????????????????????????????????????????????????");
			}
			else {
				String ext3 = resource.getExt3();
				if (ext3 != null) {
					try {

						userExpertInfoMapper.updateActionTime(aid);

					} catch (Exception e) {
						object.put("flag", false);
						object.put("cause", "?????????????????????????????????????????????");
					}
				}
			}

		}
		else{
			String array[]=ids.split(",");
			Resource resource=resourceMapper.selectParameterByCode("CSPSSJ");
			if(resource==null){
				object.put("flag", false);
				object.put("cause", "??????????????????????????????????????????CSPSSJ???????????????????????????????????????????????????????????????");
			}else{
				String ext3=resource.getExt3();
				if(ext3!=null){
					try{
						Integer shengyu=Integer.valueOf(ext3);
						int count=0;
						for(int i=0;i<array.length;i++){
							UserExpertInfo expert = userExpertInfoMapper.selectByPrimaryKey(Integer.valueOf(array[i]));
							expert.setOtherTime(shengyu);
							expert.setInitTime(shengyu);
							expert.setLoginDate(null);
							count+=userExpertInfoMapper.updateByPrimaryKey(expert);
						}
						if(count>0){
							object.put("flag",true);
							object.put("cause","????????????????????????????????????");
						}else{
							object.put("flag", false);
							object.put("cause", "????????????????????????????????????");
						}

					}catch(Exception e){
						object.put("flag", false);
						object.put("cause", "?????????????????????????????????????????????");
					}
				}
			}
		}
		return response(object);
	}

	@Override
	public String setReviewTime(HttpServletRequest request) {
		JSONObject object=new JSONObject();
		Integer id=TextUtil.getInt(request.getParameter("id"));
		Integer initTime=TextUtil.getInt(request.getParameter("initTime"));
		Integer otherTime=TextUtil.getInt(request.getParameter("otherTime"));
		UserExpertInfo expert=new UserExpertInfo();
		expert.setId(id);
		expert.setInitTime(initTime);
		expert.setOtherTime(otherTime);
		expert.setLoginDate(null);
		int count=userExpertInfoMapper.updateByPrimaryKeySelective1(expert);
		if(count>0){
			object.put("flag", true);
			object.put("cause", "???????????????????????????");
		}else{
			object.put("flag", false);
			object.put("cause", "???????????????????????????");
		}
		return response(object);
	}


	@Override
	public String setReviewTimeAll(HttpServletRequest request) {
		String ids=request.getParameter("ids");
		JSONObject object=new JSONObject();
		if(ids==null){
			object.put("flag", false);
			object.put("cause", "????????????????????????");
		}
		else{
			String[] array=ids.split(",");
			try{
				Integer shengyu=Integer.valueOf(request.getParameter("init_time"));
				int count=0;
				for(int i=0;i<array.length;i++){
					UserExpertInfo expert = userExpertInfoMapper.selectByPrimaryKey(Integer.valueOf(array[i]));
					expert.setOtherTime(shengyu);
					expert.setInitTime(shengyu);
					expert.setLoginDate(null);
					count+=userExpertInfoMapper.updateByPrimaryKey(expert);
				}
				if(count>0){
					object.put("flag",true);
					object.put("cause","?????????????????????????????????");
				}else{
					object.put("flag", false);
					object.put("cause", "?????????????????????????????????");
				}

			}catch(Exception e){
				object.put("flag", false);
				object.put("cause", "???????????????????????????");
			}
		}
		return response(object);
	}


	@Override
	public UserExpertInfo getExpertInfo(Integer id){
		UserExpertInfo expertInfo=userExpertInfoMapper.selectByPrimaryKey(id);
		long t;
		if(expertInfo.getLoginDate()!=null) {
			t=DateUtil.dateDiff(DateUtil.MINUTE, expertInfo.getLoginDate(), new Date());
		}
		else {
			t=0;
		}
		if(expertInfo.getInitTime()==null){
			expertInfo.setInitTime(0);
			expertInfo.setOtherTime(0);
		}else if(expertInfo.getInitTime()>=(int)t){
			expertInfo.setOtherTime(expertInfo.getInitTime()-(int)t);
		}else{
			expertInfo.setOtherTime(0);
		}
		userExpertInfoMapper.updateByPrimaryKeySelective(expertInfo);
		return expertInfo;

	}

	@Override
	public void insertZjList( List<ImpZjInfo> qyList,String uid)throws Exception{
		Map<String, Object> params = new HashMap<String, Object>();
		for(ImpZjInfo info :qyList){
			ExpertActivityInfo e=new ExpertActivityInfo();
			String name=ResultConstant.replaceTrim(info.getName());
			String pnum=ResultConstant.replaceTrim(info.getPnum());
			String businessId=ResultConstant.replaceTrim(info.getBusinessId());
			e.setStaff(Integer.valueOf(uid));
			//??????????????????????????????ID
			ZcActivityInfo z=new ZcActivityInfo();
			z.setBusinessId(Integer.valueOf(info.getBusinessId()));
			Map<String,Object> m=zcActivityInfoMapper.getAll(z);
			if(m!=null && m.get("id")!=null){
				e.setaId(Integer.valueOf(m.get("id").toString()));//???????????????zc_activity_info??? id
			}
			UserInfo u=new UserInfo();
			u.setPnum(info.getPnum().trim());
			u=userInfoMapper.selectYg(u);
			Map<String,Object> map=new HashMap<String, Object>();
			map.put("uid", u.getId());
			List<Map<String,Object>> list= userExpertInfoMapper.selectUserExpertList(map);
			if(list!=null && list.size()>0){
				map=list.get(0);
				e.setExpertId(Integer.valueOf(map.get("id").toString()));// ?????????user_expert_info.id
			}

			if(e.getaId()!=null && e.getExpertId()!=null){
				params.put("name2", name);
				params.put("pnum2", pnum);
				params.put("business_id", businessId);
				params.put("isId", true);//????????????ID
				//?????????+?????????????????????????????????????????????????????????-?????????????????????????????????????????????????????????????????????????????????????????????
				Map<String,Object> act=expertActivityInfoMapper.listExpertActivityInfo2(params);
				//????????????
				if(act!=null && act.get("id")!=null){
					e.setId(Integer.valueOf(act.get("id").toString()));
					expertActivityInfoMapper.updateByPrimaryKeySelective(e);
				}else{//???????????????
					e.setAddDate(new Date());
					expertActivityInfoMapper.insertSelective(e);//expert_activity_info
				}

			}
		}

	}
	@Override
	public void qyZjszExport(HttpServletResponse response,HttpServletRequest request)throws Exception{

		try {
			String ids=request.getParameter("ids");
			String[] idsArr = ids.split(",");

			Map<String, Object> m=new HashMap<String, Object>();
			m.put("ids", idsArr);
			List<Map<String, Object>> rylist =userExpertInfoMapper.selectUserExpertList(m);
			List<ImpZjInfo> list2=new ArrayList<ImpZjInfo>();
			if(rylist!=null && rylist.size()>0){
				for(int i=0;i<rylist.size();i++){
					Map<String, Object> m2=rylist.get(i);
					ImpZjInfo e =new ImpZjInfo();
					e.setName(m2.get("name")==null?"":m2.get("name").toString());
					e.setPnum(m2.get("pnum")==null?"":m2.get("pnum").toString());
					list2.add(e);
				}

			}

			ExcelExport<ImpZjInfo> ex = new ExcelExport<ImpZjInfo>();
			String fileName = "????????????.xls";
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List resultList=new ArrayList();
			resultList.add(list2);
			List<String> titleList=new ArrayList<String>();
			titleList.add("????????????");
			Map<String,Object>title=new HashMap<String, Object>();
			ex.exportExcel2(titleList, resultList, title,output);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}
	@Override
	public void qyZjszExportByPro_type(HttpServletResponse response,HttpServletRequest request)throws Exception{//?????????
	try {
		String ids=request.getParameter("ids");
		String[] idsArr = ids.split(",");

		Map<String, Object> m=new HashMap<String, Object>();
		m.put("ids", idsArr);
		List<Map<String, Object>> rylist =userExpertInfoMapper.selectUserExpertListMore(m);
		List<UserExpertInfoPickUp> list2=new ArrayList<UserExpertInfoPickUp>();
		if(rylist!=null && rylist.size()>0){
			for(int i=0;i<rylist.size();i++){
				Map<String, Object> m2=rylist.get(i);
				UserExpertInfoPickUp e =new UserExpertInfoPickUp();
				e.setEId(i+"");
				e.setZpno(m2.get("zpno")==null?"":m2.get("zpno").toString());
				e.setCompany(m2.get("company")==null?"":m2.get("company").toString());
				e.setName(m2.get("name")==null?"":m2.get("name").toString());
				e.setSex(m2.get("sex")==null?"":m2.get("sex").toString());
				e.setBirth_date(m2.get("birth_date")==null?"":m2.get("birth_date").toString());
				//e.setXueli(m2.get("xueli")==null?"":m2.get("xueli").toString());
				if(m2.get("graduation_time")!=null||m2.get("school")!=null||
						m2.get("major")!=null||m2.get("degree")!=null){
					
					if(m2.get("graduation_time")!=null&&!"".equals(m2.get("graduation_time"))){
						e.setAllXueli(m2.get("graduation_time").toString()+"?????????"+
								m2.get("school").toString());
						if(m2.get("major")!=null&&!"".equals(m2.get("major")))
						{
							e.setAllXueli(e.getAllXueli()+m2.get("major").toString()+"??????"
								);
						}
						if(m2.get("degree")!=null&&!"".equals(m2.get("degree"))){
							e.setAllXueli(e.getAllXueli()+m2.get("degree").toString()+"??????");
						}
					}
					else if(m2.get("school")!=null&&!"".equals(m2.get("school"))){
						e.setAllXueli("?????????"+m2.get("school").toString());
						if(m2.get("major")!=null&&!"".equals(m2.get("major")))
						{
							e.setAllXueli(e.getAllXueli()+m2.get("major").toString()+"??????"
								);
						}
						if(m2.get("degree")!=null&&!"".equals(m2.get("degree"))){
							e.setAllXueli(e.getAllXueli()+m2.get("degree").toString()+"??????");
						}
					}
					else if(m2.get("major")!=null&&!"".equals(m2.get("major"))){
						e.setAllXueli("?????????"+m2.get("major").toString()+"??????");
						if(m2.get("degree")!=null&&!"".equals(m2.get("degree"))){
							e.setAllXueli(e.getAllXueli()+m2.get("degree").toString()+"??????");
						}
					}
					else if(m2.get("degree")!=null&&!"".equals(m2.get("degree"))){
						e.setAllXueli("?????????"+m2.get("degree").toString()+"??????");
					}
				}
				if(m2.get("zg_level")!=null||m2.get("zg_time")!=null)
				{
					if(m2.get("zg_level")!=null){
					e.setAllZg(m2.get("zg_level").toString());
					}
					else {
						e.setAllZg(m2.get("zg_level").toString()+"?????????"+m2.get("zg_time").toString());
					}
				}
				
				e.setPlace_name(m2.get("place_name")==null?"":m2.get("place_name").toString());
				e.setWork_name(m2.get("work_name")==null?"":m2.get("work_name").toString());
				e.setPro_type(m2.get("pro_type")==null?"":m2.get("pro_type").toString());
				e.setTel(m2.get("tel")==null?"":m2.get("tel").toString());
				e.setRemark(m2.get("remark")==null?"":m2.get("remark").toString());
				e.setPnum(m2.get("pnum")==null?"":m2.get("pnum").toString());
				list2.add(e);
			}

		}
		//System.out.println("????????????,list.size="+list2.size()+"??????????????????"+list2.get(0).getName());
		
		ExcelExport<UserExpertInfoPickUp> ex = new ExcelExport<UserExpertInfoPickUp>();
		String fileName = "????????????.xls";
		OutputStream output =ResultConstant.outputStream(request, response, fileName);
		List resultList=new ArrayList();
		resultList.add(list2);
		List<String> titleList=new ArrayList<String>();
		titleList.add("????????????");
		Map<String,Object>title=new HashMap<String, Object>();
		ex.exportExcel2(titleList, resultList, title,output);

	} catch (IOException e) {
		e.printStackTrace();
	}
	
}
	public void markExpert(HttpServletResponse response,HttpServletRequest request)throws Exception{
		String ids=request.getParameter("ids");
		String[] zpnosArr = ids.split(",");
		for(int i=0;i<zpnosArr.length;i++)
		{
			userExpertInfoMapper.updateEffectedToTrueByzpno(zpnosArr[i]);
		}
	}
	
	public void cancelMark(HttpServletResponse response,HttpServletRequest request)throws Exception{
		String ids=request.getParameter("zpnos");
		String[] zpnosArr = ids.split(",");
		for(int i=0;i<zpnosArr.length;i++)
		{
			userExpertInfoMapper.updateEffectedToFalseByzpno(zpnosArr[i]);
		}
	}
}
