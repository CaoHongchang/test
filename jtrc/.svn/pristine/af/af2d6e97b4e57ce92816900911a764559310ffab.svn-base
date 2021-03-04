package com.i84.earnpoint.zcps.controller;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.common.TextUtil;
import com.i84.earnpoint.common.excel.ExcelExport;
import com.i84.earnpoint.model.ExpertAssignWorkPo;
import com.i84.earnpoint.model.UserExpertInfo;
import com.i84.earnpoint.model.ZcActivityGet;
import com.i84.earnpoint.model.ZcDissertationInfo;
import com.i84.earnpoint.model.ZcDissertationScore;
import com.i84.earnpoint.zcps.service.ExpertActivityInfoService;
import com.i84.earnpoint.zcps.service.ExpertDissertationInfoService;
import com.i84.earnpoint.zcps.service.ZcActivityGetService;
import com.i84.earnpoint.zcps.service.ZcDissertationInfoService;
/**
 * 职称申报--论文专著鉴定分配管理，论文专著鉴定成绩管理
 * @author CHEN
 *
 */
@Controller
@RequestMapping("/zcps")
public class ExpertDissertationInfoController extends ResultConstant{
	@Autowired
	private ExpertDissertationInfoService expertDissertationInfoService;

	@Autowired
	private ZcDissertationInfoService zcDissertationInfoService;

	@Autowired
	private ExpertActivityInfoService expertActivityInfoService;

	@Autowired
	private ZcActivityGetService zcActivityGetService;
	/**
	 * 自动分配专家
	 * @param param
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/autoAssignExpert")
	public void autoAssignExpert(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Integer uid=TextUtil.getInt(request.getSession().getAttribute("uid"));
		param.put("uid", uid);
		write( response,expertDissertationInfoService.autoAssignExperts(param));
	}
	/**
	 * 查询专家论文信息
	 * @param param
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryExpertDissertationInfos")
	public @ResponseBody Map<String,Object> queryExpertDissertationInfos(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
		int page=TextUtil.getInt(param.get("page"));
		page=page<=0?1:page;
		int rows=TextUtil.getInt(param.get("rows"));
		rows=rows<=0?10:rows;
		PageHelper.startPage(page, rows);
		List<Map<String,Object>> list=expertDissertationInfoService.listExpertDissertationInfos(param);
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageInfo.getTotal(), true, "");
	}
	/**
	 * 导出有任务的专家
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/exportHasAssignWorkExperts")
	public void exportHasAssignWorkExperts(HttpServletRequest request,HttpServletResponse response)throws Exception{
		List<ExpertAssignWorkPo> expertAssignWorkPos=expertDissertationInfoService.listExpertAssignWorkPos(null);
		response.setHeader("Content-Type", "application/force-download;");
		String filename=encodeFilename2(request, "专家任务信息"+new SimpleDateFormat("yyyyMMddHHmmss").format(new Date())+".xls");
		response.setHeader("Content-disposition", "attachment;"+filename);
		response.setContentType("application/ms-excel");
		ExcelExport<ExpertAssignWorkPo> excelExport=new ExcelExport<ExpertAssignWorkPo>();
		excelExport.exportExcel("专家任务信息表", expertAssignWorkPos, response.getOutputStream());
	}
	/**
	 * 删除所有论文分配的专家
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/deleteAllAssignedExperts")
	public void deleteAllAssignedExperts(HttpServletRequest request,HttpServletResponse response)throws Exception{
		String activityId=request.getParameter("activityId");
		String rs= expertDissertationInfoService.deleteAllAssignedExperts(activityId==null?null:TextUtil.getInt(activityId));
		write( response,rs);
	}

	/**
	 * 再次自动分配专家
	 * @param param
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/autoAssignExpertAgain")
	public void autoAssignExpertAgain(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
		Integer uid=TextUtil.getInt(request.getSession().getAttribute("uid"));
		param.put("uid", uid);
		write(response,expertDissertationInfoService.autoAssignExpertsAgain(param));
	}

	/**
	 * 结束之前的分配
	 * 
	 * @param param
	 * @param request
	 * @param response
	 * @throws Exception
	 */
	@RequestMapping("/cloaseScore")
	public void cloaseScore(@RequestParam Map<String, Object> param, HttpServletRequest request, HttpServletResponse response) throws Exception {
		Integer uid = TextUtil.getInt(request.getSession().getAttribute("uid"));
		param.put("uid", uid);
		write(response, expertDissertationInfoService.cloaseScore(param));
	}

