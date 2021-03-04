package com.i84.earnpoint.sydwzp.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.BgActivityInfo;
import com.i84.earnpoint.model.BgActivityUserScoreInfo;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.PlaceInfo;
import com.i84.earnpoint.model.UserScoreExpertImportInfo;
import com.i84.earnpoint.service.EnterpriseInfoService;
import com.i84.earnpoint.service.PlaceInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityUserInfoService;
import com.i84.earnpoint.sydwzp.service.BgActivityUserScoreInfoService;

@Controller
@RequestMapping("/bgActivityUserScoreInfo")
public class BgActivityUserScoreInfoController extends ResultConstant{
	private static Logger logger = Logger.getLogger(BgActivityUserScoreInfoController.class);
    @Autowired
    private BgActivityUserScoreInfoService bgActivityUserScoreInfoService;
    @Autowired
    private BgActivityUserInfoService bgActivityUserInfoService;
    @Autowired
    private BgActivityInfoService bgActivityInfoService;
    @Autowired
    private EnterpriseInfoService enterpriseInfoService;
    @Autowired
    private PlaceInfoService placeInfoService;


    @RequestMapping("/query")
    public @ResponseBody void query(String id, HttpServletResponse response,HttpServletRequest request) throws Exception{

        BgActivityUserScoreInfo _bgStudyExperienceInfo = bgActivityUserScoreInfoService.selectByPrimaryKey(Integer.parseInt(id));
        JSONObject result=new JSONObject();
        if(null != _bgStudyExperienceInfo) {
            result = JSONObject.fromObject(_bgStudyExperienceInfo);
        } else {
            result.put("errorMsg", "获取成绩失败!");
        }
        write(response, result);

    }

