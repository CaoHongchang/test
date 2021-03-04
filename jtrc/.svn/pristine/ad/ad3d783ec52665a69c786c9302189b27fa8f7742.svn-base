package com.i84.earnpoint.zyzgksgl.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.BaseService;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.mapper.ExamClassProjectMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.ExamClassProject;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.zyzgksgl.service.ExamClassProjectService;

@Service
public class ExamClassProjectServiceImpl extends BaseService implements ExamClassProjectService {
	@Autowired
	private ExamClassProjectMapper examClassProjectMapper;
	@Autowired
	private UserInfoMapper userInfoMapper;

	@Override
	public List<Map<String, Object>> queryList(ExamClassProject record) {
		return examClassProjectMapper.queryList(record);
	}

	@Override
	public Map<String, Object> getDetail(Integer id) {
		return examClassProjectMapper.getDetail(id);
	}

	@Override
	public void audit(ExamClassProject examClassProject) {
		examClassProjectMapper.audit(examClassProject);
	}

	@Override
	public List<Map<String, Object>> queryStudent(ExamClassProject record) {
		return examClassProjectMapper.queryStudent(record);
	}

	@Override
	public Map<String, Object> getStudentDetail(Integer id) {
		return examClassProjectMapper.getStudentDetail(id);
	}

	@Override
	public void insertList(List<ExamClassProject> list) {
		UserInfo userInfo = null;
		for(ExamClassProject examClassProject : list){
			userInfo = userInfoMapper.getUserByPnum(examClassProject.getPnum());
			if(userInfo==null){
				userInfo = new UserInfo();
				userInfo.setName(examClassProject.getUserName());
				userInfo.setPnum(examClassProject.getPnum());
				userInfo.setTel(examClassProject.getTel());
				int length = examClassProject.getPnum().length();
				if(length>6)
					userInfo.setPwd(MD5.GetMD5Code(examClassProject.getPnum().substring(length-6, length)));
				userInfo.setSex(examClassProject.getSex());
				userInfo.setAddDate(new Date());
				userInfo.setWorkName(examClassProject.getWorkName());
				userInfo.setSchool(examClassProject.getSchool());
				userInfo.setMajor(examClassProject.getMajor());
				userInfo.setDegree(examClassProject.getDegree());
				userInfo.setBirthDate(DateUtil.getDate(DateUtil.YYYYMM, examClassProject.getBirthDate()));
				userInfoMapper.insertSelective(userInfo);
			}else{
				userInfo.setName(examClassProject.getUserName());
				userInfo.setPnum(examClassProject.getPnum());
				userInfo.setTel(examClassProject.getTel());
				userInfo.setSex(examClassProject.getSex());
				userInfo.setWorkName(examClassProject.getWorkName());
				userInfo.setSchool(examClassProject.getSchool());
				userInfo.setMajor(examClassProject.getMajor());
				userInfo.setDegree(examClassProject.getDegree());
				userInfo.setBirthDate(DateUtil.getDate(DateUtil.YYYYMM, examClassProject.getBirthDate()));
				userInfoMapper.updateByPrimaryKeySelective(userInfo);
			}
			examClassProject.setUserId(userInfo.getId());
			if(examClassProject.getId()==null)
				examClassProjectMapper.insertSelective(examClassProject);
			else
				examClassProjectMapper.updateByPrimaryKeySelective(examClassProject);
		}
	}

	@Override
	public List<Map<String, Object>> getCanAssign(Integer projectId) {
		return examClassProjectMapper.getCanAssign(projectId);
	}

	@Override
	public ExamClassProject getExamClassProject(ExamClassProject record) {
		return examClassProjectMapper.getExamClassProject(record);
	}
}
