package com.i84.earnpoint.xljy.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.AcademicEducationMapper;
import com.i84.earnpoint.mapper.StudentAchievementMapper;
import com.i84.earnpoint.mapper.StudentSignupMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.AcademicEducation;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.GzExportVo;
import com.i84.earnpoint.model.HyBusinessInfo;
import com.i84.earnpoint.model.StudentAchievement;
import com.i84.earnpoint.model.StudentSignup;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.XyExportVo;
import com.i84.earnpoint.model.YgImportVo;
import com.i84.earnpoint.xljy.service.XljyService;
/**
 * 学历教育
 * @author liu_quan
 *
 */
@Service
public class XljyServiceImpl implements XljyService{
	@Autowired
	private StudentSignupMapper studentSignupMapper;
	@Autowired 
	private UserInfoMapper userInfoMapper;
	@Autowired
	private AcademicEducationMapper academicEducationMapper;
	@Autowired
	private StudentAchievementMapper studentAchievementMapper;
	
	public int addKsbj(Map<String,Object> map) throws Exception{
		if(map!=null&&map.size()>0){
			AcademicEducation a=null;
			a=academicEducationMapper.selectMaxEducationNum(null);
			if(a==null||a.getEducationNum()==null){
				a=new AcademicEducation();
				a.setEducationNum("JY10001");
			}else{
				String educationNum=a.getEducationNum().substring(2,a.getEducationNum().length());
				a.setEducationNum("JY"+(Long.parseLong(educationNum)+1));
				
			}
			a.setEducationMajor(map.get("educationMajor")==null?null:map.get("educationMajor").toString());
			a.setEducationSchool(map.get("educationSchool")==null?null:map.get("educationSchool").toString());
			a.setEndTime(map.get("endTime")==null?null:ResultConstant.parseDateTime(map.get("endTime").toString(), null));
			a.setStartTime(map.get("startTime")==null?null:ResultConstant.parseDateTime(map.get("startTime").toString(), null) );
			a.setLearnType(map.get("learnType")==null?null:map.get("learnType").toString());
			a.setRegisterLevel(map.get("registerLevel")==null?null:map.get("registerLevel").toString());
			a.setRemark(map.get("remark")==null?null:map.get("remark").toString());
			a.setUid(map.get("uid")==null?null:Integer.valueOf(map.get("uid").toString()));
			a.setStatus(map.get("status")==null?"有效":map.get("status").toString());
			return academicEducationMapper.insertSelective(a);
		}
		return 0;
	
		
	}
	 public int editKsbj(Map<String,Object> map) throws Exception{
		 AcademicEducation a=new AcademicEducation();
		 a.setEducationMajor(map.get("educationMajor")==null?null:map.get("educationMajor").toString());
			a.setEducationSchool(map.get("educationSchool")==null?null:map.get("educationSchool").toString());
			a.setEndTime(map.get("endTime")==null?null:ResultConstant.parseDateTime(map.get("endTime").toString(), null));
			a.setStartTime(map.get("startTime")==null?null:ResultConstant.parseDateTime(map.get("startTime").toString(), null) );
			a.setLearnType(map.get("learnType")==null?null:map.get("learnType").toString());
			a.setRegisterLevel(map.get("registerLevel")==null?null:map.get("registerLevel").toString());
			a.setRemark(map.get("remark")==null?null:map.get("remark").toString());
			//a.setUid(map.get("uid")==null?null:Integer.valueOf(map.get("uid").toString()));
			//a.setStatus(map.get("status")==null?"有效":map.get("status").toString());
			a.setId(map.get("id")==null?null:Integer.valueOf(map.get("id").toString()));
			return academicEducationMapper.updateByPrimaryKeySelective(a);
		 
	 }

	
	@Override
	public StudentSignup selectisExist(StudentSignup record) {
		return studentSignupMapper.selectisExist(record);
	}
	
	public StudentAchievement selectisExist(StudentAchievement record) {
		return studentAchievementMapper.selectisExist(record);
	}
	
