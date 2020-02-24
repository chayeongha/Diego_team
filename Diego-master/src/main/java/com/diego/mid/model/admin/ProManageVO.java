package com.diego.mid.model.admin;

import java.sql.Date;

import com.diego.mid.model.product.CategoryVO;
import com.diego.mid.model.product.ImagesVO;

public class ProManageVO {
	
	private Integer pro_num;
	private Integer cat_ref;//카테코리ref ex: 셔츠면 101 맨투맨이면 102
	private String pro_name;//상품이름
	private Integer pro_price;//상품가격
	private Integer pro_count;//상품재고량
	private Integer pro_sale;//상품판매개수
	private Date pro_date;//상품올린날짜
	private String contents;//상품 상세내용
	private String pro_warning;//상품 주의사항
	private String pro_size;//상품 사이즈
	private String pro_color;//상품 색상
	private String pro_vital;//상품 필수옵션
	private CategoryVO categoryVO;
	private ImagesVO imagesVO;
	
	
	public Integer getPro_num() {
		return pro_num;
	}
	public void setPro_num(Integer pro_num) {
		this.pro_num = pro_num;
	}
	public Integer getCat_ref() {
		return cat_ref;
	}
	public void setCat_ref(Integer cat_ref) {
		this.cat_ref = cat_ref;
	}
	public String getPro_name() {
		return pro_name;
	}
	public void setPro_name(String pro_name) {
		this.pro_name = pro_name;
	}
	public Integer getPro_price() {
		return pro_price;
	}
	public void setPro_price(Integer pro_price) {
		this.pro_price = pro_price;
	}
	public Integer getPro_count() {
		return pro_count;
	}
	public void setPro_count(Integer pro_count) {
		this.pro_count = pro_count;
	}
	public Integer getPro_sale() {
		return pro_sale;
	}
	public void setPro_sale(Integer pro_sale) {
		this.pro_sale = pro_sale;
	}
	public Date getPro_date() {
		return pro_date;
	}
	public void setPro_date(Date pro_date) {
		this.pro_date = pro_date;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getPro_warning() {
		return pro_warning;
	}
	public void setPro_warning(String pro_warning) {
		this.pro_warning = pro_warning;
	}
	public String getPro_size() {
		return pro_size;
	}
	public void setPro_size(String pro_size) {
		this.pro_size = pro_size;
	}
	public String getPro_color() {
		return pro_color;
	}
	public void setPro_color(String pro_color) {
		this.pro_color = pro_color;
	}
	public String getPro_vital() {
		return pro_vital;
	}
	public void setPro_vital(String pro_vital) {
		this.pro_vital = pro_vital;
	}
	public CategoryVO getCategoryVO() {
		return categoryVO;
	}
	public void setCategoryVO(CategoryVO categoryVO) {
		this.categoryVO = categoryVO;
	}
	public ImagesVO getImagesVO() {
		return imagesVO;
	}
	public void setImagesVO(ImagesVO imagesVO) {
		this.imagesVO = imagesVO;
	}
	
	
	

}