    // 报考岗位列表
    @RequestMapping("/list")
    public @ResponseBody Map<String,Object> list(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response)throws Exception{
        List<Integer> list2 =new ArrayList<Integer>();
        try {
            int userId = Integer.parseInt(request.getSession().getAttribute("uid").toString());

            List<Map<String, Object>> enterpriseId = bgActivityUserInfoService.userEnterpriseId(userId);

            List<Map<String, Object>> enterpriseIds = null;
            if (null != enterpriseId.get(0).get("enterpriseId") && !"".equals(enterpriseId.get(0).get("enterpriseId").toString())) {
                enterpriseIds = bgActivityUserInfoService.userEnterpriseIds(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));
            }
            else {
                enterpriseIds = bgActivityUserInfoService.userEnterpriseAll();
            }

            for(int i = 0; i < enterpriseIds.size(); i++) {
                list2.add(Integer.parseInt(enterpriseIds.get(i).get("id").toString()));
            }
            if (null != enterpriseId.get(0).get("enterpriseId") && !"".equals(enterpriseId.get(0).get("enterpriseId").toString())) {
                list2.add(Integer.parseInt(enterpriseId.get(0).get("enterpriseId").toString()));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        params.put("list", list2);
        List<Map<String,Object>> list=bgActivityUserScoreInfoService.activityPlaceList(params);
        PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
        return resultMap(list, pageInfo.getTotal(), true, "");
    }

    // 成绩列表
    @RequestMapping("/userScoreList")
    public @ResponseBody Map<String,Object> userScoreList(@RequestParam Map<String,Object> params,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        int page=TextUtil.getInt(params.get("page"));
        int rows=TextUtil.getInt(params.get("rows"));
        PageHelper.startPage(page, rows);
        PageInfo<Map<String,Object>> pageInfo = null;
        List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
        if(params.get("activityPlaceId") != null){
            infos = bgActivityUserScoreInfoService.userScoreList(params);
            pageInfo=new PageInfo<Map<String,Object>>(infos);
            return resultMap(infos, pageInfo.getTotal(), true, "");
        }else{
            return resultMap(infos, 0L, true, "");
        }


    }

    /**
     * 导出模板
     * @param response
     * @param request
     * @return
     * @throws IOException
     * @throws Exception
     */
    @RequestMapping("/exportModel")
    public String exportModel(HttpServletResponse response,HttpServletRequest request) throws IOException{
        String name = "sydwzp_score.xlsx";
        //String path = request.getSession().getServletContext().getRealPath(name);

        // 从请求参数获取附件ID并查询附件信息
        try{
            //InputStream is = new BufferedInputStream(new FileInputStream("C:/Users/Administrator/Desktop/student.xlsx"));
            //InputStream is = new BufferedInputStream(new FileInputStream(path));
            //			ResultConstant.fileDownload(request, response, "temp/hygsgl/down", "ygdrmb.xlsx","员工导入模板.xlsx");//员工导入模板
            String finalFileName ="事业单位招聘成绩模板.xlsx";
            ResultConstant.fileDownload(request, response, "templates",name,finalFileName);//员工导入模板


            /*
			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();

			// 设置响应类型为
			response.reset();

			System.out.println("----------------" + finalFileName);
			response.setHeader("Content-Disposition","attachment; filename=\""+finalFileName+"\"");
			response.setContentType("application/octet-stream;charset=UTF-8");

			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();*/
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }

    // 成绩列表
    @RequestMapping("/makeOrder")
    public void makeOrder(String activityPlaceId,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
        List<Map<String,Object>> infos = new ArrayList<Map<String,Object>>();
        Map<String,Object> params = new HashMap<String, Object>();
        params.put("activityPlaceId", activityPlaceId);

        infos = bgActivityUserScoreInfoService.userScoreList(params);

        BgActivityUserScoreInfo user = new BgActivityUserScoreInfo();

        for(int i = 0; i < infos.size(); i++) {
            user.setId(Integer.parseInt(infos.get(i).get("id").toString()));
            String score = infos.get(i).get("score").toString();
            String order="";
            for(int j = 0; j < infos.size(); j++) {
                if(score.equals(infos.get(j).get("score").toString())) {
                    order = (j+1)+"";
                    break;
                }
            }
            user.setOrderId(order);
            bgActivityUserScoreInfoService.updateByPrimaryKeySelective(user);
        }

        write(response, 1);
    }
    
    // 删除全部成绩
    @RequestMapping("/deleteOrder")
    public void deleteOrder(String activityPlaceId,HttpServletRequest request,
            HttpServletResponse response) throws IOException {
      bgActivityUserScoreInfoService.deleteOrder(1);
       write(response, 1);
    }
    
 // 导出全部成绩
    @RequestMapping("/exportOrder")
    public void exportOrder(String activityPlaceId,HttpServletRequest request,
            HttpServletResponse response) throws Exception {
    	  Map<String,Object> params = new HashMap<String, Object>();
          params.put("activityPlaceId", activityPlaceId);
      bgActivityUserScoreInfoService.exportOrder(params,response,request);
       //write(response, 1);
    }
    
    

    /**
     * 导入文件
     * @param uploadExcel
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/importExcel")
    public @ResponseBody void importExcel(@RequestParam("uploadExcel") CommonsMultipartFile uploadExcel,
            HttpServletRequest request, HttpServletResponse response)
                    throws Exception {
        JSONObject resObject = new JSONObject();
        JSONArray array = new JSONArray();
        try {
            /*获取导入文件类型*/
            DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem();
            File f = fi.getStoreLocation();/**/
            boolean dataFlag = true;
            String tipMsg = "";//提示信息
            ImportExcel<UserScoreExpertImportInfo> excelUtil = new ImportExcel<UserScoreExpertImportInfo>(UserScoreExpertImportInfo.class);
            List<UserScoreExpertImportInfo> results = (List<UserScoreExpertImportInfo>) excelUtil.importExcel(f);
            for (int i = 0; i < results.size(); i++) { 
            	if ("".equals(results.get(i).getZkzh())) { 
            		results.remove(i); 
            	}
            }
           /* results.remove(results.size()-1);*/
            SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
            SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");

            if(results!=null && results.size()>0){
                //数量不能超过1000条
                /*if(results.size()>1000){
                    JSONObject jsonObject=new JSONObject();
                    jsonObject.put("flag", false);
                    jsonObject.put("cause", "导入的记录数最大不能超过1000条");
                    ResultConstant.write(response, jsonObject);
                    return;
                    //return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
                }*/
                List<UserScoreExpertImportInfo> resList = new ArrayList<UserScoreExpertImportInfo>();
                Map<String,String> saveMap = new HashMap<String,String>();
                for (UserScoreExpertImportInfo tempVo : results) {
                    String errMsg = "";



                    String bkhddm = tempVo.getBkhddm();
                    String dwdm = tempVo.getDwdm();
                    String gwdm = tempVo.getGwdm();
                    String sfzh = tempVo.getSfzh();//身份证号
                    String xm = tempVo.getXm();//姓名
                    String cj = tempVo.getCj();
                    String bz = tempVo.getBz();
                    String zkh = tempVo.getZkzh();

                   /* BgActivityInfo bgActivityInfo = new BgActivityInfo();
                    EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
                    PlaceInfo placeInfo = new PlaceInfo();*/
                    
                    if(StringUtils.isBlank(zkh)){
                    	 dataFlag = false;
                         errMsg = "准考号证不能为空";
                    }else{
                    	Map<String,Object> params = new HashMap<String, Object>();
                        params.put("zkh", zkh);
                        List<Map<String,Object>> checkIn4 = bgActivityUserScoreInfoService.checkIn4(params);
                        if(checkIn4!=null && checkIn4.size()>0){
                        	dataFlag = false;
                    		if(StringUtils.isBlank(errMsg)){
                    			errMsg = "该考生成绩信息已存在";
                    		}else{
                    			errMsg += ",该考生成绩信息已存在";
                    		}
                        }else{
                        	Map<String,Object> params2 = new HashMap<String, Object>();
                            params2.put("zkzh", zkh);
                        	List<Map<String,Object>> userListByzkz = bgActivityUserInfoService.userListByzkz(params2);
                        	if(userListByzkz!=null && userListByzkz.size()>0){
                        		for (Map<String, Object> map : userListByzkz) {
                        			tempVo.setBkhddm(map.get("bkhddm").toString());
                        			tempVo.setDwdm(map.get("dwdm").toString());
                        			tempVo.setGwdm(map.get("gwdm").toString());
                        			tempVo.setSfzh(map.get("sfzh").toString());
                        			tempVo.setUserId(Integer.parseInt(map.get("user_id").toString()));
                        			tempVo.setBgEnterprisePlaceId(Integer.parseInt(map.get("bg_enterprise_place_id").toString()));
                        			tempVo.setActivityUserId(Integer.parseInt(map.get("id").toString()));
                        		}
                        	}else{
                        		dataFlag = false;
                        		if(StringUtils.isBlank(errMsg)){
                        			errMsg = "准考证号错误";
                        		}else{
                        			errMsg += ",准考证号错误";
                        		}
                        	}
                        }
                    }
                    
                    /*if(StringUtils.isBlank(bkhddm)){
                        dataFlag = false;
                        errMsg = "报考活动代码不能为空";
                    } else {
                        try {
                            bgActivityInfo =bgActivityInfoService.queryByPno(bkhddm);
                            if(null != bgActivityInfo) {
                                tempVo.setBkhddm(bgActivityInfo.getPname());
                            } else {
                                if(StringUtils.isBlank(errMsg)){
                                    errMsg = "报考活动代码错误";
                                }else{
                                    errMsg += ",报考活动代码错误";
                                }
                            }
                        } catch (Exception e) {
                            if(StringUtils.isBlank(errMsg)){
                                errMsg = "报考活动代码错误";
                            }else{
                                errMsg += ",报考活动代码错误";
                            }
                        }

                    }*/


                    /*if(StringUtils.isNotBlank(sfzh)){
                        if(sfzh.length() > 18 || sfzh.length() < 15){
                            dataFlag = false;
                            if(StringUtils.isBlank(errMsg)){
                                errMsg = "身份证号必须是15到18位数字";
                            }else{
                                errMsg += ",身份证号必须是15到18位数字";
                            }
                        }
                    }else{
                        dataFlag = false;
                        if(StringUtils.isBlank(errMsg)){
                            errMsg = "身份证号不能为空";
                        }else{
                            errMsg += ",身份证号不能为空";
                        }
                    }*/


                    /*if(StringUtils.isBlank(dwdm)){
                        dataFlag = false;
                        if(StringUtils.isBlank(errMsg)){
                            errMsg = "单位代码不能为空";
                        }else{
                            errMsg += ",单位代码不能为空";
                        }
                    } else {
                        try {
                            EnterpriseInfo ei = new EnterpriseInfo();
                            ei.setPno(dwdm);
                            enterpriseInfo = enterpriseInfoService.selectEnterpriseByPno(ei);
                            if(null != enterpriseInfo) {
                                tempVo.setDwdm(enterpriseInfo.getName());
                            } else {
                                if(StringUtils.isBlank(errMsg)){
                                    errMsg = "单位代码错误";
                                }else{
                                    errMsg += ",单位代码错误";
                                }
                            }
                        } catch (Exception e) {
                            if(StringUtils.isBlank(errMsg)){
                                errMsg = "单位代码错误";
                            }else{
                                errMsg += ",单位代码错误";
                            }
                        }

                    }*/

                    /*if(StringUtils.isBlank(gwdm)){
                        dataFlag = false;
                        if(StringUtils.isBlank(errMsg)){
                            errMsg = "岗位代码不能为空";
                        }else{
                            errMsg += ",岗位代码不能为空";
                        }
                    } else {
                        try {
                            placeInfo = placeInfoService.selectPlaceInfoById(Integer.parseInt(gwdm));
                        	placeInfo.setPno(gwdm);
                        	placeInfo = placeInfoService.selectByPno(placeInfo);
                            if(null != placeInfo) {
                                tempVo.setGwdm(placeInfo.getName());
                            } else {
                                if(StringUtils.isBlank(errMsg)){
                                    errMsg = "岗位代码错误";
                                }else{
                                    errMsg += ",岗位代码错误";
                                }
                            }
                        } catch (Exception e) {
                            if(StringUtils.isBlank(errMsg)){
                                errMsg = "岗位代码错误";
                            }else{
                                errMsg += ",岗位代码错误";
                            }
                        }

                    }*/

                    if(StringUtils.isBlank(xm)){
                        dataFlag = false;
                        if(StringUtils.isBlank(errMsg)){
                            errMsg = "姓名不能为空";
                        }else{
                            errMsg += ",姓名不能为空";
                        }
                    }

                    if(StringUtils.isBlank(cj)){
                        dataFlag = false;
                        if(StringUtils.isBlank(errMsg)){
                            errMsg = "成绩不能为空";
                        }else{
                            errMsg += ",成绩不能为空";
                        }
                    } else {
                        try {
                            double cj2 = Double.parseDouble(cj);
                            if(cj2 >= 0 && cj2 <= 100) {

                            } else {
                            	dataFlag = false;
                                if(StringUtils.isBlank(errMsg)){
                                    errMsg = "导入的成绩请大于0，小于100";
                                }else{
                                    errMsg += ",导入的成绩请大于0，小于100";
                                }
                            }
                        } catch (Exception e) {
                        	dataFlag = false;
                            if(StringUtils.isBlank(errMsg)){
                                errMsg = "导入的成绩请大于0，小于100";
                            }else{
                                errMsg += ",导入的成绩请大于0，小于100";
                            }
                        }
                    }

                    //判断该记录用户是否存在
                    /*Map<String, Object> params = new HashMap<String, Object>();
                    if(errMsg.equals("")) {
                        params.put("bkhddm", bkhddm);
                        params.put("dwdm", dwdm);
                        params.put("gwdm", gwdm);
                        params.put("sfzh", sfzh);
                        try {
                            List<Map<String, Object>> list = bgActivityUserScoreInfoService.checkIn3(params);
                            if(!(list.size() > 0)) {
                                dataFlag = false;
                                errMsg = "人员信息或报考岗位信息有误";
                            } else {

                                //判断是否存在已导入的成绩
                                Map<String, Object> params2 = new HashMap<String, Object>();
                                params2.put("user_id", Integer.parseInt(list.get(0).get("user_id").toString()));
                                params2.put("activity_user_id", Integer.parseInt(list.get(0).get("id").toString()));
                                params2.put("enterprise_place_id", Integer.parseInt(list.get(0).get("bg_enterprise_place_id").toString()));
                                params2.put("sfzh", tempVo.getSfzh());
                                List<Map<String, Object>> list2 = bgActivityUserScoreInfoService.checkIn2(params2);

                                if((list2.size() > 0)) {
                                    dataFlag = false;
                                    errMsg = "该考生成绩信息已存在";
                                } else {
                                    tempVo.setUserId(Integer.parseInt(list.get(0).get("user_id").toString()));
                                    tempVo.setActivityUserId(Integer.parseInt(list.get(0).get("id").toString()));
                                    tempVo.setBgEnterprisePlaceId(Integer.parseInt(list.get(0).get("bg_enterprise_place_id").toString()));
                                }
                            }
                        } catch (Exception e) {
                            dataFlag = false;
                            errMsg = "人员信息或报考岗位信息有误";
                        }

                    }*/


                    tempVo.setErrMsg(errMsg);
                    resList.add(tempVo);
                }

                /*for(int i = 0; i < resList.size(); i++) {
                    for(int j = 0; j < resList.size(); j++) {
                        if(i != j) {
                        		if(resList.get(i).getSfzh().equals(resList.get(j).getSfzh())) {
                        			if(StringUtils.isBlank(resList.get(i).getErrMsg())){
                        				resList.get(i).setErrMsg("导入人员信息重复");
                        			}else{
                        				resList.get(i).setErrMsg(resList.get(i).getErrMsg()+",导入人员信息重复");
                        			}
                        			dataFlag = false;
                        		}
                        }
                    }
                }*/
                System.out.println("----------tipMsg--------" + tipMsg);
                //return ResultConstant.resultMap(resList, dataFlag, tipMsg);
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("rows", resList);
                jsonObject.put("flag", dataFlag);
                jsonObject.put("cause", tipMsg);
                ResultConstant.write(response, jsonObject);
                return;
            }else{
                JSONObject jsonObject=new JSONObject();
                jsonObject.put("flag", false);
                jsonObject.put("cause", "文件中未上传任何数据");
                ResultConstant.write(response, jsonObject);
                return;
                //return ResultConstant.resultMap(false,"文件中未上传任何数据");

            }
        } catch (Exception e) {
            e.printStackTrace();
            resObject.put("flag", false);
            resObject.put("errorMsg", e.getMessage());
        }
        ResultConstant.write(response, resObject);
        return;
        //return resObject;
    }

