package com.i84.earnpoint.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.FileUtil;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.EnterpriseMaterialInfo;
import com.i84.earnpoint.model.User;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.UserMaterialInfo;
import com.i84.earnpoint.service.EnterpriseInfoService;
import com.i84.earnpoint.service.EnterpriseMaterialInfoService;
import com.i84.earnpoint.service.UserInfoService;
import com.i84.earnpoint.service.UserMaterialInfoService;
import com.i84.earnpoint.system.service.UserService;

@Controller
@RequestMapping("/clgl")
public class MaterialManageController {
	@Autowired
	private UserInfoService userInfoService;

	@Autowired
	private UserMaterialInfoService userMaterialInfoService;
    @Autowired
	private UserService userService;
    @Autowired
    private EnterpriseMaterialInfoService enterpriseMaterialInfoService;
    @Autowired
    private EnterpriseInfoService enterpriseInfoService;
    /**
     * 保存用户材料信息
     * @param request
     * @param response
     * @throws Exception
     */
	@RequestMapping("/insertUserMaterialInfo")
	public void insertUserMaterialInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		String usernum = request.getParameter("usernum");
		String pno = request.getParameter("pno");
		String ptype = request.getParameter("ptype");
		String pname = request.getParameter("pname");
		String sname = request.getParameter("sname");
		String sdate = request.getParameter("sdate");
		String validDate = request.getParameter("validDate");
		String remark=request.getParameter("remark");
		if (usernum != null) {
			UserInfo userInfo = new UserInfo();
			userInfo.setPnum(usernum);
			List<UserInfo> list = userInfoService
					.selectUserInfoBySelective(userInfo);
			if (list.size() > 0) {
				UserMaterialInfo userMaterialInfo = new UserMaterialInfo();
				userMaterialInfo.setAddDate(new Date());
				// 1表示有效
				userMaterialInfo.setIsValid("0");
				userMaterialInfo.setPname(pname);
				userMaterialInfo.setPtype(ptype);
				userMaterialInfo.setSdate(DateUtil.stringToDate(sdate,
						"yyyy-MM-dd"));
				userMaterialInfo.setRemark(remark);
				userMaterialInfo.setUid(list.get(0).getId());
				userMaterialInfo.setPno(pno);
				userMaterialInfo.setSname(sname);
				HttpSession session = request.getSession();
				String uid = (String) session.getAttribute("uid");
				if (uid != null && !uid.trim().isEmpty()) {
					userMaterialInfo.setStaffId(Integer.valueOf(uid));
				}
				MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
				MultipartFile file = mrequest.getFile("file");
				if (file != null && file.getSize() > 0) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String now = format.format(new Date());
					String dstPath = new File(getClass().getClassLoader()
							.getResource("").getPath()).getParentFile()
							.getParentFile().getPath()
							+ "/upload/usermaterials/" + now;
					String filename = FileUtil.upload(file, dstPath);
					userMaterialInfo.setUrl(request.getContextPath()
							+ "/upload/usermaterials/" + now + "/" + filename);
				}
				userMaterialInfo.setValidDate(validDate);
				int count = userMaterialInfoService
						.insertUserMaterialInfo(userMaterialInfo);
				if (count > 0) {
					response.getWriter().write("1");
				} else {
					response.getWriter().write("用户材料保存失败!");
				}
			} else {
				response.getWriter().write("系统中不存在此身份证号的用户！");
			}
		}

	}
    /**
     * 预览材料图片
     * @param request
     * @param response
     * @throws Exception
     */
	@RequestMapping("/uploadMaterial")
	public void uploadUserMaterial(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
		MultipartFile file = mrequest.getFile("file");
		if (file != null && file.getSize() > 0) {
			SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
			String now = format.format(new Date());
			String dstPath = new File(getClass().getClassLoader()
					.getResource("").getPath()).getParentFile().getParentFile()
					.getPath()
					+ "/upload/usermaterials/" + now;
			String filename = FileUtil.upload(file, dstPath);
			response.getWriter().write(
					request.getContextPath() + "/upload/usermaterials/" + now
							+ "/" + filename);
		} else {
			response.getWriter().write("0");
		}
	}

	/**
	 * 查询个人材料信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/listUserMaterialInfo")
	public void listUserMaterialInfo(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
         response.setCharacterEncoding("utf-8");
		UserMaterialInfo userMaterialInfo = new UserMaterialInfo();
		int page=TextUtil.getInt(request.getParameter("page"));
		int rows=TextUtil.getInt(request.getParameter("rows"));
		PageHelper.startPage(page,rows);
		List<UserMaterialInfo> userMaterialInfos = userMaterialInfoService
				.listUserMaterialInfo(userMaterialInfo);
		PageInfo<UserMaterialInfo> pageInfo=new PageInfo<UserMaterialInfo>(userMaterialInfos);
		JSONArray jArray=new JSONArray();
		JSONObject obj=new JSONObject();
		for(int i=0;i<userMaterialInfos.size();i++){
			JSONObject jobj=new JSONObject();
			UserMaterialInfo mi=userMaterialInfos.get(i);
			UserInfo userInfo= userInfoService.selectById(mi.getUid());
			User user=userService.selectByPrimaryKey(mi.getStaffId());
			jobj.put("id", mi.getId());
			jobj.put("sfzh",userInfo!=null?userInfo.getPnum():"");
			jobj.put("xm",userInfo!=null?userInfo.getName():"" );
			jobj.put("clbh", mi.getPno());
			jobj.put("cllx", mi.getPtype());
			jobj.put("clmc", mi.getPname());
			jobj.put("lrsj", new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()));
			jobj.put("bz", mi.getRemark());
			jobj.put("lrr", user!=null?user.getUsername():"");
			jobj.put("yxx", mi.getIsValid());
			jobj.put("usernum", userInfo!=null?userInfo.getPnum():"");
			jobj.put("username", userInfo!=null?userInfo.getName():"");
			jobj.put("pno", mi.getPno());
			jobj.put("ptype", mi.getPtype());
			jobj.put("pname", mi.getPname());
			jobj.put("sname", mi.getSname());
			jobj.put("remark", mi.getRemark());
			jobj.put("sdate",new SimpleDateFormat("yyyy-MM-dd").format(mi.getSdate()));
			jobj.put("validDate",mi.getValidDate() );
			jobj.put("preview", mi.getUrl());
			jArray.add(jobj);
		}
		obj.put("rows", jArray);
		obj.put("total", pageInfo.getTotal());
		obj.put("flag", true);
		obj.put("cause", null);
		response.getWriter().write(obj.toString());
	}
	/**
	 * 无效个人材料信息
	 * @throws Exception
	 */
    @RequestMapping("/invalidMaterial")
	public void invalidUserMaterialInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
    	response.setCharacterEncoding("utf-8");
		String ids=request.getParameter("ids");
		int count=userMaterialInfoService.invalidUserMaterialInfo(ids);
		if(count>0){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("无效用户材料失败！");
		}
	}
    /**
     * 修改用户材料信息
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateUserMaterial")
    public void updateUserMaterialInfo(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
       response.setCharacterEncoding("utf-8");
    	String id=request.getParameter("id");
    	String usernum = request.getParameter("usernum");
		String pno = request.getParameter("pno");
		String ptype = request.getParameter("ptype");
		String pname = request.getParameter("pname");
		String sname = request.getParameter("sname");
		String sdate = request.getParameter("sdate");
		String validDate = request.getParameter("validDate");
		String remark=request.getParameter("remark");
		if (usernum != null) {
			UserInfo userInfo = new UserInfo();
			userInfo.setPnum(usernum);
			List<UserInfo> list = userInfoService
					.selectUserInfoBySelective(userInfo);
			if (list.size() > 0) {
				UserMaterialInfo userMaterialInfo = new UserMaterialInfo();
				userMaterialInfo.setId(Integer.valueOf(id));
				userMaterialInfo.setAddDate(new Date());
				// 1表示无效
				userMaterialInfo.setIsValid("1");
				userMaterialInfo.setPname(pname);
				userMaterialInfo.setPtype(ptype);
				userMaterialInfo.setSdate(DateUtil.stringToDate(sdate,
						"yyyy-MM-dd"));
				userMaterialInfo.setRemark(remark);
				userMaterialInfo.setStaffId(list.get(0).getId());
				userMaterialInfo.setPno(pno);
				userMaterialInfo.setSname(sname);
				HttpSession session = request.getSession();
				String uid = (String) session.getAttribute("uid");
				if (uid != null && !uid.trim().isEmpty()) {
					userMaterialInfo.setUid(Integer.valueOf(uid));
				}
				MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
				MultipartFile file = mrequest.getFile("file");
				if (file != null && file.getSize() > 0) {
					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
					String now = format.format(new Date());
					String dstPath = new File(getClass().getClassLoader()
							.getResource("").getPath()).getParentFile()
							.getParentFile().getPath()
							+ "/upload/usermaterials/" + now;
					String filename = FileUtil.upload(file, dstPath);
					userMaterialInfo.setUrl(request.getContextPath()
							+ "/upload/usermaterials/" + now + "/" + filename);
				}
				userMaterialInfo.setValidDate(validDate);
				int count = userMaterialInfoService
						.updateUserMaterialInfo(userMaterialInfo);
				if (count > 0) {
					response.getWriter().write("1");
				} else {
					response.getWriter().write("用户材料修改失败!");
				}
			} else {
				response.getWriter().write("系统中不存在此身份证号的用户！");
			}
		}
    }
    /**
     * 插入企业材料信息
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/insertEnterpriseMaterialInfo")
    public void insertEnterpriseMaterialInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
    	response.setCharacterEncoding("utf-8");
		String usernum = request.getParameter("enterpriseCode");
		String pno = request.getParameter("materialCode");
		String ptype = request.getParameter("materialType");
		String pname = request.getParameter("materialName");
		String sname = request.getParameter("publishOrg");
		String sdate = request.getParameter("publishTime");
		String validDate = request.getParameter("validDate");
		String remark=request.getParameter("remark");
		if (usernum != null) {
			EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
 			enterpriseInfo.setcCode(usernum);
 			EnterpriseInfo list = enterpriseInfoService
 					.selectEnterpriseBycCode(enterpriseInfo);
			if (list!=null) {
				EnterpriseMaterialInfo enterpriseMaterialInfo = new EnterpriseMaterialInfo();
 				
 				enterpriseMaterialInfo.setAddDate(new Date());
 				// 1表示无效
 				enterpriseMaterialInfo.setIsValid("0");
 				enterpriseMaterialInfo.setPname(pname);
 				enterpriseMaterialInfo.setPtype(ptype);
 				enterpriseMaterialInfo.setSdate(DateUtil.stringToDate(sdate,
 						"yyyy-MM-dd"));
 				enterpriseMaterialInfo.setRemark(remark);
 				enterpriseMaterialInfo.setEnterpriseId(list.getId());
 				enterpriseMaterialInfo.setPno(pno);
 				enterpriseMaterialInfo.setSname(sname);
 				HttpSession session = request.getSession();
 				String uid = (String) session.getAttribute("uid");
 				if (uid != null && !uid.trim().isEmpty()) {
 					enterpriseMaterialInfo.setStaffId(Integer.valueOf(uid));
 				}
 				MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
 				MultipartFile file = mrequest.getFile("file");
 				if (file != null && file.getSize() > 0) {
 					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 					String now = format.format(new Date());
 					String dstPath = new File(getClass().getClassLoader()
 							.getResource("").getPath()).getParentFile()
 							.getParentFile().getPath()
 							+ "/upload/usermaterials/" + now;
 					String filename = FileUtil.upload(file, dstPath);
 					enterpriseMaterialInfo.setUrl(request.getContextPath()
 							+ "/upload/usermaterials/" + now + "/" + filename);
 				}
 				enterpriseMaterialInfo.setValidDate(validDate);
 				int count = enterpriseMaterialInfoService.insertEnterpriseMaterialInfo(enterpriseMaterialInfo);
				if (count > 0) {
					response.getWriter().write("1");
				} else {
					response.getWriter().write("企业材料保存失败!");
				}
			} else {
				response.getWriter().write("系统中不存在此组织机构代码的企业！");
			}
		}

    }
    /**
     * 修改企业材料信息
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/updateEnterpriseMaterialInfo")
    public void updateEnterpriseMaterialInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
    	 response.setCharacterEncoding("utf-8");
     	String id=request.getParameter("id");
     	String usernum = request.getParameter("enterpriseCode");
		String pno = request.getParameter("materialCode");
		String ptype = request.getParameter("materialType");
		String pname = request.getParameter("materialName");
		String sname = request.getParameter("publishOrg");
		String sdate = request.getParameter("publishTime");
		String validDate = request.getParameter("validDate");
		String remark=request.getParameter("remark");
 		if (usernum != null) {
 			EnterpriseInfo enterpriseInfo = new EnterpriseInfo();
 			enterpriseInfo.setcCode(usernum);
 			EnterpriseInfo list = enterpriseInfoService
 					.selectEnterpriseBycCode(enterpriseInfo);
 			if (list!=null) {
 				EnterpriseMaterialInfo enterpriseMaterialInfo = new EnterpriseMaterialInfo();
 				enterpriseMaterialInfo.setId(Integer.valueOf(id));
 				enterpriseMaterialInfo.setAddDate(new Date());
 				// 1表示无效
 				enterpriseMaterialInfo.setIsValid("0");
 				enterpriseMaterialInfo.setPname(pname);
 				enterpriseMaterialInfo.setPtype(ptype);
 				enterpriseMaterialInfo.setSdate(DateUtil.stringToDate(sdate,
 						"yyyy-MM-dd"));
 				enterpriseMaterialInfo.setRemark(remark);
 				enterpriseMaterialInfo.setEnterpriseId(list.getId());
 				enterpriseMaterialInfo.setPno(pno);
 				enterpriseMaterialInfo.setSname(sname);
 				HttpSession session = request.getSession();
 				String uid = (String) session.getAttribute("uid");
 				if (uid != null && !uid.trim().isEmpty()) {
 					enterpriseMaterialInfo.setStaffId(Integer.valueOf(uid));
 				}
 				MultipartHttpServletRequest mrequest = (MultipartHttpServletRequest) request;
 				MultipartFile file = mrequest.getFile("file");
 				if (file != null && file.getSize() > 0) {
 					SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
 					String now = format.format(new Date());
 					String dstPath = new File(getClass().getClassLoader()
 							.getResource("").getPath()).getParentFile()
 							.getParentFile().getPath()
 							+ "/upload/usermaterials/" + now;
 					String filename = FileUtil.upload(file, dstPath);
 					enterpriseMaterialInfo.setUrl(request.getContextPath()
 							+ "/upload/usermaterials/" + now + "/" + filename);
 				}
 				enterpriseMaterialInfo.setValidDate(validDate);
 				int count = enterpriseMaterialInfoService
 						.updateEnterpriseMaterialInfo(enterpriseMaterialInfo);
 				if (count > 0) {
 					response.getWriter().write("1");
 				} else {
 					response.getWriter().write("企业材料修改失败!");
 				}
 			} else {
 				response.getWriter().write("系统中不存在此组织机构代码的企业！");
 			}
 		}
    }
    /**
     * 列出企业材料信息
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/listEnterpriseMaterialInfo")
    public void listEnterpriseMaterialInfo(HttpServletRequest request,HttpServletResponse response)throws Exception{
    	  response.setCharacterEncoding("utf-8");
    	  int page=TextUtil.getInt(request.getParameter("page"));
  		int rows=TextUtil.getInt(request.getParameter("rows"));
  		
    	  EnterpriseMaterialInfo enterpriseMaterialInfo = new EnterpriseMaterialInfo();
    	  PageHelper.startPage(page,rows);
  		List<EnterpriseMaterialInfo> enterpriseMaterialInfos = enterpriseMaterialInfoService
  				.listEnterpriseMaterialInfo(enterpriseMaterialInfo);
  		PageInfo<EnterpriseMaterialInfo> pageInfo=new PageInfo<EnterpriseMaterialInfo>(enterpriseMaterialInfos);
  		JSONArray jArray=new JSONArray();
  		JSONObject obj=new JSONObject();
  		for(int i=0;i<enterpriseMaterialInfos.size();i++){
  			JSONObject jobj=new JSONObject();
  			EnterpriseMaterialInfo mi=enterpriseMaterialInfos.get(i);
  			EnterpriseInfo enterpriseInfo= enterpriseInfoService.selectEnterpriseById(mi.getEnterpriseId());
  			User user=userService.selectByPrimaryKey(mi.getStaffId());
  			jobj.put("id", mi.getId());
  			jobj.put("zzjgdm",enterpriseInfo!=null?enterpriseInfo.getcCode():"");
  			jobj.put("qymc",enterpriseInfo!=null?enterpriseInfo.getName():"" );
  			jobj.put("clbh", mi.getPno());
  			jobj.put("cllx", mi.getPtype());
  			jobj.put("clmc", mi.getPname());
  			jobj.put("lrsj", new SimpleDateFormat("yyyy-MM-dd").format(mi.getAddDate()));
  			jobj.put("bz", mi.getRemark());
  			jobj.put("lrr", user!=null?user.getUsername():"");
  			jobj.put("yxx", mi.getIsValid());
  			jobj.put("enterpriseCode", enterpriseInfo!=null?enterpriseInfo.getcCode():"");
  			jobj.put("enterpriseName", enterpriseInfo!=null?enterpriseInfo.getName():"");
  			jobj.put("materialCode", mi.getPno());
  			jobj.put("materialType", mi.getPtype());
  			jobj.put("materialName", mi.getPname());
  			jobj.put("publishOrg", mi.getSname());
  			jobj.put("remark", mi.getRemark());
  			jobj.put("publishTime", new SimpleDateFormat("yyyy-MM-dd").format(mi.getSdate()));
  			jobj.put("validDate", mi.getValidDate());
  			jobj.put("preview", mi.getUrl());
  			jArray.add(jobj);
  		}
  		obj.put("rows", jArray);
  		obj.put("total", pageInfo.getTotal());
  		obj.put("flag", true);
  		obj.put("cause", null);
  		response.getWriter().write(obj.toString());
    }
    /**
	 * 无效企业材料信息
	 * @throws Exception
	 */
    @RequestMapping("/invalidEnterpriseMaterial")
	public void invalidEnterpriseMaterial(HttpServletRequest request,
			HttpServletResponse response)throws Exception{
    	response.setCharacterEncoding("utf-8");
		String ids=request.getParameter("ids");
		int count=enterpriseMaterialInfoService.invalidEnterpriseMaterialInfo(ids);
		if(count>0){
			response.getWriter().write("1");
		}else{
			response.getWriter().write("无效企业材料失败！");
		}
	}
    /**
     * 用身份证号获取姓名
     * @param request
     * @param response
     * @throws Exception
     */
    @RequestMapping("/getNameByIdCard")
    public void getNameByIdCard(HttpServletRequest request,HttpServletResponse response)throws Exception{
    	
    	String pnum=request.getParameter("pnum");
    	UserInfo userInfo=new UserInfo();
    	if(pnum!=null&&!pnum.trim().isEmpty()){
    		response.setCharacterEncoding("utf-8");
    		JSONObject object=new JSONObject();
    		userInfo.setPnum(pnum);
    		List<UserInfo> userInfos=userInfoService.selectUserInfoBySelective(userInfo);
    		if(userInfos.size()>0){
    			object.put("flag", true);
    			object.put("msg", userInfos.get(0).getName());
    		}else{
    			object.put("flag", false);
    			object.put("msg", "系统中尚不存在此身份证的用户！");
    		}
    		response.getWriter().write(object.toString());
    	}
    }
}
