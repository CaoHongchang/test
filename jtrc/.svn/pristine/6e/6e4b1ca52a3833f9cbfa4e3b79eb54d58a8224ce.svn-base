package com.i84.earnpoint.sydwzp.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.util.Date;
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
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.BgActivityEnterprise;
import com.i84.earnpoint.model.BgActivityInfo;
import com.i84.earnpoint.model.BgEnterprisePlaceInfo;
import com.i84.earnpoint.model.ImportPostInfo;
import com.i84.earnpoint.model.ImportUserInfo;
import com.i84.earnpoint.model.PlaceInfo;
import com.i84.earnpoint.sydwzp.service.BgActivityEnterpriseService;
import com.i84.earnpoint.sydwzp.service.BgActivityInfoService;
import com.i84.earnpoint.sydwzp.service.BgEnterprisePlaceInfoService;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author linyj
 *
 */
@Controller
@RequestMapping("/bgEnterprisePlaceInfo")
public class BgEnterprisePlaceInfoController extends ResultConstant{
	@Autowired
	private BgEnterprisePlaceInfoService bgEnterprisePlaceInfoService;
	@Autowired
	private BgActivityEnterpriseService bgActivityEnterpriseService;
	
	@Autowired
	private BgActivityInfoService bgActivityInfoService;
	/**
	 * 获取已选岗位列表
	 */
	@RequestMapping("/selectedPlaceList")
	public @ResponseBody Map<String,Object> selectedPlaceList(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response) throws IOException {
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		
		List<Map<String,Object>> list=bgEnterprisePlaceInfoService.querySelected(params);
		
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageInfo.getTotal(), true, "");
		
	}
	
	 // 编辑活动
	@RequestMapping("/query")
	public void query(Integer id, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		BgEnterprisePlaceInfo result;
		result = bgEnterprisePlaceInfoService.selectByPrimaryKey(id);
		JSONObject json = new JSONObject();
		json = JSONObject.fromObject(result);
		write(response,json);
	}
	
	 // 编辑活动
		@RequestMapping("/checkByPlaceId")
		public void checkByPlaceId(Integer id, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			
			BgEnterprisePlaceInfo result;
			result = bgEnterprisePlaceInfoService.checkByPlaceId(id);
			
			JSONObject json = new JSONObject();
			json = JSONObject.fromObject(result);
			write(response,json);
		}
	
	@RequestMapping("/bmbquery")
	public void bmbquery(Integer id, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		Map<String, Object> result;
		result = bgEnterprisePlaceInfoService.selectByPrimaryKey2(id);
		JSONObject json = new JSONObject();
		json = JSONObject.fromObject(result);
		System.out.println(json);
		write(response,json);
	}
	
	/**
	 * 获取待选岗位列表
	 */
	@RequestMapping("/unSelectedPlaceList")
	public @ResponseBody Map<String,Object> unSelectedPlaceList(@RequestParam Map<String,Object> params,HttpServletRequest request,HttpServletResponse response) throws IOException {
		int page=TextUtil.getInt(params.get("page"));
		int rows=TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		
		List<Map<String,Object>> list=bgEnterprisePlaceInfoService.queryUnSelected(params);
		
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageInfo.getTotal(), true, "");
		
	}
	
    // 添加岗位
	@RequestMapping("/add")
	public void add(BgEnterprisePlaceInfo bgEnterprisePlaceInfo, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		String result = "";
		String aei = hr.getParameter("aei");
		String pid = hr.getParameter("pid");
		System.out.println(aei);
		System.out.println(pid);
		if(null != aei && !"".equals(aei)) {
			bgEnterprisePlaceInfo.setActivityEnterpriseId(Integer.parseInt(aei));
		}
		if(null != pid && !"".equals(pid)) {
			bgEnterprisePlaceInfo.setPlaceId(Integer.parseInt(pid));
		}
		/**
		BgEnterprisePlaceInfo bgEnterprisePlaceInfo = new BgEnterprisePlaceInfo();
		String aei = hr.getParameter("aei");
		String pid = hr.getParameter("pid");
		String num = hr.getParameter("num");
		String age = hr.getParameter("age");
		String gender = hr.getParameter("gender");
		String nation = hr.getParameter("nation");
		String zzmm = hr.getParameter("zzmm");
		String whcd = hr.getParameter("whcd");
		String school = hr.getParameter("school");
		String xllxyq = hr.getParameter("xllxyq");
		String zyyq = hr.getParameter("zyyq");
		String sjlx = hr.getParameter("sjlx");
		String ksmc = hr.getParameter("ksmc");
		String ksdd = hr.getParameter("ksdd");
		String kskm = hr.getParameter("kskm");
		String sfkk = hr.getParameter("sfkk");
		String qtyq = hr.getParameter("qtyq");
		String bz = hr.getParameter("bz");
		
		if(null != aei && !"".equals(aei)) {
			bgEnterprisePlaceInfo.setActivityEnterpriseId(Integer.parseInt(aei));
		}
		if(null != pid && !"".equals(pid)) {
			bgEnterprisePlaceInfo.setPlaceId(Integer.parseInt(pid));
		}
		if(null != num && !"".equals(num)) {
			bgEnterprisePlaceInfo.setRecruitmentNum(Integer.parseInt(num));
		}
		if(null != age && !"".equals(age)) {
			bgEnterprisePlaceInfo.setAgeRange(age);
		}
		if(null != gender && !"".equals(gender)) {
			bgEnterprisePlaceInfo.setGenderRange(gender);
		}
		if(null != nation && !"".equals(nation)) {
			bgEnterprisePlaceInfo.setNationRange(nation);
		}
		if(null != zzmm && !"".equals(zzmm)) {
			bgEnterprisePlaceInfo.setPoliticalStatusRange(zzmm);
		}
		if(null != whcd && !"".equals(whcd)) {
			bgEnterprisePlaceInfo.setEducationRange(whcd);
		}
		if(null != school && !"".equals(school)) {
			bgEnterprisePlaceInfo.setSchoolRange(school);
		}
		if(null != xllxyq && !"".equals(xllxyq)) {
			bgEnterprisePlaceInfo.setEducationTypeRange(xllxyq);
		}
		if(null != zyyq && !"".equals(zyyq)) {
			bgEnterprisePlaceInfo.setProfessionRange(zyyq);
		}
		if(null != sjlx && !"".equals(sjlx)) {
			bgEnterprisePlaceInfo.setPaperStyle(sjlx);
		}
		if(null != ksmc && !"".equals(ksmc)) {
			bgEnterprisePlaceInfo.setExaminationName(ksmc);
		}
		if(null != ksdd && !"".equals(ksdd)) {
			bgEnterprisePlaceInfo.setExaminationPlace(ksdd);
		}
		if(null != kskm && !"".equals(kskm)) {
			bgEnterprisePlaceInfo.setExaminationSubject(kskm);
		}
		if(null != sfkk && !"".equals(sfkk)) {
			bgEnterprisePlaceInfo.setIsStart(sfkk);
		}
		if(null != qtyq && !"".equals(qtyq)) {
			bgEnterprisePlaceInfo.setOthersRange(qtyq);
		}
		if(null != bz && !"".equals(bz)) {
			bgEnterprisePlaceInfo.setRemark(bz);
		}
		**/
		try {
			int id = bgEnterprisePlaceInfoService.insertSelective(bgEnterprisePlaceInfo);
			result = id+"";
		} catch (Exception e) {
			e.printStackTrace();
			result = "添加新岗位异常!";
		}
		write(response,result);
	}
	
    // 编辑岗位
	@RequestMapping("/edit")
	public void edit(BgEnterprisePlaceInfo bgEnterprisePlaceInfo, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		String result = "";
		try {
			int id = bgEnterprisePlaceInfoService.updateByPrimaryKeySelective(bgEnterprisePlaceInfo);
			result = id+"";
		} catch (Exception e) {
			e.printStackTrace();
			result = "编辑岗位异常!";
		}
		write(response,result);
	}
	
	 // 编辑岗位
		@RequestMapping("/gwbjEdit")
		public void gwbjEdit(BgEnterprisePlaceInfo bgEnterprisePlaceInfo, HttpServletResponse response,
				HttpServletRequest hr) throws IOException {
			String result = "";
			try {
				int id = bgEnterprisePlaceInfoService.updateByPlaceId(bgEnterprisePlaceInfo);
				result = id+"";
			} catch (Exception e) {
				e.printStackTrace();
				result = "编辑岗位异常!";
			}
			write(response,result);
		}
	
    // 删除岗位
	@RequestMapping("/del")
	public void del(Integer id, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		String result = "";
		try {
			int num = bgEnterprisePlaceInfoService.deleteByPrimaryKey(id);
			result = num+"";
		} catch (Exception e) {
			e.printStackTrace();
			result = "删除岗位异常!";
		}
		write(response,result);
	}
	
    // 判断编辑岗位时招考活动报名是否已经开始
	@RequestMapping("/checkActivityBeginTime")
	public void checkActivityBeginTime(String id, HttpServletResponse response,
			HttpServletRequest hr) throws IOException {
		String result = "";
		try {
			Map  map = new HashMap<String, Object>();
			map.put("id", Integer.valueOf(id));
			Map  resultMap = new HashMap<String, Object>();
			resultMap = bgEnterprisePlaceInfoService.checkActivityBeginTime(map);
			Date beginTime = (Date) resultMap.get("start_date");
			if(beginTime.getTime()>new Date().getTime()){
				result = 1+"";
			}
		} catch (Exception e) {
			e.printStackTrace();
			result = "编辑岗位异常!";
		}
		write(response,result);
	}
	
	
	 @RequestMapping("/importUserInfo")
	    public void importUserInfo(@RequestParam("importFile") CommonsMultipartFile uploadExcel,
	            HttpServletRequest request, HttpServletResponse response)
	                    throws Exception {
	        JSONObject resObject = new JSONObject();
	        JSONArray array = new JSONArray();
	        try {
	            DiskFileItem fi = (DiskFileItem)uploadExcel.getFileItem();
	            File f = fi.getStoreLocation();/**/
	            ImportExcel<ImportPostInfo> excelUtil = new ImportExcel<ImportPostInfo>(ImportPostInfo.class);
	            List<ImportPostInfo> results = (List<ImportPostInfo>) excelUtil.importExcel(f);
	            //	System.out.println(excelUtil.isTitle(f).size());
	            if(excelUtil.isTitle(f).size()<0){
	                resObject.put("flag", "1");
	                resObject.put("errorMsg", "导入模板文件错误！");
	                response.getWriter().write(resObject.toString());
	                response.getWriter().flush();
	                return;
	            }
	            for (ImportPostInfo tempVo : results) {
	                String acName = tempVo.getAcName();
	               String code = tempVo.getCode();
	                String postCode = tempVo.getPostCode();
	                String postName = tempVo.getPostName();
	               String examinationName = tempVo.getExaminationName();
	               String examinationPlace = tempVo.getExaminationPlace();
	               String recruitmentNum = tempVo.getRecruitmentNum();
	               String examinationSubject = tempVo.getExaminationSubject();
	               
	                String errM="";
	                if ("".equals(acName)||acName==null) {
	                    errM += "招聘活动名称不能为空;\r\n";
	                    //					resObject.put("flag", "1");
	                    //					resObject.put("errorMsg",errM);
	                    //					ResultConstant.write(response, resObject);
	                    //					return;
	                }

	                if (code == null || "".equals(code)) {
	                    errM += "组织机构代码不能为空;\r\n";
	                }
	                if (postCode == null || "".equals(postCode)) {
	                    errM += "岗位代码不能为空;\r\n";
	                }
	                
	                if (postName == null || "".equals(postName)) {
	                    errM += "岗位名称不能为空;\r\n";
	                }
	                if (examinationName == null || "".equals(examinationName)) {
	                    errM += "考试名称不能为空;\r\n";
	                }
	                if (examinationPlace == null || "".equals(examinationPlace)) {
	                    errM += "考试地点不能为空;\r\n";
	                }
	                if (recruitmentNum == null || "".equals(recruitmentNum)) {
	                    errM += "招考人数不能为空;\r\n";
	                }
	                
	                
	                if (examinationSubject == null || "".equals(examinationSubject)) {
	                    errM += "考试科目不能为空;\r\n";
	                }
	                
	                

	                
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
	 
	 //岗位信息导入
	 @RequestMapping("/saveImportPostInfo")
	   //public void saveImportUserInfos2(@RequestBody List<ImportUserInfo> list,HttpServletRequest request,HttpServletResponse response)throws Exception{
	   public void saveImportPostInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{ 	
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
    			String  acName = (String) jsonOne.get("acName");
    			String  cCode = (String) jsonOne.get("code");
    			String  postCode = (String) jsonOne.get("postCode");
    			String  postName = (String) jsonOne.get("postName");
    			String  recruitmentNum = (String) jsonOne.get("recruitmentNum");
    			String  ageRange = (String) jsonOne.get("ageRange");
    			String  genderRange = (String) jsonOne.get("genderRange");
    			String  nationRange = (String) jsonOne.get("nationRange");
    			String  politicalStatusRange = (String) jsonOne.get("politicalStatusRange");
    			String  educationRange = (String) jsonOne.get("educationRange");
    			String  schoolRange = (String) jsonOne.get("schoolRange");
    			String  educationTypeRange = (String) jsonOne.get("educationTypeRange");
    			String  professionRange = (String) jsonOne.get("professionRange");
    			String  paperStyle = (String) jsonOne.get("paperStyle");
    			String  examinationName = (String) jsonOne.get("examinationName");
    			String  examinationPlace = (String) jsonOne.get("examinationPlace");
    			String  examinationSubject = (String) jsonOne.get("examinationSubject");
    			String  isStart = (String) jsonOne.get("isStart");
    			String  othersRange = (String) jsonOne.get("othersRange");
    			String  remark = (String) jsonOne.get("remark");
    			String  errMsg = (String) jsonOne.get("errMsg");
    			/**=========================================*/
    			BgActivityInfo bi = bgActivityInfoService.queryByPno(acName);
    			if(bi==null){
    				object.put("flag", false);
    				object.put("msg", "招聘活动名称错误，请检查导入文件!");
    				response.getWriter().write(object.toString());
     	            response.getWriter().flush();
     				return;
    			}
    			/**=========================================*/
    			 PlaceInfo pi =new PlaceInfo();
    			 pi.setPno(postCode);
    			 pi.setName(postName);
    			 pi.setAcId(bi.getId());
    			 pi = bgEnterprisePlaceInfoService.selectByPnoId(pi);
    			 if(pi==null){
    				object.put("flag", false);
     				object.put("msg", "岗位信息不一致，请检查导入文件!");
     				response.getWriter().write(object.toString());
     	            response.getWriter().flush();
     				return;
    			 }
    			 
    			 /**=========================================*/
    			 Map<String,Object> param = new HashMap<String,Object>();
    			 param.put("cCode", cCode);
    			 param.put("activityId", bi.getId());
    			
    			 Map<String, Object> selectByCode = bgActivityEnterpriseService.selectByCode(param);
    			 Integer id = (Integer) selectByCode.get("id");
    			 /**=========================================*/
    			 BgEnterprisePlaceInfo checkByPlaceId = bgEnterprisePlaceInfoService.checkByPlaceId(pi.getId());
    			 if(checkByPlaceId!=null){
    				 checkByPlaceId.setPlaceId(pi.getId());
    				 checkByPlaceId.setActivityEnterpriseId(id);
    				 checkByPlaceId.setRecruitmentNum(Integer.parseInt(recruitmentNum));
        			 checkByPlaceId.setAgeRange(ageRange);
        			 checkByPlaceId.setGenderRange(genderRange);
        			 checkByPlaceId.setNationRange(nationRange);
        			 checkByPlaceId.setPoliticalStatusRange(politicalStatusRange);
        			 checkByPlaceId.setEducationRange(educationRange);
        			 checkByPlaceId.setSchoolRange(schoolRange);
        			 checkByPlaceId.setEducationTypeRange(educationTypeRange);
        			 checkByPlaceId.setProfessionRange(professionRange);
        			 checkByPlaceId.setPaperStyle(paperStyle);
        			 checkByPlaceId.setExaminationName(examinationName);
        			 checkByPlaceId.setExaminationPlace(examinationPlace);
        			 checkByPlaceId.setExaminationSubject(examinationSubject);
        			 checkByPlaceId.setIsStart(isStart);
        			 checkByPlaceId.setOthersRange(othersRange);
        			 checkByPlaceId.setRemark(remark);
        			 count+=bgEnterprisePlaceInfoService.updateByPrimaryKeySelective(checkByPlaceId);
    			 }else{
    				 BgEnterprisePlaceInfo bpf = new BgEnterprisePlaceInfo();
    				 bpf.setPlaceId(pi.getId());
    				 bpf.setActivityEnterpriseId(id);
    				 bpf.setRecruitmentNum(Integer.parseInt(recruitmentNum));
    				 bpf.setAgeRange(ageRange);
    				 bpf.setGenderRange(genderRange);
    				 bpf.setNationRange(nationRange);
    				 bpf.setPoliticalStatusRange(politicalStatusRange);
    				 bpf.setEducationRange(educationRange);
    				 bpf.setSchoolRange(schoolRange);
    				 bpf.setEducationTypeRange(educationTypeRange);
    				 bpf.setProfessionRange(professionRange);
    				 bpf.setPaperStyle(paperStyle);
    				 bpf.setExaminationName(examinationName);
    				 bpf.setExaminationPlace(examinationPlace);
    				 bpf.setExaminationSubject(examinationSubject);
    				 bpf.setIsStart(isStart);
    				 bpf.setOthersRange(othersRange);
    				 bpf.setRemark(remark);
        			 count+= bgEnterprisePlaceInfoService.insertSelective(bpf);
    			 }
    			 
    		}
    		JSONObject obj=new JSONObject();
            if(count>0){
                obj.put("flag", true);
                obj.put("msg","导入岗位信息成功！" );
            }else{
                obj.put("flag", false);
                obj.put("msg", "导入岗位信息失败!");
            }
            response.getWriter().write(obj.toString());
            response.getWriter().flush();
    	}else{
    		object.put("flag", true);
            object.put("msg","导入岗位信息为空！" );
            response.getWriter().write(object.toString());
            response.getWriter().flush();
    	}
		 
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
	        String path = request.getSession().getServletContext().getRealPath("templates/post_info.xlsx");

	        // 从请求参数获取附件ID并查询附件信息
	        try{
	            InputStream is = new BufferedInputStream(new FileInputStream(path));

	            byte[] buf = new byte[is.available()];
	            is.read(buf);
	            is.close();
	            // 设置响应类型为
	            response.reset();


	            response.setHeader("Content-Disposition","attachment; "+encodeFilename2(request, "岗位信息导入模板.xlsx"));
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
	
}
