package com.i84.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class CheckLoginFilter implements Filter{
	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	@Override
	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
					throws IOException, ServletException {
		// TODO Auto-generated method stub

		HttpServletRequest request = (HttpServletRequest) servletRequest;
		HttpServletResponse response = (HttpServletResponse) servletResponse;
		HttpSession session = request.getSession();


		// 获得用户请求的URI
		String path = request.getRequestURI();
		String contextPath = request.getContextPath();
		String url = path.substring(contextPath.length());
		// System.out.println("=================CheckLoginFilter url=" + path);
		/*
		 * Person person =SessionUtils.getPerson(request);
		 * 
		 * if (person == null) {
		 * response.sendRedirect(contextPath+"/person.do?method=tologin");
		 * return;
		 * }
		 * if (person.getId()!=null&&person.getPassword()!=null) {
		 * filterChain.doFilter(servletRequest, servletResponse);
		 * return;
		 * }
		 */
		String indexPath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + request.getContextPath() + "/login.jsp";
		// System.out.println("=================CheckLoginFilter indexPath=" + indexPath);
		if (path.indexOf(".jsp") > 0 & path.indexOf("login") == -1) {
			// 是否登陆
			String uid = request.getSession().getAttribute("uid") + "";
			if (uid == null || "".equals(uid) || "null".equals(uid)) {
				response.sendRedirect(indexPath);
			}
			else {
				filterChain.doFilter(servletRequest, servletResponse);
			}
		}
		else {
			filterChain.doFilter(servletRequest, servletResponse);
		}
	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

}