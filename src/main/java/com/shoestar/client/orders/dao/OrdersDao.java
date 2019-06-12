package com.shoestar.client.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoestar.client.orders.vo.CartVO;

public interface OrdersDao {
	
	public List<CartVO> cartListByMemNo(int mem_no);
	
	public int addToCart(CartVO cvo);
	
	public int removeFromCart(@Param("cartlist") List<CartVO> cvo);
	
	public int duplicateCheck(CartVO cvo);
}
