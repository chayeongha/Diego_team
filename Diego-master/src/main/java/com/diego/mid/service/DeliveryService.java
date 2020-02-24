package com.diego.mid.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.diego.mid.dao.DeliveryDAO;
import com.diego.mid.model.admin.DeliveryVO;
import com.diego.mid.util.Pager;

@Service
public class DeliveryService {
	@Inject
	private DeliveryDAO deliveryDAO;
	
	//delivery List
	public List<DeliveryVO> deliveryList(Pager pager)throws Exception{
		pager.makeRow();
		pager.makePage(deliveryDAO.deliveryCount(pager));
		return deliveryDAO.deliveryList(pager);
	}
	
	//delivery Select
	public DeliveryVO deliverySelect(DeliveryVO deliveryVO)throws Exception{
		return deliveryDAO.deliverySelect(deliveryVO);
	}
	
	//delivery Insert
	public int deliveryInsert(DeliveryVO deliveryVO)throws Exception{
		return deliveryDAO.deliveryInsert(deliveryVO);
	}
	
	//delivery Update
	public int deliveryUpdate(DeliveryVO deliveryVO)throws Exception{
		return deliveryDAO.deliveryUpdate(deliveryVO);
	}
	
	//delivery Delete
	public int deliveryDelete(DeliveryVO deliveryVO)throws Exception{
		return deliveryDAO.deliveryDelere(deliveryVO);
	}
	
}
