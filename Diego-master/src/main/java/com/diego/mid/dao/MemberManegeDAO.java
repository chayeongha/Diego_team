package com.diego.mid.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.member.Cart;
import com.diego.mid.model.member.Coupon;
import com.diego.mid.model.member.Orders;
import com.diego.mid.model.member.Point;
import com.diego.mid.model.member.Wishlist;
import com.diego.mid.util.MPager;

@Repository
public class MemberManegeDAO {
	@Inject
	private SqlSession sql;
	
	private static final String COUPON = "couponMapper.";
	private static final String POINT = "pointMapper.";
	private static final String ORDER = "orderMapper.";
	private static final String WISHLIST = "wishListMapper.";
	private static final String CART = "cartMapper.";
	
	public int wishListInsert(Wishlist wishlist) throws Exception{
		return sql.insert(WISHLIST+"wishListInsert",wishlist);
	}
	
	public int wishListCount(Wishlist wishlist) throws Exception{
		return sql.selectOne(WISHLIST+"wishListCount",wishlist);
	}
	
	public List<Wishlist> wishListSelectList(Wishlist wishlist,MPager pager) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("wish", wishlist);
		map.put("pager", pager);
		return sql.selectList(WISHLIST+"wishListSelectList",map);
	}
	
	public int wishListDelete(Wishlist wishlist)throws Exception{
		return sql.delete(WISHLIST+"wishListDelete",wishlist);
	}
	
	public int wishListClean(Wishlist wishlist) throws Exception{
		return sql.delete(WISHLIST+"wishListClean",wishlist);
	}
	
	public List<Integer> wishOverlapCheck(Wishlist wishlist) throws Exception{
		return sql.selectList(WISHLIST+"overlapCheck",wishlist);
	}
	
	
//	
//	public Integer wishListGetSum(Wishlist wishlist) throws Exception{
//		return sql.selectOne(WISHLIST+"wishListGetSum",wishlist);
//	}
//	
//	public Integer wishListSetSum(Wishlist wishlist) throws Exception{
//		return sql.update(WISHLIST+"wishListSetSum",wishlist);
//	}
	
	public int getOrderNum() throws Exception{
		return sql.selectOne(ORDER+"getOrderNum");
	}
	
	public int orderInsert(Orders orders) throws Exception{
		return sql.insert(ORDER+"orderInsert",orders);
	}
	
	public Orders orderSelect(Orders orders) throws Exception{
		return sql.selectOne(ORDER+"orderSelect",orders);
	}
	
	public Integer MLcount(Orders orders) throws Exception{
		return sql.selectOne(ORDER+"MLcount",orders);
	}
	
	public List<Orders> orderMyList(Map<String, Object> map) throws Exception{
		return sql.selectList(ORDER+"orderMyList",map);
	}
	
	public List<Orders> orderList() throws Exception{
		return sql.selectList(ORDER+"orderList");
	}
	
	public Integer CLcount(Orders orders) throws Exception{
		return sql.selectOne(ORDER+"CLcount",orders);
	}
	
	public List<Orders> orderCancelList(Map<String, Object> map) throws Exception{
		return sql.selectList(ORDER+"orderCancelList",map);
	}
	
	
	public int orderCancel(Orders orders) throws Exception{
		return sql.update(ORDER+"orderCancel",orders);
	}
	
	public int orderUpdate(Orders orders) throws Exception{
		return sql.update(ORDER+"orderUpdate",orders);
	}
	
	public Integer SLcount(Orders orders) throws Exception{
		return sql.selectOne(ORDER+"SLcount",orders);
	}
	
	public List<Orders> orderSearchList(Map<String, Object> map) throws Exception{
		return sql.selectList(ORDER+"orderSearchList",map);
	}
	
	public Orders getLastOrder(Orders orders) throws Exception{
		return sql.selectOne(ORDER+"getLastOrder",orders);
	}
	
	
	public int pointInsert(Point point) throws Exception{
		return sql.insert(POINT+"pointInsert",point);
	}
	
	public int myListCount(Point point) throws Exception{
		return sql.selectOne(POINT+"myListCount",point);
	}
	
	public List<Point> pointMyList(Point point,MPager pager) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("point", point);
		map.put("pager", pager);
		return sql.selectList(POINT+"pointMyList",map);
	}
	
	public List<Point> pointList() throws Exception{
		return sql.selectList(POINT+"pointList");
	}
	
	public Point pointSelect(Point point) throws Exception{
		return sql.selectOne(POINT+"pointSelect",point);
	}
	
	public Point pointCalcel(Point point) throws Exception{
		return sql.selectOne(POINT+"pointCancel",point);
	}
	
	public int couponInsert(Coupon coupon) throws Exception{
		return sql.insert(COUPON+"couponInsert",coupon);
	}
	
	public Coupon couponSelect(Coupon coupon) throws Exception{
		return sql.selectOne(COUPON+"couponSelect",coupon);
	}
	
	public List<Coupon> couponMyList(Coupon coupon) throws Exception{
		return sql.selectList(COUPON+"couponMyList",coupon);
	}
	
	public List<Coupon> couponList() throws Exception{
		return sql.selectList(COUPON+"couponList");
	}
	
	public int couponDelete(Coupon coupon) throws Exception{
		return sql.delete(COUPON+"couponDelete",coupon);
	}
	
	public int couponUse(Coupon coupon) throws Exception{
		return sql.update(COUPON+"couponUse",coupon);
	}
	
	
	public int cartInsert(Cart cart) throws Exception{
		return sql.insert(CART+"cartInsert",cart);
	}
	
	public int cartDelete(Cart cart) throws Exception{
		return sql.delete(CART+"cartDelete",cart);
	}
	
	public int cartUpdate (Cart cart) throws Exception{
		return sql.update(CART+"cartUpdate",cart);
	}
	
	public Cart cartSelect(Cart cart) throws Exception{
		return sql.selectOne(CART+"cartSelect",cart);
	}
	
	public List<Cart> cartList(Cart cart,MPager pager) throws Exception{
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("cart", cart);
		map.put("pager", pager);
		return sql.selectList(CART+"cartList",map);
	}
	
	public int cartListCoint(Cart cart) throws Exception{
		return sql.selectOne(CART+"cartListCount",cart);
	}
	
	public int cartClean(Cart cart) throws Exception{
		return sql.delete(CART+"cartClean",cart);
	}
	
	public List<Integer> cartOverlapCheck(Cart cart) throws Exception{
		return sql.selectList(CART+"overlapCheck",cart);
	}
	
	
	
	
	
	
	
	
}

