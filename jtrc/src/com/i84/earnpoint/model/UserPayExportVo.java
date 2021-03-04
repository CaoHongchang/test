package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 缴费信息导出
 * @author chenb
 *
 */
public class UserPayExportVo {
	@ExcelAnnotation(exportName="订单号")
	private String ddh;
	@ExcelAnnotation(exportName="付款时间")
	private String fksj;
	@ExcelAnnotation(exportName="付款交易号")
	private String fkjyh;
	@ExcelAnnotation(exportName="缴费状态")
	private String jfzt;
	@ExcelAnnotation(exportName="电话")
	private String dh;
	@ExcelAnnotation(exportName="姓名")
	private String xm;
	@ExcelAnnotation(exportName="身份证号")
	private String sfzh;
	public String getDdh() {
		return ddh;
	}
	public void setDdh(String ddh) {
		this.ddh = ddh;
	}
	public String getFksj() {
		return fksj;
	}
	public void setFksj(String fksj) {
		this.fksj = fksj;
	}
	public String getFkjyh() {
		return fkjyh;
	}
	public void setFkjyh(String fkjyh) {
		this.fkjyh = fkjyh;
	}
	public String getJfzt() {
		return jfzt;
	}
	public void setJfzt(String jfzt) {
		this.jfzt = jfzt;
	}
	public String getDh() {
		return dh;
	}
	public void setDh(String dh) {
		this.dh = dh;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getSfzh() {
		return sfzh;
	}
	public void setSfzh(String sfzh) {
		this.sfzh = sfzh;
	}
	
	
	
}
