package com.shoestar.client.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.orders.dao.OrdersDao;
import com.shoestar.client.orders.vo.CartVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	
	private OrdersDao ordersDao;
	
	@Override
	public List<CartVO> cartListByMemNo(int mem_no) {
		List<CartVO> result = ordersDao.cartListByMemNo(mem_no);
		return result;
	}

}
