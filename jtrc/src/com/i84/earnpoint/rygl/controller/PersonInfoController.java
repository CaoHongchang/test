package com.i84.earnpoint.rygl.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.PersonBasicInfo;
import com.i84.earnpoint.model.PersonEducationInfo;
import com.i84.earnpoint.model.PersonMajorCertificate;
import com.i84.earnpoint.model.PersonProfessionCertificate;
import com.i84.earnpoint.model.PersonReward;
import com.i84.earnpoint.model.PersonSkillCertificate;
import com.i84.earnpoint.model.PersonStateAllowance;
import com.i84.earnpoint.rckgl.service.PersonInfoService;
/**
 * 人员管理
 * @author 
 *
 */
@Controller
@RequestMapping("/personInfo")
public class PersonInfoController extends ResultConstant{
	@Autowired 
	public PersonInfoService personInfoService;
	
	/**
     * 	获取人员信息采集列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryPersonList")
	public  @ResponseBody Map<String, Object> queryPersonList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		String key = request.getParameter("key");
		String is_state = request.getParameter("is_state");
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("page", page);
		params.put("rows", rows);
		if(StringUtils.isNotBlank(key)){
			params.put("person_name", key);
		}
        if(StringUtils.isNotBlank(is_state)&&!is_state.equals("3")){
        	params.put("status", is_state);
		}
		List<Map<String, Object>> list = personInfoService.selectPersonList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
     * 	获取人员基本信息
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryPersonBasic")
	public  @ResponseBody Map<String, Object> qryPersonBasic(HttpServletResponse response,HttpServletRequest request) throws Exception{
	    String pid = request.getParameter("pid");
	    return personInfoService.qryPersonBasic(pid);
	}
	
	/**
     * 审核人员信息
     * @param request
     * @param response
     * @throws Exception
     */
	@RequestMapping("/checkPersonInfo")
	public void checkUnitInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
		String id=TextUtil.getString(request.getParameter("id"));
		String status=request.getParameter("checkStatus");
		String content=request.getParameter("checkRemark");
		String checkUserId=request.getParameter("checkUserId");
		try{
		    PersonBasicInfo basicInfo=new PersonBasicInfo();
		    basicInfo = personInfoService.selectBasicInfoById(Integer.valueOf(id));
			if(status!=null){
				basicInfo.setStatus(status);
			}
			basicInfo.setContent(content);
			if(checkUserId!=null){
				basicInfo.setUid(Integer.valueOf(checkUserId));
			}
			int count=personInfoService.updateByPrimaryKeySelective(basicInfo);
			if(count>0){
				if(status.equals("1")){
					personInfoService.insertUser(basicInfo);
				}
				response.getWriter().write("1");
			}else{
				response.getWriter().write("审核人员失败！");
			}
		
		}catch(Exception e){
			response.getWriter().write(e.getMessage());
		}
	}
	
	/**
     * 	获取学习经历列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryEducationInfo")
	public  @ResponseBody Map<String, Object> qryEducationInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonEducationInfo> list = personInfoService.qryEducationInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	/**
     * 	获取国务院津贴列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryAllowanceInfo")
	public  @ResponseBody Map<String, Object> qryAllowanceInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonStateAllowance> list = personInfoService.qryAllowanceInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	/**
     * 	获取专业技术职务资格证书列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryMajorInfo")
	public  @ResponseBody Map<String, Object> qryMajorInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonMajorCertificate> list = personInfoService.qryMajorInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	/**
     * 	获取职业资格证书列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryProfessionInfo")
	public  @ResponseBody Map<String, Object> qryProfessionInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonProfessionCertificate> list = personInfoService.qryProfessionInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	/**
     * 	获取技术等级岗位列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qrySkillInfo")
	public  @ResponseBody Map<String, Object> qrySkillInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonSkillCertificate> list = personInfoService.qrySkillInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	/**
     * 	获取奖惩情况列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/qryRewardInfo")
	public  @ResponseBody Map<String, Object> qryRewardInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String pid = request.getParameter("pid");
		List<PersonReward> list = personInfoService.qryRewardInfo(Integer.valueOf(pid));
		return resultMap(list,true, null);
	}
	
	@RequestMapping("/officialDegree")
	public  @ResponseBody List<Map<String, Object>> degree() {
		List<Map<String, Object>> list = personInfoService.degree();
		return list;
	}
	
	@RequestMapping("/officialEducation")
	public  @ResponseBody List<Map<String, Object>> education() {
		List<Map<String, Object>> list = personInfoService.education();
		return list;
	}
	
	@RequestMapping("/officialLevel")
	public  @ResponseBody List<Map<String, Object>> level() {
		List<Map<String, Object>> list = personInfoService.level();
		return list;
	}
	
	
	@RequestMapping("/officialProfessionalLevel")
	public  @ResponseBody List<Map<String, Object>> professionalLevel() {
		List<Map<String, Object>> list = personInfoService.professionalLevel();
		return list;
	}
	
	
	@RequestMapping("/officialRewardsAndPunishments")
	public  @ResponseBody List<Map<String, Object>> rewardsAndPunishments() {
		List<Map<String, Object>> list = personInfoService.rewardsAndPunishments();
		return list;
	}
	
	
	@RequestMapping("/officialCertificate")
	public  @ResponseBody List<Integer> certificate(HttpServletResponse response,HttpServletRequest request) throws Exception{
		List<Integer> count=new ArrayList<Integer>();
		Integer rp=personInfoService.certificateStatistics1();
		Integer jsdj=personInfoService.certificateStatistics2();
		Integer zyzg=personInfoService.certificateStatistics3();
		Integer zyjs=personInfoService.certificateStatistics4();
		Integer tsjt=personInfoService.certificateStatistics5();
		Integer xlxx=personInfoService.certificateStatistics6();
		Integer xwzs=personInfoService.certificateStatistics7();
		count.add(rp);
		count.add(jsdj);
		count.add(zyzg);
		count.add(zyjs);
		count.add(tsjt);
		count.add(xlxx);
		count.add(xwzs);
		return count;
	}
	
	
	@RequestMapping("/totalNumber")
	public @ResponseBody List<Map<String, Object>> totalNumber(String year1,String year2,String timeType){
		List<Map<String, Object>> lists = personInfoService.totalNumber(year1, year2,timeType);
		return lists;
		
	}
	
	@RequestMapping("/testLevel")
	public @ResponseBody List<Map<String, Object>> testLevel(String year1,String year2){
		List<Map<String, Object>> lists = personInfoService.testLevel(year1, year2);
		return lists;
		
	}
	
	
	@RequestMapping("/unitStatistical")
	public @ResponseBody List<Map<String, Object>> unitStatistical(){
		List<Map<String, Object>> lists = personInfoService.unitStatistical();
		return lists;
		
	}
	
	
	@RequestMapping("/formsOfLearning")
	public @ResponseBody List<Map<String, Object>> formsOfLearning(String year1,String year2){
		List<Map<String, Object>> lists = personInfoService.formsOfLearning(year1, year2);
		return lists;
		
	}
	
	@RequestMapping("/school")
	public @ResponseBody List<Map<String, Object>> school(String year1,String year2){
		List<Map<String, Object>> lists = personInfoService.school(year1, year2);
		return lists;
		
	}
	
	@RequestMapping("/major")
	public @ResponseBody List<Map<String, Object>> major(String year1,String year2){
		List<Map<String, Object>> lists = personInfoService.major(year1, year2);
		return lists;
		
	}
	
	
	
	@RequestMapping("/countman")
	public @ResponseBody List<Map<String, Object>> countman(String year1,String year2,String timeType){
		List<Map<String, Object>> lists = personInfoService.countman(year1, year2,timeType);
		return lists;
		
	}
	
	
	@RequestMapping("/llr")
	public @ResponseBody List<Map<String, Object>> llr(String year1,String year2){
		List<Map<String, Object>> lists = personInfoService.llr(year1, year2);
		return lists;
		
	}
	
}
