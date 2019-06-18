package com.shoestar.admin.orders.service;

import java.util.List;

import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface OrdersAdminService {
	
	public List<OrdersVO> getList(OrdersVO ovo);
	
	public OrdersVO getDetail(OrdersVO ovo);
	
	public List<OrdersInsVO> getInsList(OrdersVO ovo);
}
