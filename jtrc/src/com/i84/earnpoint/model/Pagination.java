package com.i84.earnpoint.model;

import java.util.ArrayList;
import java.util.List;

public class Pagination<T> {
	
	public Pagination(){
		
	}
	public Pagination(Integer pageNo, Integer pageSize) {
		this.pageNo=pageNo;
		this.pageSize=pageSize;
	}
	protected Integer totalCount = 0;//总记录数
	protected Integer pageSize = 10;//每页条数,默认
	protected Integer pageNo = 1;//页码
	protected List<T> dateList = new ArrayList<T>();//数据
	public Integer getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(Integer totalCount) {
		this.totalCount = totalCount;
	}
	public Integer getPageSize() {
		if(pageSize==null || pageSize<=0) return 10;
		return pageSize;
	}
	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}
	public Integer getPageNo() {
		if(pageNo==null || pageNo <=0) return 1;
		return pageNo;
	}
	public void setPageNo(Integer pageNo) {
		this.pageNo = pageNo;
	}
	public List<T> getDateList() {
		return dateList;
	}
	public void setDateList(List<T> dateList) {
		this.dateList = dateList;
	}
	
	public String getPaging(){
		return " limit "+(this.getPageNo()-1)*this.getPageSize()+","+this.getPageNo()*this.getPageSize()+"";
	}

}
