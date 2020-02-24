package com.diego.mid.model.product;

public class ReviewCommentVO {

	private Integer rev_num;//리뷰의 번호
	private Integer com_num;//리뷰에달리는 답글의 번호
	private String name;//작성자 이름
	private String com_contents;// 리뷰에 달리는 답글의 내용
	
	public Integer getRev_num() {
		return rev_num;
	}
	public void setRev_num(Integer rev_num) {
		this.rev_num = rev_num;
	}
	public Integer getCom_num() {
		return com_num;
	}
	public void setCom_num(Integer com_num) {
		this.com_num = com_num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getCom_contents() {
		return com_contents;
	}
	public void setCom_contents(String com_contents) {
		this.com_contents = com_contents;
	}

	
	
}
