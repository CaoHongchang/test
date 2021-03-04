package com.i84.earnpoint.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.i84.earnpoint.model.EnterpriseInfo;
import com.i84.earnpoint.model.ImpEnterpriseInfo;

public interface EnterpriseInfoService {
	EnterpriseInfo selectEnterpriseById(Integer id);
	List<EnterpriseInfo> listEnterpriseInfo(EnterpriseInfo enterpriseInfo);
    EnterpriseInfo selectEnterpriseBycCode(EnterpriseInfo enterpriseInfo);
    int insertEnterpriseInfo(EnterpriseInfo enterpriseInfo);
    int deleteEnterpriseInfo(Integer id);
    int updateEnterpriseInfo(EnterpriseInfo enterpriseInfo);
    EnterpriseInfo selectEnterpriseByPno(EnterpriseInfo enterpriseInfo);
    void insertQyList( List<ImpEnterpriseInfo> qyList,String uid)throws Exception;
	void qyExport(HttpServletResponse response,HttpServletRequest request)throws Exception;

}
