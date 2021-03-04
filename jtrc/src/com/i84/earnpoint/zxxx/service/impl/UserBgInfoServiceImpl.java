package com.i84.earnpoint.zxxx.service.impl;

import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.MD5;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.SystemContant;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.mapper.ClassInfoMapper;
import com.i84.earnpoint.mapper.UserBgInfoMapper;
import com.i84.earnpoint.mapper.UserInfoMapper;
import com.i84.earnpoint.model.BmbImport;
import com.i84.earnpoint.model.BmbInfo;
import com.i84.earnpoint.model.ClassInfo;
import com.i84.earnpoint.model.ExpExcelBmbInfo;
import com.i84.earnpoint.model.UserInfo;
import com.i84.earnpoint.model.XyExportVo;
import com.i84.earnpoint.zxxx.service.UserBgInfoService;
/**
 * 报名用户服务具体实现类
 * @author wangsc
 *
 */
@Service
public class UserBgInfoServiceImpl implements UserBgInfoService {

	@Autowired
	public UserBgInfoMapper userBgInfoMapper;
	@Autowired
	public ClassInfoMapper classInfoMapper;
	@Autowired
	public UserInfoMapper userInfoMapper;
	
	/**
	 * 报名表导入信息插入表
	 * @param tempVo
	 */
	@Override
	public void insertUserInfo(List<BmbImport> results) {
			    for (int i = 0; i < results.size(); i++) {
			    	BmbImport tempVo = results.get(i);
			    	if("".equals(tempVo.getBrith()))
			    		tempVo.setBrith(null);
			    	tempVo.setIsState(SystemContant.BG_STATE_NEW+"");
			    	Map<String, Object> map = new HashMap<String, Object>(); 
			    	map.put("pno", tempVo.getClassId()); 
			    	ClassInfo classObj = classInfoMapper.queryClassInfoByParam(map);
			    	//判断报名表是否已经存在了记录
			    	tempVo.setClassId(classObj.getId()+"");
			    	int count = userBgInfoMapper.queryIsExistUserInfo(tempVo);
			    	//判断用户表是否已经存在了记录
			    	UserInfo inseUser = new UserInfo();
			    	inseUser.setPnum(tempVo.getPnum());
			    	UserInfo user = userInfoMapper.selectYg(inseUser);
			    	if(count == 0 && user == null){
			    		tempVo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code(tempVo.getPnum().substring(tempVo.getPnum().length()-6))) );
			    		tempVo.setTechnical(tempVo.getZyjs());
			    		userBgInfoMapper.insertUserInfo(tempVo);
			    		//查询出最新这笔记录
			    		user = userInfoMapper.selectYg(inseUser);
			    		tempVo.setUserId(user.getId()+"");
			    		userBgInfoMapper.insertUserBgInfo(tempVo);
			    	}else if(count == 0 && user != null){//不存在报名，用户已经存在
			    		tempVo.setTechnical(tempVo.getZyjs());
			    		userBgInfoMapper.updateUserInfo(tempVo);
			    		tempVo.setUserId(user.getId()+"");
			    		userBgInfoMapper.insertUserBgInfo(tempVo);
			    	}else if(count != 0 && user == null){//存在了报名，不存在用户
			    		tempVo.setPwd(MD5.GetMD5Code(MD5.GetMD5Code(tempVo.getPnum().substring(tempVo.getPnum().length()-6))));
			    		 tempVo.setTechnical(tempVo.getZyjs());
			    		userBgInfoMapper.insertUserInfo(tempVo);
			    		 UserInfo temp=new UserInfo();
			    		 temp.setPnum(tempVo.getPnum());
			    		 temp=userInfoMapper.selectYg(temp);
			    		 tempVo.setUserId(temp.getId()+"");
			    		
			    		 userBgInfoMapper.updateUserBgInfo(tempVo);
			    	}else{
			    		tempVo.setUserId(user.getId()+"");
			    		 tempVo.setTechnical(tempVo.getZyjs());
			    		userBgInfoMapper.updateUserInfo(tempVo);
			    		userBgInfoMapper.updateUserBgInfo(tempVo);
			    	}
			    	
				}
	}
	 /**
     * 报名表列表信息获取
     * @param record
     * @return
     */
	@Override
	public List<BmbInfo> queryBmbList(BmbInfo record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		List<BmbInfo> list = userBgInfoMapper.queryBmbList(record);
		return list;
	}
	/**
	 * 根据条件获取报名用户的信息
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@Override
	public JSONObject queryUserBgInfoByParam(Map<String, Object> map) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 resJsonObj.put("flag", "0");
			 resJsonObj.put("bmbInfo", userBgInfoMapper.queryUserBgInfoByParam(map));
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	/**
	 * 审核报名用户操作
	 * @param response
	 * @param request
	 * @throws Exception
	 */
	@Override
	public JSONObject checkUserBgInfo(Map<String, Object> params) {
		JSONObject resJsonObj = new JSONObject();
		try {
			 userBgInfoMapper.checkUserBgInfo(params);
			 resJsonObj.put("flag", "0");
		} catch (Exception e) {
			resJsonObj.put("flag", "1");
			resJsonObj.put("errorMsg", e.getMessage());
		}
		return resJsonObj;
	}
	@Override
	public void bmExport(HttpServletResponse response,HttpServletRequest request) throws Exception {
		try {
			List<Map<String, Object>> list = userBgInfoMapper.queryBmbList2(null);
			List<ExpExcelBmbInfo> list2=new ArrayList<ExpExcelBmbInfo>();
			if(list!=null && list.size()>0){
				for(int i=0;i<list.size();i++){
					Map<String, Object> m=list.get(i);
					ExpExcelBmbInfo e =new ExpExcelBmbInfo();
					e.setBmName(m.get("pno_name")==null?"":m.get("pno_name").toString());
					e.setTel(m.get("tel")==null?"":m.get("tel").toString());
					e.setWorkName(m.get("work_name")==null?"":m.get("work_name").toString());
					e.setIsState(m.get("is_state")==null?"":m.get("is_state").toString());
		            
					e.setSex(m.get("sex")==null?"":m.get("sex").toString());
					e.setMz(m.get("mz")==null?"":m.get("mz").toString());
					e.setPartyName(m.get("party_name")==null?"":m.get("party_name").toString());
		            e.setBgDepartmentId(m.get("bg_department_id")==null?"":m.get("bg_department_id").toString());
		            e.setPlaceName(m.get("place_name")==null?"":m.get("place_name").toString());
		            e.setTechnical(m.get("technical")==null?"":m.get("technical").toString());
		            ResultConstant.mapToDate(DateUtil.OYYYY_MM_DD,m, "birth_date");
		            e.setBrith(m.get("birth_date")==null?"":m.get("birth_date").toString());
		            e.setDomicilePlace(m.get("domicile_place")==null?"":m.get("domicile_place").toString());
		            e.setDegree(m.get("degree")==null?"":m.get("degree").toString());
		            e.setRemark(m.get("remark")==null?"":m.get("remark").toString());
		            
					if(e.getIsState().equals("0")){
						e.setIsState("待审核");
					}else if(e.getIsState().equals("1")){
						e.setIsState("审核成功");
					}else if(e.getIsState().equals("2")){
						e.setIsState("审核失败");
					}else{
						e.setIsState("未知");
					}
					
					e.setName(m.get("name")==null?"":m.get("name").toString());
					e.setPnum(m.get("pnum")==null?"":m.get("pnum").toString());
					e.setCj(m.get("cj")==null?"":m.get("cj").toString());
					e.setXs(m.get("xs")==null?"":m.get("xs").toString());
					list2.add(e);
				}
			}

			ExcelExport<ExpExcelBmbInfo> ex = new ExcelExport<ExpExcelBmbInfo>();
			String fileName = "学员报名.xls";  
			OutputStream output =ResultConstant.outputStream(request, response, fileName);
			List resultList=new ArrayList(); 
			resultList.add(list2);
			List<String> titleList=new ArrayList<String>(); 
			titleList.add("学员报名");
			Map<String,Object>title=new HashMap<String, Object>();
			ex.exportExcel2(titleList, resultList, title,output);

		} catch (IOException e) {
			e.printStackTrace();
		}

	}	
	
}
