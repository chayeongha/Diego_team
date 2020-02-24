package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.HomeDAO;
import com.diego.mid.dao.ProductDAO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.util.MPager;

@Service
public class HomeService {

	@Inject
	private ProductDAO productDAO;
	
	@Inject
	private HomeDAO homeDAO;
	
	public List<ProductVO>productList(MPager pager)throws Exception{
		
		pager.rowMake();
		pager.makePager(homeDAO.productCount(pager));
		
		return homeDAO.productList(pager);
		
	}
	
	public List<ProductVO>newProduct(MPager pager)throws Exception{
		
		pager.rowMake();
		pager.makePager(homeDAO.productCount(pager));
		return homeDAO.newProduct(pager);
	}
	
	public List<ProductVO>reviewList(MPager pager)throws Exception{
		
		pager.rowMake();
		pager.makePager(homeDAO.productCount(pager));
		return homeDAO.reviewList(pager);
	}
	
}
