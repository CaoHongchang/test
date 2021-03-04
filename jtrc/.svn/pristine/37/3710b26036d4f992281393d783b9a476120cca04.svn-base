package com.i84.earnpoint.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletResponse;




import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.i84.earnpoint.common.ResultConstant;
import com.i84.earnpoint.mapper.ZxTypeInfoMapper;
import com.i84.earnpoint.model.TypeInfo;
import com.i84.earnpoint.service.ZxTypeInfoService;

@Service
public class ZxTypeInfoServiceImpl implements ZxTypeInfoService{
	@Autowired
	private ZxTypeInfoMapper zxTypeInfoMapper;

	@Override
	public int insertTypeInfo(TypeInfo typeInfo) {
		// TODO Auto-generated method stub
		return zxTypeInfoMapper.insertTypeInfo(typeInfo);
	}

	@Override
	public int updateTypeInfo(TypeInfo typeInfo) {
		// TODO Auto-generated method stub
		return zxTypeInfoMapper.updateTypeInfo(typeInfo);
	}



	@Override
	public List<TypeInfo> listTypeInfoByParentid(Integer parent_id) {
		// TODO Auto-generated method stub
		return zxTypeInfoMapper.listTypeInfoByParentid(parent_id);
	}

	@Override
	public TypeInfo selectTypeInfoByPno(String pno) {
		// TODO Auto-generated method stub
		List<TypeInfo> typeInfos=zxTypeInfoMapper.selectTypeInfoByPno(pno);
		return typeInfos!=null&&typeInfos.size()>0?typeInfos.get(0):null;
	}

	@Override
	public TypeInfo selectTypeInfoByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return zxTypeInfoMapper.selectTypeInfoByPrimaryKey(id);
	}

	@Override
	public void deleteTypeInfoByPrimaryKeys(String ids,
			HttpServletResponse response) throws Exception{
			
			String[] idArray = ids.split(",");
			List<TypeInfo> typeList = zxTypeInfoMapper.findByIds(idArray);
			if(typeList != null && typeList.size()>0){
				ResultConstant.write(response, "该类型有子节点，不能删除！");
			}else{
				int delNums = zxTypeInfoMapper.deleteTypeInfoByPrimayKeys(idArray);
				if(delNums>0){
					ResultConstant.write(response, "1");
				}else{

					ResultConstant.write(response, "删除失败");
				}
			}
			
		}

	@Override
	public int selectMaxSeqByParentId(Integer parentId) {
		// TODO Auto-generated method stub
		Integer result=zxTypeInfoMapper.selectMaxSeqByParentId(parentId);
		return result==null?0:result;
	}

	@Override
	public List<TypeInfo> queryZxTypeInfos(TypeInfo typeInfo) {
		// TODO Auto-generated method stub
		return zxTypeInfoMapper.selectBySelective(typeInfo);
	}

	@Override
	public TypeInfo getChildTypeInfoIfExists(String pno, Integer id) {
		return zxTypeInfoMapper.selectByPnoAndId(pno, id);
	}
		
	
}

	
