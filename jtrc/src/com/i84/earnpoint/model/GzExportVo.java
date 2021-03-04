package com.i84.earnpoint.model;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 工资导出
 * @author liu_quan
 *
 */
public class GzExportVo {
	@ExcelAnnotation(exportName="工资发放时间")
	private String gzffsj;
	@ExcelAnnotation(exportName="企业名称")
	private String qymc;
	@ExcelAnnotation(exportName="企业性质")
	private String qyxz;
	@ExcelAnnotation(exportName="身份证")
	private String sfz;
	@ExcelAnnotation(exportName="姓名")
	private String xm;
	@ExcelAnnotation(exportName="性别")
	private String xb;
	@ExcelAnnotation(exportName="工资薪档")
	private String gzxd;
	@ExcelAnnotation(exportName="岗位津贴")
	private String gwjt;
	@ExcelAnnotation(exportName="生活补贴")
	private String shbt;
	@ExcelAnnotation(exportName="基础绩效")
	private String jcjx;
	@ExcelAnnotation(exportName="高出绩效")
	private String gcjx;
	@ExcelAnnotation(exportName="保留工资")
	private String blgz;
	@ExcelAnnotation(exportName="其它工资")
	private String qtgz;
	@ExcelAnnotation(exportName="提租补贴")
	private String tzbt;
	@ExcelAnnotation(exportName="其它")
	private String qt;
	@ExcelAnnotation(exportName="工资总额")
	private String gzze;
	@ExcelAnnotation(exportName="基本工资")
	private String jbgz;
	@ExcelAnnotation(exportName="工龄工资")
	private String glgz;
	@ExcelAnnotation(exportName="津贴补贴")
	private String jtbt;
	@ExcelAnnotation(exportName="月奖金")
	private String yjj;
	@ExcelAnnotation(exportName="加班工资")
	private String jbgz1;
	@ExcelAnnotation(exportName="绩效工资")
	private String jxgz;
	@ExcelAnnotation(exportName="其它工资1")
	private String qtgz1;
	@ExcelAnnotation(exportName="其它工资2")
	private String qtgz2;
	public String getGzffsj() {
		return gzffsj;
	}
	public void setGzffsj(String gzffsj) {
		this.gzffsj = gzffsj;
	}
	public String getQymc() {
		return qymc;
	}
	public void setQymc(String qymc) {
		this.qymc = qymc;
	}
	public String getQyxz() {
		return qyxz;
	}
	public void setQyxz(String qyxz) {
		this.qyxz = qyxz;
	}
	public String getSfz() {
		return sfz;
	}
	public void setSfz(String sfz) {
		this.sfz = sfz;
	}
	public String getXm() {
		return xm;
	}
	public void setXm(String xm) {
		this.xm = xm;
	}
	public String getXb() {
		return xb;
	}
	public void setXb(String xb) {
		this.xb = xb;
	}
	public String getGzxd() {
		return gzxd;
	}
	public void setGzxd(String gzxd) {
		this.gzxd = gzxd;
	}
	public String getGwjt() {
		return gwjt;
	}
	public void setGwjt(String gwjt) {
		this.gwjt = gwjt;
	}
	public String getShbt() {
		return shbt;
	}
	public void setShbt(String shbt) {
		this.shbt = shbt;
	}
	public String getJcjx() {
		return jcjx;
	}
	public void setJcjx(String jcjx) {
		this.jcjx = jcjx;
	}
	public String getGcjx() {
		return gcjx;
	}
	public void setGcjx(String gcjx) {
		this.gcjx = gcjx;
	}
	public String getBlgz() {
		return blgz;
	}
	public void setBlgz(String blgz) {
		this.blgz = blgz;
	}
	public String getQtgz() {
		return qtgz;
	}
	public void setQtgz(String qtgz) {
		this.qtgz = qtgz;
	}
	public String getTzbt() {
		return tzbt;
	}
	public void setTzbt(String tzbt) {
		this.tzbt = tzbt;
	}
	public String getQt() {
		return qt;
	}
	public void setQt(String qt) {
		this.qt = qt;
	}
	public String getGzze() {
		return gzze;
	}
	public void setGzze(String gzze) {
		this.gzze = gzze;
	}
	public String getJbgz1() {
		return jbgz1;
	}
	public void setJbgz1(String jbgz1) {
		this.jbgz1 = jbgz1;
	}
	public String getGlgz() {
		return glgz;
	}
	public void setGlgz(String glgz) {
		this.glgz = glgz;
	}
	public String getJtbt() {
		return jtbt;
	}
	public void setJtbt(String jtbt) {
		this.jtbt = jtbt;
	}
	public String getYjj() {
		return yjj;
	}
	public void setYjj(String yjj) {
		this.yjj = yjj;
	}
	public String getJbgz() {
		return jbgz;
	}
	public void setJbgz(String jbgz) {
		this.jbgz = jbgz;
	}
	public String getJxgz() {
		return jxgz;
	}
	public void setJxgz(String jxgz) {
		this.jxgz = jxgz;
	}
	public String getQtgz1() {
		return qtgz1;
	}
	public void setQtgz1(String qtgz1) {
		this.qtgz1 = qtgz1;
	}
	public String getQtgz2() {
		return qtgz2;
	}
	public void setQtgz2(String qtgz2) {
		this.qtgz2 = qtgz2;
	}
	
}
