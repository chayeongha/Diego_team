package com.diego.mid.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Service;
import com.diego.mid.dao.MemberManegeDAO;
import com.diego.mid.model.member.Cart;
import com.diego.mid.model.member.Coupon;
import com.diego.mid.model.member.Orders;
import com.diego.mid.model.member.Point;
import com.diego.mid.model.member.Wishlist;
import com.diego.mid.util.MPager;
import com.diego.mid.util.MemberFile;

@Service
public class MemberManageService {
	@Inject
	private MemberFile saver;
	@Inject
	private MemberManegeDAO dao;

	
	public int wishListInsert(Wishlist wishlist) throws Exception{
		return dao.wishListInsert(wishlist);
	}
	
	public List<Wishlist> wishListSelectList(Wishlist wishlist,MPager pager) throws Exception{
		pager.makePager(dao.wishListCount(wishlist));
		pager.rowMake();
		return dao.wishListSelectList(wishlist,pager);
	}
	
	public int wishListDelete(Wishlist wishlist)throws Exception{
		return dao.wishListDelete(wishlist);
	}
	
	public int wishListClean(Wishlist wishlist) throws Exception{
		return dao.wishListClean(wishlist);
	}
	
	public List<Integer> wishOverlapCheck(Wishlist wishlist) throws Exception{
		return dao.wishOverlapCheck(wishlist);
	}
	
	public Orders orderInsert(Orders orders) throws Exception{
		if (orders.getOrder_num() != null) {			
			orders.setOrder_num(dao.getOrderNum());
		}
		int result = dao.orderInsert(orders); 
		if (result > 0) {
			return orders;
		}else {
			
		return null;
		}
	}
	
	public int getOrderNum() throws Exception{
		return dao.getOrderNum();
	}
	
	public Orders orderSelect(Orders orders) throws Exception{
		return dao.orderSelect(orders);
	}
//////////////////////////////////////////////////////////////////////////////////////////
	public int MLcount(Orders orders) throws Exception{
		return dao.MLcount(orders);
	}
	public int SLcount(Orders orders) throws Exception{
		return dao.SLcount(orders);
	}
	public int CLcount(Orders orders) throws Exception{
		return dao.CLcount(orders);
	}
//////////////////////////////////////////////////////////////////////////////////////////
	public List<Orders> orderMyList(Orders orders,MPager pager) throws Exception{
		pager.rowMake();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", orders);
		map.put("pager", pager);
		return dao.orderMyList(map);
	}
	
	public List<Orders> orderList() throws Exception{
		return dao.orderList();
	}
	
	public List<Orders> orderCancelList(Orders orders,MPager pager) throws Exception{
		pager.rowMake();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", orders);
		map.put("pager", pager);
		return dao.orderCancelList(map);
	}
	public int orderCancel(Orders orders) throws Exception{
		return dao.orderCancel(orders);
	}
	
	public int orderUpdate(Orders orders) throws Exception{
		orders.setOrder_sum(orders.getPro_count()*orders.getPrice());
		return dao.orderUpdate(orders);
	}
	
	public List<Orders> orderSearchList(Orders orders,MPager pager) throws Exception{
		pager.rowMake();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("order", orders);
		map.put("pager", pager);
		return dao.orderSearchList(map);
	}
	
	public Orders getLastOrder(Orders orders) throws Exception{
		return dao.getLastOrder(orders);
	}
	
	public int pointInsert(Point point) throws Exception{
		if(point.getPoint_value()<0) {
			point.setPoint_value(point.getPoint_value() * -1);
		}
		if (point.getPoint_save() >0) {
			point.setPoint_save(point.getPoint_save() * -1);
		}
		point.setTotal_point(point.getPoint_value() + point.getTotal_point()+ point.getPoint_save());
		return dao.pointInsert(point);
	}
	
	public List<Point> pointMyList(Point point,MPager pager) throws Exception{
		pager.setPerPager(10);
		pager.makePager(dao.myListCount(point));
		pager.rowMake();
		return dao.pointMyList(point,pager);
	}
	
	public List<Point> pointList() throws Exception{
		return dao.pointList();
	}
	
	public int pointSave(Point point) throws Exception{
		point.setTotal_point(point.getTotal_point()+point.getPoint_save());
		return dao.pointInsert(point);
	}
	
	public int pointUse(Point point) throws Exception{
		if (point.getPoint_value() > 0) {
			point.setPoint_value(point.getPoint_value() * -1);
		}
		point.setTotal_point(point.getPoint_value() + point.getTotal_point()+point.getPoint_save());
		
		return dao.pointInsert(point);
	}
	
	public Point pointSelect(Point point) throws Exception{
		return dao.pointSelect(point);
	}
	
	public Point pointCancel(Point point) throws Exception{
		return dao.pointCalcel(point);
	}
	
	public int couponMaker(Coupon coupon) throws Exception{
		double discount = Integer.parseInt(coupon.getDiscount());
		coupon.setSales_value((100-discount)/100);
		return dao.couponInsert(coupon);
	}
	
	public int couponInsert(Coupon coupon) throws Exception{
		double discount = Integer.parseInt(coupon.getDiscount());
		coupon.setSales_value((100-discount)/100);
		return dao.couponInsert(coupon);
	}
	
	public Coupon couponSelect(Coupon coupon) throws Exception{
		return dao.couponSelect(coupon);
	}
	
	public List<Coupon> couponMyList(Coupon coupon) throws Exception{
		return dao.couponMyList(coupon);
	}
	
	public List<Coupon> couponList() throws Exception{
		return dao.couponList();
	}
	
	public int couponDelete(Coupon coupon) throws Exception{
		return dao.couponDelete(coupon);
	}
	
	public int couponUse(Coupon coupon) throws Exception{
		coupon.setUse("O");
		return dao.couponUse(coupon);
	}
	public int couponCancel(Coupon coupon) throws Exception{
		coupon.setUse("X");
		return dao.couponUse(coupon);
	}
//////////////////////////////////////////////////////////////////////////////////////////
	
	
	public int cartInsert(Cart cart) throws Exception{
		return dao.cartInsert(cart);
	}
	
	public int cartUpdate(Cart cart) throws Exception{
		return dao.cartUpdate(cart);
	}
	
	public int cartDelete(Cart cart) throws Exception{
		return dao.cartDelete(cart);
	}
	
	public Cart cartSelect(Cart cart) throws Exception{
		return dao.cartSelect(cart);
	}
	
	public List<Cart> cartList(Cart cart,MPager pager) throws Exception{
		pager.makePager(dao.cartListCoint(cart));
		pager.rowMake();
		return dao.cartList(cart,pager);
	}
	
	public int cartClean(Cart cart) throws Exception{
		return dao.cartClean(cart);
	}
	
	public List<Integer> cartOverlapCheck(Cart cart) throws Exception{
		return dao.cartOverlapCheck(cart);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
