package com.diego.mid.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.diego.mid.model.admin.DeliveryVO;
import com.diego.mid.util.Pager;
@Repository
public class DeliveryDAO {
	@Inject
	private SqlSession session;
	private static final String NAMESPACE="deliveryMapper.";
	
	//delivery Count
	public int deliveryCount(Pager pager)throws Exception{
		return session.selectOne(NAMESPACE+"deliveryCount", pager);
	}
	
	//delivery List
	public List<DeliveryVO> deliveryList(Pager pager) throws Exception{
		return session.selectList(NAMESPACE+"deliveryList", pager);
	}
	
	//delivery Select
	public DeliveryVO deliverySelect(DeliveryVO deliveryVO)throws Exception{
		return session.selectOne(NAMESPACE+"deliverySelect", deliveryVO);
	}
	
	//delivery Insert
	public int deliveryInsert(DeliveryVO deliveryVO) throws Exception{
		return session.insert(NAMESPACE+"deliveryInsert", deliveryVO);
	}
	
	//delivery Update
	public int deliveryUpdate(DeliveryVO deliveryVO)throws Exception{
		return session.update(NAMESPACE+"deliveryUpdate", deliveryVO);
	}

	//delivery Delete
	public int deliveryDelere(DeliveryVO deliveryVO)throws Exception {
		return session.delete(NAMESPACE+"deliveryDelete", deliveryVO);
	}
}
