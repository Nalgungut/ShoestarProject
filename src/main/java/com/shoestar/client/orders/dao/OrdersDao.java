package com.shoestar.client.orders.dao;

import java.util.List;

import com.shoestar.client.orders.vo.CartVO;

public interface OrdersDao {
	
	public List<CartVO> cartListByMemNo(int mem_no);
}
