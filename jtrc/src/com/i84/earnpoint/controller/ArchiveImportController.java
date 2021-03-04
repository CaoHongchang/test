package com.i84.earnpoint.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.disk.DiskFileItem;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.ImportUserInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.service.UserInfoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
/**
 * 档案导入
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/archive")
public class ArchiveImportController extends ResultConstant{
    @Autowired
    private UserInfoService userInfoService;


    @RequestMapping("/importUserInfo")
    public void importUserInfo(@RequestParam("importFile") CommonsMultipartFile uploadExcel,
            HttpServletRequest request, HttpServletResponse response)
                    throws Exception {
        JSONObject resObject = new JSONObject();
        JSONArray array = new JSONArray();
        try {
            DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem();
            File f = fi.getStoreLocation();/**/
            ImportExcel<ImportUserInfo> excelUtil = new ImportExcel<ImportUserInfo>(ImportUserInfo.class);
            List<ImportUserInfo> results = (List<ImportUserInfo>) excelUtil.importExcel(f);
            //	System.out.println(excelUtil.isTitle(f).size());
            if(excelUtil.isTitle(f).size()<0){
                resObject.put("flag", "1");
                resObject.put("errorMsg", "导入模板文件错误！");
                response.getWriter().write(resObject.toString());
                response.getWriter().flush();
                return;
            }
            for (ImportUserInfo tempVo : results) {
                String pnum = tempVo.getPnum();
                String birthDate=tempVo.getBirthDate();
                String graduationTime=tempVo.getGraduationTime();
                String ZDate=tempVo.getZDate();
                String dpno = tempVo.getDpno();
                String errM="";
                if ("".equals(tempVo.getName())||tempVo.getName()==null) {
                    errM += "用户名称不能为空;\r\n";
                    //					resObject.put("flag", "1");
                    //					resObject.put("errorMsg",errM);
                    //					ResultConstant.write(response, resObject);
                    //					return;
                }

                if (dpno == null || "".equals(dpno)) {
                    errM += "档案号不能为空;\r\n";
                }

                /*				if ("".equals(tempVo.getSchool())||tempVo.getSchool()==null) {
                					errM += "毕业院校不能为空;\r\n";
                //					resObject.put("flag", "1");
                //					resObject.put("errorMsg",errM);
                //					ResultConstant.write(response, resObject);
                //					return;
                				}
                				if ("".equals(tempVo.getMajor())||tempVo.getMajor()==null) {
                					errM += "专业不能为空;\r\n";
                //					resObject.put("flag", "1");
                //					resObject.put("errorMsg",errM);
                //					ResultConstant.write(response, resObject);
                //					return;
                				}
                				if ("".equals(graduationTime)||graduationTime==null) {
                					errM += "毕业时间不能为空;\r\n";
                //					resObject.put("flag", "1");
                //					resObject.put("errorMsg",errM);
                //					ResultConstant.write(response, resObject);
                //					return;
                				}
                				if ("".equals(pnum)||pnum==null) {
                					errM += "身份证不能为空;\r\n";
                //					resObject.put("flag", "1");
                //					resObject.put("errorMsg",errM);
                //					ResultConstant.write(response, resObject);
                //					return;
                				}else{
                					if (!Pattern.matches("^\\d{15}(\\d{2}[A-Za-z0-9])?$", pnum)) {
                						errM += "身份证必须为15或18位;\r\n";
                //						resObject.put("flag", "1");
                //						resObject.put("errorMsg",errM);
                //						ResultConstant.write(response, resObject);
                //						return;
                					}
                				}

                				if(birthDate!=null){
                					if (!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])$", birthDate)) {
                						errM += "出生年月格式错误，需形如YYYY-MM\r\n;";
                //						resObject.put("flag", "1");
                //						resObject.put("errorMsg",errM);
                //						ResultConstant.write(response, resObject);
                //						return;
                					}
                				}

                				if(!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])-\\d{2}$", graduationTime)){
                					errM+="毕业时间格式错误，需形如YYYY-MM-DD\r\n;";
                //					resObject.put("flag", "1");
                //					resObject.put("errorMsg",errM);
                //					ResultConstant.write(response, resObject);
                //					return;
                				}
                				if(ZDate!=null){
                					if(!Pattern.matches("^\\d{4}-(0[1-9]|1[0-2])-\\d{2}$", ZDate)){
                						errM+="转入时间格式错误，需形如YYYY-MM-DD\r\n";
                //						resObject.put("flag", "1");
                //						resObject.put("errorMsg",errM);
                //						ResultConstant.write(response, resObject);
                //						return;
                					}else{
                						tempVo.setZDate(ZDate);
                					}
                				}
                 */
                tempVo.setErrMsg(errM);
                if(!errM.equals("")){
                    resObject.put("errorMsg",errM);
                }
                array.add(JSONObject.fromObject(tempVo));
            }
            resObject.put("flag", "0");
            resObject.put("returnList", array);

        } catch (Exception e) {
            resObject.put("flag", "1");
            resObject.put("errorMsg", "导入失败");
        }
        ResultConstant.write(response, resObject);
    }
    /**
     * 查询用户档案信息
     * @return
     */
    @RequestMapping("/listUserInfo")
    public @ResponseBody Map<String,Object> listUserInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
        Map<String,Object> params=paramSet(request);
        UserInfo userInfo=new UserInfo();
        String pages="1";
        if(params.containsKey("page")){
            pages=String.valueOf(params.get("page"));
        }
        String archiveCode=request.getParameter("archiveCode");
        String idCode=request.getParameter("idCode");
        String searchName=request.getParameter("searchName");
        String searchSchool=request.getParameter("searchSchool");
        String searchMajor=request.getParameter("searchMajor");
        String searchGraduationTime=request.getParameter("searchGraduationTime");
        if(archiveCode!=null&&!archiveCode.trim().isEmpty()){
            userInfo.setDpno(String.valueOf("%"+archiveCode+"%"));
        }
        if(idCode!=null&&!idCode.trim().isEmpty()){
            userInfo.setPnum("%"+idCode+"%");
        }
        if(archiveCode!=null&&!archiveCode.trim().isEmpty()){
            userInfo.setDpno(String.valueOf("%"+archiveCode+"%"));
        }
        if(searchName!=null&&!searchName.trim().isEmpty()){
            userInfo.setName("%"+searchName+"%");
        }
        if(searchSchool!=null&&!searchSchool.trim().isEmpty()){
            userInfo.setSchool(String.valueOf("%"+searchSchool+"%"));
        }
        if(searchMajor!=null&&!searchMajor.trim().isEmpty()){
            userInfo.setMajor("%"+searchMajor+"%");
        }
        if(searchGraduationTime!=null&&!searchGraduationTime.trim().isEmpty()){
            userInfo.setGraduationTime(DateUtil.stringToDate(searchGraduationTime, "yyyy-MM-dd"));
        }
        PageHelper.startPage(Integer.valueOf(pages), Integer.valueOf(String.valueOf(params.get("rows"))));
        List<UserInfo> list=userInfoService.selectUserInfoBySelective(userInfo);
        PageInfo<UserInfo> pageInfo=new PageInfo<UserInfo>(list);
        return resultMap(list,pageInfo.getTotal(), true, null);
    }

    /**
     * 导出学员模板
     * @param response
     * @param request
     * @return
     * @throws IOException
     * @throws Exception
     */
    @RequestMapping("/exportModel")
    public String exportModel(HttpServletResponse response,HttpServletRequest request) throws IOException{
        String path = request.getSession().getServletContext().getRealPath("templates/userinfo_archive.xlsx");

        // 从请求参数获取附件ID并查询附件信息
        try{
            InputStream is = new BufferedInputStream(new FileInputStream(path));

            byte[] buf = new byte[is.available()];
            is.read(buf);
            is.close();
            // 设置响应类型为
            response.reset();


            response.setHeader("Content-Disposition","attachment; "+encodeFilename2(request, "用户档案.xlsx"));
            response.setContentType("application/octet-stream;charset=UTF-8");

            // 将附件内容写入输出流
            OutputStream outputStream = new BufferedOutputStream(response.getOutputStream());
            outputStream.write(buf);
            outputStream.flush();
            outputStream.close();
        }catch(Exception e){
            e.printStackTrace();
        }
        return null;
    }
    /**
     * 保存档案信息
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/saveImportUserInfos")
    public void saveImportUserInfos(HttpServletRequest request,HttpServletResponse response)throws Exception{
    	String names[]=request.getParameterValues("name");
        String pnums[]=request.getParameterValues("pnum");
        String sexs[]=request.getParameterValues("sex");
        String birthDates[]=request.getParameterValues("birthDate");
        String schools[]=request.getParameterValues("school");
        String majors[]=request.getParameterValues("major");
        String graduationTimes[]=request.getParameterValues("graduationTime");
        String dpnos[]=request.getParameterValues("dpno");
        String DStates[]=request.getParameterValues("DState");
        String ZDates[]=request.getParameterValues("ZDate");
        String errorMsgs[]=request.getParameterValues("errorMsg");
        int count=0;
        if(pnums!=null){
            for(int i=0;i<pnums.length;i++){
                UserInfo userInfo=new UserInfo();
                userInfo.setPnum(pnums[i]);
                List<UserInfo> list=userInfoService.selectUserInfoBySelective1(userInfo);
                userInfo.setName(names[i]);
                userInfo.setSex(sexs[i]);
                if(!"".equals(birthDates[i])){
                	userInfo.setBirthDate(DateUtil.stringToDate(birthDates[i], "yyyy/MM/dd"));
                }
                userInfo.setSchool(schools[i]);
                userInfo.setMajor(majors[i]);
                if(!"".equals(graduationTimes[i])){
                	userInfo.setGraduationTime(DateUtil.stringToDate(graduationTimes[i], "yyyy/MM/dd"));
                }
                userInfo.setdState(DStates[i]);
                userInfo.setDpno(dpnos[i]);
                if(!"".equals(ZDates[i])){
                	userInfo.setzDate(DateUtil.stringToDate(ZDates[i], "yyyy/MM/dd"));
                }
                userInfo.setErrMsg(errorMsgs[i]);

                //找得到就更新
                if(list.size()>0){
                    userInfo.setId(list.get(0).getId());
                    System.out.println(list.get(0).getId());
                    UserInfo uf1 = userInfoService.selectById(list.get(0).getId());

                    userInfoService.ufcheck(request, dpnos[i], uf1.getId(), uf1, userInfo);
                    if(userInfo.getPwd()==null||userInfo.getPwd()==""){
                        userInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
                    }
                    count+=userInfoService.updateUserInfo(userInfo);

                }//找不到就插入
                else{
                    userInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
                    count+=userInfoService.insertUserInfo(userInfo);
                }
            }
        }
        JSONObject object=new JSONObject();
        if(count>0){
            object.put("flag", true);
            object.put("msg","导入档案信息成功！" );
        }else{
            object.put("flag", false);
            object.put("msg", "导入档案信息失败!");
        }
        response.getWriter().write(object.toString());
        response.getWriter().flush();

    }
    
   @RequestMapping("/saveImportUserInfos2")
   //public void saveImportUserInfos2(@RequestBody List<ImportUserInfo> list,HttpServletRequest request,HttpServletResponse response)throws Exception{
   public void saveImportUserInfos2(HttpServletRequest request,HttpServletResponse response)throws Exception{ 	
	   JSONObject object=new JSONObject();
    	String date = request.getParameter("date");
    	 int count=0;
    	if(!"".equals(date) && !"null".equals(date)){
    		JSONArray json=JSONArray.fromObject(date);  
    		JSONObject jsonOne;  
    		Map<String,String> map=null;  
    		for(int i=0;i<json.size();i++){  
    			map = new HashMap<String,String>();  
    			jsonOne = json.getJSONObject(i);
    			String  name = (String) jsonOne.get("name");
    			String  pnum = (String) jsonOne.get("pnum");
    			String  sex = (String) jsonOne.get("sex");
    			String  birthDate = (String) jsonOne.get("birthDate");
    			String  school = (String) jsonOne.get("school");
    			String  major = (String) jsonOne.get("major");
    			String  graduationTime = (String) jsonOne.get("graduationTime");
    			String  dpno = (String) jsonOne.get("dpno");
    			String  DState = (String) jsonOne.get("DState");
    			String  ZDate = (String) jsonOne.get("ZDate");
    			String  errorMsg = (String) jsonOne.get("errorMsg");
    			if(pnum!=null){
    				UserInfo userInfo=new UserInfo();
    				userInfo.setPnum(pnum);
    				List<UserInfo> list=userInfoService.selectUserInfoBySelective1(userInfo);
    				userInfo.setName(name);
    				userInfo.setSex(sex);
    				
    				if(!"".equals(birthDate)){
    					userInfo.setBirthDate(DateUtil.stringToDate(birthDate, "yyyy/MM/dd"));
    				}
    				
    				userInfo.setSchool(school);
    				userInfo.setMajor(major);
    				if(!"".equals(graduationTime)){
    					userInfo.setGraduationTime(DateUtil.stringToDate(graduationTime, "yyyy/MM/dd"));
    				}
    				userInfo.setdState(DState);
    				userInfo.setDpno(dpno);
    				if(!"".equals(ZDate)){
    					userInfo.setzDate(DateUtil.stringToDate(ZDate, "yyyy/MM/dd"));
    				}
    				userInfo.setErrMsg(errorMsg);
    				
    				//找得到就更新
    				if(list.size()>0){
    					userInfo.setId(list.get(0).getId());
    					System.out.println(list.get(0).getId());
    					UserInfo uf1 = userInfoService.selectById(list.get(0).getId());
    					
    					userInfoService.ufcheck(request, dpno, uf1.getId(), uf1, userInfo);
    					if(userInfo.getPwd()==null||userInfo.getPwd()==""){
    						userInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
    					}
    					count+=userInfoService.updateUserInfo(userInfo);
    					
    				}//找不到就插入
    				else{
    					userInfo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code("000000")));
    					count+=userInfoService.insertUserInfo(userInfo);
    				}
    			}
                
    			
    			/*map.put("name", (String) jsonOne.get("name"));  
    			map.put("pnum", (String) jsonOne.get("pnum")); 
    			map.put("sex", (String) jsonOne.get("sex")); 
    			map.put("birthDate", (String) jsonOne.get("birthDate")); 
    			map.put("school", (String) jsonOne.get("school")); 
    			map.put("major", (String) jsonOne.get("major")); 
    			map.put("graduationTime", (String) jsonOne.get("graduationTime")); 
    			map.put("dpno", (String) jsonOne.get("dpno")); 
    			map.put("DState", (String) jsonOne.get("DState"));
    			map.put("ZDate", (String) jsonOne.get("ZDate"));
    			map.put("errorMsg", (String) jsonOne.get("errorMsg"));*/
    			
    		}
    		JSONObject obj=new JSONObject();
            if(count>0){
                obj.put("flag", true);
                obj.put("msg","导入档案信息成功！" );
            }else{
                obj.put("flag", false);
                obj.put("msg", "导入档案信息失败!");
            }
            response.getWriter().write(obj.toString());
            response.getWriter().flush();
    		
    	}else{
    		object.put("flag", true);
            object.put("msg","导入档案信息为空！" );
            response.getWriter().write(object.toString());
            response.getWriter().flush();
    	}
    	
    }

}
