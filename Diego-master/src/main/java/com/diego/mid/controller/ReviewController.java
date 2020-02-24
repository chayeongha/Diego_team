package com.diego.mid.controller;

import java.util.ArrayList;
import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.RevFilesVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.service.ReviewService;

import com.diego.mid.util.PPager;


@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Inject
	private ReviewService reviewService;
	
	//리뷰작성
	@GetMapping(value = "reviewWrite")
	public void reviewWrite()throws Exception {
			
	}
	
	@PostMapping(value = "reviewWrite")
	public ModelAndView reviewWrite(ReviewVO reviewVO)throws Exception {
		
		
		ModelAndView mv = new ModelAndView();
		int result = reviewService.reviewWrite(reviewVO);
		
		String msg="리뷰 저장이 실패했습니다.";
		
		if(result==1) {
			msg="리뷰 저장이 완료되었습니다.";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", "reviewList");
		mv.setViewName("common/common_result");
		return mv;
	}
	
	//(상품+이미지+리뷰+리뷰파일)리스트
	@GetMapping("reviewList")
	public ModelAndView reviewList(PPager pager,RevFilesVO revFilesVO, ReviewVO reviewVO)throws Exception{
		
		List<ProductVO>ar= reviewService.reviewList(pager);
		for (ProductVO productVO : ar) {
			try {
				reviewVO= new ReviewVO();
				reviewVO.setPro_num(productVO.getPro_num());
				productVO.setTotalReview(reviewService.totalReview(reviewVO));
				Double d= reviewService.totalStar(reviewVO);
				String total	=d.toString();
				total=total.substring(0,3);
				productVO.setTotalStar(Double.parseDouble(total));
				
			} catch (Exception e) {
				
			}
		}
		
		
//		List<RevFilesVO> ar2=new ArrayList<RevFilesVO>();
//		
//		for (ProductVO productVO : ar) {
//			for (int i = 0; i < ar.size(); i++) {
//				
//				ar2.add(reviewService.photoReview(productVO.getReviewVO().get(i).getRev_num()));
//			}
//		}
//		
		
		/*
		 * for(int i=0; i<ar3.size(); i++) {
		 * System.out.println(ar3.get(i).getRev_num());
		 * System.out.println(ar3.get(i).getFname());
		 * System.out.println(ar3.get(i).getFnum()); }
		 */
		
		ModelAndView mv = new ModelAndView();
		
	
		mv.addObject("reviewList", ar);//(상품+이미지+리뷰+리뷰파일)리스트를 가져오는것
		
		//mv.addObject("photoReview", ar2);
		
		mv.addObject("pager", pager);
		
		mv.setViewName("review/reviewList");
		
		return mv;
		
	}
	
	//리뷰셀렉트
	@GetMapping("selectReview")
	public ModelAndView selectReview(ReviewVO reviewVO, RevFilesVO revFilesVO)throws Exception{
		ModelAndView mv= new ModelAndView();
		
		//System.out.println(reviewVO.getRev_num()+" = controller");
	
		reviewVO=reviewService.selectReview(reviewVO, revFilesVO);
		
		
		mv.addObject("review", reviewVO);
		mv.setViewName("review/selectReview");
		
		return mv;
	}
	
}
