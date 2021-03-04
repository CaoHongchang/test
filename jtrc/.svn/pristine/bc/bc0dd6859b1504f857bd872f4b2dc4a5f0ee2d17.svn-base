package com.jtsjhj.webservice;

import javax.xml.namespace.QName;

import org.apache.axis2.addressing.EndpointReference;
import org.apache.axis2.client.Options;
import org.apache.axis2.rpc.client.RPCServiceClient;

import Decoder.BASE64Encoder;





public class ExchServiceTest {

	private static String serviceUrl = "http://218.85.65.4:30208/jtsjhj/services/ExchService?wsdl";

	
	  public static void main(String[] args) throws Exception {
		  ExchService  service = new ExchServiceStub(); 
		  Login login = new Login();
		  login.setAppId("hjqtmmbam3drgz31oe");
		  login.setAppSecret("k5f1l8hb9m3liu6vb6wyg4090ntbobr4"); 
		  LoginResponse resp = service.login(login);
		  String token = resp.get_return();
		  int beginIndex = token.indexOf("Token") + 6;
		  int endIndex = token.lastIndexOf("</Token");
		  String token1 = token.substring(beginIndex,endIndex);
		  
		  BASE64Encoder encoder = new BASE64Encoder();
		  String data = "<?xml version='1.0' encoding='GBK'?><Request><ResId>69562C3E056944BAB30436420AF56F1B</ResId><UpdateMode>FULL</UpdateMode><Rows></Rows></Request>";
		  byte[] textByte = data.getBytes("UTF-8");
		  String encodeBuffer = encoder.encodeBuffer(textByte);
		  ReceiveData receiveData = new ReceiveData();
		  receiveData.setToken(token1);// 从login方法返回值获取token
		  receiveData.setData(encodeBuffer);// xml格式数据
		  ReceiveDataResponse receiveDataResponse = service.receiveData(receiveData);
		  // 返回xml数据
		  String receiveDataResult = receiveDataResponse.get_return();
		  System.out.println("222"+receiveDataResult);

	  }

}