	/**
	 * 查询论文的分配情况
	 * 
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryDissertationAssignState")
	public @ResponseBody Map<String,Object> queryDissertationAssignState(HttpServletRequest request,HttpServletResponse response)throws Exception{

		String lwIds=request.getParameter("lwIds");
		String ids=request.getParameter("ids");
		String pnos=request.getParameter("pnos");
		String expertIds=request.getParameter("expertIds");
		int length=TextUtil.getInt(request.getParameter("length"));
		System.out.println(ids);
		String array[]=null;
		//修改分配时原来的分配ids
		String array2[]=null;
		if(lwIds!=null){
			//论文ids
			array=lwIds.split(",",length);
			array2=ids.split(",",length);
		}else if(pnos!=null){
			//论文编号
			array=pnos.split(",",length);
		}
		if(array==null){
			return resultMap(false, "不存在需要修改或新增的分配！");
		}
		//专家ids
		String []array1=expertIds.split(",",length);
		//标记是否包含错误信息
		boolean containErrMsg=false;
		List<Map<String,Object>> list=new ArrayList<Map<String,Object>>();
		//遍历数组
		for(int i=0;i<array.length;i++){
			//记录错误提示信息
			StringBuilder errMsg=new StringBuilder();
			String searchStr=array[i].trim();
			String expertId=array1[i].trim();
			ZcDissertationInfo zcDissertationInfo;
			Integer activityId;
			ZcActivityGet zcActivityGet=null;
			//获得专家信息
			UserExpertInfo userExpertInfo=expertDissertationInfoService.selectUserExpertInfoByZpno(expertId);
			Map<String,Object> item=new HashMap<String, Object>();
			//获得论文信息
			if(lwIds!=null){
				zcDissertationInfo=zcDissertationInfoService.selectByPrimaryKey(TextUtil.getInt(searchStr));
				activityId=zcDissertationInfo.getActivityId();
				item.put("id", array2[i]);//原来的分配id
			}
			else{
				zcDissertationInfo=expertDissertationInfoService.selectZcDissertationInfoByPno(searchStr);
				activityId=TextUtil.getInt(request.getParameter("activityId"));
				item.put("id", null);//新增分配时分配id置为null
			}

			if(zcDissertationInfo!=null&&zcDissertationInfo.getpNo()!=null&&!"".equals(zcDissertationInfo.getpNo())){
				//取得活动Id
				Integer uid=zcDissertationInfo.getUid();
				zcActivityGet=new ZcActivityGet();
				zcActivityGet.setActivityId(activityId);
				zcActivityGet.setUid(uid);
				//根据活动id和申报人id取得评审活动申报信息  ，一个申报人在一个活动下仅可申报一个专业
				zcActivityGet=zcActivityGetService.selectZcActivityGetByActivityIdAndUid(zcActivityGet);

			}else{
				errMsg.append("论文编号不存在;<br>");
			}
			//判断
			if(userExpertInfo==null||userExpertInfo!=null&&"".equals(expertId)){
				errMsg.append("专家编号不存在;<br>");
			}else{
				Map<String,Object> param=new HashMap<String, Object>();
				param.put("activityId", activityId);
				param.put("expertId", userExpertInfo.getId());
				//查询专家在某个活动中是否存在
				int size=expertActivityInfoService.queryExpertActivitys(param).size();
				if(size==0){
					errMsg.append("专家没有参与此次评审专家组;<br>");
				}else if(zcActivityGet!=null){
					//专家的工作单位
					String expertCom=TextUtil.getString(userExpertInfo.getCompany());
					//专家的专业
					String expertPro=TextUtil.getString(userExpertInfo.getProType());
					//申报人的工作单位
					String sbCom=TextUtil.getString(zcActivityGet.getWorkName());
					//申报人的专业
					String sbPro=TextUtil.getString(zcActivityGet.getsPro());
					if(expertCom.equals(sbCom)){
						errMsg.append("专家单位与申报者相同;<br>");
					}
					if(!expertPro.equals(sbPro)){
						errMsg.append("专家专业与申报者不同;<br>");
					}
				}
			}
			if(lwIds!=null){
				item.put("lwId", searchStr);
				if(zcDissertationInfo!=null){
					item.put("p_no", zcDissertationInfo.getpNo());
				}
			}
			else{
				item.put("p_no", searchStr);
				if(zcDissertationInfo!=null){
					item.put("lwId", zcDissertationInfo.getId());
				}

			}
			item.put("zpno",expertId);
			item.put("expert_id", userExpertInfo!=null?userExpertInfo.getId():null);
			item.put("errMsg", errMsg.toString());
			list.add(item);
			if(!errMsg.toString().isEmpty()){
				containErrMsg=true;
			}

		}
		if(containErrMsg){
			return resultMap(list, false, "");
		}else{
			Integer uid=TextUtil.getInt(request.getSession().getAttribute("uid"));
			changeAssign(list,uid==0?null:uid);
			return resultMap(true, "保存分配成功！");
		}

	}
	/**
	 * 查询论文的分配情况
	 * @param request
	 * @param response
	 * @return
	 * @throws Exception
	 */
	@RequestMapping("/queryDissertationAssign")
	public @ResponseBody Map<String,Object> queryDissertationAssign(@RequestParam Map<String,Object> param,HttpServletRequest request,HttpServletResponse response)throws Exception{
		int page=TextUtil.getInt(param.get("page"));
		page=page<=0?1:page;
		int rows=TextUtil.getInt(param.get("rows"));
		rows=rows<=0?10:rows;
		PageHelper.startPage(page, rows);
		List<Map<String,Object>> list=expertDissertationInfoService.queryDissertationAssign(param);
		PageInfo<Map<String,Object>> pageInfo=new PageInfo<Map<String,Object>>(list);
		return resultMap(list, pageInfo.getTotal(),true, null);
	}

