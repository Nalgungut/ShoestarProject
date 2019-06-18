package com.shoestar.client.orders.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;
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
	
	public int insertNewOrders(OrdersVO ovo);
	
	public int insertOrderIns(OrdersInsVO oivo);
	
	public int updateStock(OrdersInsVO oivo);
	
	public int insertDeliveryInfo(AdminDeliveryVO dvo);

}