package com.diego.mid.model.product;

public class CategoryVO {

		private String cat_name;// 상의 - 셔츠,맨투맨 하의- 청바지,슬랙스, 반바지 아우터-패딩,코트
		private Integer cat_code;//ex 상의100번 , 하의200번, 아우터 300번,
		private Integer cat_ref;//ex 상의 100번에서 셔츠는 101, 맨투맨은 102, 티는 103번
		
		public String getCat_name() {
			return cat_name;
		}
		public void setCat_name(String cat_name) {
			this.cat_name = cat_name;
		}
		public Integer getCat_code() {
			return cat_code;
		}
		public void setCat_code(Integer cat_code) {
			this.cat_code = cat_code;
		}
		public Integer getCat_ref() {
			return cat_ref;
		}
		public void setCat_ref(Integer cat_ref) {
			this.cat_ref = cat_ref;
		}
		
		
		
	
}
