package com.diego.mid.model.admin;


import java.sql.Date;
import java.util.List;

import com.diego.mid.model.product.ImagesVO;
import com.diego.mid.model.product.ProductVO;

public class QnaManageVO {

   private String writer;//작성자
   private Integer qna_num;//qna번호
   private Integer pro_num;//상품번호
   private String title;//제목
   private String contents;//내용
   private String qna_img;//섬머노트에서 이미지추가
   private Date qna_date;// 작성날짜
   private Integer step;
   private Integer ref;
   private Integer depth;
   private String secret;
   private String sec_num;
   private ImagesVO imagesVO;
   private ProductVO productVO;
   
   
   
   
   
   
   public ProductVO getProductVO() {
	return productVO;
}
public void setProductVO(ProductVO productVO) {
	this.productVO = productVO;
}

public ImagesVO getImagesVO() {
	return imagesVO;
}
public void setImagesVO(ImagesVO imagesVO) {
	this.imagesVO = imagesVO;
}
public String getSecret() {
      return secret;
   }
   public void setSecret(String secret) {
      this.secret = secret;
   }
   public String getSec_num() {
      return sec_num;
   }
   public void setSec_num(String sec_num) {
      this.sec_num = sec_num;
   }
   
   public String getWriter() {
      return writer;
   }
   public void setWriter(String writer) {
      this.writer = writer;
   }
   public Integer getQna_num() {
      return qna_num;
   }
   public void setQna_num(Integer qna_num) {
      this.qna_num = qna_num;
   }
   public Integer getPro_num() {
      return pro_num;
   }
   public void setPro_num(Integer pro_num) {
      this.pro_num = pro_num;
   }
   public String getTitle() {
      return title;
   }
   public void setTitle(String title) {
      this.title = title;
   }
   public String getContents() {
      return contents;
   }
   public void setContents(String contents) {
      this.contents = contents;
   }
   public String getQna_img() {
      return qna_img;
   }
   public void setQna_img(String qna_img) {
      this.qna_img = qna_img;
   }
   public Date getQna_date() {
      return qna_date;
   }
   public void setQna_date(Date qna_date) {
      this.qna_date = qna_date;
   }
   public Integer getStep() {
      return step;
   }
   public void setStep(Integer step) {
      this.step = step;
   }
   public Integer getRef() {
      return ref;
   }
   public void setRef(Integer ref) {
      this.ref = ref;
   }
   public Integer getDepth() {
      return depth;
   }
   public void setDepth(Integer depth) {
      this.depth = depth;
   }
   
   
   
   


   
}