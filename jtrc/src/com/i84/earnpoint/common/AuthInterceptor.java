package com.i84.earnpoint.common;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * 登录权限校验拦截器
 * Created by shiguangqi on 2016/10/18.
 */
public class AuthInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		HttpSession session = request.getSession(false);
		if (session == null) { return false; }
		String sessionid = session.getId();
		Map login = (HashMap)(request.getSession().getServletContext().getAttribute("LOGIN"));
		if(login==null){
			login=new HashMap();
		}

		String uid = request.getSession().getAttribute("uid")+"";
		String url=request.getRequestURI();
		// System.out.println("=================url=" + url);
		if(uid==null||"".equals(uid)||"null".equals(uid)||url.contains("users/loginout")||url.contains("xm/code")){
			return true;
		}else{
			if(login.containsKey(uid)){
				String sid = login.get(uid)+"";

				if(sessionid.equals(sid)){
					return true;
				}else{
					return false;
				}
			}
			return true;
		}

	}
}
