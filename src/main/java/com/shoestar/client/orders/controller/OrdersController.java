package com.shoestar.client.orders.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	
	@GetMapping("/cart")
	public String cartList(@SessionAttribute("login") LoginVO lvo, Model model) {
		List<CartVO> list = ordersService.cartListByMemNo(lvo.getMem_no());
		
		model.addAttribute("cartlist", list);
		
		return "client/orders/cartlist";
	}
	
	@RequestMapping(value="/addCart", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String addToCart(@SessionAttribute("login") LoginVO lvo, CartVO cvo) {
		cvo.setMem_no(lvo.getMem_no());
		String result = ordersService.addToCart(cvo);
		return result;
	}
	
	@RequestMapping(value="/removeCart", method={RequestMethod.POST, RequestMethod.GET},
			consumes={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public String removeFromCart(@RequestBody List<CartVO> cvo, @SessionAttribute("login") LoginVO lvo) {
		//List<CartVO> cvo = carts.getCartList();
		if(cvo.get(0).getMem_no() == 0) {
			for (CartVO cartVO : cvo) {
				cartVO.setMem_no(lvo.getMem_no());
			}
		}
		
		int result = ordersService.removeFromCart(cvo);
		return String.valueOf(result);
	}
}
