package com.i84.earnpoint.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.EnterpriseInfoMapper;
import com.i84.earnpoint.mapper.UserMapper;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.ExpEnterpriseInfo;
import com.i84.earnpoint.model.ImpEnterpriseInfo;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.model.XyExportVo;
import com.i84.earnpoint.service.EnterpriseInfoService;
@Service
public class EnterpriseInfoServiceImpl implements EnterpriseInfoService {
	@Autowired
   private EnterpriseInfoMapper enterpriseInfoMapper;
	@Autowired
	private UserMapper userMapper;
	
	@Override
	public EnterpriseInfo selectEnterpriseById(Integer id) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.selectByPrimaryKey(id);
	}
	@Override
	public List<EnterpriseInfo> listEnterpriseInfo(EnterpriseInfo enterpriseInfo) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.selectBySelective(enterpriseInfo);
	}
	@Override
	public EnterpriseInfo selectEnterpriseBycCode(EnterpriseInfo enterpriseInfo) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.selectByCcode(enterpriseInfo);
	}
	@Override
	public int insertEnterpriseInfo(EnterpriseInfo enterpriseInfo) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.insertSelective(enterpriseInfo);
	}
	@Override
	public int deleteEnterpriseInfo(Integer id) {
		// TODO Auto-generated method stub
		EnterpriseInfo enterpriseInfo=new EnterpriseInfo();
		enterpriseInfo.setId(id);
		enterpriseInfo.setDelDate(new Date());
		return enterpriseInfoMapper.updateByPrimaryKeySelective(enterpriseInfo);
	}
	@Override
	public int updateEnterpriseInfo(EnterpriseInfo enterpriseInfo) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.updateByPrimaryKeySelective(enterpriseInfo);
	}
	
	@Override
	public EnterpriseInfo selectEnterpriseByPno(EnterpriseInfo enterpriseInfo) {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.selectByPno(enterpriseInfo);
	}
	@Override
	public void insertQyList( List<ImpEnterpriseInfo> qyList,String uid) throws Exception {
		for( ImpEnterpriseInfo info :qyList ){
		String enterpriseCode = info.getEnterpriseCode();
		String isSignOrg = info.getIsSignOrg();
		String mainOrgName=info.getMainOrgName();
		String orgCode = info.getOrgCode();
		String orgName = info.getOrgName();
		String orgNature = info.getOrgNature();
		String legalPerson = info.getLegalPerson();
		String orgArea = info.getOrgArea();
		String orgType = info.getOrgType();
		String orgLevel = info.getOrgLevel();
		String type = info.getType();
		String registerType = info.getRegisterType();
		String businessArea = info.getBusinessArea();
		String manageType = info.getManageType();
		String phone = info.getPhone();
		String email = info.getEmail();
		String sendTime = info.getSendTime();
		String parentOrgType = info.getParentOrgType();
		String parentOrgCode = info.getParentOrgCode();
		String parentOrgName = info.getParentOrgName();
		String parentOrgLeader = info.getParentOrgLeader();
		String parentOrgPhone = info.getParentOrgPhone();
		EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
 		enterpriseInfo.setcCode(orgCode);

 		//0:?????????1????????????2????????????3?????????
 		if(StringUtils.isNotEmpty(ResultConstant.replaceTrim(orgNature))){
 			if(orgNature.equals("??????"))
 				orgNature="0";
 			if(orgNature.equals("??????"))
 				orgNature="1";
 			if(orgNature.equals("??????"))
 				orgNature="2";
 			if(orgNature.equals("??????"))
 				orgNature="3";
 		}
 		enterpriseInfo.setPno(enterpriseCode);
		enterpriseInfo.setProId(Integer.valueOf(orgNature));
		enterpriseInfo.setName(orgName);
		enterpriseInfo.setAddDate(new Date());
		// ???????????????????????????
		if(StringUtils.isNotEmpty(ResultConstant.replaceTrim(isSignOrg))){
			if(isSignOrg.equals("???"))
				isSignOrg="0";
 			if(isSignOrg.equals("???"))
 				isSignOrg="1";
		}
		enterpriseInfo.setIsOrder(Integer.valueOf(isSignOrg));
		// ??????????????????
		enterpriseInfo.setSname(legalPerson);
		// ???????????????????????????orgArea
		enterpriseInfo.setsArea(orgArea);
		// ?????????????????????orgType
		enterpriseInfo.settType(orgType);
		// ????????????????????????
		enterpriseInfo.setSlevel(Integer.valueOf(orgLevel));
		// ??????????????????
		enterpriseInfo.setJgType(type);
		enterpriseInfo.setJjType(registerType);
		enterpriseInfo.setArea(businessArea);
		enterpriseInfo.setTel(phone);
		enterpriseInfo.setEmail(email);
		enterpriseInfo.setUpUid(parentOrgLeader);
		enterpriseInfo.setUpType(parentOrgType);
		enterpriseInfo.setUpCode(parentOrgCode);
		if(!StringUtils.isEmpty(sendTime))
			enterpriseInfo.setUpDate(DateUtil.stringToDate(sendTime, "yyyy-MM-dd"));
		enterpriseInfo.setUpName(parentOrgName);
		enterpriseInfo.setUpTel(parentOrgPhone);
		enterpriseInfo.setMgType(manageType);
		enterpriseInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
		//
		/**
		 * messagefromid 0??????????????? 1??????????????? 2??????????????? ???????????????????????????????????????
		 */
		enterpriseInfo.setMsgFromId(0);
		enterpriseInfo.setIsValid("1");// ??????????????????????????????
		enterpriseInfo.setIsState(0);// ????????????????????? ?????????
		
		if (uid != null) {
			enterpriseInfo.setUserId(Integer.valueOf(uid));
		}
		
		//???????????????????????????????????????????????????????????????
		if(StringUtils.isNotEmpty(mainOrgName)){
			//???????????????????????????????????????????????????????????????????????????????????????
			EnterpriseInfo	e=new EnterpriseInfo();
			e.setcCode(mainOrgName);
			e.setPno(enterpriseCode);
			List<EnterpriseInfo> enterpriseInfos=this.listEnterpriseInfo(e);
			if(enterpriseInfos!=null&&enterpriseInfos.size()>0){//???????????????
				int parentId =enterpriseInfos.get(0).getId();
				enterpriseInfo.setParentId(parentId);
			}
			
		}else{//???????????????
			enterpriseInfo.setParentId(-1);
		}
		 this.insertEnterpriseInfo(enterpriseInfo);

		
		// ???????????????
//		if (situation.equals("1")) {
//			enterpriseInfo.setParentId(-1);
//
//		} else {// ???????????????
//			String parentId = request.getParameter("parentId");
//			enterpriseInfo.setParentId(Integer.valueOf(parentId));
//
//		}
//		EnterpriseInfo e=this.selectEnterpriseBycCode(enterpriseInfo);
//		if(e!=null){
//			response.getWriter().write("????????????????????????????????????");
//			response.getWriter().flush();
//			return;
//		}

//		EnterpriseInfo e1=this.selectEnterpriseByPno(enterpriseInfo);
//		if(e1!=null){
//			response.getWriter().write("??????????????????????????????");
//			response.getWriter().flush();
//			return;
//		}

		
		}
	}
	@Override
	public void qyExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
		try {
			List<EnterpriseInfo> list = this.listEnterpriseInfo(new EnterpriseInfo());			 
			List<ExpEnterpriseInfo> list2=new ArrayList<ExpEnterpriseInfo>();
			if(list!=null){
				for(int i=0;i<list.size();i++){
			    EnterpriseInfo	mi=list.get(i);
				ExpEnterpriseInfo e=new ExpEnterpriseInfo();	
				EnterpriseInfo main=this.selectEnterpriseById(mi.getParentId());
			    e.setMainOrg(main!=null?main.getName():"");
				if(mi.getParentId()==null||mi.getParentId()==-1){
					e.setOrgType1("?????????");
				}else {
					e.setOrgType1("?????????");

				}
				e.setOrgCode(mi.getcCode());
				e.setOrgName(mi.getName());
				//f(value=='0') return '????????????';else if(value=='1') return '????????????'; else if(value=='2') return '????????????'; else if(value=='3') return '????????????';},width:50">????????????</th>
				String orgType2="??????";
				if(mi.getProId()!=null){
					if(mi.getProId().equals("0"))
						orgType2="????????????";
					else if(mi.getProId().equals("1"))
						orgType2="????????????";
					else if(mi.getProId().equals("2"))
						orgType2="????????????";
					else if(mi.getProId().equals("3"))
						orgType2="????????????";
					
				}
				e.setOrgType2(orgType2);
				if(mi.getIsValid()!=null){
				  if(mi.getIsValid().equals("1"))
					e.setAvailable("??????");
				  else
					e.setAvailable("??????");  
				  
				}else{
					e.setAvailable("??????"); 
				}
				//value=='0') return '?????????'; else if(value=='1') return '?????????'; else if(value=='2') return '????????????'
				if(mi.getIsState()!=null){
					if(mi.getIsState().equals("0"))
					      e.setStatus("?????????");
					else if(mi.getIsState().equals("1"))
						  e.setStatus("?????????");
					else if(mi.getIsState().equals("2"))
						  e.setStatus("????????????");
					else 
						   e.setStatus("??????");
				}else{
					e.setStatus("??????");
				}
				//0:???????????? 1:????????????
				if(mi.getIsAuthorize()==0){
					e.setIsAuthorize("????????????");
				}else{
					e.setIsAuthorize("????????????");
				}
				e.setOptions("");
				User user=userMapper.selectByPrimaryKey(mi.getUserId());
				//value=='0') return '????????????'; else if(value=='1') return '????????????'; else if(value=='2') return '????????????';
				if(mi.getMsgFromId()!=null){
				if(mi.getMsgFromId()==0)
					e.setSource("????????????");
				else if(mi.getMsgFromId()==1)
					e.setSource("????????????");
				else if(mi.getMsgFromId()==2)
					e.setSource("????????????");
				}
				else
					e.setSource("??????");
				
				e.setCreator(user!=null?user.getUsername():"");
				e.setCreateTime(mi.getAddDate()!=null? new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()):"");
				list2.add(e);
				}
				
			}
			
			ExcelExport<XyExportVo> ex = new ExcelExport<XyExportVo>();
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
	public UserMapper getUserMapper() {
		return userMapper;
	}
	public void setUserMapper(UserMapper userMapper) {
		this.userMapper = userMapper;
	}
    
	
}
