package com.diego.mid.controller;

import java.sql.Date;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.diego.mid.model.member.Cart;
import com.diego.mid.model.member.Coupon;
import com.diego.mid.model.member.MemberVO;
import com.diego.mid.model.member.Orders;
import com.diego.mid.model.member.Point;
import com.diego.mid.model.member.Wishlist;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.service.MemberManageService;
import com.diego.mid.service.MemberService;
import com.diego.mid.service.ProductService;
import com.diego.mid.util.KakaoPay;
import com.diego.mid.util.MPager;
import com.diego.mid.util.Pager;

@Controller
@RequestMapping("member/memberManage/**")
public class MemberManageController {
	
	@Inject
	private MemberManageService service;
	
	@Inject
	private ProductService proService;
	
	@Inject
	private MemberService memService;
	
	
//@@@@@@@@@@@@@POINT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@GetMapping("pointUse")
	public ModelAndView pointUpdate(HttpSession session) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		Point point = new Point();
		point.setId(vo.getId());
		point = service.pointSelect(point);
		mv.addObject("point", point);
		return mv;
	}
	
	@PostMapping("pointUse")
	public ModelAndView pointUse(Point point) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		
		if (point.getTotal_point() >= point.getPoint_value()) {
			result = service.pointUse(point);
		}
		int msg = 0;
		if (result>0) {
			msg =1;
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	
	@GetMapping("pointInsert")
	public ModelAndView pointInsert(HttpSession session) throws Exception{
		MemberVO vo = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		Point point = new Point();
		point.setId(vo.getId());
		point = service.pointSelect(point);
		mv.addObject("point", point);
		return mv;
	}
	
	@PostMapping("pointInsert")
	public ModelAndView pointInsert(Point point) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = service.pointInsert(point);
		int msg = 0;
		if (result>0) {
			msg =1;
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@GetMapping("pointMyList")
	public ModelAndView pointMyList(HttpSession session,MPager pager) throws Exception{
		if (pager.getCurPage() == null) {
			pager.setCurPage(1);
		}
		ModelAndView mv = new ModelAndView();
		Point point = new Point();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		point.setId(vo.getId());
		List<Point> ar= service.pointMyList(point,pager);
		mv.addObject("pointList", ar);
		mv.addObject("total", ar.get(0).getTotal_point());
		mv.addObject("pager", pager);
		mv.setViewName("/member/memberManage/pointList");
		
		return mv;
	}
	
	@PostMapping("pointListAjax")
	public ModelAndView pointListAjax(Point point, MPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("pointList", service.pointMyList(point, pager));
		mv.addObject("pager", pager);
		mv.setViewName("/member/memberManage/pointListAjax");
		return mv;
	}
	
	@GetMapping("pointList")
	public ModelAndView pointList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("pointList", service.pointList());
		mv.addObject("page", "All POINT");
		mv.setViewName("/member/memberManage/pointList");
		
		return mv;
	}
	
//@@@@@@@@@@@@@POINT@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//@@@@@@@@@@@@@WISHLIST@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@GetMapping("wishListInsert")
	public void wishListInsert(HttpSession session) {
		
	}
	
	@PostMapping("wishListInsert")
	public ModelAndView wishListInsert(Wishlist wishlist) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Integer> numCheck = service.wishOverlapCheck(wishlist);
		int result = 0;
		for (Integer integer : numCheck) {
			if (integer != wishlist.getPro_num()) {				
				result = service.wishListInsert(wishlist);
			}
		}
		String msg	 = "실패";
		String path = "#";
		if (result > 0) {
			msg = "성공";
			path = "/mid/diego";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_msg");
		return mv;
	}
	
	
	@GetMapping("wishListSelectList")
	public ModelAndView wishListSelectList(HttpSession session,MPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		if (pager.getCurPage() == null) {
			pager.setCurPage(1);
		}
		MemberVO vo = (MemberVO)session.getAttribute("member");
		Wishlist wishlist = new Wishlist();
		wishlist.setId(vo.getId());
		
		List<Wishlist> ar = service.wishListSelectList(wishlist,pager);
		mv.addObject("wishList", ar);
		int sum = 0;
		for (Wishlist wishlist2 : ar) {
			sum+=wishlist2.getPrice();
		}
		mv.addObject("sum", sum);
		mv.addObject("pager", pager);
		mv.setViewName("/member/memberManage/wishListSelectList");
		
		return mv;
		
	}
	
	@GetMapping("wishListAjax")
	public ModelAndView wishListAjax(Wishlist wishlist, MPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Wishlist> ar = service.wishListSelectList(wishlist, pager);
		mv.addObject("wishList", ar);
		int sum = 0;
		for (Wishlist wishlist2 : ar) {
			sum+=wishlist2.getPrice();
		}
		mv.addObject("sum", sum);
		mv.addObject("pager", pager);
		mv.setViewName("/member/memberManage/wishAjax");
		return mv;
	}
	
	@PostMapping("wishListClean")
	public ModelAndView wishListClean(Wishlist wishlist) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = service.wishListClean(wishlist);
		int msg = 0;
		if (result > 0) {
			msg = 1;
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}

	@PostMapping("wishListDelete")
	public ModelAndView wishListDelete(Wishlist wishlist,String[] num) throws Exception{
		ModelAndView mv = new ModelAndView();
		int check = 0;
		int result = 0;
		for (String string : num) {
			
			wishlist.setWish_num(Integer.parseInt(string));
			check = service.wishListDelete(wishlist);
			Thread.sleep(200);
			if (check == 1) {
				result++;
			}
		}
		if (result == num.length) {
			result = 1;
		}
		
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	
	@PostMapping("wishAjaxInsert")
	public ModelAndView wishAjaxInsert(ProductVO productVO, Wishlist wishlist) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Integer> numCheck = service.wishOverlapCheck(wishlist);
		int result = 0;
		if (numCheck.size() != 0) {
				
			for (Integer integer : numCheck) {
				if (!integer.equals(productVO.getPro_num())) {
					result++;
				}
			}
			
			if (result == numCheck.size()) {
				productVO = proService.productGetInfo(productVO);
				wishlist.setImage(productVO.getPro_image());
				wishlist.setPro_info(productVO.getPro_name());
				wishlist.setPrice(productVO.getPro_price());
				wishlist.setDelivery_cost("무료배송");
				
				result = service.wishListInsert(wishlist);
			}
		}else {
			productVO = proService.productGetInfo(productVO);
			wishlist.setImage(productVO.getPro_image());
			wishlist.setPro_info(productVO.getPro_name());
			wishlist.setPrice(productVO.getPro_price());
			wishlist.setDelivery_cost("무료배송");
			
			result = service.wishListInsert(wishlist);
		}
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	
	@PostMapping("wishListCheckInsert")
	public ModelAndView wishListCheckInsert(ProductVO productVO, Wishlist wishlist, String[] num)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		for (String string : num) {
			int check = 0;
			
			List<Integer> numCheck = service.wishOverlapCheck(wishlist);
			
			if (numCheck.size() != 0) {
				for (Integer integer : numCheck) {
					if (!integer.equals(Integer.parseInt(string))) {
						check++;
					}
				}
				
				if (check == numCheck.size()) {
					
					productVO.setPro_num(Integer.parseInt(string));
					productVO = proService.productGetInfo(productVO);
					wishlist.setPro_num(productVO.getPro_num());
					wishlist.setImage(productVO.getPro_image());
					wishlist.setPro_info(productVO.getPro_name());
					wishlist.setPrice(productVO.getPro_price());
					wishlist.setDelivery_cost("무료배송");
					
					result = service.wishListInsert(wishlist);
					
				}
				
				
				
			}else {
				productVO.setPro_num(Integer.parseInt(string));
				productVO = proService.productGetInfo(productVO);
				wishlist.setPro_num(productVO.getPro_num());
				wishlist.setImage(productVO.getPro_image());
				wishlist.setPro_info(productVO.getPro_name());
				wishlist.setPrice(productVO.getPro_price());
				wishlist.setDelivery_cost("무료배송");
				
				result = service.wishListInsert(wishlist);
			}
			
		}
		
		
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	
	
//@@@@@@@@@@@@@WISHLIST@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//@@@@@@@@@@@@@ORDER@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	@GetMapping("orderInsert")
	public ModelAndView orderInsert(HttpSession session) throws Exception {
		ModelAndView mv = new ModelAndView();
		Point point = new Point();
		Coupon coupon = new Coupon();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		coupon.setId(vo.getId());
		point.setId(vo.getId());
		mv.addObject("couponList", service.couponMyList(coupon));
		mv.addObject("point", service.pointSelect(point));
		mv.setViewName("/member/memberManage/orderInsert");
		
		return mv;
	}
	
	@GetMapping("orderInsertAjax")
	public ModelAndView orderInsertAjax(ProductVO vo, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		vo = proService.productGetInfo(vo);
		Point point = new Point();
		Coupon coupon = new Coupon();
		MemberVO mVo = (MemberVO)session.getAttribute("member");
		coupon.setId(mVo.getId());
		point.setId(mVo.getId());
		mv.addObject("proVO", vo);
		mv.addObject("couponList", service.couponMyList(coupon));
		mv.addObject("point", service.pointSelect(point));
		mv.setViewName("/member/memberManage/orderInsertAjax");
		return mv;
	}
	
	
	@PostMapping("orderInsert")
	public ModelAndView orderInsert(Orders orders,HttpSession session,Coupon coupon, Point point,ProductVO productVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = proService.productGetInfo(productVO);
		orders.setImage(productVO.getPro_image());
		orders.setOrder_sum(orders.getPro_count()*orders.getPrice()-point.getPoint_value());
		orders = service.orderInsert(orders);
		point.setOrder_num(orders.getOrder_num());
		point.setContents(orders.getPro_info());
		
		int result = 0;
		int pInsert = 0;
		double x = (Integer)session.getAttribute("ps") *0.01;
		point.setPoint_save((int)(orders.getOrder_sum()*x));
		
		if (point.getPoint_value() == 0) {
			pInsert = service.pointSave(point);
		}else {
			pInsert=service.pointUse(point);			
		}
		
		int cUse = 0;
		if (coupon.getCoup_num() == 9999) {
			cUse = 1;
		}else {
			cUse = service.couponUse(coupon);
		}
		
		if (pInsert==1 && cUse == 1) {
			result = 1;
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			int getPay = memService.getPay(memberVO);
			memberVO.setTotal_pay(getPay+orders.getOrder_sum());
			result = memService.setPay(memberVO);
			
		}else if(pInsert == 1 && cUse != 1) {
			cUse = service.couponCancel(coupon);
		}else if (pInsert != 1 && cUse == 1) {
			point.setContents("주문실패");
			pInsert = service.pointInsert(point);
		}else {
			cUse = service.couponCancel(coupon);
			point.setContents("주문실패");
			pInsert = service.pointUse(point);
		}
		
		
		String msg	 = "실패";
		String path = "#";
		if (result > 0) {
			
			msg = "성공";
			path = "/mid/diego";
		}
		mv.addObject("msg", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_msg");
		return mv;
	}
	
	@PostMapping("orderInsertAjax")
	public ModelAndView orderInsertAjax(Orders orders,HttpSession session,Coupon coupon, Point point,ProductVO productVO) throws Exception{
		ModelAndView mv = new ModelAndView();
		productVO = proService.productGetInfo(productVO);
		orders.setImage(productVO.getPro_image());
		orders.setOrder_sum(orders.getPro_count()*orders.getPrice()-point.getPoint_value());
		orders = service.orderInsert(orders);
		point.setOrder_num(orders.getOrder_num());
		point.setContents(orders.getPro_info());
		
		int result = 0;
		int pInsert = 0;
		double x = (Integer)session.getAttribute("ps") *0.01;
		point.setPoint_save((int)(orders.getOrder_sum()*x));
		
		if (point.getPoint_value() == 0) {
			pInsert = service.pointSave(point);
		}else {
			pInsert=service.pointUse(point);			
		}
		
		int cUse = 0;
		if (coupon.getCoup_num() == 9999) {
			cUse = 1;
		}else {
			cUse = service.couponUse(coupon);
		}
		
		if (pInsert==1 && cUse == 1) {
			result = 1;
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			int getPay = memService.getPay(memberVO);
			memberVO.setTotal_pay(getPay+orders.getOrder_sum());
			result=memService.setPay(memberVO);
			
		}else if(pInsert == 1 && cUse != 1) {
			cUse = service.couponCancel(coupon);
		}else if (pInsert != 1 && cUse == 1) {
			point.setContents("주문실패");
			pInsert = service.pointInsert(point);
		}else {
			cUse = service.couponCancel(coupon);
			point.setContents("주문실패");
			pInsert = service.pointUse(point);
		}
		
		
		int msg	 = 0;
		if (result > 0) {
			
			msg = 1;
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	@GetMapping("orderSelect")
	public ModelAndView orderSelect(Orders orders, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("orders", service.orderSelect(orders));
		mv.setViewName("/member/memberManage/orderSelect");
		return mv;
	}
	
	@GetMapping("orderMyList")
	public ModelAndView orderMyList(HttpSession session,MPager pager)throws Exception{
		
		Calendar ca = Calendar.getInstance();
		ca.setTimeInMillis(ca.getTimeInMillis()-(1000L*60*60*24*90));
		Date d = new Date(ca.getTimeInMillis());
		
		
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		Orders orders = new Orders();
		orders.setId(vo.getId());
		orders.setOrder_date(d);
		pager.makePager(service.MLcount(orders));
		List<Orders> ar = service.orderMyList(orders,pager);
		for (Orders orders2 : ar) {
			if (orders2.getOrder_status().equals("WP")) {
				orders2.setOrder_status("결제 대기중");
			}else if(orders2.getOrder_status().equals("OC")) {
				orders2.setOrder_status("주문 취소");
			}else if(orders2.getOrder_status().equals("WD")) {
				orders2.setOrder_status("배송준비중");
			}else if(orders2.getOrder_status().equals("DV")) {
				orders2.setOrder_status("배송중");
			}else if(orders2.getOrder_status().equals("DC")) {
				orders2.setOrder_status("배송 완료");
			}else if(orders2.getOrder_status().equals("OX")) {
				orders2.setOrder_status("교환 요청");
			}else if(orders2.getOrder_status().equals("OR")) {
				orders2.setOrder_status("반품 요청");
			}else {
				orders2.setOrder_status("구매 확정");
			}
		}
		mv.addObject("pager", pager);
		mv.addObject("orderList", ar);
		mv.setViewName("/member/memberManage/orderMyList");
		return mv;
	}
	
	@GetMapping("orderAllList")
	public ModelAndView orderAllList(Orders orders,HttpSession session,MPager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		pager.makePager(service.SLcount(orders));
		List<Orders> ar = service.orderSearchList(orders,pager);
		String h1 = "AL";
		for (Orders orders2 : ar) {
			if (orders2.getOrder_status().equals("WP")) {
				orders2.setOrder_status("결제 대기중");
			}else if(orders2.getOrder_status().equals("OC")) {
				orders2.setOrder_status("주문 취소");
				h1="IC";
			}else if(orders2.getOrder_status().equals("WD")) {
				orders2.setOrder_status("배송준비중");
			}else if(orders2.getOrder_status().equals("DV")) {
				orders2.setOrder_status("배송중");
			}else if(orders2.getOrder_status().equals("DC")) {
				orders2.setOrder_status("배송 완료");
			}else if(orders2.getOrder_status().equals("OX")) {
				orders2.setOrder_status("교환 요청");
				h1="IC";
			}else if(orders2.getOrder_status().equals("OR")) {
				orders2.setOrder_status("반품 요청");
				h1="IC";
			}else {
				orders2.setOrder_status("구매 확정");
			}
		}
		mv.addObject("pager", pager);
		mv.addObject("orderList", ar);
		mv.addObject("h1", h1);
		mv.setViewName("/member/memberManage/listAjax");
		return mv;
	}
	
	@GetMapping("orderCancelList")
	public ModelAndView orderCancelList(Orders orders,HttpSession session,MPager pager) throws Exception {
		ModelAndView mv = new ModelAndView();
		pager.makePager(service.CLcount(orders));
		List<Orders> ar = service.orderCancelList(orders,pager);
		for (Orders orders2 : ar) {
			if (orders2.getOrder_status().equals("OC")) {
				orders2.setOrder_status("주문 취소");
			}else if(orders2.getOrder_status().equals("OX")) {
				orders2.setOrder_status("교환 요청");
			}else {
				orders2.setOrder_status("반품 요청");
			}
		}
		mv.addObject("pager", pager);
		mv.addObject("orderList", ar);
		mv.addObject("h1", "IC");
		mv.setViewName("/member/memberManage/listAjax");
		return mv;
	}
	
	@PostMapping("orderCancel")
	public ModelAndView orderCancel(Orders orders,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		Coupon coupon = new Coupon();
		Point point = new Point();
		int result=0;
		MemberVO vo = (MemberVO)session.getAttribute("member");
		orders = service.orderSelect(orders);
		if (orders.getId().equals(vo.getId())) {
			result = service.orderCancel(orders);
		}
		if (result > 0) {
			if (orders.getCoup_num() != 9999) {
				coupon.setCoup_num(orders.getCoup_num());
				result = service.couponCancel(coupon);
			}
			
			point.setOrder_num(orders.getOrder_num());
			point = service.pointCancel(point);
			
			if (point != null) {
				point.setContents("주문 취소");
				result = service.pointInsert(point);
			}
			
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			int getPay = memService.getPay(memberVO);
			memberVO.setTotal_pay(getPay-orders.getOrder_sum());
			result = memService.setPay(memberVO);
		}
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@GetMapping("orderUpdate")
	public ModelAndView orderUpdate(Orders orders, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		orders = service.orderSelect(orders);
		MemberVO vo = (MemberVO)session.getAttribute("member");
		if (orders.getId().equals(vo.getId())) {
			mv.addObject("orders", orders);
			mv.setViewName("/member/memberManage/orderUpdate");
		}else {
			mv.setViewName("#");			
		}
		
		return mv;
	}
	
	@PostMapping("orderUpdate")
	public ModelAndView orderUpdate(Orders orders) throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = service.orderUpdate(orders);
		String msg	 = "실패";
		String path = "#";
		if (result > 0) {
			msg = "성공";
			path = "/mid/diego";
		}
		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_msg");
		
		
		return mv;
	}
	
//@@@@@@@@@@@@@ORDER@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

//@@@@@@@@@@@@@COUPON@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	@GetMapping("couponList")
	public ModelAndView couponList() throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("couponList", service.couponList());
		mv.setViewName("/member/memberManage/couponList");
		
		return mv;
	}
	
	@GetMapping("couponMyList")
	public ModelAndView couponMyList(Coupon coupon,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		coupon.setId(vo.getId());
		mv.addObject("couponList", service.couponMyList(coupon));
		mv.setViewName("/member/memberManage/couponMyList");
		
		return mv;
	}
	
	@GetMapping("couponMaker")
	public void couponMaker() throws Exception{
		
	}
	
	@PostMapping("couponMaker")
	public ModelAndView couponMaker(Coupon coupon) throws Exception{
		ModelAndView mv = new ModelAndView();
		String msg	 = "실패";
		String path = "/mid/diego";
		int result =service.couponMaker(coupon);
		if (result > 0) {
			msg = "성공";
			path = "/mid/member/memberManage/couponList";
		}
		mv.addObject("result", msg);
		mv.addObject("path", path);
		mv.setViewName("common/common_msg");
		
		return mv;
		
	}
	
	@GetMapping("couponDelete")
	public ModelAndView couponDelete(Coupon coupon) throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("msg", service.couponDelete(coupon));
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@GetMapping("couponInsert")
	public ModelAndView couponInsert(Coupon coupon, HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		coupon = service.couponSelect(coupon);
		coupon.setId(vo.getId());
		List<Coupon> ar = service.couponMyList(coupon);
		boolean check = true;
		for (Coupon coupon2 : ar) {
			if (coupon2.getCoup_name().equals(coupon.getCoup_name())) {
				check = false;
			}
		}
		int msg = 0;
		if (check) {
			msg = service.couponInsert(coupon);
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	
	
//@@@@@@@@@@@@@COUPON@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//@@@@@@@@@@@@@CART@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@

	@GetMapping("cartList")
	public ModelAndView cartList(Cart cart,HttpSession session, MPager pager) throws Exception{
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		cart.setId(vo.getId());
		Point point = new Point();
		Coupon coupon = new Coupon();
		point.setId(vo.getId());
		coupon.setId(vo.getId());
		pager.setPerPager(10);
		List<Cart> ar = service.cartList(cart,pager);
		mv.addObject("point", service.pointSelect(point));
		mv.addObject("coupon", service.couponMyList(coupon));
		mv.addObject("cartList", ar);
		mv.addObject("pager", pager);
		mv.setViewName("/member/memberManage/cartList");
		return mv;
	}
	
	@PostMapping("cartInsert")
	public ModelAndView cartInsert(Cart cart,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = service.cartInsert(cart);
		String msg = "0";
		if (result > 0) {
			msg = "1";
		}
		List<Integer> cr = service.cartOverlapCheck(cart);
		session.setAttribute("cc", cr.size());
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@PostMapping("cartUpdate")
	public ModelAndView cartUpdate(Cart cart) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = service.cartUpdate(cart);
		String msg = "0";
		if (result > 0) {
			msg = "1";
		}
		mv.addObject("msg", msg);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@PostMapping("cartDelete")
	public ModelAndView cartDelete(Cart cart,String[] num,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int check = 0;
		int result = 0;
		for (String string : num) {
			cart.setCart_num(Integer.parseInt(string));
			check = service.cartDelete(cart);
			Thread.sleep(200);
			if (check == 1) {
				result++;
			}
		}
		if (result == num.length) {
			result = 1;
		}
		
		List<Integer> cr = service.cartOverlapCheck(cart);
		session.setAttribute("cc", cr.size());
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@PostMapping("cartClean")
	public ModelAndView cartClean(Cart cart,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		
		int result = service.cartClean(cart);
		
		List<Integer> cr = service.cartOverlapCheck(cart);
		session.setAttribute("cc", cr.size());
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	@PostMapping("cartAjaxInsert")
	public ModelAndView cartAjaxInsert(Cart cart,ProductVO productVO,HttpSession session) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Integer> numCheck = service.cartOverlapCheck(cart);
		int result = 0;
		int check = 0;
		if (numCheck.size() != 0) {
			for (Integer integer : numCheck) {
				if (!integer.equals(productVO.getPro_num())) {
					check++;
				}
			}
			
			if (check == numCheck.size()) {
				
				productVO = proService.productGetInfo(productVO);
				cart.setPro_info(productVO.getPro_name());
				cart.setPro_image(productVO.getPro_image());
				cart.setPro_price(productVO.getPro_price());
				cart.setPro_count(1);
				
				result = service.cartInsert(cart);
			}
			
			
		}else {
			productVO = proService.productGetInfo(productVO);
			cart.setPro_info(productVO.getPro_name());
			cart.setPro_image(productVO.getPro_image());
			cart.setPro_price(productVO.getPro_price());
			cart.setPro_count(1);
			
			result = service.cartInsert(cart);
			
			
		}
		List<Integer> cr = service.cartOverlapCheck(cart);
		session.setAttribute("cc", cr.size());
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		
		return mv;
	}
	
	@PostMapping("cartCheckInsert")
	public ModelAndView cartCheckInsert(ProductVO productVO,Cart cart, String[] num,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result = 0;
		for (String string : num) {
			int check = 0;
			
			List<Integer> numCheck = service.cartOverlapCheck(cart);
			
			if (numCheck.size() != 0) {
				for (Integer integer : numCheck) {
					if (!integer.equals(Integer.parseInt(string))) {
						check++;
					}
				}
				
				if (check == numCheck.size()) {
					
					productVO.setPro_num(Integer.parseInt(string));
					productVO = proService.productGetInfo(productVO);
					cart.setPro_num(productVO.getPro_num());
					cart.setPro_image(productVO.getPro_image());
					cart.setPro_info(productVO.getPro_name());
					cart.setPro_price(productVO.getPro_price());
					cart.setPro_count(1);
					
					
					result = service.cartInsert(cart);
				}
				
				
				
			}else {
				productVO.setPro_num(Integer.parseInt(string));
				productVO = proService.productGetInfo(productVO);
				cart.setPro_num(productVO.getPro_num());
				cart.setPro_image(productVO.getPro_image());
				cart.setPro_info(productVO.getPro_name());
				cart.setPro_price(productVO.getPro_price());
				cart.setPro_count(1);
				
				
				result = service.cartInsert(cart);
			}
			
			Thread.sleep(300);
		}
		
		List<Integer> cr = service.cartOverlapCheck(cart);
		session.setAttribute("cc", cr.size());
		mv.addObject("msg", result);
		mv.setViewName("common/common_ajax_result");
		return mv;
	}
	
	//@@@@@@@@@@@@@CART@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
//@@@@@@@@@@@@@PAY@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
	
	
	@GetMapping("payPage")
	public ModelAndView payPage(HttpSession session,String[] num) throws Exception{
		ModelAndView mv = new ModelAndView();
		List<ProductVO> ar = new ArrayList<ProductVO>();
		for (String pNum : num) {
			int getNum	= Integer.parseInt(pNum);
			ProductVO vo = new ProductVO();
			vo.setPro_num(getNum);
			vo = proService.productGetInfo(vo);
			ar.add(vo);
		}
		MemberVO memVO = (MemberVO)session.getAttribute("member"); 
		Point point = new Point();
		Coupon coupon = new Coupon();
		point.setId(memVO.getId());
		coupon.setId(memVO.getId());
		mv.addObject("list", ar);
		mv.addObject("point", service.pointSelect(point));
		mv.addObject("coupon", service.couponMyList(coupon));
		mv.setViewName("/member/memberManage/payPage");
		
		return mv;
	}
	
	@Inject
	private KakaoPay kakaoPay;
	
	@GetMapping("/kakaoPay")
	public void kakaoPayGet() {
		
	}
	
	@PostMapping("kakaoPay")  
	public String kakaoPay(Orders orders,Point point,HttpSession session,Coupon coupon) throws Exception{
		orders.setOrder_num(service.getOrderNum());
		orders = service.orderInsert(orders);
		point.setOrder_num(orders.getOrder_num());
		point.setContents(orders.getPro_info());
		
		int result = 0;
		int pInsert = 0;
		
		if (point.getPoint_value() == 0) {
			pInsert = service.pointSave(point);
		}else {
			pInsert=service.pointUse(point);			
		}
		
		int cUse = 0;
		if (coupon.getCoup_num() == 9999) {
			cUse = 1;
		}else {
			cUse = service.couponUse(coupon);
		}
		
		if (pInsert==1 && cUse == 1) {
			result = 1;
			MemberVO memberVO = (MemberVO)session.getAttribute("member");
			int getPay = memService.getPay(memberVO);
			memberVO.setTotal_pay(getPay+orders.getOrder_sum());
			result = memService.setPay(memberVO);
			
		}else if(pInsert == 1 && cUse != 1) {
			cUse = service.couponCancel(coupon);
		}else if (pInsert != 1 && cUse == 1) {
			point.setContents("주문실패");
			pInsert = service.pointInsert(point);
		}else {
			cUse = service.couponCancel(coupon);
			point.setContents("주문실패");
			pInsert = service.pointUse(point);
		}
		return "redirect:" + kakaoPay.kakaoPayReady(orders);
	}
	
	@GetMapping("kakaoPayCancel")
	public ModelAndView kakaoPayCancel() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", "결제를 취소하셨습니다.");
		mv.addObject("path", "/mid/member/memberManage/orderMyList");
		mv.setViewName("common/common_msg");
		return mv;
	}
	
	@GetMapping("kakaoPaySuccess")
	public ModelAndView kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model,Orders orders,HttpSession session) throws Exception {
        System.out.println("kakaoPaySuccess pg_token : " + pg_token);
		ModelAndView mv = new ModelAndView();
		MemberVO vo = (MemberVO)session.getAttribute("member");
		orders.setId(vo.getId());
		orders = service.getLastOrder(orders);
		orders.setOrder_status("WD");
		orders.setOrder_result(pg_token);
		int result = service.orderUpdate(orders);
		mv.addObject("msg", "결제가 승인됐습니다.");
		mv.addObject("path", "/mid/member/memberManage/orderMyList");
		mv.setViewName("common/common_msg");
		return mv;
	}
	
	@GetMapping("kakaoPayFail")
	public ModelAndView kakaoPayFail() throws Exception{
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", "결제를 실패하였습니다.");
		mv.addObject("path", "/mid/member/memberManage/orderMyList");
		mv.setViewName("common/common_msg");
		return mv;
	}
	
	
	
}
