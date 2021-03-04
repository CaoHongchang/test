package com.i84.earnpoint.rsdlgl.service.impl;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.RsBusinessInfoMapper;
import com.i84.earnpoint.mapper.TypeInfoMapper;
import com.i84.earnpoint.model.RsBusinessInfo;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.rsdlgl.service.TypeInfoService;


/**分类管理
 * @author zhengqr
 *
 */
@Service
public class TypeInfoServiceImpl implements TypeInfoService {
	@Autowired
	private TypeInfoMapper typeInfoMapper;
	@Autowired
	private RsBusinessInfoMapper rsBusinessInfoMapper;

	@Override
	public void deleteChildByPrimaryKeys(String ids,String childIds,HttpServletResponse response) throws Exception {
		String[] idChildArray = childIds.split(",");
		List<RsBusinessInfo> list = rsBusinessInfoMapper.findByIds(idChildArray);
		if(list != null && list.size()>0){
			ResultConstant.write(response, "该业务下已有用户申请业务，无法删除！");
		}else{
			try{
				for(String idChild:idChildArray){
					RsBusinessInfo businessInfo = new RsBusinessInfo();
					businessInfo.setId(Integer.parseInt(idChild));
					businessInfo.setDelDate(new Date());
					rsBusinessInfoMapper.updateByPrimaryKeySelective(businessInfo);
				}
				String[] idArray = ids.split(",");
				for(String string:idArray){
					TypeInfo typeInfo = new TypeInfo();
					typeInfo.setId(Integer.parseInt(string));
					typeInfo.setDelDate(new Date());
					typeInfoMapper.updateByPrimaryKeySelective(typeInfo);
				}
				ResultConstant.write(response, "1");
			}catch(Exception e){
				ResultConstant.write(response, "删除失败");
			}
		}
		
//		int delNums = typeInfoMapper.deleteByPrimaryKeys(idArray);
//		String[] idChildArray = childIds.split(",");
//		int delNums2 = rsBusinessInfoMapper.deleteByPrimaryKeys(idChildArray);
//		if(delNums>0 && delNums2>0){
//			ResultConstant.write(response, "1");
//		}else{
//			ResultConstant.write(response, "删除失败");
//		}
	}
	
	@Override
	public void deleteByPrimaryKeys(String ids,HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		String[] idArray = ids.split(",");
		List<TypeInfo> typeList = typeInfoMapper.findByIds2(idArray);
		if(typeList != null && typeList.size()>0){
//			result.put("errorMsg", "该类型有子节点，不能删除！");
			ResultConstant.write(response, "该分类下含有业务，无法删除！");
		}else{
			try{
				for(String string:idArray){
					TypeInfo typeInfo = new TypeInfo();
					typeInfo.setId(Integer.parseInt(string));
					typeInfo.setDelDate(new Date());
					typeInfoMapper.updateByPrimaryKeySelective(typeInfo);
				}
				ResultConstant.write(response, "1");
			}catch(Exception e){
				e.printStackTrace();
				ResultConstant.write(response, "删除失败");
			}
			
//			int delNums = typeInfoMapper.deleteByPrimaryKeys(idArray);
//			if(delNums>0){
//				ResultConstant.write(response, "1");
//			}else{
//				ResultConstant.write(response, "删除失败");
//			}
		}
		
	}

	@Override
	public void deleteMunu(TypeInfo typeInfo, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void insert(TypeInfo typeInfo, HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		int saveNums = typeInfoMapper.insertSelective(typeInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "保存失败");
		}
		
	}
	
	@Override
	public void insertChild(TypeInfo typeInfo,RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception {
		JSONObject result=new JSONObject();
		
		int saveNums = typeInfoMapper.insertChild(typeInfo);
		rsBusinessInfo.setBusinessId(typeInfo.getId());
		int saveNums2 = rsBusinessInfoMapper.insert(rsBusinessInfo);
		if(saveNums > 0 && saveNums2 > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "保存失败");
		}
		
	}

	@Override
	public void saveMunu(TypeInfo typeInfo, HttpServletResponse response)
			throws Exception {
		// TODO Auto-generated method stub
		
	}

	@Override
	public TypeInfo selectByPrimaryKey(Integer id) {
		return typeInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public List<TypeInfo> selectListByPrimaryKey(TypeInfo typeInfo) {
		return typeInfoMapper.selectListByPrimaryKey(typeInfo);
	}

	@Override
	public void updateByPrimaryKey(TypeInfo typeInfo, HttpServletResponse response) throws Exception{
        JSONObject result=new JSONObject();
		int saveNums = typeInfoMapper.updateByPrimaryKey(typeInfo);
		if(saveNums>0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
	}
	
	@Override
	public void updateChildByPrimaryKey(TypeInfo typeInfo,RsBusinessInfo rsBusinessInfo, HttpServletResponse response) throws Exception{
        JSONObject result=new JSONObject();
        int saveNums = typeInfoMapper.updateByPrimaryKey(typeInfo);
		int saveNums2 = rsBusinessInfoMapper.updateByPrimaryKeySelective(rsBusinessInfo);
		if(saveNums>0 && saveNums2 > 0){
			ResultConstant.write(response, "1");
		}else{
			ResultConstant.write(response, "修改失败");
		}
	}

	@Override
	public int updateByPrimaryKeySelective(TypeInfo typeInfo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TypeInfo> selectListByPrimary(TypeInfo record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		List<TypeInfo> list = typeInfoMapper.selectListByPrimary(record);
		return list;
	}
	
	@Override
	public List<TypeInfo> selectChildListByPrimary(TypeInfo record) {
		PageHelper.startPage(record.getPage(),record.getRows());
		List<TypeInfo> list = typeInfoMapper.selectChildListByPrimary(record);
		return list;
	}

	@Override
	public List<TypeInfo> loadTypeInfo() {
		TypeInfo record = new TypeInfo();
		record.setIsValid("1");
		record.setTypeId(5);
		record.setParentId(0);
		List<TypeInfo> list = typeInfoMapper.selectListByPrimary(record);
		return list;
	}

	@Override
	public String getNextPno() {
		String pno = "001";
		try{
			pno = typeInfoMapper.getNextPno();
			if(StringUtils.isBlank(pno) || pno.length() == 0){
				pno = "001";
			}else{
				int temp = Integer.parseInt(pno)+1;
				if(temp < 10){
					pno = "00" + temp;
				}else if(temp < 100){
					pno = "0" + temp;
				}else if(temp < 1000){
					pno = ""+temp;
				}
			}
		}catch(Exception e){
			e.printStackTrace();
			pno = "001";
		}
		return pno;
	}

	@Override
	public List<Map<String, Object>> businessTypeStatistics(String year1,
			String year2) {
		List<Map<String, Object>> list = typeInfoMapper.businessTypeStatistics(year1, year2);
		return list;
	}

	@Override
	public List<Map<String, Object>> handle(String year1, String year2,
			String timeType) {
		List<Map<String, Object>> list = typeInfoMapper.handle(year1, year2,timeType);
		return list;
	}
	
}
