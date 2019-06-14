package com.shoestar.client.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoestar.client.orders.vo.CartVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface OrdersDao {
	
	public List<CartVO> cartListByMemNo(int mem_no);
	
	public List<OrdersInsVO> prodDataByCartList(@Param("cartlist") List<CartVO> cvo);
	
	public int addToCart(CartVO cvo);
	
	public int removeFromCart(@Param("cartlist") List<CartVO> cvo);
	
	public int duplicateCheck(CartVO cvo);
	
	public Integer checkStock(CartVO cvo);
	
	public List<OrdersVO> ordersDataByMemNo(int mem_no);
	
	public List<OrdersInsVO> ordersInsByOdNo(OrdersVO ovo);
	
	public int insertNewOrders(int mem_no);
	
	public int insertOrderIns(@Param("inslist") List<OrdersInsVO> oivo, @Param("od_no") int od_no);
	
	public int updateStock(OrdersInsVO oivo);
}