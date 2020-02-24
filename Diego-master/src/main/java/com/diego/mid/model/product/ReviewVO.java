package com.diego.mid.model.product;


import java.sql.Date;
import java.util.List;

public class ReviewVO {
	
	private String id;
	private Integer pro_num;//상품번호
	private Integer rev_num;//리뷰번호
	private Integer star;//별개수
	private String rev_contents;// 리뷰내용
	private String name;//작성자이름
	private Integer help;// 도움이되셨습니까? 네(1)아니오(0)
	private Date rev_date;//작성날짜
	private String pro_main;//메인이미지
	
	private Integer fnum;
	private String fname;

	private List<RevFilesVO>files;// 포토리뷰처럼 섬머노트이용해서 사진도 올릴수있게..여러개 파일 저장.
	
	public Integer getFnum() {
		return fnum;
	}

	public void setFnum(Integer fnum) {
		this.fnum = fnum;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
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

	public Integer getRev_num() {
		return rev_num;
	}

	public void setRev_num(Integer rev_num) {
		this.rev_num = rev_num;
	}

	public Integer getStar() {
		return star;
	}

	public void setStar(Integer star) {
		this.star = star;
	}

	public String getRev_contents() {
		return rev_contents;
	}

	public void setRev_contents(String rev_contents) {
		this.rev_contents = rev_contents;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getHelp() {
		return help;
	}

	public void setHelp(Integer help) {
		this.help = help;
	}

	public Date getRev_date() {
		return rev_date;
	}

	public void setRev_date(Date rev_date) {
		this.rev_date = rev_date;
	}

	public String getPro_main() {
		return pro_main;
	}

	public void setPro_main(String pro_main) {
		this.pro_main = pro_main;
	}

	public List<RevFilesVO> getFiles() {
		return files;
	}

	public void setFiles(List<RevFilesVO> files) {
		this.files = files;
	}
	
	
	
	
}
