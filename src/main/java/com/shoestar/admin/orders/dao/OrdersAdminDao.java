package com.shoestar.admin.orders.dao;

import java.util.List;

import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface OrdersAdminDao {
	
	public List<OrdersVO> getList(OrdersVO ovo);
	
	public OrdersVO getDetail(OrdersVO ovo);
	
	public List<OrdersInsVO> getInsList(OrdersVO ovo);
	
	public int countRecords(OrdersVO ovo);
}
