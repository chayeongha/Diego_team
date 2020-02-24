package com.diego.mid.model.member;

import java.sql.Date;

public class Coupon {
	private Integer coup_num;
	private String id;
	private String coup_name;
	private String discount;
	private double sales_value;
	private Date coup_date;
	private Date deadline;
	private String use;
	
	
	public Integer getCoup_num() {
		return coup_num;
	}
	public void setCoup_num(Integer coup_num) {
		this.coup_num = coup_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

	public String getCoup_name() {
		return coup_name;
	}
	public void setCoup_name(String coup_name) {
		this.coup_name = coup_name;
	}
	public String getDiscount() {
		return discount;
	}
	public void setDiscount(String discount) {
		this.discount = discount;
	}
	public double getSales_value() {
		return sales_value;
	}
	public void setSales_value(double sales_value) {
		this.sales_value = sales_value;
	}
	public Date getCoup_date() {
		return coup_date;
	}
	public void setCoup_date(Date coup_date) {
		this.coup_date = coup_date;
	}
	public Date getDeadline() {
		return deadline;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public String getUse() {
		return use;
	}
	public void setUse(String use) {
		this.use = use;
	}
	
	

}
