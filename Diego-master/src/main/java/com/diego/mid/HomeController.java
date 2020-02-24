package com.diego.mid;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.product.ProductVO;
import com.diego.mid.model.product.ReviewVO;
import com.diego.mid.service.ProductService;
import com.diego.mid.service.ReviewService;
import com.diego.mid.service.HomeService;
import com.diego.mid.util.MPager;

/**
 * Handles requests for the application home page.
 */




@Controller
public class HomeController {
	
	@Inject
	private ProductService productService;
	
	@Inject
	private ReviewService reviewService;
	
	@Inject
	private HomeService homeService;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
public ModelAndView home(MPager pager, ReviewVO reviewVO) throws Exception {
		
		ModelAndView mv= new ModelAndView();
		pager.setPerPager(40);
		List<ProductVO>ar= homeService.productList(pager);
		for (ProductVO productVO : ar) {
			String before = String.valueOf(productVO.getPro_price()*1.4);
			int last=before.lastIndexOf('.');
		 	int bf =Integer.parseInt((before.substring(0,last)));
			productVO.setBeforeSale(bf);
		}
		//System.out.println(ar.get(0).getPro_main()+"=proMain");
		pager.setPerPager(24);
		List<ProductVO> ar2 = homeService.newProduct(pager);
		for (ProductVO productVO : ar2) {
//			
			String before = String.valueOf(productVO.getPro_price()*1.4);
			int last=before.lastIndexOf('.');
		 	int bf =Integer.parseInt((before.substring(0,last)));
			productVO.setBeforeSale(bf);
		}
		pager.setPerPager(12);
		List<ProductVO>ar3 = homeService.reviewList(pager);
		for (ProductVO productVO : ar3) {
			for(int i=0; i<ar.size();i++) {
		try {
			String name=productVO.getReviewVO().get(i).getName();
			name=name.substring(0, 1)+"**";
			//System.out.println(name);
			productVO.setSec_name(name);
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
		}
		
		mv.addObject("reviewList", ar3);
		mv.addObject("newPro", ar2);
		mv.addObject("productList", ar);
		mv.addObject("pager", pager);
		mv.setViewName("makeDiv");
		
		return mv;
		
	}
	
	@GetMapping("/diego")
	public void diego() {
		
	}

	@GetMapping( value = "/makeDiv")
	public ModelAndView makeDiv(MPager pager, ReviewVO reviewVO) throws Exception {
		
		ModelAndView mv= new ModelAndView();
		pager.setPerPager(24);
		List<ProductVO>ar= homeService.productList(pager);
		for (ProductVO productVO : ar) {
			String before = String.valueOf(productVO.getPro_price()*1.4);
			int last=before.lastIndexOf('.');
		 	int bf =Integer.parseInt((before.substring(0,last)));
			productVO.setBeforeSale(bf);
		}
		//System.out.println(ar.get(0).getPro_main()+"=proMain");
		pager.setPerPager(24);
		List<ProductVO> ar2 = homeService.newProduct(pager);
		for (ProductVO productVO : ar2) {

			String before = String.valueOf(productVO.getPro_price()*1.4);
			int last=before.lastIndexOf('.');
		 	int bf =Integer.parseInt((before.substring(0,last)));
			productVO.setBeforeSale(bf);
		}
		pager.setPerPager(12);
		List<ProductVO>ar3 = homeService.reviewList(pager);
		for (ProductVO productVO : ar3) {
			for(int i=0; i<ar.size();i++) {
		try {
			String name=productVO.getReviewVO().get(i).getName();
			name=name.substring(0, 1)+"**";
			//System.out.println(name);
			productVO.setSec_name(name);
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
		}
		
		mv.addObject("reviewList", ar3);
		mv.addObject("newPro", ar2);
		mv.addObject("productList", ar);
		mv.addObject("pager", pager);
		mv.setViewName("makeDiv");
		
		return mv;
		
	}
	
	

	@GetMapping("/mainProduct")
	public void mainProduct() {
		
	}
}