	@Override
	public void insertXyList(List<StudentSignup> xyList) throws Exception {
		if(xyList!=null&&xyList.size()>0){
			for(int i=0;i<xyList.size();i++){
				StudentSignup vo=xyList.get(i);
				vo.setSourceType("内部导入");
				if(StringUtils.isNotEmpty(vo.getBirthday1()))
				vo.setBirthday(ResultConstant.parseDateTime( vo.getBirthday1()+"-01",null));
				if(StringUtils.isNotEmpty(vo.getGraduationDate1()))
				vo.setGraduationDate(ResultConstant.parseDateTime( vo.getGraduationDate1(),null));
				UserInfo userInfo=new UserInfo();//用户
			
                String pnum=vo.getPnum(); 
                if(StringUtils.isNotBlank(pnum)){
                String pwd=pnum.substring(pnum.length()-6,pnum.length());
                pwd=MD5.GetMD5Code(MD5.GetMD5Code(pwd));
				userInfo.setPwd(pwd);//密码默认身份证后6位
                }
				userInfo.setPnum(vo.getPnum());//身份证
				userInfo.setName(vo.getName());//姓名
				userInfo.setSex(vo.getSex());//性别
				if(StringUtils.isNotEmpty(vo.getBirthday1())){//出生年月
					userInfo.setBirthDate(ResultConstant.parseDateTime(vo.getBirthday1()+"-01",null));
				}
				if(StringUtils.isNotEmpty(vo.getWorkTime())){//工作时间
					userInfo.setWorkTime(ResultConstant.parseDateTime(vo.getWorkTime(),null));
				}
				userInfo.setZzmm(vo.getZzmm());//政治面貌
				userInfo.setWorkName(vo.getWorkUnit());//工作单位
				userInfo.setPlaceName(vo.getPost());//职务
				userInfo.setSchool(vo.getGraduationSchool());//毕业院校
				if(StringUtils.isNotEmpty(vo.getGraduationDate1())){//毕业时间
					userInfo.setGraduationTime(ResultConstant.parseDateTime(vo.getGraduationDate1(),null));
				}
				userInfo.setEmail(vo.getEmail());//邮箱
				userInfo.setTel(vo.getPhone());//手机
				userInfo.setgTel(vo.getTel());//固定电话
				userInfo.setAdr(vo.getPostalAddress());//联系地址
				//邮政编码
				userInfo.setZipCode(vo.getCode());
				//qq号
				userInfo.setQq(vo.getQq());
				userInfo.setSex(vo.getSex());
				
				userInfo.setMz(vo.getMz());//民族
				userInfo.setWx(vo.getWxh());//微信
				//userInfo.setTeLevel(vo.getZylb());//职业类别、职业等级
				//---------用户信息表----------
				
				//根据身份证判断用户是否存在如果存在则修改
				UserInfo user=userInfoMapper.selectYg(userInfo);
				if(user!=null){
					userInfo.setId(user.getId());
					userInfoMapper.updateByPrimaryKeySelective(userInfo);
					String userId=userInfo.getId().toString();
					System.out.println("用户id："+userId);
					vo.setId(null);
			        vo.setAddDate(new Date());
					vo.setIsPrint("否");
					studentSignupMapper.insertSelective(vo);

				}else{
					userInfo.setId(null);
					userInfoMapper.insertUserInfoByKey(userInfo);
					String userId=userInfo.getId().toString();
					System.out.println("用户id："+userId);
					vo.setId(null);
					vo.setAddDate(new Date());
					vo.setIsPrint("否");
					studentSignupMapper.insertSelective(vo);
				}
			}
		}		
	}
	
	 public int updateXy(Map<String,Object>m)throws Exception{
	    if(m!=null)	{
	    	StudentSignup u=new StudentSignup();
	    	u.setName(m.get("name")==null?null:m.get("name").toString());
	    	u.setSex(m.get("sex")==null?null:m.get("sex").toString());
	    	if(StringUtils.isNotEmpty(m.get("birthDate")==null?null:m.get("birthDate").toString())){
				u.setBirthday(ResultConstant.parseDateTime(m.get("birthDate").toString()+"-01",null));
			}
	    	u.setAddress(m.get("address")==null?null:m.get("address").toString());
	    	u.setZzmm(m.get("zzmm")==null?null:m.get("zzmm").toString());
	    	u.setPlaceResidence(m.get("placeResidence")==null?null:m.get("placeResidence").toString());
	    	u.setWorkUnit(m.get("workName")==null?null:m.get("workName").toString());
	    	u.setPost(m.get("placeName")==null?null:m.get("placeName").toString());
	    	u.setHighestDegree(m.get("highestDegree")==null?null:m.get("highestDegree").toString());
	    	u.setGraduationSchool(m.get("school")==null?null:m.get("school").toString());
	    	u.setGraduationNum(m.get("graduationNum")==null?null:m.get("graduationNum").toString());
	    	
	    	if(StringUtils.isNotEmpty(m.get("graduationTime")==null?null:m.get("graduationTime").toString())){
				u.setGraduationDate(ResultConstant.parseDateTime(m.get("graduationTime").toString(),null));
			}
	    	
	    	u.setEmail(m.get("email")==null?null:m.get("email").toString());
	    	u.setPhone(m.get("tel")==null?null:m.get("tel").toString());
	    	u.setTel(m.get("gTel")==null?null:m.get("gTel").toString());
	    	u.setPostalAddress(m.get("adr")==null?null:m.get("adr").toString());
	    	u.setCode(m.get("zipCode")==null?null:m.get("zipCode").toString());
	    	u.setQq(m.get("qq")==null?null:m.get("qq").toString());
	    	u.setWorkTime(m.get("workTime")==null?null:m.get("workTime").toString());
	    	u.setXyzsNum(m.get("xyzsNum")==null?null:m.get("xyzsNum").toString());
	    	u.setGwzsNum(m.get("gwzsNum")==null?null:m.get("gwzsNum").toString());
	    	u.setRemark(m.get("remark")==null?null:m.get("remark").toString());
	    	u.setLastUid(m.get("uid")==null?null:m.get("uid").toString());
	
	    	u.setId(m.get("id")==null?null:Integer.valueOf(m.get("id").toString()));
	    	u.setMz(m.get("mz")==null?null:m.get("mz").toString());
	    	u.setWxh(m.get("wxh")==null?null:m.get("wxh").toString());
	    	u.setZylb(m.get("zylb")==null?null:m.get("zylb").toString());
	    	u.setZslb(m.get("zslb")==null?null:m.get("zslb").toString());
	    	u.setBkkm(m.get("bkkm")==null?null:m.get("bkkm").toString());
	    	u.setPnumCode(m.get("pnumCode")==null?null:m.get("pnumCode").toString());
	    	u.setKqAddress(m.get("kqAddress")==null?null:m.get("kqAddress").toString());
	    	u.setCkkqAddress(m.get("ckkqAddress")==null?null:m.get("ckkqAddress").toString());
	    	u.setJgName(m.get("jgName")==null?null:m.get("jgName").toString());
	    	u.setKsTz(m.get("ksTz")==null?null:m.get("ksTz").toString());
	    	int c=studentSignupMapper.updateByPrimaryKeySelective(u);
	    	if(c>0){
	    		return c;
	    	}
	    	
	    }
		 
		 return 0;
		 
		 
		 
	 }

	 
	public  void insertCjList(List<StudentAchievement> cjList,String uid)throws Exception{
		if(cjList!=null&&cjList.size()>0){
			for(int i=0;i<cjList.size();i++){
				StudentAchievement vo=cjList.get(i);
				vo.setAddDate(new Date());
				vo.setUid(uid==null?null:Integer.valueOf(uid));
				vo.setId(null);
				//判断是否已有成绩，已有成绩进行更新操在
				StudentAchievement vo2=studentAchievementMapper.selectisExist(vo);
				if(vo2!=null&&vo2.getId()!=null){
					 vo.setId(vo2.getId());
					 studentAchievementMapper.updateByPrimaryKeySelective(vo);
				}else
				     studentAchievementMapper.insertSelective(vo);
			}
		}
		
	}


