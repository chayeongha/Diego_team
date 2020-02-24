package com.diego.mid.model.board;

import java.sql.Date;

public class NoticeVO {
	
	private String admin_id;
	private Integer not_num;
	private String title;
	private String admin_name;
	private String contents;
	private Date not_date;
	
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getNot_num() {
		return not_num;
	}
	public void setNot_num(Integer not_num) {
		this.not_num = not_num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public Date getNot_date() {
		return not_date;
	}
	public void setNot_date(Date not_date) {
		this.not_date = not_date;
	}
	
	

}
