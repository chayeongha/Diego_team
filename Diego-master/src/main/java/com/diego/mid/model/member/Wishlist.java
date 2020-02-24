package com.diego.mid.model.member;

import org.springframework.web.multipart.MultipartFile;

public class Wishlist {
	
	private Integer wish_num;
	private MultipartFile fname;
	private String image;
	private String id;
	private Integer pro_num;
	private String pro_info;
	private Integer price;
	private String delivery;
	private String delivery_cost;
	
	

	public MultipartFile getFname() {
		return fname;
	}
	public void setFname(MultipartFile fname) {
		this.fname = fname;
	}
	public Integer getWish_num() {
		return wish_num;
	}
	public void setWish_num(Integer wish_num) {
		this.wish_num = wish_num;
	}
	public String getImage() {
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
	public Integer getPrice() {
		return price;
	}
	public void setPrice(Integer price) {
		this.price = price;
	}
	public String getDelivery() {
		return delivery;
	}
	public void setDelivery(String delivery) {
		this.delivery = delivery;
	}
	public String getDelivery_cost() {
		return delivery_cost;
	}
	public void setDelivery_cost(String delivery_cost) {
		this.delivery_cost = delivery_cost;
	}

	
	
	
}