	/**
	 * 删除论文分配
	 */
	@RequestMapping("/deleteDissertationAssign")
	public @ResponseBody Map<String,Object> deleteDissertationAssign(HttpServletRequest request,HttpServletResponse response)throws Exception{
		JSONObject object=new JSONObject();
		String lwIdsStr=request.getParameter("lwIds");
		String expertIdsStr=request.getParameter("expertIds");
		if(lwIdsStr==null){
			object.put("flag",false);
			object.put("cause","您当前尚未选择要删除分配的论文");
		}
		String lwIds[]=lwIdsStr.split(",");
		String expertIds[]=expertIdsStr.split(",");
		for(int i=0;i<lwIds.length;i++){
			Integer lwId=TextUtil.getInt(lwIds[i]);
			if(!expertIds[i].equals("")){
				Integer expertId=TextUtil.getInt(expertIds[i]);
				ZcDissertationScore record=new ZcDissertationScore();
				record.setrId(lwId);
				record.setExpertId(expertId);
				expertDissertationInfoService.delectDissertationAssign(record);
			}
		}
		return resultMap(true, null);
	}
	/**
	 * 更改分配
	 * @param assignList
	 */
	public void changeAssign(List<Map<String,Object>> assignList,Integer uid){
		if(assignList==null){
			return;
		}
		if(assignList.size()>0){
			try{
				for(Map<String,Object> assign:assignList){
					Integer rId=TextUtil.getInt(assign.get("lwId"));
					Integer expertId=TextUtil.getInt(assign.get("expert_id"));
					Integer id=TextUtil.getInt(assign.get("id"));
					ZcDissertationScore record=new ZcDissertationScore();
					record.setrId(rId);
					record.setExpertId(expertId);
					record.setAddDate(new Date());
					record.setUid(uid);
					if(id==0){
						expertDissertationInfoService.insertDissertationAssign(record);
					}else{
						record.setId(id);
						expertDissertationInfoService.updateDissertationAssign(record);
					}
				}
			}catch(Exception e){

			}
		}
	}
}
