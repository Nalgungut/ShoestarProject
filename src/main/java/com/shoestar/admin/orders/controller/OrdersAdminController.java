package com.shoestar.admin.orders.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoestar.admin.orders.service.OrdersAdminService;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/admin/orders/*")
@AllArgsConstructor
public class OrdersAdminController {
	
	private OrdersAdminService ordersAdminService;
	
	@GetMapping("/list")
	public String showList(OrdersVO ovo, Model model) {
		List<OrdersVO> list = ordersAdminService.getList(ovo);
		
		model.addAttribute("orderslist", list);
		
		return "admin/orders/list";
	}
}
