package com.shoestar.client.myPage.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.myPage.dao.MyPageDao;
import com.shoestar.client.myPage.vo.DeliveryVO;
import com.shoestar.client.orders.dao.OrdersDao;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class MyPageServiceImpl implements MyPageService{
	
	private OrdersDao ordersDao;
	private MyPageDao mdao;
	@Override
	public List<OrdersVO> ordersDataByMemNo(int mem_no) {
		return ordersDao.ordersDataByMemNo(mem_no);
	}

	@Override
	public List<OrdersInsVO> ordersInsByOdNo(OrdersVO ovo) {
		return ordersDao.ordersInsByOdNo(ovo);
	}

	@Override
	public List<DeliveryVO> deliveryList(DeliveryVO dvo) {
		List<DeliveryVO> list = null;
		list = mdao.deliveryList(dvo);
		
		return list;
	}

}
