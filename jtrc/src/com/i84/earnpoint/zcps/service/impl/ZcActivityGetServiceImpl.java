package com.i84.earnpoint.zcps.service.impl;

import java.io.File;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.io.Writer;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.JsonUtil;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.mapper.StudyCurInfoMapper;
import com.i84.earnpoint.mapper.StudyCurupInfoMapper;
import com.i84.earnpoint.mapper.StudyInfoMapper;
import com.i84.earnpoint.mapper.StudyUpInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.mapper.WorkCurInfoMapper;
import com.i84.earnpoint.mapper.WorkInfoMapper;
import com.i84.earnpoint.mapper.ZcActivityGetMapper;
import com.i84.earnpoint.mapper.ZcCurdissertationInfoMapper;
import com.i84.earnpoint.mapper.ZcDissertationInfoMapper;
import com.i84.earnpoint.mapper.ZcOtherInfoMapper;
import com.i84.earnpoint.model.StudyCurInfo;
import com.i84.earnpoint.model.StudyCurupInfo;
import com.i84.earnpoint.model.StudyInfo;
import com.i84.earnpoint.model.StudyUpInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.WorkCurInfo;
import com.i84.earnpoint.model.WorkInfo;
import com.i84.earnpoint.model.ZcActivityGet;
import com.i84.earnpoint.model.ZcCurdissertationInfo;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.model.ZcOtherInfo;
import com.i84.earnpoint.zcps.service.ZcActivityGetService;
@Service
public class ZcActivityGetServiceImpl implements ZcActivityGetService {
	@Autowired
    private ZcActivityGetMapper zcActivityGetMapper;
	@Autowired
	private StudyInfoMapper studyInfoMapper;
	@Autowired 
	private WorkInfoMapper workinfomapper;
	@Autowired 
	private StudyUpInfoMapper studyupinfomapper;
	@Autowired 
	private ZcDissertationInfoMapper zcdissertationinfomapper;
 
	@Autowired 
	private StudyCurupInfoMapper studycurupinfomapper;
	@Autowired 
	private StudyCurInfoMapper studycurinfomapper;
	
	@Autowired 
	private ZcActivityGetMapper zcactivitygetmapper;
	@Autowired 
	private UserInfoMapper userinfomapper;
 
	@Autowired 
	private WorkCurInfoMapper workcurinfomapper;
	@Autowired 
	private ZcCurdissertationInfoMapper zccurdissertationinfomapper;
	@Autowired
	private ZcOtherInfoMapper zcOtherInfoMapper;
	
	@Override
	public int insertZcActivityGet(ZcActivityGet zcActivityGet) {
		return zcActivityGetMapper.insertSelective(zcActivityGet);
	}

	@Override
	public int updateZcActivityGet(ZcActivityGet zcActivityGet) {
		return zcActivityGetMapper.updateByPrimaryKeySelective(zcActivityGet);
	}

	@Override
	public int deleteZcActivityGet(String ids) {
		String [] idArray=ids.split(",");
		int count=0;
		for(int i=0;i<idArray.length;i++){
			count+=zcActivityGetMapper.deleteByPrimaryKey(Integer.valueOf(idArray[i]));
		}
		return count;
	}

	@Override
	public ZcActivityGet selectZcActivityGetById(Integer id) {
		return zcActivityGetMapper.selectByPrimaryKey(id);
	}

	public ZcActivityGetMapper getZcActivityGetMapper() {
		return zcActivityGetMapper;
	}

	public void setZcActivityGetMapper(ZcActivityGetMapper zcActivityGetMapper) {
		this.zcActivityGetMapper = zcActivityGetMapper;
	}

	@Override
	public List<Map<String,Object>> queryList(Map<String,Object> map) {
		return this.zcActivityGetMapper.queryList(map);
	}
	public List<Map<String,Object>> queryListExcel(Map<String,Object> map){
		return this.zcActivityGetMapper.queryListExcel(map);
	}
	
	public List<Map<String,Object>> queryListExcel1(Map<String,Object> map){
		return this.zcActivityGetMapper.queryListExcel1(map);
	}
	
	public List<Map<String,Object>> queryListExcel2(Map<String,Object> map){
		return this.zcActivityGetMapper.queryListExcel2(map);
	}

