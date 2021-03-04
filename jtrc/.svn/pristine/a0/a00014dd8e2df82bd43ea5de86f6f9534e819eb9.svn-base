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

 		//0:私企，1：国企，2：外企，3：合资
 		if(StringUtils.isNotEmpty(ResultConstant.replaceTrim(orgNature))){
 			if(orgNature.equals("私企"))
 				orgNature="0";
 			if(orgNature.equals("国企"))
 				orgNature="1";
 			if(orgNature.equals("外企"))
 				orgNature="2";
 			if(orgNature.equals("合资"))
 				orgNature="3";
 		}
 		enterpriseInfo.setPno(enterpriseCode);
		enterpriseInfo.setProId(Integer.valueOf(orgNature));
		enterpriseInfo.setName(orgName);
		enterpriseInfo.setAddDate(new Date());
		// 设置是否为签约企业
		if(StringUtils.isNotEmpty(ResultConstant.replaceTrim(isSignOrg))){
			if(isSignOrg.equals("否"))
				isSignOrg="0";
 			if(isSignOrg.equals("是"))
 				isSignOrg="1";
		}
		enterpriseInfo.setIsOrder(Integer.valueOf(isSignOrg));
		// 设置法人代表
		enterpriseInfo.setSname(legalPerson);
		// 单位所在行政区划：orgArea
		enterpriseInfo.setsArea(orgArea);
		// 填报单位类型：orgType
		enterpriseInfo.settType(orgType);
		// 设置填报单位层次
		enterpriseInfo.setSlevel(Integer.valueOf(orgLevel));
		// 设置机构类型
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
		 * messagefromid 0：内部创建 1：外部注册 2：数据采集 后台创建的默认有效且已审核
		 */
		enterpriseInfo.setMsgFromId(0);
		enterpriseInfo.setIsValid("1");// 有效性设置？？？？？
		enterpriseInfo.setIsState(0);// 设置审核状态为 未审核
		
		if (uid != null) {
			enterpriseInfo.setUserId(Integer.valueOf(uid));
		}
		
		//主企业字段值不为空，那么导入的肯定是子企业
		if(StringUtils.isNotEmpty(mainOrgName)){
			//子企业的话必须存在主企业，根据主企业和企业代码查询是否存在
			EnterpriseInfo	e=new EnterpriseInfo();
			e.setcCode(mainOrgName);
			e.setPno(enterpriseCode);
			List<EnterpriseInfo> enterpriseInfos=this.listEnterpriseInfo(e);
			if(enterpriseInfos!=null&&enterpriseInfos.size()>0){//添加子企业
				int parentId =enterpriseInfos.get(0).getId();
				enterpriseInfo.setParentId(parentId);
			}
			
		}else{//添加主企业
			enterpriseInfo.setParentId(-1);
		}
		 this.insertEnterpriseInfo(enterpriseInfo);

		
		// 添加主企业
//		if (situation.equals("1")) {
//			enterpriseInfo.setParentId(-1);
//
//		} else {// 添加子企业
//			String parentId = request.getParameter("parentId");
//			enterpriseInfo.setParentId(Integer.valueOf(parentId));
//
//		}
//		EnterpriseInfo e=this.selectEnterpriseBycCode(enterpriseInfo);
//		if(e!=null){
//			response.getWriter().write("该组织机构代码已经存在！");
//			response.getWriter().flush();
//			return;
//		}

//		EnterpriseInfo e1=this.selectEnterpriseByPno(enterpriseInfo);
//		if(e1!=null){
//			response.getWriter().write("该企业代码已经存在！");
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
					e.setOrgType1("主企业");
				}else {
					e.setOrgType1("子企业");

				}
				e.setOrgCode(mi.getcCode());
				e.setOrgName(mi.getName());
				//f(value=='0') return '私营企业';else if(value=='1') return '国有企业'; else if(value=='2') return '外资企业'; else if(value=='3') return '合资企业';},width:50">企业性质</th>
				String orgType2="其它";
				if(mi.getProId()!=null){
					if(mi.getProId().equals("0"))
						orgType2="私营企业";
					else if(mi.getProId().equals("1"))
						orgType2="国有企业";
					else if(mi.getProId().equals("2"))
						orgType2="外资企业";
					else if(mi.getProId().equals("3"))
						orgType2="合资企业";
					
				}
				e.setOrgType2(orgType2);
				if(mi.getIsValid()!=null){
				  if(mi.getIsValid().equals("1"))
					e.setAvailable("有效");
				  else
					e.setAvailable("无效");  
				  
				}else{
					e.setAvailable("无效"); 
				}
				//value=='0') return '未审核'; else if(value=='1') return '已审核'; else if(value=='2') return '审核失败'
				if(mi.getIsState()!=null){
					if(mi.getIsState().equals("0"))
					      e.setStatus("未审核");
					else if(mi.getIsState().equals("1"))
						  e.setStatus("已审核");
					else if(mi.getIsState().equals("2"))
						  e.setStatus("审核失败");
					else 
						   e.setStatus("其它");
				}else{
					e.setStatus("其它");
				}
				//0:采集授权 1:取消授权
				if(mi.getIsAuthorize()==0){
					e.setIsAuthorize("采集授权");
				}else{
					e.setIsAuthorize("取消授权");
				}
				e.setOptions("");
				User user=userMapper.selectByPrimaryKey(mi.getUserId());
				//value=='0') return '内部创建'; else if(value=='1') return '外部注册'; else if(value=='2') return '数据采集';
				if(mi.getMsgFromId()!=null){
				if(mi.getMsgFromId()==0)
					e.setSource("内部创建");
				else if(mi.getMsgFromId()==1)
					e.setSource("外部注册");
				else if(mi.getMsgFromId()==2)
					e.setSource("数据采集");
				}
				else
					e.setSource("其它");
				
				e.setCreator(user!=null?user.getUsername():"");
				e.setCreateTime(mi.getAddDate()!=null? new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()):"");
				list2.add(e);
				}
				
			}
			
			ExcelExport<XyExportVo> ex = new ExcelExport<XyExportVo>();
			String fileName = "企业管理.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List resultList=new ArrayList(); 
			resultList.add(list2);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("企业管理");
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
