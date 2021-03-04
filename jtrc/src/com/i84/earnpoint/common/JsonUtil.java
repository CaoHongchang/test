package com.i84.earnpoint.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletResponse;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import net.sf.json.JsonConfig;
import net.sf.json.util.CycleDetectionStrategy;

/**
 * @author liu_quan
 *
 */
public class JsonUtil {
	/**
	 * 从一个JSON 对象字符格式中得到一个java对象
	 * 
	 * @param jsonString
	 * @param pojoCalss
	 * @return
	 */
	public static Object getObject4JsonString(String jsonString, Class pojoCalss) {
		Object pojo;
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		pojo = JSONObject.toBean(jsonObject, pojoCalss);
		return pojo;
	}

	/**
	 * 从json HASH表达式中获取一个map，改map支持嵌套功能
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Map getMap4Json(String jsonString) {
		JSONObject jsonObject = JSONObject.fromObject(jsonString);
		Iterator keyIter = jsonObject.keys();
		String key;
		Object value;
		Map valueMap = new HashMap();

		while (keyIter.hasNext()) {
			key = (String) keyIter.next();
			value = jsonObject.get(key);
			valueMap.put(key, value);
		}

		return valueMap;
	}

	/**
	 * 将一个java对象转换为object对象
	 * 
	 * @param object
	 * @return
	 */
	public static Map getMap4Object(Object object) {
		String josn = getJsonString4JavaPOJO(object);
		return getMap4Json(josn);
	}

	/**
	 * 从json数组中得到相应java数组
	 * 
	 * @param jsonString
	 * @return
	 */
	public static JSONArray getObjectArray4Json(String jsonString) {
		if("".equals(jsonString)){
			JSONArray jsonArray = new JSONArray();
			return jsonArray;
		}else{
			JSONArray jsonArray = JSONArray.fromObject(jsonString);
			return jsonArray;
		}
		
	}

	/**
	 * 从json对象集合表达式中得到一个java对象列表
	 * 
	 * @param jsonString
	 * @param pojoClass
	 * @return
	 */
	public static List getList4Json(String jsonString, Class pojoClass) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		JSONObject jsonObject;
		Object pojoValue;

