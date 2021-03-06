package com.shoestar.admin.orders.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.orders.dao.OrdersAdminDao;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrdersAdminServiceImpl implements OrdersAdminService {
	
	private OrdersAdminDao ordersAdminDao;
	
	@Override
	public List<OrdersVO> getList(OrdersVO ovo) {
		String keyword = ovo.getKeyword();
		String search = ovo.getSearch();
		if(keyword != null && search.endsWith("no")) {
			ovo.setKeyword(null);
		}
		
		return ordersAdminDao.getList(ovo);
	}

	@Override
	public OrdersVO getDetail(OrdersVO ovo) {
		return ordersAdminDao.getDetail(ovo);
	}

	@Override
	public List<OrdersInsVO> getInsList(OrdersVO ovo) {
		return ordersAdminDao.getInsList(ovo);
	}

	@Override
	public int countRecords(OrdersVO ovo) {
		return ordersAdminDao.countRecords(ovo);
	}

}
