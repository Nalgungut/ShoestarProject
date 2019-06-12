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

	@Override
	public String addToCart(CartVO cvo) {
		String result = "";
		
		if(ordersDao.duplicateCheck(cvo) == 1) {
			result = "duplicate";
		} else {
			int insertResult = ordersDao.addToCart(cvo);
			result = insertResult == 1 ? "success" : "failure";
		}
		
		return result;
	}

	@Override
	public int removeFromCart(List<CartVO> cvo) {
		int result = ordersDao.removeFromCart(cvo);
		return result;
	}
}
