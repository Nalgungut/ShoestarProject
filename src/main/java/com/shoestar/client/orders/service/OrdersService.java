package com.shoestar.client.orders.service;

import java.util.List;

import com.shoestar.client.orders.vo.CartVO;

public interface OrdersService {
	
	public List<CartVO> cartListByMemNo(int mem_no);
}