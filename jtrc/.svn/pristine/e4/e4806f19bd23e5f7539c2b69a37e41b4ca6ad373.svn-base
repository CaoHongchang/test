package com.i84.earnpoint.common;

import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.http.HttpServletResponse;

public class BaseController {

	public void result(String rs,HttpServletResponse response){
		
		if("null".equals(rs))
			rs="";
		response.setContentType("text/html;charset=gbk");
		OutputStream outPrint;
		try {
			outPrint = response.getOutputStream();
			outPrint.write(rs.getBytes());
			outPrint.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	
	}
}
