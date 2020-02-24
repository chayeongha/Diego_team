package com.diego.mid.model.member;

import java.sql.Date;

public class Point {
	private String id;
	private Integer point_value;
	private Integer point_save;
	private Date point_date;
	private String contents;
	private Integer total_point; 
	private Integer order_num;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getPoint_value() {
		return point_value;
	}
	public void setPoint_value(Integer point_value) {
		this.point_value = point_value;
	}
	public Date getPoint_date() {
		return point_date;
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Integer getTotal_point() {
		if (this.total_point == null) {
			total_point = 0;
		}
		return total_point;
	}
	public void setTotal_point(Integer total_point) {
		this.total_point = total_point;
	}
	public Integer getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Integer order_num) {
		this.order_num = order_num;
	}
	public Integer getPoint_save() {
		return point_save;
	}
	public void setPoint_save(Integer point_save) {
		this.point_save = point_save;
	}
	
}
