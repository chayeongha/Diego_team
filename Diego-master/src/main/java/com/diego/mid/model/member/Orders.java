package com.diego.mid.model.member;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

public class Orders {
	private Integer order_num;
	private Date order_date;
	private MultipartFile fname;
	private String image;
	private String id;
	private Integer pro_num;
	private String pro_info;
	private Integer pro_count;
	private Integer price;
	private String order_result;
	private String order_status;
	private Integer order_sum;
	private Integer coup_num;
	
	
	public MultipartFile getFname() {
		return fname;
	}
	public void setFname(MultipartFile fname) {
		this.fname = fname;
	}
	public Integer getOrder_num() {
		return order_num;
	}
	public void setOrder_num(Integer order_num) {
		this.order_num = order_num;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	}
	public String getImage() {
		if (image == null) {
			image = "";
		}
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getPro_num() {
		return pro_num;
	}
	public void setPro_num(Integer pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_info() {
		return pro_info;
	}
	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}
	public Integer getPro_count() {
		return pro_count;
	}
	public void setPro_count(Integer pro_count) {
		this.pro_count = pro_count;
	}
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getOrder_result() {
		if (order_result==null) {
			order_result = "-";
		}
		return order_result;
	}
	public void setOrder_result(String order_result) {
		this.order_result = order_result;
	}
	public String getOrder_status() {
		if (order_status == null) {
			order_status = "-";
		}
		return order_status;
	}
	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}
	public Integer getOrder_sum() {
		return order_sum;
	}
	public void setOrder_sum(Integer order_sum) {
		this.order_sum = order_sum;
	}
	public Integer getCoup_num() {
		return coup_num;
	}
	public void setCoup_num(Integer coup_num) {
		this.coup_num = coup_num;
	}
	
	

}
