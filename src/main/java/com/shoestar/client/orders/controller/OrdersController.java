package com.shoestar.client.orders.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.shoestar.client.login.vo.LoginVO;
import com.shoestar.client.orders.service.OrdersService;
import com.shoestar.client.orders.vo.CartVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/orders/*")
@AllArgsConstructor
public class OrdersController {
	
	private OrdersService ordersService;
	
	
	@GetMapping("/cartList")
	public String cartList(@SessionAttribute("login") LoginVO lvo, Model model) {
		List<CartVO> list = ordersService.cartListByMemNo(lvo.getMem_no());
		
		model.addAttribute("cartlist", list);
		
		return "client/orders/cartlist";
	}
}
