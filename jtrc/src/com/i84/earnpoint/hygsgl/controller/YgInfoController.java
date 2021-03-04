package com.i84.earnpoint.hygsgl.controller;



import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;




import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.ValidatorUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.hygsgl.service.YgInfoService;
import com.i84.earnpoint.model.HyBusinessInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.YgImportVo;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;

/**
 * 员工管理
 * @author liu_quan
 *
 */

@Controller
@RequestMapping("/yggl")
public class YgInfoController {
	private Logger logger = Logger.getLogger(this.getClass().getName()); 
	@Autowired 
	private YgInfoService ygInfoService;

	/**员工下载
	 * @param response
	 * @param request
	 */
	@RequestMapping("/ygDownload")  
	@ResponseBody
	public void fileDownload(HttpServletResponse response,HttpServletRequest request){  
		try {
			ResultConstant.fileDownload(request, response, "temp/hygsgl/down", "ygdrmb.xlsx","员工导入模板.xlsx");//员工导入模板

		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	/**员工导入
	 * @param response
	 * @param request
	 * @throws Exception 
	 */
	@RequestMapping("/ygUpload")  
	public  void ygUpload(HttpServletResponse response,HttpServletRequest request) throws Exception{  
		boolean flag=false;
		String dateFlag="";
		String infoMsg="";//已存在身份证号
		String cause="";
		List<YgImportVo> yglist=null;

		try {
			String newFileName=ResultConstant.getRandNum(32)+".xlsx";
			File newFile=ResultConstant.fileupload(request, response, "temp/hygsgl/upload/",newFileName);
			if(newFile!=null){
				//读取导入的文件
				ImportExcel<YgImportVo> importExcel = new ImportExcel<YgImportVo>(YgImportVo.class);
				List<YgImportVo> results = (List<YgImportVo>) importExcel.importExcel(newFile,"0");
				if(results!=null&&results.size()>0){
					//数量不能超过1000条
					if(results.size()>1000){
						//return ResultConstant.resultMap(false, "导入的记录数最大不能超过1000条");
						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "导入的记录数最大不能超过1000条");
						ResultConstant.write(response, jsonObject);
						return;
					}
					//校验标题是否存在
					Map<String, String> lackMap=importExcel.isTitle(newFile); 
					if(lackMap!=null&&lackMap.size()>0){
						String title="";
						for(Map.Entry<String, String> m:lackMap.entrySet()){
							title+=" "+m.getValue();
						}
						//return ResultConstant.resultMap(false, "导入文件标题缺失："+title);

						JSONObject jsonObject=new JSONObject();
						jsonObject.put("flag", false);
						jsonObject.put("cause", "导入文件标题缺失："+title);
						ResultConstant.write(response, jsonObject);
						return;
					}

					Map<String,String> map1=new HashMap<String,String>();
					yglist=new ArrayList<YgImportVo>();
					int i=0;
					for (YgImportVo ygImportVo : results) {
						//System.out.println(ygImportVo.getZzjjdm() + "\t" + ygImportVo.getCsny() + "\t" + ygImportVo.getHqsj());
						i=i+1;
						//身份证、组织机构代码不能为空，
						YgImportVo vo=ygImportVo;
						String sfz=ResultConstant.replaceTrim(ygImportVo.getSfz());
						String zzjgdm=ResultConstant.replaceTrim(ygImportVo.getZzjgdm());
						String cwts="";
						if(StringUtils.isEmpty(sfz)){
							cwts+=" 身份证不能为空";
							
						}else{
							//校验身份证是否合法
							   //boolean mark =ValidatorUtil.isIDCardValid(sfz); 
							   if(sfz.length()!=15&&sfz.length()!=18){
								   cwts+=" 身份证不合法;";
							   }
							  
						}
						//查询身份证是否已经存在数据库中
						if(StringUtils.isEmpty(cwts)){
							UserInfo u=new UserInfo();
							u.setPnum(sfz);
							UserInfo u2=ygInfoService.selectYg(u);
							if(u2!=null){
								infoMsg+=sfz+";<br>";
							}
							
						}
												
						if(StringUtils.isEmpty(zzjgdm)){
							cwts+=" 组织机构代码不能为空;";
							
						}else{
							//组织机构代码导入时需要增加判断，只有组织代码存在于企业表中，且{是否签约企业}=是的时候才允许导入
							Map<String, Object>m=new HashMap<String, Object>();
							m.put("cCode", zzjgdm);
							Map<String, Object> r=ygInfoService.isCode(m);
							if(r==null){
								cwts+=" 只有组织机构代码存在于企业表中且为签约企业才允许导入;";
							}
							
						}

						//【组织机构代码】+【身份证】是否唯一
						if(vo.getCwts()==null){
							if(map1.get(sfz+zzjgdm)!=null){
								cwts+=" 组织机构代码【"+zzjgdm+"】、身份证【"+sfz+"】已存在;";  
								 
							} 
							map1.put(sfz+zzjgdm, sfz+zzjgdm);
						}

						vo.setId(i+"");
						vo.setCwts(cwts);
						if(StringUtils.isNotBlank(cwts)){
							dateFlag="true";
						}
						yglist.add(vo);
					}
					flag=true;
				}else{
					//return ResultConstant.resultMap(false,"文件中未上传任何数据");
					JSONObject jsonObject=new JSONObject();
					jsonObject.put("flag", false);
					jsonObject.put("cause", "文件中未上传任何数据");
					ResultConstant.write(response, jsonObject);
					return;
				}
			}else{
				cause="数据上传异常";
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
//		Map<String, Object> resultMap = new HashMap<String, Object>();
//    	resultMap.put("rows", yglist);
//		resultMap.put("flag", flag);
//		resultMap.put("dateFlag", dateFlag);//错误标识
//		resultMap.put("infoMsg", infoMsg);//提示信息
//		resultMap.put("cause", cause);
//		return resultMap;
		JSONObject jsonObject=new JSONObject();
		jsonObject.put("rows", yglist);
		jsonObject.put("flag", flag);
		jsonObject.put("dateFlag", dateFlag);//错误标识
		jsonObject.put("infoMsg", infoMsg);//提示信息
		jsonObject.put("cause", cause);
		ResultConstant.write(response, jsonObject);

	}

	/**添加员工
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/addYgList")  
	public  @ResponseBody Map<String, Object> addYgList(@RequestBody List<YgImportVo> ygList){
		boolean flag=false;
		String cause="";
		try {
			ygInfoService.insertYgList(ygList);
			flag=true;

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
		
	

	/** 员工列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ygView")  
	public  @ResponseBody Map<String, Object> ygView(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> ygList=null;
		try {
			
			ygList=ygInfoService.selectYgList(ResultConstant.paramSet(request));
			if(ygList!=null&&ygList.size()>0){
				for(int i=0;i<ygList.size();i++){
					Map<String,Object> map=ygList.get(i);
					//计算年龄
					Map m=ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD, map, "csny");
					SimpleDateFormat myFormatter = new SimpleDateFormat(DateUtil.OYYYY_MM_DD);
					map.put("age","");
					if(m.get("csny")!=null){
				      java.util.Date mydate = myFormatter.parse(m.get("csny").toString());
				      
				      int age=ResultConstant.getAge(mydate);
						if(map.get("xb")!=null && map.get("xb").equals("男")){
							if(age>=59 && age<=60){//男性59到60岁做蓝色标识
								map.put("color", "blue");
							}
						}
						if(map.get("xb")!=null && map.get("xb").equals("女")){
							if(age>=54 && age<=55){//女性54到55岁
								map.put("color", "FF6600");
							}
							if(age>=49 && age<=50){
								map.put("color", "red");
							}
						}
				      
					}
					//ResultConstant.mapToDate(DateUtil.YYYY$MM$, map, "csny");
					map.put("csny", ResultConstant.StringPattern(map.get("csny")==null?null:map.get("csny").toString(), DateUtil.OYYYY_MM_DD, DateUtil.YYYY$MM$));
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "cjgzsj");
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "bysj");
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "hqsj");
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "startdate");
					ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "enddate");
					
					map.put("year",1);
					if( map.get("enddate")!=null){//计算当前日期与合同结束日期是否在一年以内，在一年以内了则标识颜色
						if(DateUtil.isDateBefore(DateUtil.getNowTime(), map.get("enddate").toString()+" 00:00:00")){//当前日期是否在合同结束日期前面						
						  map.put("year",ResultConstant.yearDateDiff(DateUtil.getNow(),map.get("enddate").toString()));
						}else if(DateUtil.isDateBefore(map.get("enddate").toString()+" 00:00:00",DateUtil.getNowTime())){//当前日期不在合同日期前面则意味着，合同日期小于系统时间，则为过期
							 map.put("old",true);
						}
					}
					
				}
				
			}
			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(ygList);
			total=pageinfo.getTotal();
			return ResultConstant.resultMap(ygList,total,flag, dateFlag,cause);

		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常"; 
		}
		return ResultConstant.resultMap(ygList,total,flag, dateFlag,cause);

	}
   
	/** 员工列表2
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/ygList")  
	public  @ResponseBody List<Map<String, Object>> ygList(HttpServletResponse response,HttpServletRequest request){  
		
		List<Map<String,Object>> ygList=null;
		try {
			String qyid=request.getParameter("qyid");
			Map<String,Object>m=new HashMap<String, Object>();
			m.put("qyid", qyid);
			if(StringUtils.isEmpty(qyid)){//查询企业名称列表
				ygList=ygInfoService.selectEnterpriseName(null);
			}
			else
			    ygList=ygInfoService.selectYgList2(m);
			
			return ygList;

		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return ygList;

	}
	
	
	/**员工查看
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/getYgMsg")  
	public  @ResponseBody Map<String, Object> getYgMsg(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			System.out.println("员工查询1");
			String id=request.getParameter("id")==null?"":request.getParameter("id").toString();
			String sfz=request.getParameter("sfz")==null?"":request.getParameter("sfz").toString();
			System.out.println("员工查询参数id"+id);
			System.out.println("员工查询参数身份证"+sfz);
			if(StringUtils.isNotBlank(id)){
				Map<String, Object>paramMap=new HashMap<String, Object>();
				paramMap.put("id", id);
				Map<String, Object>map=ygInfoService.getYgMsg(paramMap);
				ResultConstant.mapToDate(DateUtil.YYYY$MM$, map, "csny");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "cjgzsj");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "bysj");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,map, "hqsj");
				System.out.println("返回信息1"+map);
				return ResultConstant.resultMap(map,true,cause);
			}
            if(StringUtils.isNotBlank(sfz)){
            	Map<String, Object>paramMap=new HashMap<String, Object>();
				paramMap.put("sfz", sfz);
				Map<String, Object>map=ygInfoService.getYgMsg(paramMap);
				System.out.println("返回信息2"+map);
				return ResultConstant.resultMap(map,true,cause);

            	
            }
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据加载异常";
		}
		return ResultConstant.resultMap(null,flag,cause);


	}


	/**审核
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/yyglExamine")  
	public  @ResponseBody Map<String, Object> yyglExamine(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {

			String shzt=request.getParameter("shzt");
			String shyj=request.getParameter("shyj");
			String userId=request.getParameter("id");
			HyBusinessInfo hyBusinessInfo=new HyBusinessInfo();
			hyBusinessInfo.setUserId(userId);
			hyBusinessInfo.setSstate(shzt==null?null:Integer.valueOf(shzt));
			hyBusinessInfo.setRemsg(shyj);
			int count=ygInfoService.yyglExamine(hyBusinessInfo);
			if(count>0){
				return ResultConstant.resultMap(true,cause);  
			}

		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="审核异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	
	/**修改
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/yyglEdit")  
	public  @ResponseBody Map<String, Object> yyglEdit(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			
			//附件列表
			String htParam=request.getParameter("htParam");
			System.out.println(htParam);
			Map<String, Object> param=ResultConstant.paramSetAdd(request);
			System.out.println("员工修改param："+param);
			Map<String, Object>paramMap=new HashMap<String, Object>();
			String sfz=param.get("sfz")==null?null:param.get("sfz").toString();
			paramMap.put("sfz", sfz);
			Map<String, Object>map=ygInfoService.getYgMsg(paramMap);
			if(map!=null){
				if(!map.get("id").toString().equals(param.get("id").toString())){
					return ResultConstant.resultMap(false,"修改的身份证已经存在，身份证号必须唯一！");

				}
			}
			boolean c=ygInfoService.yyglEdit(param,htParam);
			logger.error("员工修改cause1："+cause);
			
			if(c){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
			System.out.println("员工修改异常："+e.getMessage());
			logger.error(e.getMessage());
		}
		
		logger.error("员工修改cause2："+cause);
		System.out.println("员工修改cause2："+cause);
		return ResultConstant.resultMap(flag,cause);  


	}
	
	/**删除用户
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/delYgFuc")  
	public  @ResponseBody Map<String, Object> delYgFuc(HttpServletResponse response,HttpServletRequest request){
		boolean flag=false;
		String cause="";
		try {
			//附件列表
			String id=request.getParameter("id");
			
			boolean c=ygInfoService.delYgFuc(id);
			if(c){
				return ResultConstant.resultMap(true,"");
			}
		} catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="操作异常";
		}
		return ResultConstant.resultMap(flag,cause);  


	}
	
	
	
	/** 劳动合同列表
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/agreementList")  
	public  @ResponseBody Map<String, Object> agreementList(HttpServletResponse response,HttpServletRequest request){  
		boolean flag=false;
		String dateFlag="";
		String cause="";
		Long total=null;
		List<Map<String,Object>> agList=new ArrayList<Map<String,Object>>();
		try {
			String userId=request.getParameter("userId");
			if(StringUtils.isNotBlank(userId)){
			Map<String, Object>paramMap=new HashMap<String, Object>();
			paramMap.put("userId", userId);
			agList=ygInfoService.agreementList(paramMap);
			if(agList!=null && agList.size()>0){
				for(int i=0;i<agList.size();i++){
				Map<String, Object> m=agList.get(i);	
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "startdate");
				ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "enddate");
			  }
			}
//			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(ygList);
//			total=pageinfo.getTotal();
			return ResultConstant.resultMap(agList,total,true, dateFlag,cause);
			}
		}catch (Exception e) {
			e.printStackTrace();
			flag=false;
			cause="数据上传异常"; 
		}
		return ResultConstant.resultMap(agList,total,flag, dateFlag,cause);

	}
	
	
	/**企业查询
	 * @param response
	 * @param request
	 * @return
	 */
	@RequestMapping("/qycx")  
	public  @ResponseBody List<Map<String, Object>> qycx(HttpServletResponse response,HttpServletRequest request){  
		
		List<Map<String,Object>> agList=null;
		try {
			String name=request.getParameter("name");
			//if(StringUtils.isNotBlank(name)){
			Map<String, Object>paramMap=new HashMap<String, Object>();
			paramMap.put("name", name);
			agList=ygInfoService.enterpriseList(paramMap);
		/*	if(agList!=null && agList.size()>0){
				for(int i=0;i<agList.size();i++){
				Map<String, Object> m=agList.get(i);	
				ResultConstant.mapToDate(m, "startdate");
				ResultConstant.mapToDate(m, "enddate");
			  }
			}*/
//			PageInfo<Map<String, Object>> pageinfo=new PageInfo<Map<String, Object>>(ygList);
//			total=pageinfo.getTotal();
			return agList;
			//}
		}catch (Exception e) {
			e.printStackTrace();
			
		}
		return agList;

	}
}