	@Override
	public List<AcademicEducation> selectAcademicList(Map<String, Object> m) {
		// TODO Auto-generated method stub
		ResultConstant.pageSet(m);
		return academicEducationMapper.selectAcademicList(m);
	}
	@Override
	public List<AcademicEducation> selectAcademicList1(Map<String, Object> m) {
		return academicEducationMapper.selectAcademicList(m);
	}

	@Override
	public int updateAcademicEducation(AcademicEducation record)
			throws Exception {
		return academicEducationMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public List<Map<String, Object>> selectStudentList(Map<String, Object> m) {
		try {	
		ResultConstant.pageSet(m);
		 List<Map<String, Object>> list=studentSignupMapper.selectStudentList(m);
		 if(list!=null&&list.size()>0){
				for(int i=0;i<list.size();i++){
					Map<String,Object> map=list.get(i);
						ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD_HH_MI_SS,map, "add_date");		
						ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "workTime");		

				}
				
			}
		    return list;
		   } catch (Exception e) {
				e.printStackTrace();
			}
		 return null;
	}


	@Override
	public int updateStudentSignup(StudentSignup record) throws Exception {
		return studentSignupMapper.updateByPrimaryKeySelective(record);
	}


	@Override
	public Map<String, Object> selectStudentbyId(Map<String, Object> m) {
		return studentSignupMapper.selectStudentbyId(m);
	}
	public void xyExport(HttpServletResponse response,HttpServletRequest request)throws Exception{
		try {
			List<XyExportVo> list=studentSignupMapper.selectStudentList2(null);
			 
			ExcelExport<XyExportVo> ex = new ExcelExport<XyExportVo>();
			String fileName = "学员报名.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List resultList=new ArrayList(); 
			resultList.add(list);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("学员报名");
			Map<String,Object>title=new HashMap<String, Object>();
			ex.exportExcel2(titleList, resultList, title,output);



		} catch (IOException e) {
			e.printStackTrace();
		}

		
	}


	@Override
	public void updateStudentSignup(String ids) throws Exception {
		String[] s=ids.split(",");
		StudentSignup stu=new StudentSignup();
		for(int i=0;i<s.length;i++){
			stu.setId(Integer.parseInt(s[i].toString()));
			stu.setIsPrint("是");
			studentSignupMapper.updateByPrimaryKeySelective(stu);
		}
	}


	@Override
	public AcademicEducation selectAcademicEducationById(Integer id) {
		return academicEducationMapper.selectByPrimaryKey(id);
	}
	@Override
	public int updateStudentAchievement(StudentAchievement record)
			throws Exception {
		// TODO Auto-generated method stub
		return studentAchievementMapper.updateByPrimaryKeySelective(record);
	}
	@Override
	public List<Map<String, Object>> selectListByBkcc(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return academicEducationMapper.selectListByBkcc(params);
	}
	@Override
	public List<Map<String, Object>> selectListByBkzrs(
			Map<String, Object> params) {
		// TODO Auto-generated method stub
		return studentSignupMapper.selectListByBkzrs(params);
	}
	@Override
	public List<Map<String, Object>> selectListByBklrr(
			Map<String, Object> params) {
		return studentSignupMapper.selectListByBklrr(params);
	}
	
	
}
