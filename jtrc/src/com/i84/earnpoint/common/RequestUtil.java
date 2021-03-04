package com.i84.earnpoint.common;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

public class RequestUtil {
	
	/**
	 * 获取所有请求参数
	 * @param request
	 * @return
	 */

	public static Map<String, Object> resolveParams(HttpServletRequest request) {
		Map<String, Object> result = new HashMap<String, Object>();
		for (Enumeration<String> paramNames = request.getParameterNames(); paramNames.hasMoreElements();) {
			String paramName = paramNames.nextElement();
			String[] values = request.getParameterValues(paramName);
			result.put(paramName+"_array", values);
			if (values.length > 1) {
				result.put(paramName, values);
			} else {
				result.put(paramName, values[0]);
			}
		}
		return result;
	}
}
