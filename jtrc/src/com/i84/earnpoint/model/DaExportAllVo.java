package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 档案信息导出
 * @author chenb
 *
 */
public class DaExportAllVo {
//	@ExcelAnnotation(exportName="档案号")
//	private String bpno;
//	@ExcelAnnotation(exportName="档案状态")
//	private String is_state;
//	
//	@ExcelAnnotation(exportName="姓名")
//	private String name;
//	@ExcelAnnotation(exportName="性别")
//	private String sex;
//	@ExcelAnnotation(exportName="出生年月")
//	private String birth_date;
//	@ExcelAnnotation(exportName="身份证号码")
//	private String pnum;	
//	@ExcelAnnotation(exportName="毕业学校")
//	private String school;
//	@ExcelAnnotation(exportName="所属专业")
//	private String major;
//	@ExcelAnnotation(exportName="毕业时间")
//	private String graduation_time;
//	@ExcelAnnotation(exportName="转入时间")
//	private String create_date;
//	
//	
//	public String getName() {
//		return name;
//	}
//	public void setName(String name) {
//		this.name = name;
//	}
//	public String getSex() {
//		if("1".equals(sex))
//			return "男";
//		else if("0".equals(sex))
//			return "女";
//			
//		return sex;
//	}
//	public void setSex(String sex) {
//		this.sex = sex;
//	}
//	public String getPnum() {
//		return pnum;
//	}
//	public void setPnum(String pnum) {
//		this.pnum = pnum;
//	}
//	public String getBirth_date() {
//		
//		Date d = DateUtil.getDate(DateUtil.OYYYY_MM_DD, birth_date);
//		if(d!=null)
//			return DateUtil.getFormatDate(DateUtil.OYYYY_MM,d);
//		else
//		return birth_date;
//	}
//	public void setBirth_date(String birth_date) {
//		this.birth_date = birth_date;
//	}
//	public String getSchool() {
//		return school;
//	}
//	public void setSchool(String school) {
//		this.school = school;
//	}
//	public String getMajor() {
//		return major;
//	}
//	public void setMajor(String major) {
//		this.major = major;
//	}
//	public String getGraduation_time() {
//		return graduation_time;
//	}
//	public void setGraduation_time(String graduation_time) {
//		this.graduation_time = graduation_time;
//	}
//	public String getBpno() {
//		return bpno;
//	}
//	public void setBpno(String bpno) {
//		this.bpno = bpno;
//	}
//	public String getIs_state() {
//		if("1".equals(is_state))
//			return "转入";
//		else if("2".equals(is_state))
//			return "转出";
//			
//		return is_state;
//	}
//	public void setIs_state(String is_state) {
//		this.is_state = is_state;
//	}
//	public String getCreate_date() {
//		return create_date;
//	}
//	public void setCreate_date(String create_date) {
//		this.create_date = create_date;
//	}
	
	private Integer id;
	@ExcelAnnotation(exportName="姓名")
	private String name;
	@ExcelAnnotation(exportName="档案号")
	private String dpno;
	@ExcelAnnotation(exportName="身份证号")
	private String pnum;
	@ExcelAnnotation(exportName="性别")
	private String sex;
	@ExcelAnnotation(exportName="户籍地")
	private String domicile_place;
	@ExcelAnnotation(exportName="政治面貌")
	private String zzmm;
	@ExcelAnnotation(exportName="就业单位")
	private String work_name;
	@ExcelAnnotation(exportName="第一学历")
	private String degree;
	@ExcelAnnotation(exportName="最高学历")
	private String max_degree;
	@ExcelAnnotation(exportName="联系电话")
	private String tel;
	@ExcelAnnotation(exportName="档案状态")
	private String p_state;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDpno() {
		return dpno;
	}
	public void setDpno(String dpno) {
		this.dpno = dpno;
	}
	public String getPnum() {
		return pnum;
	}
	public void setPnum(String pnum) {
		this.pnum = pnum;
	}
	public String getSex() {
		if("1".equals(sex))
			return "男";
		else if("0".equals(sex))
			return "女";
			
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getZzmm() {
		return zzmm;
	}
	public void setZzmm(String zzmm) {
		this.zzmm = zzmm;
	}
	public String getDomicile_place() {
		return domicile_place;
	}
	public void setDomicile_place(String domicile_place) {
		this.domicile_place = domicile_place;
	}
	public String getWork_name() {
		return work_name;
	}
	public void setWork_name(String work_name) {
		this.work_name = work_name;
	}
	public String getP_state() {
		if("1".equals(p_state))
			return "转入";
		else if("2".equals(p_state))
			return "转出";
		return p_state;
	}
	public void setP_state(String p_state) {
		this.p_state = p_state;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getMax_degree() {
		return max_degree;
	}
	public void setMax_degree(String max_degree) {
		this.max_degree = max_degree;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
