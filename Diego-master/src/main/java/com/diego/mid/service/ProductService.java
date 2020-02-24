package com.diego.mid.service;


import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.diego.mid.dao.ImagesDAO;
import com.diego.mid.dao.ProductDAO;
import com.diego.mid.dao.RevFilesDAO;
import com.diego.mid.dao.ReviewDAO;
import com.diego.mid.model.product.ImagesVO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.RevFilesVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.util.FileSaver;
import com.diego.mid.util.MPager;
import com.diego.mid.util.Pager;
import com.diego.mid.util.ProductFile;

@Service
public class ProductService {

	@Inject
	private ProductDAO productDAO;

	@Inject
	private ImagesDAO imagesDAO;
	
	@Inject
	private RevFilesDAO revFilesDAO;
	
	@Inject
	private ReviewDAO reviewDAO;

	@Inject
	private ProductFile saver;
	
	@Inject
	private FileSaver fileSaver;

	//상품 추가 INSERT
	public int productInsert(ProductVO productVO, MultipartFile [] imagesFiles ,HttpSession session )throws Exception{
		
		
		//productVO.setPro_num(productDAO.getProNum());

		//1. 파일을 저장할 실제경로
		String realPath=session.getServletContext().getRealPath("resources/product/images");

		ImagesVO imagesVO = new ImagesVO();
		String sumNale = saver.save(realPath, imagesFiles[1]);
		productVO.setPro_image(sumNale);
		int result = productDAO.productInsert(productVO);

		imagesVO.setPro_num(productVO.getPro_num());
		System.out.println(realPath);
		
		//메인 사진 하나 productVO에 넣기
		
		
		imagesVO.setPro_main(saver.save(realPath,imagesFiles[0]));
		imagesVO.setSumnale(sumNale);
		imagesVO.setFront(saver.save(realPath,imagesFiles[2]));
		imagesVO.setBack(saver.save(realPath, imagesFiles[3]));
		imagesVO.setPro_model(saver.save(realPath,imagesFiles[4]));
		imagesVO.setPro_full(saver.save(realPath,imagesFiles[5]));
		imagesVO.setGif(saver.save(realPath,imagesFiles[6]));
		imagesVO.setPro_info(saver.save(realPath,imagesFiles[7]));
		imagesVO.setPro_sizecut(saver.save(realPath,imagesFiles[8]));

		//System.out.println(imagesVO.getPro_full());

		if(result>0 ) {
			//&& imagesFiles[0].getOriginalFilename()!=null

			result= imagesDAO.imagesInsert(imagesVO);

		}


		return result;


	}

	//상품 리스트
	public List<ProductVO>productList(MPager pager)throws Exception{
		//System.out.println("test");
		pager.rowMake();
		pager.makePager(productDAO.productCount(pager));
		//System.out.println(productDAO.productCount(pager));

		return productDAO.productList(pager);
	}


	
	public  int productDelete(ProductVO productVO)throws Exception {

		return productDAO.productDelete(productVO);
	}

	//상품선택
	public ProductVO productSelect(ProductVO productVO)throws Exception{		
		productVO = productDAO.productSelect(productVO);
		List<ImagesVO>ar = imagesDAO.imagesList(productVO.getPro_num());
		
		productVO.setImages(ar);
		return productDAO.productSelect(productVO);

	}

	//상품업데이트
	public int productUpdate(ProductVO productVO)throws Exception{

		return productDAO.productUpdate(productVO);

	}

	//리뷰작성
	public int productReview(ReviewVO reviewVO, HttpSession session, MultipartFile [] file)throws Exception{
		//System.out.println(reviewVO.getRev_contents());성공
		//System.out.println("test");
		
		//1. 파일을 저장할 실제경로
		String realPath = session.getServletContext().getRealPath("resources/product/photoReview");
		
		RevFilesVO revFilesVO = new RevFilesVO();
		
		int result= productDAO.productReview(reviewVO);
		
		revFilesVO.setRev_num(reviewVO.getRev_num());
	
		System.out.println(realPath);//찍힘.
		
		for (MultipartFile multipartFile : file) {
			if (multipartFile.getSize() != 0) {				
				revFilesVO.setFname(fileSaver.save(realPath, multipartFile));
				revFilesVO.setOname(multipartFile.getOriginalFilename());
				result = revFilesDAO.fileWrite(revFilesVO);
		
				if (result<1) {
					throw new SQLException();
				}
			}
		}
		
		return result;

	}
	
	//상품 카운트
	public int productCount(MPager pager)throws Exception{
		return productDAO.productCount(pager);
	}
	//셀렉트된리뷰리스트
	public  List<ReviewVO>reviewList(ProductVO productVO, MPager pager )throws Exception{
		pager.makePager(productDAO.reviewCount(productVO));
		pager.rowMake();
		
		return productDAO.reviewList(pager, productVO);
	}
	
	//한상품리뷰갯수
		public int reviewCount(ProductVO productVO)throws Exception{
			
			return productDAO.reviewCount(productVO);
		}
	
	//리뷰삭제
		public int reviewDelete(ReviewVO reviewVO)throws Exception {
			
			return productDAO.reviewDelete(reviewVO);
		}
		
	
		
	//리뷰 업데이트
		public int reviewUpdate(ReviewVO reviewVO, HttpSession session, MultipartFile [] file)throws Exception{
			
			//1. 파일을 저장할 실제경로
			String realPath = session.getServletContext().getRealPath("resources/product/photoReview");
			System.out.println(realPath);
			
			RevFilesVO revFilesVO = new RevFilesVO();
			revFilesVO.setRev_num(reviewVO.getRev_num());
			
			//System.out.println(reviewVO.getRev_num());
			
			for (MultipartFile multipartFile : file) {
								
					revFilesVO.setFname(fileSaver.save(realPath, multipartFile));
					revFilesVO.setOname(multipartFile.getOriginalFilename());
					revFilesDAO.fileWrite(revFilesVO);
		
			}
			
			return productDAO.reviewUpdate(reviewVO); 
		}
		
		
	public ProductVO productGetInfo(ProductVO productVO) throws Exception{
		return productDAO.productGetInfo(productVO);
	}
}