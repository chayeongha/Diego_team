package com.diego.mid.model.admin;

public class DeliveryVO {
	
	private Integer num;
	private String order_num;
	private Integer del_num;
	private String del_status;
	private String del_address;
	private String del_costpay;
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public String getOrder_num() {
		return order_num;
	}
	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}
	public Integer getDel_num() {
		return del_num;
	}
	public void setDel_num(Integer del_num) {
		this.del_num = del_num;
	}
	public String getDel_status() {
		return del_status;
	}
	public void setDel_status(String del_status) {
		this.del_status = del_status;
	}
	public String getDel_address() {
		return del_address;
	}
	public void setDel_address(String del_address) {
		this.del_address = del_address;
	}
	public String getDel_costpay() {
		return del_costpay;
	}
	public void setDel_costpay(String del_costpay) {
		this.del_costpay = del_costpay;
	}
	
	

}
