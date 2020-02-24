package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.ProsearchDAO;
import com.diego.mid.model.product.ProductVO;
import com.diego.mid.util.Pager;

@Service
public class ProsearchService {
	
	@Inject
	private ProsearchDAO prosearchDAO;
	
	public List<ProductVO>productList(Pager pager)throws Exception{

		pager.makeRow();
		pager.makePage(prosearchDAO.productCount(pager));

		return prosearchDAO.productList(pager);
	}

}
