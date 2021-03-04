package com.i84.earnpoint.rygl.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;


public interface RyAddORUpdateService {
	
	public Map<String,Object> AddORUpdate(HttpServletResponse response,HttpServletRequest request,Boolean type) throws Exception;
}
