package com.i84.earnpoint.hygsgl.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;

import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.mapper.AgreementInfoMapper;
import com.i84.earnpoint.mapper.EnterpriseInfoMapper;
import com.i84.earnpoint.mapper.HyBusinessInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.HyBusinessInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.YgImportVo;

@Service
public class YgInfoServiceImpl implements YgInfoService{
	private Logger logger = Logger.getLogger(this.getClass().getName()); 

	@Autowired 
	private UserInfoMapper userInfoMapper;
	@Autowired 
	private HyBusinessInfoMapper hyBusinessInfoMapper;
    @Autowired 
	private EnterpriseInfoMapper enterpriseInfoMapper;
    @Autowired
    private AgreementInfoMapper agreementInfoMapper;

	/**员工新增*/
	public void insertYgList(List<YgImportVo> ygList)throws Exception {
		if(ygList!=null&&ygList.size()>0){
			for(int i=0;i<ygList.size();i++){
				YgImportVo vo=ygList.get(i);
				UserInfo userInfo=new UserInfo();//用户
				HyBusinessInfo hyBusinessInfo=new HyBusinessInfo();//用户信息
				EnterpriseInfo enterpriseInfo=new EnterpriseInfo();//企业信息
                String pnum=vo.getSfz(); 
                if(StringUtils.isNotBlank(pnum)){
                String pwd=pnum.substring(pnum.length()-6,pnum.length());
                pwd=MD5.GetMD5Code(MD5.GetMD5Code(pwd));
				userInfo.setPwd(pwd);//密码默认身份证后6位
                }
				enterpriseInfo.setcCode(vo.getZzjgdm());//组织机构代码
				userInfo.setId(Integer.valueOf(vo.getId()));
				userInfo.setWorkName(vo.getDw());
				userInfo.setPnum(vo.getSfz());
				userInfo.setName(vo.getXm());
				if(StringUtils.isNotEmpty(vo.getCsny())){
					userInfo.setBirthDate(ResultConstant.parseDateTime(vo.getCsny()+"-01",null));
					
				}
				userInfo.setSex(vo.getXb());
				userInfo.setDaId(vo.getXdaszd());
				if(StringUtils.isNotEmpty(vo.getCjgzsj())){
					userInfo.setWorkTime(ResultConstant.parseDateTime(vo.getCjgzsj() ,null));
				}
				userInfo.setMz(vo.getMz());
				
				userInfo.setZzmm(vo.getZzmm());
				userInfo.setSchool(vo.getByyx());
				if(StringUtils.isNotEmpty(vo.getBysj())){
					userInfo.setGraduationTime(ResultConstant.parseDateTime( vo.getBysj(),null));
				}
				userInfo.setMajor(vo.getSxzy());
				userInfo.setDegree(vo.getWhcd());
				userInfo.setDomicile(vo.getHjd());
				userInfo.setAdr(vo.getLxdz());
				userInfo.setgTel(vo.getGddh());
				userInfo.setTel(vo.getSjh());				
				userInfo.setEmail(vo.getDzyx());
				userInfo.setHousehold(vo.getHjxz());
				userInfo.setDomicilePlace(vo.getHjszd());
				userInfo.setBankId(vo.getKhyh());
				userInfo.setBankNum(vo.getYhzh());
				userInfo.setTechnical(vo.getJszc());
				userInfo.setTeLevel(vo.getZydj());
				userInfo.setJob(vo.getZyzg());
				if(StringUtils.isNotEmpty(vo.getHqsj())){
					userInfo.setGetTime(ResultConstant.parseDateTime( vo.getHqsj(),null));
				}
				userInfo.setAddDate(new Date());
				//---------用户信息表----------
				
				//根据组织机构代码查询企业id
				
				enterpriseInfo.setcCode(vo.getZzjgdm());
				enterpriseInfo=enterpriseInfoMapper.selectByCcode(enterpriseInfo);
				Integer enterpriseId=null;
				if(enterpriseInfo!=null){
					enterpriseId=enterpriseInfo.getId();//企业id
				}
				hyBusinessInfo.setEnterpriseId(enterpriseId);
				hyBusinessInfo.setEmploymentTypeId(vo.getYgxs());//用工形式
				hyBusinessInfo.setAddDate(new Date());
				//根据身份证判断用户是否存在如果存在则修改
				System.out.println("userInfo.getPnum():"+userInfo.getPnum());
				UserInfo user=userInfoMapper.selectYg(userInfo);
				if(user!=null){
					userInfo.setId(user.getId());
					userInfoMapper.updateByPrimaryKeySelective(userInfo);
					String userId=user.getId().toString();
					System.out.println("用户id："+userId);
					//根据userid查询hy_business_info是否有记录
					Map<String,Object> m=new HashMap<String, Object>();
					m.put("uid", userId);
					m=hyBusinessInfoMapper.selectIsExitsHyBusiness(m);
					if(m!=null){
						if((Long)m.get("total")>0){
							hyBusinessInfo.setUserId(userId);
							hyBusinessInfo.setSstate(0);//0:待审核1：审核通过2：审核未通过
							hyBusinessInfoMapper.updateByUserIdSelective(hyBusinessInfo);
						}else{
							hyBusinessInfo.setUserId(userId);
							hyBusinessInfo.setSstate(0);//0:待审核1：审核通过2：审核未通过
							hyBusinessInfoMapper.insertSelective(hyBusinessInfo);
							
						}
					  }
						else{
							hyBusinessInfo.setUserId(userId);
							hyBusinessInfo.setSstate(0);//0:待审核1：审核通过2：审核未通过
							hyBusinessInfoMapper.insertSelective(hyBusinessInfo);
							
						}
					


				}else{
					userInfo.setId(null);
					userInfoMapper.insertUserInfoByKey(userInfo);
					String userId=userInfo.getId().toString();
					hyBusinessInfo.setUserId(userId);
					hyBusinessInfo.setSstate(0);//0:待审核1：审核通过2：审核未通过
					hyBusinessInfoMapper.insertSelective(hyBusinessInfo);
				}
			}
		}

	}
	/**员工查看*/
	public List<Map<String,Object>> selectYgList(Map<String,Object> userInfo)throws Exception{
		ResultConstant.pageSet(userInfo);
		
		if(userInfo!=null){
		    if(userInfo.get("startBirthday")!=null)
			userInfo.put("startBirthday", userInfo.get("startBirthday")+"-01");
		    if(userInfo.get("endBirthday")!=null)
		     userInfo.put("endBirthday", userInfo.get("endBirthday")+"-31");
		}
		return userInfoMapper.selectYgList(userInfo);

	}
	/**员工查看2*/
	public List<Map<String,Object>> selectYgList2(Map<String,Object> userInfo)throws Exception{
		return userInfoMapper.selectYgList2(userInfo);

	}