		List list = new ArrayList();
		for (int i = 0; i < jsonArray.size(); i++) {

			jsonObject = jsonArray.getJSONObject(i);
			pojoValue = JSONObject.toBean(jsonObject, pojoClass);
			list.add(pojoValue);

		}
		return list;

	}

	/**
	 * 从json数组中解析出java字符串数组
	 * 
	 * @param jsonString
	 * @return
	 */
	public static String[] getStringArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		String[] stringArray = new String[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			stringArray[i] = jsonArray.getString(i);

		}

		return stringArray;
	}

	/**
	 * 从json数组中解析出javaLong型对象数组
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Long[] getLongArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Long[] longArray = new Long[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			longArray[i] = jsonArray.getLong(i);

		}
		return longArray;
	}

	/**
	 * 从json数组中解析出java Integer型对象数组
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Integer[] getIntegerArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Integer[] integerArray = new Integer[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			integerArray[i] = jsonArray.getInt(i);

		}
		return integerArray;
	}

	/**
	 * 从json数组中解析出java Integer型对象数组
	 * 
	 * @param jsonString
	 * @return
	 */
	public static Double[] getDoubleArray4Json(String jsonString) {

		JSONArray jsonArray = JSONArray.fromObject(jsonString);
		Double[] doubleArray = new Double[jsonArray.size()];
		for (int i = 0; i < jsonArray.size(); i++) {
			doubleArray[i] = jsonArray.getDouble(i);

		}
		return doubleArray;
	}

	/**
	 * 将java对象转换成json字符串
	 * 
	 * @param javaObj
	 * @return
	 */
	public static String getJsonString4JavaPOJO(Object javaObj) {

		JSONObject json;
		json = JSONObject.fromObject(javaObj);
		return json.toString();

	}

	/**
	 *除去不想生成的字段（特别适合去掉级联的对象）
	 * 
	 * @param javaObj
	 * @return
	 */
	public static String getJsonString4JavaPOJO(Object javaObj,JsonConfig configJson) {

		JSONObject json;
		json = JSONObject.fromObject(javaObj,configJson);
		return json.toString();

	}
	/**
	 * 
	 * 
	 * @param excludes
	 *            除去不想生成的字段
	 
	 * @return
	 */
	public static JsonConfig configJson(String[] excludes) {
		JsonConfig jsonConfig = new JsonConfig();
		jsonConfig.setExcludes(excludes);
		jsonConfig.setIgnoreDefaultExcludes(true);
		jsonConfig.setCycleDetectionStrategy(CycleDetectionStrategy.LENIENT);
		
		return jsonConfig;
	}

	
	public static String getJsonString4JavaArray(Object[] objects) {
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(objects);
		return jsonArray.toString();
	}

	

	/**
	 * 向页面回去data字符串
	 * 
	 * @param response
	 * @param data
	 */
	public static void returnJsonStringData(HttpServletResponse response,
			String data) {
		PrintWriter out = null;
		try {
			out = response.getWriter();
			out.write(data);
			out.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	/**
     * 返回两个JsonArray的合并后的字符串
     * @param mData
     * @param array
     * @return
     */
    public static String joinJSONArray(JSONArray mData, JSONArray array) {
        StringBuffer buffer = new StringBuffer();
        try {
          int len = mData.size();
          for (int i = 0; i < len; i++) {
            JSONObject obj1 = (JSONObject) mData.get(i);
            if (i == len - 1)
              buffer.append(obj1.toString());
            else
              buffer.append(obj1.toString()).append(",");
          }
          len = array.size();
          if (len > 0)
            buffer.append(",");
          for (int i = 0; i < len; i++) {
            JSONObject obj1 = (JSONObject) array.get(i);
            if (i == len - 1)
              buffer.append(obj1.toString());
            else
              buffer.append(obj1.toString()).append(",");
          }
//          buffer.insert(0, "[").append("]");
          return buffer.toString();
        } catch (Exception e) {
        }
        return null;
      }
	/**
	 * 将list转换为json字符串
	 * 
	 * @param list
	 * @return
	 */
	public static String getJsonArray4JavaList(List list) {
		JSONArray jsonArray;
		jsonArray = JSONArray.fromObject(list);
		//String jsonArrayStr = jsonArray.toString();
		//jsonArrayStr = jsonArrayStr.substring(jsonArrayStr.indexOf("["));
		return jsonArray.toString();
	}
	
	 // 创建JSONObject对象  
    private static JSONObject createJSONObject() {  
        JSONObject jsonObject = new JSONObject();  
        jsonObject.put("ret", new Integer(0));  
        jsonObject.put("msg", "query");  
        JSONObject dataelem1=new JSONObject();  
        //{"deviceid":"SH01H20130002","latitude":"32.140","longitude":"118.640","speed":"","orientation":""}  
        dataelem1.put("deviceid", "SH01H20130002");  
        dataelem1.put("latitude", "32.140");  
        dataelem1.put("longitude", "118.640");  
   
        JSONObject dataelem2=new JSONObject();  
        //{"deviceid":"SH01H20130002","latitude":"32.140","longitude":"118.640","speed":"","orientation":""}  
        dataelem2.put("deviceid", "SH01H20130002");  
        dataelem2.put("latitude", "32.140");  
        dataelem2.put("longitude", "118.640");  
          
     // 返回一个JSONArray对象  
        JSONArray jsonArray = new JSONArray();  
          
        jsonArray.add(0, dataelem1);  
        jsonArray.add(1, dataelem2);  
        jsonObject.element("data", jsonArray);  
  
          
        return jsonObject;  
    }  
    public static void main(String[] args) {
		String str = "{phone:[da_dtype=A&da_dpno=&da_name=&da_old_name=&da_sex=1]}";
		getJsonString4JavaPOJO(str);
	}
   
}

