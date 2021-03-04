package com.i84.earnpoint.model;

import java.util.Date;

import com.i84.earnpoint.common.excel.ExcelAnnotation;

/**
 * 档案信息导出
 * @author chenb
 *
 */
public class ScoreExportVo {

	@ExcelAnnotation(exportName="活动编码")
	private Integer activity_id;
	@ExcelAnnotation(exportName="评审活动名称")
	private String activity_name;
    @ExcelAnnotation(exportName="申报人")
    private String name;
    @ExcelAnnotation(exportName="身份证号")
    private String pnum;
    //单位名称
    private String work_name;

    @ExcelAnnotation(exportName="论文题目")
    private String dissetation_name;
    @ExcelAnnotation(exportName="专家姓名")
    private String expertname;
    @ExcelAnnotation(exportName = "专家编号")
    private String	zpno;
    @ExcelAnnotation(exportName = "分配时间")
    private Date	add_date;
    @ExcelAnnotation(exportName="成绩")
    private String p_score;
    @ExcelAnnotation(exportName="评审意见")
    private String p_msg;

    @ExcelAnnotation(exportName = "评审时间")
    private Date	j_date;

    
    public Integer getActivity_id() {
		return activity_id;
	}
	public void setActivity_id(Integer activity_id) {
		this.activity_id = activity_id;
	}
	public String getActivity_name() {
		return activity_name;
	}
	public void setActivity_name(String activity_name) {
		this.activity_name = activity_name;
	}
	public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getPnum() {
        return pnum;
    }
    public void setPnum(String pnum) {
        this.pnum = pnum;
    }
    public String getDissetation_name() {
        return dissetation_name;
    }
    public void setDissetation_name(String dissetation_name) {
        this.dissetation_name = dissetation_name;
    }
    public String getExpertname() {
        return expertname;
    }
    public void setExpertname(String expertname) {
        this.expertname = expertname;
    }
    public String getP_score() {
        return p_score;
    }
    public void setP_score(String p_score) {
        if ("1".equals(p_score))
        {
            this.p_score = "优秀";
        }
        else if ("2".equals(p_score)) {
            this.p_score = "良好";
        }
        else if ("3".equals(p_score)) {
            this.p_score = "合格";
        }
        else if ("4".equals(p_score)) {
            this.p_score = "不合格";
        }
        else {
            this.p_score = "";
        }
    }
    public String getP_msg() {
        return p_msg;
    }
    public void setP_msg(String p_msg) {
        this.p_msg = p_msg;
    }

    public Date getJ_date() {
        return j_date;
    }

    public void setJ_date(Date j_date) {
        this.j_date = j_date;
    }

    public String getZpno() {
        return zpno;
    }

    public void setZpno(String zpno) {
        this.zpno = zpno;
    }

    public Date getAdd_date() {
        return add_date;
    }

    public void setAdd_date(Date add_date) {
        this.add_date = add_date;
    }

    public String getWork_name() {
        return work_name;
    }

    public void setWork_name(String work_name) {
        this.work_name = work_name;
    }


}
