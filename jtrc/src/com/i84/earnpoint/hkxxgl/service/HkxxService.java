package com.i84.earnpoint.hkxxgl.service;

import java.util.List;
import java.util.Map;

public interface HkxxService {

	List<Map<String,Object>> GetHkxxList(Map<String,Object> params);
	
	Map<String,Object> AddHkxx(Map<String, Object> params) throws Exception;

	Map<String, Object> UpdateHkxx(Map<String, Object> params) throws Exception;

	Map<String, Object> GetHkxxInformation(Integer id);

	Map<String, Object> Hkjc(String hkjcdata)  throws Exception;

	Map<String, Object> GetLatestHkjc(Integer id);

	Map<String, Object> Hkgh(String hkghdata) throws Exception;

	List<Map<String, Object>> GetHkxxHisInformation(Map<String, Object> params);

	List<Map<String, Object>> GetHkxxHisInformation1(Map<String, Object> params);
}
