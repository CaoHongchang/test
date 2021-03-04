package com.i84.earnpoint.system.enums;

import java.util.ArrayList;
import java.util.List;

import com.i84.earnpoint.model.Code;


/**
 * 日志等级
 * @author liu_quan
 */
public enum LogLevel {
	
	LogLevel_01("01", "信息"),
	LogLevel_02("02", "警告"),
	LogLevel_03("03", "错误");
	
	private String key;

	private String value;
	
	private LogLevel(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static List<Code> getCode() {
		List<Code> codes = new ArrayList<Code>();
		for(LogLevel logLevel : LogLevel.values()){
			Code code = new Code();
			code.setTypeInfoCode(logLevel.getKey());
			code.setTypeInfoName(logLevel.getValue());
			codes.add(code);
		}
		return codes;
	}
	
	public static String getCodeValue(String key) {
		String value = "";
		for(LogLevel logLevel : LogLevel.values()){
			if (key.equals(logLevel.getKey())) {
				value = logLevel.getValue();
				break;
			}
		}
		return value;
	}
	
	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}
}
