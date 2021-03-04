package com.i84.earnpoint.sydwzp.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.model.BgActivityArgInfo;
import com.i84.earnpoint.model.BgActivityUserInfo;
import com.i84.earnpoint.model.FaildExportVo;
import com.i84.earnpoint.sydwzp.service.BgActivityArgInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityUserInfoService;
@Controller
@RequestMapping("/bgActivityUserInfo")
public class BgActivityUserInfoController extends ResultConstant{
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
    SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
    @Autowired
    private BgActivityUserInfoService bgActivityUserInfoService;
    @Autowired
    private BgActivityArgInfoService bgActivityArgInfoService;

    //报名表列表
    @RequestMapping("/list")
    public @ResponseBody Map<String,Object> list(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response){
        List<Integer> list2 =new ArrayList<Integer>();
        try {
            int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());

            List<Map<String, Object>> enterpriseId = bgActivityUserInfoService.userEnterpriseId(userId);

            if(null != enterpriseId && enterpriseId.size() > 0) {

                if(null != enterpriseId.get(0).get("enterpriseId") && !"".equals(enterpriseId.get(0).get("enterpriseId").toString())) {
                    List<Map<String, Object>> enterpriseIds = bgActivityUserInfoService.userEnterpriseIds(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));

                    for(int i = 0; i < enterpriseIds.size(); i++) {

                        list2.add(Integer.parseInt(enterpriseIds.get(i).get("id").toString()));
                    }
                    list2.add(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));
                }

            }



        } catch (Exception e) {
            e.printStackTrace();
        }
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        List<Map<String,Object>> list = null;
        PageInfo<Map<String,Object>> pageInfo = null;
        try {

            if(null != list2 && list2.size() > 0) {
                params.put("list", list2);
                request.getSession().setAttribute("enterpriseIdlist", list2);
            } else {
                params.put("list", null);
            }

            list=bgActivityUserInfoService.selectListBySelective(params);

            if(null != list && list.size() > 0) {
                for(int i = 0; i < list.size(); i++) {
                    if(sdf.parse(list.get(i).get("shjssj").toString()).before(new Date())) {//审核时间已结束
                        list.get(i).put("shjsbs", "0");
                    } else {
                        list.get(i).put("shjsbs", "1");
                    }
                    if(sdf.parse(list.get(i).get("ssjssj").toString()).before(new Date())) {//申诉时间已结束
                        list.get(i).put("ssjsbs", "0");
                    } else {
                        list.get(i).put("ssjsbs", "1");
                    }
                    if(null == list.get(i).get("shzt") || "".equals(list.get(i).get("shzt")) || "null".equals(list.get(i).get("shzt"))) {
                        list.get(i).put("shzt", "待审核");
                    }
                    if(null == list.get(i).get("sszt") || "".equals(list.get(i).get("sszt")) || "null".equals(list.get(i).get("sszt"))) {
                        list.get(i).put("sszt", "未申诉");
                    }
                }
            }

            pageInfo=new PageInfo<Map<String,Object>>(list);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap(list, pageInfo.getTotal(), true, "");
    }

    /**
     * 封装个人报名信息输出
     * @param userid 用户id
     * @param enterprisePlaceId 招考的id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryGwyqInfo")
    public @ResponseBody List<Map<String, Object>> queryGwyqInfo(String epi,HttpServletRequest request,HttpServletResponse response){
        List<Map<String, Object>> result = null;
        try {
            result = bgActivityUserInfoService.queryGwyqInfo("id", epi);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取单位信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryEnterpriseInfo")
    public @ResponseBody List<Map<String, Object>> queryEnterpriseInfo(String id, HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        try {
            result = bgActivityUserInfoService.queryEnterpriseInfo("id", id);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取个人信息
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryUserInfo")
    public @ResponseBody HashMap<String, Object> queryUserInfo(String id,String userid,String uid, String epi, HttpServletRequest request,HttpServletResponse response){
        HashMap<String, Object> map = new HashMap<String, Object>();
        List<Map<String, Object>> result = null;

        List<Map<String, Object>> userresult = null;
        try {
            result = bgActivityUserInfoService.queryGwyqInfo("id", epi);
            map.put("activityUserInfo", result);
            userresult = bgActivityUserInfoService.queryUserInfo("id", userid);

            result = bgActivityUserInfoService.queryEnterpriseInfo("id", id);
            map.put("enterpriseInfo", result);


            Map<String,Object> param = new HashMap<String, Object>();
            param.put("user_id", uid);
            param.put("enterprise_place_id", epi);
            System.out.println(uid+"&&" + epi);
            result = bgActivityUserInfoService.queryUserStudyInfo(param);
            map.put("studyInfo", result);


            System.out.println("学习经历列表长度：" + result.size());
            if(null != result && result.size() > 0) {
                String school = result.get(0).get("university").toString();
                String time = result.get(0).get("study_end_date").toString();

                if(result.size() == 1) {
                    userresult.get(0).put("byyx", school);
                    userresult.get(0).put("bysj", time);
                }

                for(int i = 0; i < result.size(); i++) {
                    if(sd.parse(time).before(sd.parse(result.get(i).get("study_end_date").toString()))) {
                        time = result.get(i).get("study_end_date").toString();
                        school = result.get(i).get("university").toString();
                    }

                    if(i == result.size()-1) {
                        System.out.println(time+school);
                        userresult.get(0).put("byyx", school);
                        userresult.get(0).put("bysj", time);
                    }
                }
            } else {
                userresult.get(0).put("byyx", "");
                userresult.get(0).put("bysj", "");
            }

            map.put("userInfo", userresult);

            result =  bgActivityUserInfoService.queryUserWorkInfo(param);
            map.put("workInfo", result);
            result = bgActivityUserInfoService.queryShSsInfo(param);
            map.put("shssInfo", result);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return map;
    }

    /**
     * 获取学习经历
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryUserStudyInfo")
    public @ResponseBody List<Map<String, Object>> queryUserStudyInfo(String userid, String epi, HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        try {
            Map<String,Object> param = new HashMap<String, Object>();

            param.put("user_id", userid);
            param.put("enterprise_place_id", epi);
            System.out.println(userid);
            System.out.println(epi);
            result = bgActivityUserInfoService.queryUserStudyInfo(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 获取工作经历
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryUserWorkInfo")
    public @ResponseBody List<Map<String, Object>> queryUserWorkInfo(String userid, String epi, HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        try {
            Map<String,Object> param = new HashMap<String, Object>();

            param.put("user_id", userid);
            param.put("enterprise_place_id", epi);
            System.out.println(userid);
            System.out.println(epi);
            result = bgActivityUserInfoService.queryUserWorkInfo(param);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 审核失败名单
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryShFailedList")
    public @ResponseBody List<Map<String, Object>> queryShFailedList(@RequestParam Map<String,Object> param, HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        try {

            result = bgActivityUserInfoService.queryShFailedList(param);

            if(null != result && result.size() > 0) {
                for(int i = 0; i < result.size(); i++) {
                    if(null == result.get(i).get("dczt") || "".equals(result.get(i).get("dczt"))) {
                        result.get(i).put("dczt", "未导出");
                    }
                    if(null != result.get(i).get("remark") && !"".equals(result.get(i).get("remark"))) {
                        result.get(i).put("dfzh", result.get(i).get("remark").toString().split("buyer_email:")[1].split("gmt_create:")[0].replace("|", ""));
                    }
                    if(null != result.get(i).get("is_state") && !"".equals(result.get(i).get("is_state"))) {
                        if(result.get(i).get("is_state") != "审核通过") {
                            result.get(i).put("tksm","审核不通过");
                        }
                        if(result.get(i).get("up_state") == "申诉失败") {
                            result.get(i).put("tksm","申诉失败");
                        }
                    }
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 容错名单
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/queryShFailedList2")
    public @ResponseBody Map<String, Object> queryShFailedList2(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response){
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        List<Map<String,Object>> result = null;
        PageInfo<Map<String,Object>> pageInfo = null;
        try {

            params.put("type", "2");
            result = bgActivityUserInfoService.queryShFailedList2(params);

            pageInfo=new PageInfo<Map<String,Object>>(result);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap(result, pageInfo.getTotal(), true, "");
    }

    /**
     * 容错处理
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/dorc")
    public void dorc(String id, String type, HttpServletRequest request,HttpServletResponse response){

        BgActivityUserInfo user = new BgActivityUserInfo();
        user.setId(Integer.parseInt(id));
        int num = 0;
        if(type.equals("审核容错处理")) {
            user.setIsState("待审核");
            user.setApplyType("已处理");
        } else if(type.equals("申诉容错处理")) {
            user.setUpState("申诉中");//2017.1.18新需求
            //user.setUpState("待申诉");
            user.setApplyType("已处理");
        } else {
            write(response, num);
        }
        num = bgActivityUserInfoService.updateByPrimaryKeySelective(user);

        write(response, num);
    }

    /**
     * 容错处理申请
     * @param id
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/dorcsq")
    public void dorcsq(String id, String type, HttpServletRequest request,HttpServletResponse response){

        BgActivityUserInfo user = new BgActivityUserInfo();
        user.setId(Integer.parseInt(id));
        int num = 0;
        if(type.equals("sh")) {
            user.setApplyType("审核容错处理");
        } else if(type.equals("ss")) {
            user.setApplyType("申诉容错处理");
        } else {
            write(response, num);
        }
        num = bgActivityUserInfoService.updateByPrimaryKeySelective(user);

        write(response, num);
    }
    
    
    @RequestMapping("/updateInfo")
    public void updateInfo(HttpServletRequest request,HttpServletResponse response){

        BgActivityUserInfo user = new BgActivityUserInfo();
        int num = 0;
        num = bgActivityUserInfoService.updateInfo(user);
        write(response, num);
    }

    @RequestMapping("/ss")
    public void ss(String id, String upState, String up, String isState, HttpServletRequest request, HttpServletResponse response) {

        BgActivityUserInfo user = new BgActivityUserInfo();
        user.setId(Integer.parseInt(id));
        int num = 0;


        if("申诉成功".equals(upState)) {
            user.setIsState("审核通过");
        }

        user.setUpState(upState);
        user.setUp(up);
        user.setIsState(isState);
        num = bgActivityUserInfoService.updateByPrimaryKeySelective(user);

        write(response, num);
    }
    @RequestMapping("/sh")
    public void sh(String id,String isState, String rs, HttpServletRequest request,HttpServletResponse response){

        BgActivityUserInfo user = new BgActivityUserInfo();
        user.setId(Integer.parseInt(id));
        int num = 0;
        user.setIsState(isState);
        user.setRs(rs);
        num = bgActivityUserInfoService.updateByPrimaryKeySelective(user);

        write(response, num);
    }

    /**
     * 查询活动列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/activityList")
    public @ResponseBody List<Map<String, Object>> activityList(HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        try {

            String date = sdf.format(new Date());

            result = bgActivityUserInfoService.activityList(date);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询活动列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/activityList2")
    public @ResponseBody List<Map<String, Object>> activityList2(HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result =  new ArrayList<Map<String,Object>>();
        List<Map<String, Object>> result2 = null;
        try {
            int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());

            List<Map<String, Object>> enterpriseId = bgActivityUserInfoService.userEnterpriseId(userId);

            if(null != enterpriseId && enterpriseId.size() > 0) {
                List<Map<String, Object>> enterpriseIds = null;
                if(null != enterpriseId.get(0).get("enterpriseId") && !"".equals(enterpriseId.get(0).get("enterpriseId").toString())) {
                    enterpriseIds = bgActivityUserInfoService.userEnterpriseIds(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));
                }
                else {
                    enterpriseIds = bgActivityUserInfoService.userEnterpriseAll();
                }

                List<Integer> list = new ArrayList<Integer>();

                for(int i = 0; i < enterpriseIds.size(); i++) {

                    list.add(Integer.parseInt(enterpriseIds.get(i).get("id").toString()));
                }
                if (null != enterpriseId.get(0).get("enterpriseId") && !"".equals(enterpriseId.get(0).get("enterpriseId").toString())) {
                    list.add(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));
                }

                Map<String, Object> param =  new HashMap<String, Object>();
                param.put("list", list);
                List<Map<String, Object>> result3 = bgActivityUserInfoService.userEnterprises(param);
                String date = sdf.format(new Date());

                result2 = bgActivityUserInfoService.activityList(date);

                for(int i = 0; i < result2.size(); i++) {
                    for(int j = 0; j < result3.size(); j++) {
                        if(result2.get(i).get("hdid").toString().equals(result3.get(j).get("activity_id").toString())) {
                            result.add(result2.get(i));
                            break;
                        }

                    }

                }
            }



        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    /**
     * 统计考室号以及人员数
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/activityAllUserList")
    public @ResponseBody Map<String,Object> activityAllUserList(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response){


        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        PageInfo<Map<String,Object>> pageInfo = null;
        List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
        List<Map<String, Object>> kslist = null;
        List<Map<String, Object>> rylist = null;
        Map<String, Object> r = new HashMap<String, Object>();

        String id = request.getParameter("id");
        if(null != id && !"".equals(id)) {
            params.put("activityId",id);
        }

        try {

            kslist = bgActivityUserInfoService.kshList(params);
            if(null != kslist && kslist.size() > 0) {
                for(int i = 0; i < kslist.size(); i++) {
                    r = new HashMap<String, Object>();
                    r.put("ksh",kslist.get(i).get("ksh"));
                    params.put("ksh",kslist.get(i).get("ksh"));
                    rylist = bgActivityUserInfoService.userList(params);
                    if(null != rylist && rylist.size() > 0) {
                        r.put("ksrs",rylist.size());
                        result.add(r);
                    }

                }
            }

            pageInfo=new PageInfo<Map<String,Object>>(kslist);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultMap(result, pageInfo.getTotal(), true, "");
    }

    /**
     * 考室号列表
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/kshList")
    public @ResponseBody List<Map<String, Object>> kshList(HttpServletRequest request,HttpServletResponse response){

        List<Map<String, Object>> result = null;
        Map<String,Object> params = new HashMap<String, Object>();

        String id = request.getParameter("id");
        if(null != id && !"".equals(id)) {
            params.put("activityId",id);
        }

        try {

            result = bgActivityUserInfoService.kshList(params);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    // 考场人员列表
    @RequestMapping("/userList")
    public @ResponseBody Map<String,Object> userList(@RequestParam Map<String,Object> params,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        PageInfo<Map<String,Object>> pageInfo = null;
        List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
        String id = request.getParameter("id");
        String ksh = request.getParameter("ksh");
        if(null != id && !"".equals(id)) {
            params.put("activityId",id);
        }
        if(null != ksh && !"".equals(ksh)) {
            params.put("ksh",ksh);
        }
        if(params.get("activityId") != null){
            infos = bgActivityUserInfoService.userList(params);
            pageInfo=new PageInfo<Map<String,Object>>(infos);
            return resultMap(infos, pageInfo.getTotal(), true, "");
        }else{
            return resultMap(infos, 0L, true, "");
        }


    }

    // 生成准考证号
    @RequestMapping("/makeZkzh")
    public void makeZkzh(String activity_id,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        List<Map<String,Object>> a_infos = new ArrayList<Map<String,Object>>();
        List<Map<String,Object>> b_infos = new ArrayList<Map<String,Object>>();
        Map<String,Object> params = new HashMap<String, Object>();
        params.put("activityId", activity_id);

        //A考卷所有考生
        //params.put("kjlx", "A");
        params.put("kjlx", "一类");
        a_infos = bgActivityUserInfoService.userList(params);
        Collections.shuffle(a_infos);
        //B考卷所有考生
        //params.put("kjlx", "B");
        params.put("kjlx", "二类");
        b_infos = bgActivityUserInfoService.userList(params);
        Collections.shuffle(b_infos);
       /* String temp = "";
        String temp2 ="";
        for(int i = 0; i<a_infos.size(); i++){
        	Map<String, Object> map = a_infos.get(i);
        	
        	temp = map.get("user_id").toString();
        	for (int j = i + 1; j < a_infos.size(); j++){
        		Map<String, Object> map2 = a_infos.get(j);
       		 	temp2 = (String) map2.get("user_id").toString();
       		 	if(temp.equals(temp2)){
       			System.out.println("第" + (i + 1) + "个跟第" + (j + 1) + "个重复，值是：" + temp);
       		 }
  		 }
  	}*/
        
        BgActivityUserInfo user;

        BgActivityArgInfo bgActivityArgInfo = bgActivityArgInfoService.selectByActivityId(Integer.parseInt(activity_id));
        
        
        System.out.println(bgActivityArgInfo.getaKsUsers());
        //计算A考室需要多少个
        int a_num = a_infos.size() / bgActivityArgInfo.getaKsUsers();
        if(a_infos.size() % bgActivityArgInfo.getaKsUsers() != 0) {
            a_num += 1;
        }	
       /* int a_num=0;
        if(a_infos!=null && a_infos.size()>0){
        	a_num = a_infos.size() / bgActivityArgInfo.getaKsUsers();
        	if(a_infos.size() % bgActivityArgInfo.getbKsUsers() !=0){
        		a_num +=1;
        	}
        }*/

        //计算B考室需要多少个
        /*int b_num = b_infos.size() / bgActivityArgInfo.getbKsUsers();
        if(b_infos.size() % bgActivityArgInfo.getbKsUsers() != 0) {
            b_num += 1;
        }*/
        int b_num=0;
        if(b_infos!=null && b_infos.size()>0){
        	b_num = b_infos.size() / bgActivityArgInfo.getbKsUsers();
        	if(b_infos.size() % bgActivityArgInfo.getbKsUsers() !=0){
        		b_num +=1;
        	}
        }
        
        
        
        
        for(int a = 1; a <= a_num; a++) {
            for(int m = 0; m < bgActivityArgInfo.getaKsUsers(); m++) {
            	
            	
                if((a-1)*bgActivityArgInfo.getaKsUsers() + m < a_infos.size()) {
                    user = new BgActivityUserInfo();
                    user.setId(Integer.parseInt(a_infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m).get("id").toString()));

                    //考试号固定三位
                    if((a+"").length() == 1) {
                        user.setKsh("00"+a);
                    } else if((a+"").length() == 2) {
                        user.setKsh("0"+a);
                    } else {
                        user.setKsh(""+a);
                    }
                    //座位号固定2位
                    if(((m+1)+"").length() == 1) {
                        user.setZwh("0" + (m+1));
                    } else {
                        user.setZwh("" + (m+1));
                    }
                    //准考证号
                    user.setZkzh(bgActivityArgInfo.getZkzTop()+a_infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m).get("pno").toString().substring(0, 3)+a_infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m).get("gwdm")
                            +user.getKsh()+user.getZwh());

                    bgActivityUserInfoService.updateByPrimaryKeySelective(user);
                } else {
                    break;
                }

            }
        }

        for(int b = 1; b <= b_num; b++) {
            for(int m = 0; m < bgActivityArgInfo.getbKsUsers(); m++) {

                if((b-1)*bgActivityArgInfo.getbKsUsers() + m < b_infos.size()) {
                    user = new BgActivityUserInfo();
                    user.setId(Integer.parseInt(b_infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m).get("id").toString()));

                    //考试号固定三位
                    if(((a_num+b)+"").length() == 1) {
                        user.setKsh("00"+(a_num+b));
                    } else if(((a_num+b)+"").length() == 2) {
                        user.setKsh("0"+(a_num+b));
                    } else {
                        user.setKsh(""+(a_num+b));
                    }
                    //座位号固定2位
                    if(((m+1)+"").length() == 1) {
                        user.setZwh("0" + (m+1));
                    } else {
                        user.setZwh("" + (m+1));
                    }
                    //准考证号
                    user.setZkzh(bgActivityArgInfo.getZkzTop()+b_infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m).get("pno").toString().substring(0, 3)+b_infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m).get("gwdm")
                            +user.getKsh()+user.getZwh());

                    bgActivityUserInfoService.updateByPrimaryKeySelective(user);
                } else {
                    break;
                }

            }
        }

        write(response, 1);



        /**

		int count = infos.size();

		int a_count = (count / 2);


		int b_count = count - a_count;


		int a_num = a_count / bgActivityArgInfo.getaKsUsers();

		if(a_count % bgActivityArgInfo.getaKsUsers() != 0) {
			a_num += 1;
		}

		int b_num = b_count / bgActivityArgInfo.getbKsUsers();

		if(b_count % bgActivityArgInfo.getbKsUsers() != 0) {
			b_num += 1;
		}

		System.out.println("A考室："+a_num +",a总人数:" + a_count);
		System.out.println("B考室："+b_num +",b总人数:" + b_count);

			for(int a = 1; a <= a_num; a++) {
				for(int m = 1; m <= bgActivityArgInfo.getaKsUsers(); m++) {

					if((a-1)*bgActivityArgInfo.getaKsUsers() + m - 1 <= a_count -1){
						System.out.println("a:" + ((a-1)*bgActivityArgInfo.getaKsUsers() + m - 1));
						user = new BgActivityUserInfo();
						user.setId(Integer.parseInt(infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m - 1).get("id").toString()));
						//考试号固定三位
						if((a+"").length() == 1) {
							user.setKsh("00"+a);
						} else if((a+"").length() == 2) {
							user.setKsh("0"+a);
						} else {
							user.setKsh(""+a);
						}
						//座位号固定2位
						if((m+"").length() == 1) {
							user.setZwh("0" + m);
						} else {
							user.setZwh("" + m);
						}
						//准考证号
						user.setZkzh(bgActivityArgInfo.getZkzTop()+infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m - 1).get("code")+infos.get((a-1)*bgActivityArgInfo.getaKsUsers() + m - 1).get("gwdm")
								+user.getKsh()+user.getZwh());
						bgActivityUserInfoService.updateByPrimaryKeySelective(user);

					}

			}
		}
			for(int b = 1; b <= b_num; b++) {
				for(int m = 1; m <= bgActivityArgInfo.getbKsUsers(); m++) {

					if((b-1)*bgActivityArgInfo.getbKsUsers() + m + a_count - 1<= count-1) {
						System.out.println("b:" + ((b-1)*bgActivityArgInfo.getbKsUsers() + m+a_count -1));
						user = new BgActivityUserInfo();
						user.setId(Integer.parseInt(infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m+a_count - 1).get("id").toString()));
						//考试号固定三位
						if(((a_num+b)+"").length() == 1) {
							user.setKsh("00"+(a_num+b));
						} else if((b+"").length() == 2) {
							user.setKsh("0"+(a_num+b));
						} else {
							user.setKsh(""+(a_num+b));
						}
						//座位号固定2位
						if((m+"").length() == 1) {
							user.setZwh("0" + m);
						} else {
							user.setZwh("" + m);
						}
						//准考证号
						user.setZkzh(bgActivityArgInfo.getZkzTop()+infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m+a_count- 1).get("code")+infos.get((b-1)*bgActivityArgInfo.getbKsUsers() + m+a_count-1).get("gwdm")
								+user.getKsh()+user.getZwh());
						bgActivityUserInfoService.updateByPrimaryKeySelective(user);
					}


			}
		}
         **/
    }

    /**导出
     * @param response
     * @param request
     */
    @RequestMapping("/faildExport")
    @ResponseBody
    public void faildExport(HttpServletResponse response,HttpServletRequest request){
        String activity_id = request.getParameter("activity_id");
        String export_state = request.getParameter("export_state");
        String cs_param = request.getParameter("cs_param");
        Map<String,Object> param = new HashMap<String, Object>();
        param.put("activity_id", activity_id);
        param.put("export_state", export_state);
        param.put("cs_param", cs_param);
        try {
            List<Map<String, Object>> result = bgActivityUserInfoService.queryShFailedList(param);

            if(null != result && result.size() > 0) {
                List<FaildExportVo> da= new ArrayList<FaildExportVo>();
                ExcelExport<FaildExportVo> ex = new ExcelExport<FaildExportVo>();
                for(int i = 0; i < result.size(); i++) {
                    FaildExportVo user = new FaildExportVo();

                    user.setHdmc(result.get(i).get("hdmc").toString());
                    user.setSfzh(result.get(i).get("sfzh").toString());
                    user.setXm(result.get(i).get("xm").toString());
                    if(null != result.get(i).get("ddh")) {
                        user.setDdh(result.get(i).get("ddh").toString());
                    }
                    if(null != result.get(i).get("fkjyh")) {
                        user.setFkjyh(result.get(i).get("fkjyh").toString());
                    }

                    if(null != result.get(i).get("fksj")) {
                        user.setFksj(result.get(i).get("fksj").toString());
                    }

                    if(null != result.get(i).get("m")) {
                        user.setTkje(result.get(i).get("m").toString());
                    }

                    if(null != result.get(i).get("shyj")) {
                        user.setTksm(result.get(i).get("shyj").toString());
                    }
                    user.setDfzh("");
                    user.setDfxm(result.get(i).get("xm").toString());



                    da.add(user);

                    BgActivityUserInfo auser = new BgActivityUserInfo();
                    auser.setId(Integer.parseInt(result.get(i).get("id").toString()));
                    auser.setExportState("已导出");

                    bgActivityUserInfoService.updateByPrimaryKeySelective(auser);
                }

                List resultList=new ArrayList();
                resultList.add(da);

                String fileName = "审核失败名单导出.xls";
                OutputStream output =ResultConstant.outputStream(request, response, fileName);
                List<String> titleList=new ArrayList<String>();
                titleList.add("审核失败名单");
                String syDelTitle="";

                Map<String,Object>title=new HashMap<String, Object>();
                title.put("1", syDelTitle);


                ex.exportExcel2(titleList, resultList, title,output);
            } else {

            }

        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // 获取信息
    @RequestMapping("/query")
    public void query(HttpServletResponse response,
            HttpServletRequest hr) throws IOException {
        String id = hr.getParameter("id");
        BgActivityUserInfo result;
        result = bgActivityUserInfoService.selectByPrimaryKey(Integer.parseInt(id));
        JSONObject json = new JSONObject();
        json = JSONObject.fromObject(result);
        write(response,json);
    }

    /**
     * 查询活动列表 公司
     * 
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/enterpriseList")
    public @ResponseBody
    List<Map<String, Object>> enterpriseList(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {

        List<Map<String, Object>> result = null;
        try {

            Object enterpriseIdlist = request.getSession().getAttribute("enterpriseIdlist");

            if (enterpriseIdlist != null) {

                params.put("list", enterpriseIdlist);

            }

            result = bgActivityUserInfoService.activityenterpriseList(params);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    /**
     * 查询活动列表 公司
     * 
     * @param request
     * @param response
     * @return
     */
    @RequestMapping("/placeList")
    public @ResponseBody
    List<Map<String, Object>> placeList(@RequestParam Map<String, Object> params, HttpServletRequest request, HttpServletResponse response) {

        List<Map<String, Object>> result = null;
        try {

            Integer enterprise_id = TextUtil.getInt(params.get("enterprise_id"));

            result = bgActivityUserInfoService.activityenterpriseplaceList(enterprise_id);

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