    /**添加成绩情况
     * @param response
     * @param request
     * @return
     * @throws Exception
     */
    @RequestMapping("/saveZj")
    public  @ResponseBody Map<String, Object> saveZj(@RequestBody List<UserScoreExpertImportInfo> list,HttpServletResponse response) throws Exception{
        boolean flag=false;
        String cause="";
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
        SimpleDateFormat sdfBirth = new SimpleDateFormat("yyyy-MM");
        try {
            List<BgActivityUserScoreInfo> userList = new ArrayList<BgActivityUserScoreInfo>();
            for(UserScoreExpertImportInfo userScoreExpertImportInfo:list){
                BgActivityUserScoreInfo user = new BgActivityUserScoreInfo();
                Map<String,Object> params = new HashMap<String, Object>();
                params.put("zkh", userScoreExpertImportInfo.getZkzh());
                List<Map<String,Object>> checkIn4 = bgActivityUserScoreInfoService.checkIn4(params);
                if(checkIn4!=null && checkIn4.size()>0){
                	System.out.println("准考证号："+userScoreExpertImportInfo.getZkzh()+"姓名："+userScoreExpertImportInfo.getXm()+"成绩已存在");
                }else{
                	user.setUserId(userScoreExpertImportInfo.getUserId());
                	user.setActivityUserId(userScoreExpertImportInfo.getActivityUserId());
                	user.setEnterprisePlaceId(userScoreExpertImportInfo.getBgEnterprisePlaceId());
                	user.setName(userScoreExpertImportInfo.getXm());
                	user.setCardNumber(userScoreExpertImportInfo.getSfzh());
                	user.setScore(userScoreExpertImportInfo.getCj());
                	user.setRemark(userScoreExpertImportInfo.getBz());
                	user.setZkh(userScoreExpertImportInfo.getZkzh());
                	bgActivityUserScoreInfoService.insertSelective(user);
                }
            }
            //ryglService.addExpertInfoList(userExpertInfoList, userInfoList, response);暂时
            //			classService.insertUserScoreInfo(list);
            flag=true;
        } catch (Exception e) {
            e.printStackTrace();
            flag=false;
            cause="数据上传异常";
            ResultConstant.write(response, "导入失败,请核查数据中错误提示");
            return null;
        }
        return null;
        //		return Resul  tConstant.resultMap(flag,cause);
    }

}
