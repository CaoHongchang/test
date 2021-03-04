package com.i84.listener;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class OnlineUserListener implements HttpSessionListener {

	@Override
	public void sessionCreated(HttpSessionEvent event) {
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		ServletContext application = session.getServletContext();
		/*
		 * // 取得登录的用户名
		 * String username = (String) session.getAttribute("username");
		 * 
		 * // 从在线列表中删除用户名
		 * List onlineUserList = (List) application.getAttribute("onlineUserList");
		 * onlineUserList.remove(username);
		 */
		Map login = (HashMap) (application.getAttribute("LOGIN"));
		if (login == null) {
			login = new HashMap();
		}
		String uid = session.getAttribute("uid") + "";
		login.remove(uid);
		session.removeAttribute("uid");
		application.setAttribute("LOGIN", login);

		System.out.println(uid + "超时退出。");
	}

}
