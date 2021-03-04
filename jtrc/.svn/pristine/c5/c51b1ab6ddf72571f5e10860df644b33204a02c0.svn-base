package com.i84.earnpoint.hygsgl.service.impl;


import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.hygsgl.service.YwslShInfoService;
import com.i84.earnpoint.mapper.BusinessOtherInfoMapper;
import com.i84.earnpoint.mapper.DealBusinessInfoMapper;
import com.i84.earnpoint.mapper.RoleMapper;
import com.i84.earnpoint.model.DealBusinessInfo;


/**
 * 业务受理审核
 * @author liu_quan
 *
 */
@Service
public class YwslShInfoServiceImpl implements YwslShInfoService{
	@Autowired
	private DealBusinessInfoMapper dealBusinessInfoMapper;
	@Autowired
	private RoleMapper roleMapper;
	@Autowired
	private BusinessOtherInfoMapper businessOtherInfoMapper;
	@Override
	public boolean addYwsl(Map<String, Object> map) {
		String id=map.get("id").toString();
		String sstate=map.get("sstate").toString();//审核状态 0:已受理  1:驳回   2:已审核 3:审核失败4：未审核：5办结
		String sMsg=map.get("sMsg")==null?null:map.get("sMsg").toString();//审核意见
		map.put("sbDate",new Date());//业务受理审核时间(对应每个环节当前受理审核时间)
		String sUid2=map.get("sUid2")==null?null:map.get("sUid2").toString();//审核人=>受理人2(实际操作人员也就是当前登录用户)
		map.put("sUid2", sUid2);

		String nextRemark=map.get("remark")==null?"":map.get("remark").toString();//下一步转交角色   
		String curRemark=map.get("curRemark")==null?"":map.get("curRemark").toString();//当前环节
		//如果当前环节为“业务受理”remark=1
		if(StringUtils.isNotEmpty(curRemark)&&curRemark.equals("1")){//remark值    1:受理人 2:指定相关业务受理人 3:宏业公司 4：自定相关部门 5领导审核：
			map.put("remark", curRemark);
			//map.put("sDate", new Date());//受理时间(默认取第一次受理的时间，也就是第一环节受理的时间)
			String pno="SL"+ResultConstant.getRandNum(7);
			map.put("pno",pno);
			while(true){//受理单是否存在
			Map<String,Object> isMap=dealBusinessInfoMapper.selectIsYwsl(map);
			if(isMap!=null&&Integer.valueOf(isMap.get("total").toString())>0){
				map.put("pno","SL"+ResultConstant.getRandNum(7));
			}else{
				break;
			}
			}
			
			
		}else{//其它环节不修改
			map.put("remark", null);
			map.put("sUid", null);
			
			
		}

        
		map.put("sDate", new Date());//受理时间
		int c=dealBusinessInfoMapper.updateDealBusiness(map);

		if(c>0){//下一步转交
			if(StringUtils.isNotEmpty(nextRemark)&&!curRemark.equals("5")){//领导审核环节则无下一步
				//状态不为“驳回”和”审核失败“
				if(!sstate.equals("1")&&!sstate.equals("3")){
					DealBusinessInfo db=dealBusinessInfoMapper.selectByPrimaryKey(Integer.valueOf(id));
					String sUid=map.get("zdSUid")==null?null:map.get("zdSUid").toString();//指定审核人=>受理人
					Map<String, Object> map2=new HashMap<String, Object>();
					map2.put("parentId", id);
					map2.put("sUid", sUid);
					
					map2.put("remark", nextRemark);
					map2.put("sbDate", new Date());//业务受理审核时间
					map2.put("addDate", db.getAddDate());
					//map2.put("sDate", new Date());//受理时间(默认取第一次受理的时间，也就是第一环节受理的时间)
					map2.put("enterpriseId", db.getEnterpriseId());
					map2.put("businessId", db.getBusinessId());//业务id
					map2.put("pno", db.getPno());
					map2.put("uid", db.getUid());//申请人
					map2.put("sstate", "4");
					//map2.put("sMsg", sMsg);//审核意见默认=上次审核意见
					map2.put("sType", 2);//申请类型：1：前台申请 2：后台申请
					map2.put("typeName", db.getTypeName());//选择其它时的类型名称
					
					//新增记录到下一环节
					c=dealBusinessInfoMapper.insertDealBusiness(map2);
					if(c>0){
						return true;
					}

				}
			}

			return true;
		}
		return false;
	}

	@Override
	public List<Map<String, Object>> selectYwslList(Map<String, Object> obj)throws Exception {
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
	}

	public List<Map<String, Object>> selectYwslshList(Map<String, Object> obj)throws Exception {
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslshList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
	}
	public List<Map<String,Object>>selectYwslByGlywjbList(Map<String,Object> obj)throws Exception{
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslByGlywjbList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
		
	}
	public List<Map<String,Object>>selectYwslByHyList(Map<String, Object>obj)throws Exception{
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslByHyList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
		
		
	}
	
	public List<Map<String,Object>>selectYwslByXgList(Map<String, Object>obj)throws Exception{
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslByXgList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
		
		
	}
	public List<Map<String,Object>>selectYwslByLdList(Map<String, Object>obj)throws Exception{
		ResultConstant.pageSet(obj);
		List<Map<String, Object>> list=dealBusinessInfoMapper.selectYwslByLdList(obj);
		if(list!=null && list.size()>0){
			for(int i=0;i<list.size();i++){
				Map<String, Object> m=list.get(i);	
				ResultConstant.mapToDate(m, "sqsj");
				ResultConstant.mapToDate(m, "slsj");
			}
		}
		return list;
		
		
	}
	
	@Override
	public List<Map<String, Object>> selectRoleByUser(Map<String, Object> obj) {
		return roleMapper.selectRoleByUser(obj);
	}

	public Map<String,Object>selectYwslMsg(Map<String,Object> obj){

		return dealBusinessInfoMapper.selectYwslMsg(obj);

	}

	/**导出业务受理1
	 * @param obj
	 * @return
	 */
	public Map<String,Object>selectExportYwsl(Map<String,Object> obj) {
		return dealBusinessInfoMapper.selectExportYwsl(obj);
	}
	/**导出业务受理2
	 * @param obj
	 * @return
	 */
	public List<Map<String,Object>>selectExportYwslList(Map<String, Object>m) {
		return dealBusinessInfoMapper.selectExportYwslList(m);
	}

	@Override
	public Map<String, Object> selectYwView(Map<String, Object> obj) {
		// TODO Auto-generated method stub
		return dealBusinessInfoMapper.selectYwView(obj);
	}
	public List<Map<String,Object>>selectByfjList(Map<String, Object>m) {
		return businessOtherInfoMapper.selectByfjList(m);
	}
	public Map<String,Object>selectYwViewZt(Map<String,Object> obj){
		return dealBusinessInfoMapper.selectYwViewZt(obj);
		
	}
	public List<Map<String,Object>>selectYwViewZtList(Map<String, Object>obj){
		return dealBusinessInfoMapper.selectYwViewZtList(obj);

		
	}

	@Override
	public boolean ldshEnd(Map<String, Object> map) {
			int c=dealBusinessInfoMapper.updateState(map);
			if(c>0){
				return true;
			}
			return false;
	}

	@Override
	public Map<String, Object> selectExportYwslHy(Map<String, Object> obj) {
		return dealBusinessInfoMapper.selectExportYwslHy(obj);
	}

}