	@Override
	public List<Map<String,Object>> queryZCPSBaseInfo( Map<String,Object> params) {
		return zcActivityGetMapper.selectZCPSBaseInfoList(params);
	}

	@Override
	public String queryZCPSBaseInfo1(ZcActivityGet params) {
		List<Map> rs = zcActivityGetMapper.selectZCPSBaseInfoList1(params);
		Map p = new HashMap();
		int total = rs.size();
		p.put("rows", rs);
		p.put("total", total);
		return response(p); 
	}
	
	@Override
	public ZcActivityGet selectZcActivityGetByActivityIdAndUid(ZcActivityGet record) {
		return zcActivityGetMapper.selectZcActivityGetByActivityIdAndUid(record);
	}
	
 
	@Override
	public int updateByPrimaryKeySelective(ZcActivityGet zcActivityGet) {
		// TODO Auto-generated method stub
		return zcActivityGetMapper.updateByPrimaryKeySelective(zcActivityGet);
	}

	
	@Override
	public String showxxjlsave(String activityid,int uid, String xxjlid, String schoolName, String inData ,String graduationDate, String proName, String xz, String getMethod, String education, String degree) {
		
		Map m = new HashMap();
		m.put("flag", 1);
		StudyInfo sf = new StudyInfo();
		
		sf.setActivityId(TextUtil.getInt(activityid.replace(",", "")));
		sf.setSchoolName(schoolName);
	
		sf.setInDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,inData));
		sf.setGraduationDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,graduationDate));
		sf.setProName(proName);
		sf.setXz(xz);
		sf.setGetMethod(getMethod);
		sf.setEducation(education);
		sf.setDegree(degree);
		sf.setUid(uid);
		if(TextUtil.getInt(xxjlid)!=0){
			sf.setId(TextUtil.getInt(xxjlid));
			int r = studyInfoMapper.updateByPrimaryKeySelective(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = studyInfoMapper.insert(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		
		StudyCurInfo sf1 = new StudyCurInfo();
		sf1.setSchoolName(schoolName);
		sf1.setGraduationDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,graduationDate));
		sf1.setProName(proName);
		sf1.setXz(xz);
		sf1.setGetMethod(getMethod);
		sf1.setEducation(education);
		sf1.setDegree(degree);
		sf1.setUid(uid);
		if(TextUtil.getInt(xxjlid)!=0){
			sf1.setId(TextUtil.getInt(xxjlid));
			int r = studycurinfomapper.updateByPrimaryKeySelective(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = studycurinfomapper.insert(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		
		return response(m);
	}
	
	/**固定返回
	 * @param obj
	 * @return
	 */
	public String response(Object obj) {

		ObjectMapper mapper = new ObjectMapper();
		Writer strWriter = new StringWriter();
		try {
			mapper.writeValue(strWriter, obj);
		} catch (Exception e) {
			StringWriter sw = new StringWriter();
			e.printStackTrace(new PrintWriter(sw, true));
			String str = sw.toString();
			System.out.println("==========");
			System.out.println(str);
		}
		return strWriter.toString();
	}
	
	
	
	@Override
	public String showxxjldel(int xxjlid) {
		Map m = new HashMap();
		m.put("flag", 1);
//		StudyCurInfo sf = new StudyCurInfo();
//		sf.setDelDate(new Date());
//		sf.setId(xxjlid);
//		int r = studycurinfomapper.updateByPrimaryKeySelective(sf);
		StudyInfo sf=new StudyInfo();
		sf.setDelDate(new Date());
		sf.setId(xxjlid);
		int r=	studyInfoMapper.updateByPrimaryKeySelective(sf);	
		if(r<=0){
			m.put("flag", 0);
		}
		return response(m);
	}

	@Override
	public String zcsbtj(String path, MultipartFile file,ZcActivityGet zaget ) {
		Map p = new HashMap();
		String fileName = "";
		p.put("flag",1);
 
		 
		if (file != null) {
			fileName = file.getOriginalFilename();
			if(fileName.endsWith(".zip")||fileName.endsWith(".rar")){
				// String fileName = new Date().getTime()+".jpg";
				System.out.println(path);
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}

				// 保存
				try {
					file.transferTo(targetFile);
				} catch (Exception e) {
					e.printStackTrace();
				}			
			}else{				
				p.put("flag", 3);//文件格式不正确
				return response(p);
			}
			
		}
		zaget.setUrl("/upload/" + fileName);
		zcactivitygetmapper.updateByPrimaryKeySelective(zaget);
		return response(p);
	}

	@Override
	public String zcsbdel(int delid) {
		Map p = new HashMap();
		p.put("flag", 1);
		int r = zcActivityGetMapper.deleteByPrimaryKey(delid);
		if(r<=0){
			p.put("flag", 0);
		}
		return response(p);
	}

	@Override
	public String showjxjydel(int jxjyid) {
		Map m = new HashMap();
		m.put("flag", 1);
//		StudyCurupInfo sf = new StudyCurupInfo();
//		sf.setDelDate(new Date());
//		sf.setId(jxjyid);
//		int r = studycurupinfomapper.updateByPrimaryKeySelective(sf);
		
		StudyUpInfo sf = new StudyUpInfo();
		sf.setDelDate(new Date());
		sf.setId(jxjyid);
		int r = studyupinfomapper.updateByPrimaryKeySelective(sf);
		if(r<=0){
			m.put("flag", 0);
		}
		return response(m);
	}
	
	

	@Override
	public String showgzjldel(int delid) {
		Map m = new HashMap();
		m.put("flag", 1);
//		WorkCurInfo sf = new WorkCurInfo();
		WorkInfo sf = new WorkInfo();
		sf.setDelDate(new Date());
		sf.setId(delid);
		//int r = workcurinfomapper.updateByPrimaryKeySelective(sf);
		int r = workinfomapper.updateByPrimaryKeySelective(sf);
		if(r<=0){
			m.put("flag", 0);
		}
		return response(m);
	}

	@Override
	public String showlwzzdel(int delid) {
		Map m = new HashMap();
		m.put("flag", 1);
		ZcDissertationInfo sf = new ZcDissertationInfo();
		sf.setDelDate(new Date());
		sf.setId(delid);
		int r = zcdissertationinfomapper.updateByPrimaryKeySelective(sf);
		if(r<=0){
			m.put("flag", 0);
		}
		return response(m);
	}

	
	@Override
	public String showgzjlsave(WorkInfo obj) {
		
		Map m = new HashMap();
		m.put("flag", 1);
		WorkInfo sf = obj;
		//sf.setStartDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,sf.getStartDate()));
		//sf.setEndDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,endDate));
		//sf.setUid(uid);
		if(TextUtil.getInt(sf.getId())!=0){
			int r = workinfomapper.updateByPrimaryKeySelective(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = workinfomapper.insert(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		WorkCurInfo sf1 = new WorkCurInfo();
		sf1.setEnterpriseId(sf.getEnterpriseId());
		sf1.setWorkName(sf.getWorkName());
		sf1.setPlaceId(sf.getPlaceId());
		sf1.setStartDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,sf.getStartDate()));
		sf1.setEndDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,sf.getEndDate()));
		sf1.setUid(sf.getUid());
		if(TextUtil.getInt(sf.getId())!=0){
			sf1.setId(TextUtil.getInt(sf.getId()));
			int r = workcurinfomapper.updateByPrimaryKeySelective(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = workcurinfomapper.insert(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		return response(m);
	}

	@Override
	public String showjxjysave(StudyUpInfo obj) {
		StudyUpInfo sf = obj;
		Map m = new HashMap();
		m.put("flag", 1);
		if(TextUtil.getInt(sf.getId())!=0){
			sf.setId(TextUtil.getInt(sf.getId()));
			int r = studyupinfomapper.updateByPrimaryKeySelective(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = studyupinfomapper.insert(sf);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		
		StudyCurupInfo sf1 = new StudyCurupInfo();
		sf1.setStudyContent(sf.getStudyContent());
		sf1.setStudyTime(sf.getStudyTime());
		sf1.setStudyMethod(sf.getStudyMethod());
		sf1.setTrainDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,sf.getTrainDate()));
		sf1.setOutDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,sf.getOutDate()));
		sf1.setUid(sf.getUid());
		if(TextUtil.getInt(sf.getId())!=0){
			sf1.setId(TextUtil.getInt(sf.getId()));
			int r = studycurupinfomapper.updateByPrimaryKeySelective(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}else{
			int r = studycurupinfomapper.insert(sf1);
			if(r<=0){
				m.put("flag", 0);
			}
		}
		return response(m);
	}



	@Override
	public String showlwzzsave(String path,
			ZcDissertationInfo obj,String fjParam) {

		Map p = new HashMap();
		String fileName = "";
		p.put("flag",1);
		//fileName = file.getOriginalFilename();
		/*if (file != null) {

			fileName = file.getOriginalFilename();
			if(fileName.endsWith(".jpg")||fileName.endsWith(".jpeg")||fileName.endsWith(".gif")||fileName.endsWith(".png")){
				// String fileName = new Date().getTime()+".jpg";
				System.out.println(path);
				File targetFile = new File(path, fileName);
				if (!targetFile.exists()) {
					targetFile.mkdirs();
				}
               
                	// 保存
    				try {
    					file.transferTo(targetFile);
    				} catch (Exception e) {
    					e.printStackTrace();
    				}
    				 if(targetFile.length()<=1024*1024){
                }else{
                	p.put("flag", 4);//文件大于1兆
    				return response(p);            	
                }	
			}else{			
				p.put("flag", 3);//文件格式不正确
				return response(p);
			}
			
		}*/
	
 
		obj.setUrl("/upload/" + fileName);
 
		if(TextUtil.getInt(obj.getId())!=0){
			zcdissertationinfomapper.updateByPrimaryKeySelective(obj);
		}else{
			Integer maxId=zcdissertationinfomapper.selectMaxId();
			maxId=maxId==null?0:maxId;
			obj.setpNo(String.format("%05d", maxId+1));
			zcdissertationinfomapper.insert(obj);
		}

		ZcCurdissertationInfo r1 = new ZcCurdissertationInfo();
		r1.setDissetationName(obj.getDissetationName());
		r1.setOverDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,obj.getOverDate()));
		r1.setjDate(DateUtil.getDate(DateUtil.OYYYY_MM_DD,obj.getjDate()));
		r1.setjMsg(obj.getjMsg());
		r1.setRemark(obj.getRemark());
		r1.setUid(obj.getUid());
		r1.setIsSend(obj.getIsSend());
		 
		r1.setUrl("/upload/" + fileName);
		r1.setUid(obj.getUid());
		if(TextUtil.getInt(obj.getId())!=0){
			zccurdissertationinfomapper.updateByPrimaryKeySelective(r1);
		}else{
			zccurdissertationinfomapper.insertSelective(r1);
		}
		
		//附件操作
		if(StringUtils.isNotEmpty(fjParam)){
			ZcOtherInfo z=new ZcOtherInfo();
			z.setAid(r1.getId());
		    z.setDelDate(new Date());
		    z.setFileType(3);//3：后台职称评审基本信息管理论文新增列表
			zcOtherInfoMapper.updateByPrimaryKeySelective(z);
			JSONArray jsonArray =JsonUtil.getObjectArray4Json(fjParam);
			int iSize = jsonArray.size();
			for (int i = 0; i < iSize; i++) {
				JSONObject jsonObj = jsonArray.getJSONObject(i);
				
				ZcOtherInfo zc=new ZcOtherInfo();
				zc.setFileName(jsonObj.get("name")==null?null:jsonObj.get("name").toString());
				zc.setFileUrl(jsonObj.get("url")==null?null:jsonObj.get("url").toString());
				//zc.setAid(r1.getId());
				zc.setAid(obj.getId());
				zc.setAddDate(new Date());
				zc.setFileType(3);//3：后台职称评审基本信息管理论文新增列表
				//zc.setStuff(r1.getUid());
				zcOtherInfoMapper.insertSelective(zc);
			}
		}
		//
		
		
		return response(p);

	}

	public  List<Map> selectfj(Map map){
		return zcOtherInfoMapper.selectfj(map);
		
	}

	@Override
	public int selectZCPSBaseInfoList2(ZcActivityGet params) {
		return zcActivityGetMapper.selectZCPSBaseInfoList2(params);
	}
	
}
