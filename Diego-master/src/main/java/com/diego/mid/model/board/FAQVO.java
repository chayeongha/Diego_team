package com.diego.mid.model.board;

import java.sql.Date;

public class FAQVO {
	
	private String admin_id;
	private Integer faq_num;
	private String faq_title;
	private String faq_contents;
	private Integer fcat_code;
	private Date faq_date;
	private FAQCategoryVO faqCategoryVO;

	public FAQCategoryVO getFaqCategoryVO() {
		return faqCategoryVO;
	}
	public void setFaqCategoryVO(FAQCategoryVO faqCategoryVO) {
		this.faqCategoryVO = faqCategoryVO;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public Integer getFaq_num() {
		return faq_num;
	}
	public void setFaq_num(Integer faq_num) {
		this.faq_num = faq_num;
	}
	public String getFaq_title() {
		return faq_title;
	}
	public void setFaq_title(String faq_title) {
		this.faq_title = faq_title;
	}
	public String getFaq_contents() {
		return faq_contents;
	}
	public void setFaq_contents(String faq_contents) {
		this.faq_contents = faq_contents;
	}
	
	public Integer getFcat_code() {
		return fcat_code;
	}
	public void setFcat_code(Integer fcat_code) {
		this.fcat_code = fcat_code;
	}
	public Date getFaq_date() {
		return faq_date;
	}
	public void setFaq_date(Date faq_date) {
		this.faq_date = faq_date;
	}
	
	
	

}
