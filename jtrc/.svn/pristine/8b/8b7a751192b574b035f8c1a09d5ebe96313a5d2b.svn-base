package com.i84.earnpoint.rsdlgl.controller;


import java.text.SimpleDateFormat;
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
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.rsdlgl.service.RsBusinessInfoService;
import com.i84.earnpoint.rsdlgl.service.TypeInfoService;

/**
 * 人事代理信息管理
 * @author zhengqr
 *
 */
@Controller
@RequestMapping("/rsBusinessInfo")
public class RsBusinessInfoController {
	@Autowired 
	private TypeInfoService typeInfoService;
	
	@Autowired 
	private RsBusinessInfoService rsBusinessInfoService;
	
	@RequestMapping("/rsBusinessInfoList")
	public  @ResponseBody Map<String, Object> typeInfoList(HttpServletResponse response,HttpServletRequest request) throws Exception{
		int page = TextUtil.getInt(request.getParameter("page"));
		if (page == 0)
			page = 1;
		int rows = TextUtil.getInt(request.getParameter("rows"));
		RsBusinessInfo record=new RsBusinessInfo();
		String userName = request.getParameter("userNameSear");
		String sstate = request.getParameter("sstateSear");
		String businessName = request.getParameter("businessNameSear");
		record.setPage(page);
		record.setRows(rows);
		if(StringUtils.isNotBlank(userName)){
		    record.setUserName(userName);
		}
		if(StringUtils.isNotBlank(sstate)){
			record.setSstate(Integer.parseInt(sstate));
		}
		if(StringUtils.isNotBlank(businessName)){
			record.setBusinessName(businessName);
		}
		List<RsBusinessInfo> list = rsBusinessInfoService.selectListByPrimary(record);
		PageInfo<RsBusinessInfo> pageinfo=new PageInfo<RsBusinessInfo>(list);
		return resultMap(list, pageinfo.getTotal(), true, null);
	}
	
	@RequestMapping("/del")
	public  @ResponseBody void del(HttpServletResponse response,HttpServletRequest request) throws Exception{
		String ids = request.getParameter("ids");
		rsBusinessInfoService.deleteByPrimaryKeys(ids,response);
	}
	
	@RequestMapping("/save")
	public  @ResponseBody void save(HttpServletResponse response,HttpServletRequest request) throws Exception{
		RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
		String kpno = request.getParameter("kpno");
		String pno = request.getParameter("pno");
		String businessId = request.getParameter("businessId");
		String sDirect = request.getParameter("sDirect");
		String sstate = request.getParameter("sstate");
		rsBusinessInfo.setBusinessId(Integer.parseInt(businessId));
		rsBusinessInfo.setKpno(kpno);
		rsBusinessInfo.setPno(pno);
		rsBusinessInfo.setsDirect(sDirect);
		rsBusinessInfo.setSstate(Integer.parseInt(sstate));
		rsBusinessInfo.setUid(1);
		
//		typeInfo.setPno(pno);
//		typeInfo.setName(name);
		rsBusinessInfoService.insert(rsBusinessInfo,response);
	}

	@RequestMapping("/update")
	public  @ResponseBody void update(HttpServletResponse response,HttpServletRequest request) throws Exception{
		RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
		String id = request.getParameter("id");
		String kpno = request.getParameter("kpno");
		String pno = request.getParameter("pno");
		String businessId = request.getParameter("businessId");
		String sDirect = request.getParameter("sDirect");
		String sstate = request.getParameter("sstate");
		rsBusinessInfo.setBusinessId(Integer.parseInt(businessId));
		rsBusinessInfo.setKpno(kpno);
		rsBusinessInfo.setPno(pno);
		rsBusinessInfo.setsDirect(sDirect);
		rsBusinessInfo.setSstate(Integer.parseInt(sstate));
		rsBusinessInfo.setUid(1);
		rsBusinessInfo.setId(Integer.parseInt(id));
		rsBusinessInfoService.updateByPrimaryKey(rsBusinessInfo,response);
	}
	
	@RequestMapping("/kdAdd")
	public  @ResponseBody void kdAdd(HttpServletResponse response,HttpServletRequest request) throws Exception{
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
		String id = request.getParameter("id");
		String kpno = request.getParameter("kpno");
		String kDate = request.getParameter("kDate");
		String kCompany = request.getParameter("kCompany");
		rsBusinessInfo.setId(Integer.parseInt(id));
		rsBusinessInfo.setKpno(kpno);
		rsBusinessInfo.setkCompany(kCompany);
		rsBusinessInfo.setkDate(kDate);
		rsBusinessInfoService.kdAdd(rsBusinessInfo,response);
	}
	
	@RequestMapping("/shBusinessInfo")
	public  @ResponseBody void shBusinessInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
		String id = request.getParameter("id");
		String sider = request.getParameter("sider");
		String sstate = request.getParameter("sstate");
		rsBusinessInfo.setId(Integer.parseInt(id));
		rsBusinessInfo.setSider(sider);
		rsBusinessInfo.setSstate(Integer.parseInt(sstate));
		rsBusinessInfoService.shBusinessInfo(rsBusinessInfo,response);
	}
	
	@RequestMapping("/bjBusinessInfo")
	public  @ResponseBody void bjBusinessInfo(HttpServletResponse response,HttpServletRequest request) throws Exception{
		RsBusinessInfo rsBusinessInfo = new RsBusinessInfo();
		String id = request.getParameter("id");
		rsBusinessInfo.setId(Integer.parseInt(id));
		rsBusinessInfo.setSstate(3);
		rsBusinessInfoService.bjBusinessInfo(rsBusinessInfo,response);
	}
	
    /**
     * @param ResultRows:结果集对象
     * @param total:总页数
     * @param flag:是否成功
     * @param cause：失败原因
     * @return
     */
    public  Map<String, Object> resultMap(Object ResultRows,Long total,boolean flag,String cause){
    	Map<String, Object> resultMap = new HashMap<String, Object>();
    	resultMap.put("rows", ResultRows);
		resultMap.put("total", total);
		resultMap.put("flag", flag);
		resultMap.put("cause", cause);
		return resultMap;
    	
    }
	
}

