package com.diego.mid.model.product;

import org.springframework.web.multipart.MultipartFile;

public class ImagesVO {

	private Integer images_num;
	private Integer pro_num;
	private String pro_main;// 클릭했을떄 들어가면 바로보이는 사진 결제창옆?에보이는 메인사진
	private String sumnale;//썸네일사진
	private String front;// 옷앞면사진
	private String back;// 옷 뒷면 사진
	private String pro_model; // 모델 착용샷
	private String pro_full;// 전신샷
	private String gif;//움짤
	private String pro_info;// 상품주의사항사진
	private String pro_sizecut;// 상품 둘레사이즈사진
	
	public Integer getImages_num() {
		return images_num;
	}
	public void setImages_num(Integer images_num) {
		this.images_num = images_num;
	}
	public Integer getPro_num() {
		return pro_num;
	}
	public void setPro_num(Integer pro_num) {
		this.pro_num = pro_num;
	}
	public String getPro_main() {
		return pro_main;
	}
	public void setPro_main(String pro_main) {
		this.pro_main = pro_main;
	}
	public String getSumnale() {
		return sumnale;
	}
	public void setSumnale(String sumnale) {
		this.sumnale = sumnale;
	}
	public String getFront() {
		return front;
	}
	public void setFront(String front) {
		this.front = front;
	}
	public String getBack() {
		return back;
	}
	public void setBack(String back) {
		this.back = back;
	}
	public String getPro_model() {
		return pro_model;
	}
	public void setPro_model(String pro_model) {
		this.pro_model = pro_model;
	}
	public String getPro_full() {
		return pro_full;
	}
	public void setPro_full(String pro_full) {
		this.pro_full = pro_full;
	}
	public String getGif() {
		return gif;
	}
	public void setGif(String gif) {
		this.gif = gif;
	}
	public String getPro_info() {
		return pro_info;
	}
	public void setPro_info(String pro_info) {
		this.pro_info = pro_info;
	}
	public String getPro_sizecut() {
		return pro_sizecut;
	}
	public void setPro_sizecut(String pro_sizecut) {
		this.pro_sizecut = pro_sizecut;
	}
	@Override
	public String toString() {
		return "ImagesVO [images_num=" + images_num + ", pro_num=" + pro_num + ", pro_main=" + pro_main + ", sumnale="
				+ sumnale + ", front=" + front + ", back=" + back + ", pro_model=" + pro_model + ", pro_full="
				+ pro_full + ", gif=" + gif + ", pro_info=" + pro_info + ", pro_sizecut=" + pro_sizecut + "]";
	}
	
	
	
}
