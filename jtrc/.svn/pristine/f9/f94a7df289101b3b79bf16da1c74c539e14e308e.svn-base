package com.i84.earnpoint.rygl.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import com.i84.earnpoint.model.MsgFromInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserPartyInfo;
import com.i84.earnpoint.model.UserPartyIn;
import com.i84.earnpoint.model.UserPartyOut;
import com.i84.earnpoint.rygl.service.RyglService;

/**
 * 人员信息采集列表
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/msgFromInfoTrol")
public class MsgFromInfoController   extends ResultConstant{

	@Autowired 
	public RyglService ryglService;
	
	/**
     * 	获取人员信息采集列表
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/queryMsgFromInfoList")
	public  @ResponseBody Map<String, Object> queryMsgFromInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
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
			params.put("KEY", key);
		}
        if(StringUtils.isNotBlank(is_state)){
        	params.put("IS_STATE", is_state);
		}
		List<Map<String, Object>> list = ryglService.queryUserList(params);
		PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	/**
     * 	审核
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
	@RequestMapping("/sh")
	public  @ResponseBody void sh(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String id = request.getParameter("id");
		MsgFromInfo record = new MsgFromInfo();
		record.setId(Integer.parseInt(id));
		record.setIsState(1);
		ryglService.updateMsgFromInfo(record, response);
	}
	
	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		ryglService.delPartyInfo(ids,response);
	}
	

	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserPartyInfo userPartyInfo = new UserPartyInfo();
		List<UserPartyIn> userPartyInList = new ArrayList<UserPartyIn>();
		List<UserPartyOut> userPartyOutList = new ArrayList<UserPartyOut>();
		UserInfo userInfo = new UserInfo();
		String pno = request.getParameter("pno");
		String name = request.getParameter("name");	
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String jg_name = request.getParameter("jg_name");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String birth_date = request.getParameter("birth_date");
		String degree = request.getParameter("degree");
		String da_id = request.getParameter("da_id");
		String is_state = request.getParameter("is_state");
		String party_date = request.getParameter("party_date");
		
		String full_date = request.getParameter("full_date");
		String j_name1 = request.getParameter("j_name1");
		String j_name2 = request.getParameter("j_name2");
		String qq = request.getParameter("qq");
		String wx = request.getParameter("wx");
		
		String sq_status = request.getParameter("sq_status");
		String rd_status = request.getParameter("rd_status");
		String zz_mtr = request.getParameter("zz_mtr");
		String py_mtr = request.getParameter("py_mtr");
		String full_rq = request.getParameter("full_rq");
		String zrInTimes = request.getParameter("zrInTimes");
		String zrZpnos = request.getParameter("zrZpnos");
		String zrInPlaces = request.getParameter("zrInPlaces");
		String zcInTimes = request.getParameter("zcInTimes");
		String zcZpnos = request.getParameter("zcZpnos");
		String zcInPlaces = request.getParameter("zcInPlaces");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String uid = String.valueOf(request.getSession().getAttribute("id"));
		if(null == uid || "null".equals(uid) || "".equals(uid)){
			uid = "1";
		}
		Date endInTime = null;
		Date endOutTime = null;
		if(StringUtils.isNotBlank(zrInTimes)){
			String[] zrInTimeArr = zrInTimes.split(",");
			String[] zrZpnoArr = zrZpnos.split(",");
			String[] zrInPlaceArr = zrInPlaces.split(",");
			for(int i=0;i<zrInTimeArr.length;i++){
				UserPartyIn in = new UserPartyIn();
				try {
					in.setInDate(sdf.parse(zrInTimeArr[i]));
					if(i == zrInTimeArr.length-1){
						endInTime = sdf.parse(zrInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				in.setZpno(zrZpnoArr[i]);
				in.setInPlace(zrInPlaceArr[i]);
				in.setAddDate(new Date());
				in.setStaff(Integer.parseInt(uid));
				userPartyInList.add(in);
			}
		}
		if(StringUtils.isNotBlank(zcInTimes)){
			String[] zcInTimeArr = zcInTimes.split(",");
			String[] zcZpnoArr = zcZpnos.split(",");
			String[] zcInPlaceArr = zcInPlaces.split(",");
			for(int i=0;i<zcInTimeArr.length;i++){
				UserPartyOut out = new UserPartyOut();
				try {
					out.setInDate(sdf.parse(zcInTimeArr[i]));
					if(i == zcInTimeArr.length-1){
						endOutTime = sdf.parse(zcInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				out.setZpno(zcZpnoArr[i]);
				out.setInPlace(zcInPlaceArr[i]);
				out.setAddDate(new Date());
				out.setStaff(Integer.parseInt(uid));
				userPartyOutList.add(out);
			}
		}
		
		if(null == endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
		}else if(null == endInTime && null != endOutTime){
			userPartyInfo.setIsIn("0");
			userPartyInfo.setOutDate(endOutTime);
		}else if(null != endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
			userPartyInfo.setInDate(endInTime);
		}else{
			userPartyInfo.setOutDate(endOutTime);
			userPartyInfo.setInDate(endInTime);
			if(endInTime.after(endOutTime)){
				userPartyInfo.setIsIn("1");
			}else{
				userPartyInfo.setIsIn("0");
			}
		}
		
		userPartyInfo.setPno(pno);
//		userPartyInfo.setIsIn(is_in);
		userInfo.setJgName(jg_name);
		if(StringUtils.isNotBlank(birth_date)){
			userInfo.setBirthDate(sdf.parse(birth_date));
		}
		userInfo.setDegree(degree);
		userInfo.setDaId(da_id);
		userPartyInfo.setIsState(is_state);
		if(StringUtils.isNotBlank(party_date)){
			userPartyInfo.setPartyDate(sdf.parse(party_date));
		}
		if(StringUtils.isNotBlank(full_date)){
			userPartyInfo.setFullDate(sdf.parse(full_date));
		}
		userPartyInfo.setjName1(j_name1);
		userPartyInfo.setjName2(j_name2);
		userInfo.setQq(qq);
		userInfo.setWx(wx);
		userPartyInfo.setSqStatus(sq_status);
		userPartyInfo.setCompany(company);
		userPartyInfo.setRdStatus(rd_status);
		userPartyInfo.setZzMtr(zz_mtr);
		userPartyInfo.setPyMtr(py_mtr);
		userPartyInfo.setFullRq(full_rq);
//		if(StringUtils.isNotBlank(in_date)){
//			userPartyInfo.setInDate(sdf.parse(in_date));
//		}
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setAddDate(new Date());
		userInfo.setWorkName(company);
		ryglService.addPartyInfo(userPartyInfo,userInfo,userPartyInList,userPartyOutList,response);
	}

	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		UserPartyInfo userPartyInfo = new UserPartyInfo();
		List<UserPartyIn> userPartyInList = new ArrayList<UserPartyIn>();
		List<UserPartyOut> userPartyOutList = new ArrayList<UserPartyOut>();
		UserInfo userInfo = new UserInfo();
		String id = request.getParameter("id");
		String uid = request.getParameter("uid");
		String pno = request.getParameter("pno");
		String is_in = request.getParameter("is_in");
		String name = request.getParameter("name");	
		String pnum = request.getParameter("pnum");
		String sex = request.getParameter("sex");
		String jg_name = request.getParameter("jg_name");
		String company = request.getParameter("company");
		String tel = request.getParameter("tel");
		String birth_date = request.getParameter("birth_date");
		String degree = request.getParameter("degree");
		String da_id = request.getParameter("da_id");
		String is_state = request.getParameter("is_state");
		String party_date = request.getParameter("party_date");
		
		String full_date = request.getParameter("full_date");
		String j_name1 = request.getParameter("j_name1");
		String j_name2 = request.getParameter("j_name2");
		String qq = request.getParameter("qq");
		String wx = request.getParameter("wx");
		
		String sq_status = request.getParameter("sq_status");
		String rd_status = request.getParameter("rd_status");
		String zz_mtr = request.getParameter("zz_mtr");
		String py_mtr = request.getParameter("py_mtr");
		String full_rq = request.getParameter("full_rq");
		String zrInTimes = request.getParameter("zrInTimes");
		String zrZpnos = request.getParameter("zrZpnos");
		String zrInPlaces = request.getParameter("zrInPlaces");
		String zcInTimes = request.getParameter("zcInTimes");
		String zcZpnos = request.getParameter("zcZpnos");
		String zcInPlaces = request.getParameter("zcInPlaces");
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		Date endInTime = null;
		Date endOutTime = null;
		if(StringUtils.isNotBlank(zrInTimes)){
			String[] zrInTimeArr = zrInTimes.split(",");
			String[] zrZpnoArr = zrZpnos.split(",");
			String[] zrInPlaceArr = zrInPlaces.split(",");
			for(int i=0;i<zrInTimeArr.length;i++){
				UserPartyIn in = new UserPartyIn();
				try {
					in.setInDate(sdf.parse(zrInTimeArr[i]));
					if(i == zrInTimeArr.length-1){
						endInTime = sdf.parse(zrInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				in.setZpno(zrZpnoArr[i]);
				in.setInPlace(zrInPlaceArr[i]);
				in.setParty(Integer.parseInt(id));
				userPartyInList.add(in);
			}
		}
		if(StringUtils.isNotBlank(zcInTimes)){
			String[] zcInTimeArr = zcInTimes.split(",");
			String[] zcZpnoArr = zcZpnos.split(",");
			String[] zcInPlaceArr = zcInPlaces.split(",");
			for(int i=0;i<zcInTimeArr.length;i++){
				UserPartyOut out = new UserPartyOut();
				try {
					out.setInDate(sdf.parse(zcInTimeArr[i]));
					if(i == zcInTimeArr.length-1){
						endOutTime = sdf.parse(zcInTimeArr[i]);
					}
				} catch (ParseException e) {
					e.printStackTrace();
				}
				out.setZpno(zcZpnoArr[i]);
				out.setInPlace(zcInPlaceArr[i]);
				out.setParty(Integer.parseInt(id));
				userPartyOutList.add(out);
			}
		}
		
		if(null == endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
		}else if(null == endInTime && null != endOutTime){
			userPartyInfo.setIsIn("0");
			userPartyInfo.setOutDate(endOutTime);
		}else if(null != endInTime && null == endOutTime){
			userPartyInfo.setIsIn("1");
			userPartyInfo.setInDate(endInTime);
		}else{
			userPartyInfo.setOutDate(endOutTime);
			userPartyInfo.setInDate(endInTime);
			if(endInTime.after(endOutTime)){
				userPartyInfo.setIsIn("1");
			}else{
				userPartyInfo.setIsIn("0");
			}
		}
		
		
		userPartyInfo.setPno(pno);
		userPartyInfo.setIsIn(is_in);
		userInfo.setJgName(jg_name);
		if(StringUtils.isNotBlank(birth_date)){
			userInfo.setBirthDate(sdf.parse(birth_date));
		}
		userInfo.setDegree(degree);
		userInfo.setDaId(da_id);
		userPartyInfo.setIsState(is_state);
		if(StringUtils.isNotBlank(party_date)){
			userPartyInfo.setPartyDate(sdf.parse(party_date));
		}
		if(StringUtils.isNotBlank(full_date)){
			userPartyInfo.setFullDate(sdf.parse(full_date));
		}
		userPartyInfo.setjName1(j_name1);
		userPartyInfo.setjName2(j_name2);
		userInfo.setQq(qq);
		userInfo.setWx(wx);
		userPartyInfo.setSqStatus(sq_status);
		userPartyInfo.setCompany(company);
		userPartyInfo.setRdStatus(rd_status);
		userPartyInfo.setZzMtr(zz_mtr);
		userPartyInfo.setPyMtr(py_mtr);
		userPartyInfo.setFullRq(full_rq);
//		if(StringUtils.isNotBlank(in_date)){
//			userPartyInfo.setInDate(sdf.parse(in_date));
//		}
		userInfo.setName(name);
		userInfo.setTel(tel);
		userInfo.setSex(sex);
		userInfo.setPnum(pnum);
		userInfo.setAddDate(new Date());
		userInfo.setWorkName(company);
		userInfo.setId(Integer.parseInt(uid));
		userPartyInfo.setId(Integer.parseInt(id));
		ryglService.updatePartyInfo(userPartyInfo,userInfo,userPartyInList,userPartyOutList, response);
	}
	
	
}
