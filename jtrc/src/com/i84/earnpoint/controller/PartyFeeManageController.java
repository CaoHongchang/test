package com.i84.earnpoint.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Comparator;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ImportExcel;
import com.i84.earnpoint.model.HistoryPartyFeeImport;
import com.i84.earnpoint.model.PartyBaseInfo;
import com.i84.earnpoint.model.PartyMoneyInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.service.PartyBaseInfoService;
import com.i84.earnpoint.service.PartyMoneyInfoService;
import com.i84.earnpoint.service.UserInfoService;
import com.i84.earnpoint.service.UserPartyInfoService;

/**
 * 党费管理
 * 
 * @author CHEN
 * 
 */
@Controller
@RequestMapping("/dfgl")
public class PartyFeeManageController extends ResultConstant {
	@Autowired
	private PartyBaseInfoService partyBaseInfoService;
	@Autowired
	private UserPartyInfoService userPartyInfoService;
	@Autowired
	private PartyMoneyInfoService partyMoneyInfoService;
    @Autowired
	private UserInfoService userInfoService;
	/**
	 * 查询缴费基准信息
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/SelectPartyBase")
	public void SelectPartyBase(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		PartyBaseInfo partyBaseInfo = new PartyBaseInfo();
		String pnum=request.getParameter("pnum");
		partyBaseInfo.setPnum(pnum);
		userPartyInfoService.updatePartyFeeMsg(pnum);
		Map<String,Object> map=new HashMap<String,Object>();
		map.put("pnum", pnum);
		List<PartyBaseInfo> partyBaseInfos = partyBaseInfoService
				.listPartyBaseInfo(partyBaseInfo);
		JSONArray jArray = new JSONArray();
		JSONObject obj = new JSONObject();
		for (int i = 0; i < partyBaseInfos.size(); i++) {
			JSONObject jobj = new JSONObject();
			PartyBaseInfo mi = partyBaseInfos.get(i);

			jobj.put("id", mi.getId());
			jobj.put("pnum", mi.getPnum());
			jobj.put("pyear", mi.getPyear());
			jobj.put("base_m", mi.getBaseM());
			jobj.put("err_m", mi.getErrM());
			jArray.add(jobj);
		}
		obj.put("rows", jArray);
		obj.put("flag", true);
		obj.put("data", userPartyInfoService.selectUserPartyInfoWidthPnum(map));
		obj.put("cause", null);
		response.getWriter().write(obj.toString());
	}

	/**
	 * 查询缴费记录
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/SelectPartyMoney")
	public void SelectPartyMoney(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding("utf-8");
		Map<String, Object> params = new HashMap<String, Object>();	
		params.put("pnum", request.getParameter("pnum"));
		List<Map<String, Object>> partyMoneyInfos = partyMoneyInfoService
				.queryPartyMoneyInfos(params);

		JSONArray jArray = new JSONArray();
		JSONObject obj = new JSONObject();
		for (int i = 0; i < partyMoneyInfos.size(); i++) {
			JSONObject jobj = new JSONObject();
			Map<String,Object> mi = partyMoneyInfos.get(i);
			jobj.put("id", mi.get("id"));
			jobj.put("order_id", mi.get("order_id"));
			System.out.println(mi.get("p_date"));
			String p_date=TextUtil.getString(mi.get("p_date"));
			jobj.put("p_date",p_date);
			jobj.put("order_no", mi.get("order_no"));
			jobj.put("m", mi.get("m"));
			jobj.put("state", mi.get("state"));
			jobj.put("msg_from_id", mi.get("msg_from_id"));

			jArray.add(jobj);
		}
		obj.put("rows", jArray);
		obj.put("flag", true);
		obj.put("cause", null);
		response.getWriter().write(obj.toString());
	}

	/**
	 * 缴费基准导入
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importPartyBaseInfo")
	public void importPartyBaseInfo(
			@RequestParam("importFile") CommonsMultipartFile uploadExcel,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		JSONObject object = new JSONObject();
		try {
			DiskFileItem fi = (DiskFileItem) uploadExcel.getFileItem();
			File file = fi.getStoreLocation();
			ImportExcel<PartyBaseInfo> excelUtil = new ImportExcel<PartyBaseInfo>(
					PartyBaseInfo.class);
			Map<String, String> title = excelUtil.isTitle(file);
			// 导入错误的文件
			if (title != null && title.size() > 0) {
				object.put("result", 1);
				object.put("msg", "导入模板错误！");
				response.getWriter().write(object.toString());
				response.getWriter().flush();
				return;
			}
			List<PartyBaseInfo> partyBaseInfos = (List<PartyBaseInfo>) excelUtil
					.importExcel(file);
			int index=0;
			for (PartyBaseInfo partyBaseInfo : partyBaseInfos) {
				String pnum = partyBaseInfo.getPnum();
				String pyear = partyBaseInfo.getPyear();
				String baseM = partyBaseInfo.getBaseM();
				String errM = "";
				if (!Pattern.matches("^\\d{15}(\\d{2}[A-Za-z0-9])?$", pnum)) {
					errM += "身份证必须为15或18位;\r\n";
				}
				else{
						//判断是否为党员
					   Map<String,Object> record=new HashMap<String, Object>();
					   record.put("pnum", pnum);
					   if(userPartyInfoService.selectUserPartyInfoWidthPnum(record).size()==0){
						   errM+="身份证："+pnum+"的不是党员;\r\n";
					   }
					   
					}
				if (!Pattern.matches("^\\d{4}$", pyear)) {
					errM += "年份必须为4位数字\r\n;";
				}
				if (errM.equals("")){
					   int index1=0;
						for(PartyBaseInfo pb:partyBaseInfos){
							String ppnum=pb.getPnum();
							String ppyear=pb.getPyear();
							if(pnum.equals(ppnum)&&pyear.equals(ppyear)&&index!=index1){
								errM+=pnum+"+"+pyear+"缴费基准有多条;\r\n";
								break;
							}
							index1++;
						}
				}//
				if (!Pattern.matches("^[+]?\\d+(\\.\\d+)?$", baseM)) {
					errM += "缴费基准数值错误;\r\n";
				}
				index++;
				partyBaseInfo.setErrM(errM);
			}
			object.put("result", 2);
			object.put("rows", partyBaseInfos);
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		} catch (Exception e) {
			object.put("result", 3);
			object.put("msg", "错误：" + e.getStackTrace());
			e.printStackTrace();
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		}

	}

	/**
	 * 设置年缴费基准
	 * 
	 * @param params
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/setYearPaidBase")
	public void setYearPaidBase(@RequestParam Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		PartyBaseInfo partyBaseInfo = new PartyBaseInfo();
		if (params.containsKey("year")) {
			partyBaseInfo.setPyear(String.valueOf(params.get("year")));
		}
		if (params.containsKey("name")) {
			partyBaseInfo.setBaseM(String.valueOf(params.get("name")));
		}
		JSONObject object = new JSONObject();
		try{
		//查询所有党员信息
		List<Map<String,Object>> list=userPartyInfoService.selectUserPartyInfoWidthPnum(new  HashMap<String, Object>());
		for(Map<String,Object> m:list){
			String pnum=(String)m.get("pnum");
			partyBaseInfo.setPnum(pnum);
			//当年的缴费基准存在 覆盖
			if(partyBaseInfoService.listPartyBaseInfo(partyBaseInfo).size()>0){
				partyBaseInfoService.updatePartyBaseInfo(partyBaseInfo);
			}else{//不存在 插入
				partyBaseInfoService.savePartyBaseInfo(partyBaseInfo);
			}
			userPartyInfoService.updatePartyFeeMsg(pnum);
		}
		     object.put("flag", true);
		     object.put("msg", "设置年缴费基准成功！");
		     response.getWriter().write(object.toString());
			 response.getWriter().flush();
		}
		catch(Exception e){
		   object.put("flag", false);
		   object.put("msg", e.getMessage());
		   response.getWriter().write(object.toString());
		   response.getWriter().flush();
		}
	}

	/**
	 * 导出模板
	 * 
	 * @param response
	 * @param request
	 * @return
	 * @throws IOException
	 * @throws Exception
	 */
	@RequestMapping("/exportModel")
	public String exportModel(HttpServletResponse response,
			HttpServletRequest request) throws IOException {
		String type = request.getParameter("year");
		String path = ResultConstant.getWEB_ROOTPath();
		
		if (type.equals("0")) {
			path =path+"templates/PaidBase.xlsx";
		} else {
			path = path+"templates/HistoryPartyFee.xlsx";
		}
       
		// 从请求参数获取附件ID并查询附件信息
		try {
			InputStream is = new BufferedInputStream(new FileInputStream(path));

			byte[] buf = new byte[is.available()];
			is.read(buf);
			is.close();
			// 设置响应类型为
			response.reset();
			String finalFileName = 
					type.equals("0") ? encodeFilename2(request, "缴费基准.xlsx")
							: encodeFilename2(request,"历史党费缴至.xlsx");
			response.setHeader("Content-Disposition", "attachment; "+finalFileName);
			
			// 将附件内容写入输出流
			OutputStream outputStream = new BufferedOutputStream(
					response.getOutputStream());
			outputStream.write(buf);
			outputStream.flush();
			outputStream.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	/**
	 * 检查缴费基准是否存在
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkIsPaidBaseExist")
	public void checkIsPaidBaseExist(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String pnums[] = request.getParameter("pnum").split(",");
		String pyears[] = request.getParameter("pyear").split(",");
		JSONObject object = new JSONObject();
		if (pnums != null && pnums.length > 0) {
			String msg = "";
			JSONArray jArray = new JSONArray();
			for (int i = 0; i < pnums.length; i++) {
				PartyBaseInfo p = new PartyBaseInfo();
				p.setPnum(pnums[i]);
				p.setPyear(pyears[i]);
				if (partyBaseInfoService.listPartyBaseInfo(p).size() > 0) {
					JSONObject jobj = new JSONObject();
					jobj.put("pnum", pnums[i]);
					jobj.put("pyear", pyears[i]);
					msg += pnums[i] + "  " + pyears[i] + "的缴费基准已存在;\r\n";
					jArray.add(jobj);
				}
			}
			if (msg.equals("")) {
				object.put("result", 0);
				object.put("msg", "");

			} else {
				object.put("result", 1);
				object.put("msg", msg);
				object.put("rows", jArray);
			}
		} else {
			object.put("result", 0);
			object.put("msg", "");
		}
		response.getWriter().write(object.toString());
		response.getWriter().flush();
	}

	/**
	 * 保存缴费基准信息
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/savePartyBaseInfos")
	public void savePartyBaseInfos(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		JSONObject object = new JSONObject();
		try{
		String pnums[] = request.getParameter("pnum").split(",");
		String pyears[] = request.getParameter("pyear").split(",");
		String baseMs[] = request.getParameter("baseM").split(",");
		if (pnums != null && pnums.length > 0) {
			for (int i = 0; i < pnums.length; i++) {
				PartyBaseInfo partyBaseInfo = new PartyBaseInfo();
				partyBaseInfo.setPnum(pnums[i]);
				partyBaseInfo.setPyear(pyears[i]);
				partyBaseInfo.setBaseM(baseMs[i]);
				System.out.println(pnums[i]);
				// 若已经存在则更新
				if (partyBaseInfoService.listPartyBaseInfo(partyBaseInfo)
						.size() > 0) {
					partyBaseInfoService.updatePartyBaseInfo(partyBaseInfo);
				} else {// 若不存在则插入
					partyBaseInfoService.savePartyBaseInfo(partyBaseInfo);
				}
				//更新历史党费与应缴总额
				userPartyInfoService.updatePartyFeeMsg(pnums[i]);

			}
			object.put("result", "1");
			ResultConstant.write(response,object);
		} else {
			object.put("result", "0");
			ResultConstant.write(response,object);
		}
		}catch(Exception e){
			object.put("result", "0");
			ResultConstant.write(response, object);
		}
	}

	/**
	 * 历史党费缴至导入
	 * 
	 * @param uploadExcel
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/importHistoryPartyFee")
	public void importHistoryPartyFee(
			@RequestParam("importFile") CommonsMultipartFile uploadExcel,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		JSONObject object = new JSONObject();
		try {
			DiskFileItem fi = (DiskFileItem) uploadExcel.getFileItem();
			File file = fi.getStoreLocation();
			ImportExcel<HistoryPartyFeeImport> excelUtil = new ImportExcel<HistoryPartyFeeImport>(
					HistoryPartyFeeImport.class);
			Map<String, String> title = excelUtil.isTitle(file);

			// 导入错误的文件
			if (title != null && title.size() > 0) {
				object.put("result", 1);
				object.put("msg", "导入模板错误！");
				response.getWriter().write(object.toString());
				response.getWriter().flush();
				return;
			}
			List<HistoryPartyFeeImport> historyPartyFeeImports = (List<HistoryPartyFeeImport>) excelUtil.importExcel(file);
			HistoryPartyFeeImport[] temp = new HistoryPartyFeeImport[historyPartyFeeImports.size()];
			// 排序
			Arrays.sort(historyPartyFeeImports.toArray(temp), 0,
					historyPartyFeeImports.size(),
					new Comparator<HistoryPartyFeeImport>() {
						@Override
						public int compare(HistoryPartyFeeImport o1,
								HistoryPartyFeeImport o2) {
							return o1.getPnum().compareToIgnoreCase(
									o2.getPnum());
						}
					});
			// 判断导入数据中身份证号是否唯一
			for (int i = 0; i < historyPartyFeeImports.size() - 1; i++) {
				String pnum = temp[i].getPnum();
				String hisDate = temp[i].getHisDate();
				String errM = "";
				if (temp[i].getPnum().equals(temp[i + 1].getPnum())) {
					object.put("result", 3);
					object.put("msg", "身份证号码必须是唯一值");
					response.getWriter().write(object.toString());
					response.getWriter().flush();
					return;
				} 
				if (!Pattern.matches("^\\d{15}(\\d{2}[A-Za-z0-9])?$", pnum)) {
						errM += "身份证必须为15或18位;\r\n";
				}
				else{
					//判断是否为党员
				   Map<String,Object> record=new HashMap<String, Object>();
				   record.put("pnum", pnum);
				   if(userPartyInfoService.selectUserPartyInfoWidthPnum(record).size()==0){
					   errM+="身份证："+pnum+"的不是党员;\r\n";
				   }
				   
				}
					// 判断历史党费缴至
				if (!Pattern.matches("^\\d{4}(0[1-9]|1[0-2])$", hisDate)) {
						errM += "历史党费缴至必须为6位数字，如YYYYMM;\r\n";
				}
				temp[i].setErrM(errM);
				
			}
			if (temp.length > 0) {
				String errM = "";
				String pnum=temp[temp.length-1].getPnum();
				if (!Pattern.matches("^\\d{15}(\\d{2}[A-Za-z0-9])?$",
						pnum)) {
					errM += "身份证必须为15或18位;\r\n";
				}
				else{
					//判断是否为党员
				   Map<String,Object> record=new HashMap<String, Object>();
				   record.put("pnum", pnum);
				   if(userPartyInfoService.selectUserPartyInfoWidthPnum(record).size()==0){
					   errM+="身份证："+pnum+"的不是党员;\r\n";
				   }
				   
				}
				// 判断历史党费缴至
				if (!Pattern.matches("^\\d{4}(0[1-9]|1[0-2])$",
						temp[temp.length - 1].getHisDate())) {
					errM += "历史党费缴至必须为6位数字，如YYYYMM;\r\n";
				}
				temp[temp.length - 1].setErrM(errM);
			}
			object.put("result", 2);
			object.put("rows", temp);
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		} catch (Exception e) {
			object.put("result", 4);
			object.put("msg", "错误：" + e.getStackTrace());
			e.printStackTrace();
			response.getWriter().write(object.toString());
			response.getWriter().flush();
		}

	}

	/**
	 * 检查缴费基准是否存在
	 * 
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkIsHistoryPartyFeeExist")
	public void checkIsHistoryPartyFeeExist(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		System.out.println(request.getParameter("pnum"));
		String pnums[] = request.getParameter("pnum").split(",");
		System.out.println(pnums.length);
		JSONObject object = new JSONObject();
		if (pnums != null && pnums.length > 0) {
			String msg = "";
			JSONArray jArray = new JSONArray();
			for (int i = 0; i < pnums.length; i++) {

				if (userPartyInfoService.checkUserPartyInfoExist(pnums[i])) {
					JSONObject jobj = new JSONObject();
					jobj.put("pnum", pnums[i]);
					msg += pnums[i] + "的历史党费缴至记录已存在，是否覆盖保存\r\n";
					jArray.add(jobj);
				}
			}
			if (msg.equals("")) {
				object.put("result", 0);
				object.put("msg", "");

			} else {
				object.put("result", 1);
				object.put("msg", msg);
				object.put("rows", jArray);
			}
		} else {
			object.put("result", 0);
			object.put("msg", "");
		}
		response.getWriter().write(object.toString());
		response.getWriter().flush();
	}
	/**
	 * 更新历史党费信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/updateHistoryPartyFee")
	public void updateHistoryPartyFee(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String[] pnums = request.getParameter("pnum").split(",");
		String[] hisDates = request.getParameter("hisDate").split(",");
		JSONObject object = new JSONObject();
		if (pnums != null && pnums.length > 0) {

			userPartyInfoService.updateHistoryPartyFee(pnums, hisDates,
					response);
		} else {
			object.put("flag", false);
			object.put("msg", "不能保存空数据，请选择您要导入的表格！");
		}
	}

	/**
	 * 查询党费信息
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryPartyFeeMsgs")
	public @ResponseBody
	Map<String, Object> queryPartyFeeMsgs(
			@RequestParam Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {

		int page = TextUtil.getInt(params.get("page"));
		page = page == 0 ? 1 : page;
		int rows = TextUtil.getInt(params.get("rows"));
		PageHelper.startPage(page, rows);
		List<Map<String, Object>> list = userPartyInfoService.selectUserPartyInfoWidthPnum(params);
		PageInfo<Map<String, Object>> pageInfo = new PageInfo<Map<String, Object>>(list);
		return resultMap(list, pageInfo.getTotal(), true, null);
	}

	/**
	 * 检查是否为中心党员
	 * 
	 * @param params
	 * @param request
	 * @param respones
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryIsInUserPartyInfo")
	public @ResponseBody
	Map<String, Object> queryIsInUserPartyInfo(
			@RequestParam Map<String, Object> params,
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		Map<String, Object> map = userPartyInfoService
				.queryIsInUserPartyInfo(params);
		if (map != null){
			
			return resultMap(map, true, "");
		}
		else {
			return resultMap(false, "");
		}
	}

	/**
	 * 保存缴费信息
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/savePartyMoneyInfo")
	public void savePartyMoneyInfo(HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		response.setContentType("text/html;charset=utf-8");
		String pnum=request.getParameter("pnum");
		String payTime=request.getParameter("payTime");
		String payCode=request.getParameter("payCode");
		String money=request.getParameter("money");
		String type=request.getParameter("type");
		String state=request.getParameter("state");
		PartyMoneyInfo partyMoneyInfo=new PartyMoneyInfo();
		partyMoneyInfo.setOrderNo(payCode);
		partyMoneyInfo.setMsgFromId(payCode);
		partyMoneyInfo.setpDate(DateUtil.stringToDate(payTime, "yyyy-MM-dd HH:mm:ss"));
		partyMoneyInfo.setM(Float.valueOf(money));
		UserInfo userInfo=new UserInfo();
		userInfo.setPnum(pnum);
		List<UserInfo> list=userInfoService.selectUserInfoBySelective(userInfo);
		//设置uid
		if(list.size()>0){
			partyMoneyInfo.setUid(list.get(0).getId());
		}
		partyMoneyInfo.setOrderId(new Long(System.currentTimeMillis()).intValue());
		if(type.equals("0")){
			partyMoneyInfo.setState("已付款");//表示已经付款
			partyMoneyInfo.setMsgFromId("手动录入");//表示手动录入
		}else{
			partyMoneyInfo.setState(state);
			partyMoneyInfo.setMsgFromId("支付宝");//表示线上缴费
		}
	    int count=partyMoneyInfoService.savePartyMoneyInfo(partyMoneyInfo);
	    
	    if(count>0){
	    	userPartyInfoService.updatePartyFeeMsg(pnum);
	    	JSONObject jsonObject=new JSONObject();
			jsonObject.put("flag", true);
			jsonObject.put("cause", "新增缴费记录成功！");
			ResultConstant.write(response, jsonObject);
			return;
	    	//return resultMap(true, "新增缴费记录成功！");
	    }else{
	    	JSONObject jsonObject=new JSONObject();
			jsonObject.put("flag", false);
			jsonObject.put("cause", "新增缴费记录失败！");
			ResultConstant.write(response, jsonObject);
			return;
	    	//return resultMap(false,"新增缴费记录失败！");
	    }
		
	}
	/**
	 * 查询缴费信息列表
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryPartyMoneyInfos")
	public @ResponseBody
	Map<String, Object> queryPartyMoneyInfos(@RequestParam Map<String, Object> params,HttpServletRequest request, HttpServletResponse response){
		try {
			int page=Integer.valueOf((String)params.get("page"));
			page=page==0?1:page;
			int rows=Integer.valueOf((String)params.get("rows"));
			PageHelper.startPage(page, rows);
			List<Map<String,Object>> list=partyMoneyInfoService.queryPartyMoneyInfos(params);
			PageInfo<Map<String,Object>> pageinfo=new PageInfo<Map<String,Object>>(list);
			return resultMap(list, pageinfo.getTotal(), true, "");
		} catch (NumberFormatException e) {
			e.printStackTrace();
			return null;
		}
	}
	/**
	 * 检查付款交易号是否已经存在
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkIsOrderNoExist")
	public void checkIsOrderNoExist(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String orderNo = request.getParameter("orderNo");
		partyMoneyInfoService.checkIsOrderNoExist(orderNo, response);
	}
	
	/**
	 * 保存缴费信息
	 * @param params
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/updatePartyMoneyInfo")
	public @ResponseBody
	Map<String, Object> updatePartyMoneyInfo(
			
			HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		String id=request.getParameter("id");
		String pnum=request.getParameter("pnum");
		String payTime=request.getParameter("payTime");
		String payCode=request.getParameter("payCode");
		String money=request.getParameter("money");
		String type=request.getParameter("type");
		String state=request.getParameter("state");
		PartyMoneyInfo partyMoneyInfo=new PartyMoneyInfo();
		
		partyMoneyInfo.setOrderNo(payCode);
		partyMoneyInfo.setMsgFromId(payCode);
		partyMoneyInfo.setpDate(DateUtil.stringToDate(payTime, "yyyy-MM-dd HH:mm:ss"));
		partyMoneyInfo.setM(Float.valueOf(money));
		UserInfo userInfo=new UserInfo();
		userInfo.setPnum(pnum);
		List<UserInfo> list=userInfoService.selectUserInfoBySelective(userInfo);
	    partyMoneyInfo.setId(Integer.valueOf(id));
		//设置uid
		if(list.size()>0){
			partyMoneyInfo.setUid(list.get(0).getId());
		}
		if(type.equals("0")){
			partyMoneyInfo.setState("已付款");//表示已经付款
			partyMoneyInfo.setMsgFromId("手动录入");//表示手动录入
		}else{
			partyMoneyInfo.setState(state);
			partyMoneyInfo.setMsgFromId("支付宝");//表示线上缴费
		}
	    int count=partyMoneyInfoService.updatePartyMoneyInfo(partyMoneyInfo);
	    
	    if(count>0){
	    	userPartyInfoService.updatePartyFeeMsg(pnum);
	    	return resultMap(true, "修改缴费记录成功！");
	    }else{
	    	return resultMap(false,"修改缴费记录失败！");
	    }
		
	}
	/**
	 * 删除党员缴费信息
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/deletePartyMoneyInfos")
	public void deletePartyMoneyInfos(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String [] array=request.getParameterValues("id");
		partyMoneyInfoService.deletePartyMoneyInfos(array, response);
	}
	/**
	 * 判断某个党员是否符合党费缴交条件
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/checkIsEnablePay")
	public void checkIsEnablePay(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String pnum=request.getParameter("pnum");
		write(response,userPartyInfoService.checkIsEnablePay(pnum));
	}
}
