package com.i84.earnpoint.system.enums;

import java.util.ArrayList;
import java.util.List;

import com.i84.earnpoint.model.Code;


/**
 * 操作类型
 * @author liu_quan
 */
public enum OperateType {
	
	OperateType_01("01", "新增"),
	OperateType_02("02", "修改"),
	OperateType_03("03", "删除"),
	OperateType_04("04", "导入"),
	OperateType_05("05", "导出"),
	OperateType_06("06", "查询"),
	OperateType_07("07","上传"),
	OperateType_08("08","登录"),
	OperateType_09("09","登出");
		
	private String key;

	private String value;
	
	private OperateType(String key, String value) {
		this.key = key;
		this.value = value;
	}
	
	public static List<Code> getCode(){
		List<Code> codes = new ArrayList<Code>();
		for(OperateType operatorType : OperateType.values()){
			Code code = new Code();
			code.setTypeInfoCode(operatorType.getKey());
			code.setTypeInfoName(operatorType.getValue());
			codes.add(code);
		}
		return codes;
	}
	
	public static String getCodeValue(String key) {
		String value = "";
		for(OperateType operateType : OperateType.values()){
			if (key.equals(operateType.getKey())) {
				value = operateType.getValue();
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