	public Map<String,Object> getYgMsg(Map<String,Object> userInfo)throws Exception{
		return userInfoMapper.getYgMsg(userInfo);
	}


	@Override
	public int yyglExamine(HyBusinessInfo hyBusinessInfo) throws Exception {
		return hyBusinessInfoMapper.updateByUserIdSelective(hyBusinessInfo);
	}
 
	public List<Map<String,Object>> agreementList(Map<String,Object> map)throws Exception{
		
		return agreementInfoMapper.selectAgreementList(map);
		
		
	}
	@Override
	public boolean yyglEdit(Map<String, Object> param, String htParam)throws Exception {
		
		UserInfo userInfo=new UserInfo();
		userInfo.setName(param.get("xm")==null?null:param.get("xm").toString());
		//前台传递的参数为xxxx年xx月，此处需要先转化	2017年5月19日17:42:37 邓祯
		if(param.get("csny")!=null&&param.get("csny").equals("")){
			String date=param.get("csny").toString();
			date=date.replace("年", "-");
			date=date.replace("月", "-");
			date+="00";
			//date=date.replace("月", "-");
			userInfo.setBirthDate( ResultConstant.parseDateTime(date, null));
		}
//		userInfo.setBirthDate( (param.get("csny")==null?null:ResultConstant.parseDateTime(param.get("csny").toString()+"-01 00:00:00",null)));
		userInfo.setSex(param.get("xb")==null?null:param.get("xb").toString());
		userInfo.setDaId(param.get("xdaszd")==null?null:param.get("xdaszd").toString());
		userInfo.setWorkTime(param.get("cjgzsj")==null?null:ResultConstant.parseDateTime(param.get("cjgzsj").toString(),null));
		userInfo.setMz(param.get("mz")==null?null:param.get("mz").toString());
		userInfo.setWorkName(param.get("dw")==null?null:param.get("dw").toString());
		userInfo.setPnum(param.get("sfz")==null?null:param.get("sfz").toString());
		//用户信息
		HyBusinessInfo hyInfo=new HyBusinessInfo();
		hyInfo.setEmploymentTypeId(param.get("ygxs")==null?null:param.get("ygxs").toString());//用工形式
		hyInfo.setSstate(param.get("sstate")==null?null:Integer.valueOf(param.get("sstate").toString()));//审核状态
		hyInfo.setRemsg(param.get("shyj")==null?null:param.get("shyj").toString());//审核意见
		hyInfo.setEnterpriseId(param.get("enterpriseId")==null?null:Integer.valueOf(param.get("enterpriseId").toString()));//企业id
		
		userInfo.setZzmm(param.get("zzmm")==null?null:param.get("zzmm").toString());
		userInfo.setSchool(param.get("byyx")==null?null:param.get("byyx").toString());
		userInfo.setGraduationTime(param.get("bysj")==null?null:ResultConstant.parseDateTime(param.get("bysj").toString(),null));
		userInfo.setMajor(param.get("sxzy")==null?null:param.get("sxzy").toString());
		userInfo.setDegree(param.get("whcd")==null?null:param.get("whcd").toString());
		userInfo.setDomicile(param.get("hjd")==null?null:param.get("hjd").toString());
		userInfo.setAdr(param.get("lxdz")==null?null:param.get("lxdz").toString());
		userInfo.setgTel(param.get("gddh")==null?null:param.get("gddh").toString());
		userInfo.setTel(param.get("sjhm")==null?null:param.get("sjhm").toString());
		userInfo.setEmail(param.get("dzyx")==null?null:param.get("dzyx").toString());
		userInfo.setHousehold(param.get("hjxz")==null?null:param.get("hjxz").toString());
		userInfo.setDomicilePlace(param.get("hjszd")==null?null:param.get("hjszd").toString());
		userInfo.setBankId(param.get("khyh")==null?null:param.get("khyh").toString());
		userInfo.setTechnical(param.get("jszc")==null?null:param.get("jszc").toString());
		userInfo.setBankNum(param.get("yhzh")==null?null:param.get("yhzh").toString());
		
		userInfo.setTeLevel(param.get("zydj")==null?null:param.get("zydj").toString());
		userInfo.setJob(param.get("zyzg")==null?null:param.get("zyzg").toString());
		userInfo.setGetTime(param.get("hqsj")==null?null:ResultConstant.parseDateTime(param.get("hqsj").toString(),null));
		userInfo.setId(param.get("id")==null?null:Integer.valueOf(param.get("id").toString()));
		logger.info("开始：");
		if(userInfo.getId()!=null){
		int c=userInfoMapper.updateByPrimaryKeySelective(userInfo);
		//修改后的企业id
		Integer newEnterpriseId=param.get("newEnterpriseId")==null?null:Integer.valueOf(param.get("newEnterpriseId").toString());
		//修改前的企业id
		Integer enterpriseId=param.get("enterpriseId")==null?null:Integer.valueOf(param.get("enterpriseId").toString());
		logger.info("修改后大小："+c);
		if(newEnterpriseId!=null){
			
			if(!newEnterpriseId.equals(enterpriseId)){
				//修改用户信息标识为物理删除
				HyBusinessInfo hyBusinessInfo=new HyBusinessInfo();
				hyBusinessInfo.setUserId(userInfo.getId().toString());
				hyBusinessInfo.setDelDate(new Date());
				hyBusinessInfoMapper.updateByUserIdSelective(hyBusinessInfo);
				logger.info("修改用户信息标识为物理删除");
				//新增一条用户信息
				
				hyInfo.setUserId(userInfo.getId().toString());
				hyInfo.setAddDate(new Date());
				hyInfo.setUid(param.get("sUid")==null?null:Integer.valueOf(param.get("sUid").toString()));
				hyBusinessInfoMapper.insertSelective(hyInfo);
				logger.info("新增一条用户信息");
				
			}
			
		}
		
		if(c>0){
			//附件操作
			Map<String, Object> htmap=new HashMap<String, Object>();
			if(StringUtils.isNotEmpty(htParam)){
				//删除原有记录
				agreementInfoMapper.deleteAgreement(Integer.valueOf(param.get("id").toString()));
				logger.info("删除原有记录");
				JSONArray jsonArray =JsonUtil.getObjectArray4Json(htParam);
				int iSize = jsonArray.size();
				for (int i = 0; i < iSize; i++) {
					JSONObject jsonObj = jsonArray.getJSONObject(i);
					htmap.put("startdate", jsonObj.get("startdate"));
					htmap.put("enddate", jsonObj.get("enddate"));
					htmap.put("userid", param.get("id"));
					agreementInfoMapper.insertAgreement(htmap);
					logger.info("新增合同记录");
				}
			}
			return true;
		}
		}
		return false;
	}
	@Override
	public List<Map<String, Object>> enterpriseList(Map<String, Object> map)
			throws Exception {
		return enterpriseInfoMapper.enterpriseList(map);
	}
	@Override
	public boolean delYgFuc(String id) throws Exception {
		UserInfo userInfo=new UserInfo();
		userInfo.setId(Integer.valueOf(id));
		userInfo.setDelDate(new Date());
		int c=userInfoMapper.updateByPrimaryKeySelective(userInfo);
		if(c>0){
			HyBusinessInfo hyBusinessInfo=new HyBusinessInfo();
			hyBusinessInfo.setUserId(id);
			hyBusinessInfo.setDelDate(new Date());
			c=hyBusinessInfoMapper.updateByUserIdSelective(hyBusinessInfo);
			
			return true;
		}
		
		
		return false;
	}
	@Override
	public Map<String, Object> isCode(Map<String, Object> map)throws Exception {
		// TODO Auto-generated method stub
		return enterpriseInfoMapper.isCode(map);
	}
	@Override
	public UserInfo selectYg(UserInfo record) throws Exception {
		return userInfoMapper.selectYg(record);
	}
	@Override
	public List<Map<String, Object>> selectEnterpriseName(Map<String, Object> map) throws Exception {
		return enterpriseInfoMapper.selectEnterpriseName(map);
	}

}