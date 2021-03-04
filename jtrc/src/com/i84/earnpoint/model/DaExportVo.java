package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.DateUtil;
import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 档案信息导出
 * @author chenb
 *
 */
public class DaExportVo {
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
	@ExcelAnnotation(exportName="机构名称")
	private String org_name;
	@ExcelAnnotation(exportName="姓名")
	private String name;
	@ExcelAnnotation(exportName="档案号")
	private String dpno;
	@ExcelAnnotation(exportName="身份证号")
	private String pnum;
	@ExcelAnnotation(exportName="性别")
	private String sex;
	@ExcelAnnotation(exportName="出生年月")
	private String birth_date;
	@ExcelAnnotation(exportName="政治面貌")
	private String zzmm;
	@ExcelAnnotation(exportName="户籍地")
	private String domicile_place;
	@ExcelAnnotation(exportName="就业单位")
	private String work_name;
	@ExcelAnnotation(exportName="报道单位")
	private String bd_unit;
	@ExcelAnnotation(exportName="第一学历")
	private String degree;
	@ExcelAnnotation(exportName="第一专业")
	private String major;
	@ExcelAnnotation(exportName="第一院校")
	private String school;
	@ExcelAnnotation(exportName="第一时间")
	private String graduation_time;
	@ExcelAnnotation(exportName="最高学历")
	private String max_degree;
	@ExcelAnnotation(exportName="最高专业")
	private String max_major;
	@ExcelAnnotation(exportName="最高院校")
	private String max_school;
	@ExcelAnnotation(exportName="最高时间")
	private String max_graduation_time;
	@ExcelAnnotation(exportName="工作地")
	private String unit_adr;
	@ExcelAnnotation(exportName="调入单位")
	private String in_point;
	@ExcelAnnotation(exportName="调入时间")
	private String in_date;
	@ExcelAnnotation(exportName="博士研究生毕业院校")
	private String doctor_school_name;
	@ExcelAnnotation(exportName="博士研究生毕业时间")
	private String doctor_graduation_date;
	@ExcelAnnotation(exportName="学习专业")
	private String doctor_major;
	@ExcelAnnotation(exportName="硕士研究生毕业学校")
	private String master_school_name;
	@ExcelAnnotation(exportName="硕士研究生毕业时间")
	private String master_graduation_date;
	@ExcelAnnotation(exportName="学习专业")
	private String master_major;
	@ExcelAnnotation(exportName="大学本科毕业学校")
	private String bachelor_school_name;
	@ExcelAnnotation(exportName="大学本科毕业时间")
	private String bachelor_graduation_date;
	@ExcelAnnotation(exportName="学习专业")
	private String bachelor_major;
	@ExcelAnnotation(exportName="大学专科毕业学校")
	private String training_school_name;
	@ExcelAnnotation(exportName="大学专科毕业时间")
	private String training_graduation_date;
	@ExcelAnnotation(exportName="学习专业")
	private String training_major;
	@ExcelAnnotation(exportName="高中毕业学校")
	private String hign_school_name;
	@ExcelAnnotation(exportName="高中毕业时间")
	private String hign_graduation_date;
	@ExcelAnnotation(exportName="中专毕业学校")
	private String middle_school_name;
	@ExcelAnnotation(exportName="中专毕业时间")
	private String middle_graduation_date;
	@ExcelAnnotation(exportName="学习专业")
	private String middle_major;
	@ExcelAnnotation(exportName="档案状态")
	private String p_state;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOrg_name() {
		return org_name;
	}
	public void setOrg_name(String org_name) {
		this.org_name = org_name;
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
	public String getDoctor_school_name() {
		return doctor_school_name;
	}
	public void setDoctor_school_name(String doctor_school_name) {
		this.doctor_school_name = doctor_school_name;
	}
	public String getDoctor_graduation_date() {
		return doctor_graduation_date;
	}
	public void setDoctor_graduation_date(String doctor_graduation_date) {
		this.doctor_graduation_date = doctor_graduation_date;
	}
	public String getDoctor_major() {
		return doctor_major;
	}
	public void setDoctor_major(String doctor_major) {
		this.doctor_major = doctor_major;
	}
	public String getMaster_school_name() {
		return master_school_name;
	}
	public void setMaster_school_name(String master_school_name) {
		this.master_school_name = master_school_name;
	}
	public String getMaster_graduation_date() {
		return master_graduation_date;
	}
	public void setMaster_graduation_date(String master_graduation_date) {
		this.master_graduation_date = master_graduation_date;
	}
	public String getMaster_major() {
		return master_major;
	}
	public void setMaster_major(String master_major) {
		this.master_major = master_major;
	}
	public String getBachelor_school_name() {
		return bachelor_school_name;
	}
	public void setBachelor_school_name(String bachelor_school_name) {
		this.bachelor_school_name = bachelor_school_name;
	}
	public String getBachelor_graduation_date() {
		return bachelor_graduation_date;
	}
	public void setBachelor_graduation_date(String bachelor_graduation_date) {
		this.bachelor_graduation_date = bachelor_graduation_date;
	}
	public String getBachelor_major() {
		return bachelor_major;
	}
	public void setBachelor_major(String bachelor_major) {
		this.bachelor_major = bachelor_major;
	}
	public String getTraining_school_name() {
		return training_school_name;
	}
	public void setTraining_school_name(String training_school_name) {
		this.training_school_name = training_school_name;
	}
	public String getTraining_graduation_date() {
		return training_graduation_date;
	}
	public void setTraining_graduation_date(String training_graduation_date) {
		this.training_graduation_date = training_graduation_date;
	}
	public String getTraining_major() {
		return training_major;
	}
	public void setTraining_major(String training_major) {
		this.training_major = training_major;
	}
	public String getHign_school_name() {
		return hign_school_name;
	}
	public void setHign_school_name(String hign_school_name) {
		this.hign_school_name = hign_school_name;
	}
	public String getHign_graduation_date() {
		return hign_graduation_date;
	}
	public void setHign_graduation_date(String hign_graduation_date) {
		this.hign_graduation_date = hign_graduation_date;
	}
	public String getMiddle_school_name() {
		return middle_school_name;
	}
	public void setMiddle_school_name(String middle_school_name) {
		this.middle_school_name = middle_school_name;
	}
	public String getMiddle_graduation_date() {
		return middle_graduation_date;
	}
	public void setMiddle_graduation_date(String middle_graduation_date) {
		this.middle_graduation_date = middle_graduation_date;
	}
	public String getMiddle_major() {
		return middle_major;
	}
	public void setMiddle_major(String middle_major) {
		this.middle_major = middle_major;
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
	public String getBirth_date() {
		return birth_date;
	}
	public void setBirth_date(String birth_date) {
		this.birth_date = birth_date;
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
	public String getBd_unit() {
		return bd_unit;
	}
	public void setBd_unit(String bd_unit) {
		this.bd_unit = bd_unit;
	}
	public String getDegree() {
		return degree;
	}
	public void setDegree(String degree) {
		this.degree = degree;
	}
	public String getMajor() {
		return major;
	}
	public void setMajor(String major) {
		this.major = major;
	}
	public String getSchool() {
		return school;
	}
	public void setSchool(String school) {
		this.school = school;
	}
	public String getGraduation_time() {
		return graduation_time;
	}
	public void setGraduation_time(String graduation_time) {
		this.graduation_time = graduation_time;
	}
	public String getMax_degree() {
		return max_degree;
	}
	public void setMax_degree(String max_degree) {
		this.max_degree = max_degree;
	}
	public String getMax_major() {
		return max_major;
	}
	public void setMax_major(String max_major) {
		this.max_major = max_major;
	}
	public String getMax_school() {
		return max_school;
	}
	public void setMax_school(String max_school) {
		this.max_school = max_school;
	}
	public String getMax_graduation_time() {
		return max_graduation_time;
	}
	public void setMax_graduation_time(String max_graduation_time) {
		this.max_graduation_time = max_graduation_time;
	}
	public String getUnit_adr() {
		return unit_adr;
	}
	public void setUnit_adr(String unit_adr) {
		this.unit_adr = unit_adr;
	}
	public String getIn_point() {
		return in_point;
	}
	public void setIn_point(String in_point) {
		this.in_point = in_point;
	}
	public String getIn_date() {
		return in_date;
	}
	public void setIn_date(String in_date) {
		this.in_date = in_date;
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
}
