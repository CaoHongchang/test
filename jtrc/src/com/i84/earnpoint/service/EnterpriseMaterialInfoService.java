package com.i84.earnpoint.service;

import java.util.List;

import com.i84.earnpoint.model.EnterpriseMaterialInfo;

public interface EnterpriseMaterialInfoService {
	    int insertEnterpriseMaterialInfo(EnterpriseMaterialInfo enterpriseMaterialInfo);
	    int updateEnterpriseMaterialInfo(EnterpriseMaterialInfo enterpriseMaterialInfo);
	    List<EnterpriseMaterialInfo> listEnterpriseMaterialInfo(EnterpriseMaterialInfo enterpriseMaterialInfo);
	    int invalidEnterpriseMaterialInfo(String ids);
}
