package com.shoestar.client.orders.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
import com.shoestar.client.orders.vo.CartListVO;
import com.shoestar.client.orders.vo.CartVO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/orders/*")
@AllArgsConstructor
public class OrdersController {
	
	private OrdersService ordersService;
	
	@RequestMapping(value="/checkStock", method={RequestMethod.GET, RequestMethod.POST})
	@ResponseBody
	public String checkStock(CartVO cvo) {
		boolean result = ordersService.checkStock(cvo);
		return String.valueOf(result);
	}
	
	@GetMapping("/cart")
	public String cartList(@SessionAttribute("login") LoginVO lvo, Model model) {
		List<CartVO> list = ordersService.cartListByMemNo(lvo.getMem_no());
		
		model.addAttribute("cartlist", list);
		
		return "client/orders/cartlist";
	}
	
	@RequestMapping(value="/addCart", method={RequestMethod.POST})
	@ResponseBody
	public String addToCart(@SessionAttribute("login") LoginVO lvo, CartVO cvo) {
		cvo.setMem_no(lvo.getMem_no());
		String result = ordersService.addToCart(cvo);
		return result;
	}
	
	@RequestMapping(value="/removeCart", method={RequestMethod.POST},
			consumes={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public String removeFromCart(@RequestBody List<CartVO> cvo, @SessionAttribute("login") LoginVO lvo) {
		if(cvo.get(0).getMem_no() == 0) {
			for (CartVO cartVO : cvo) {
				cartVO.setMem_no(lvo.getMem_no());
			}
		}
		
		int result = ordersService.removeFromCart(cvo);
		return String.valueOf(result);
	}

	@RequestMapping(value="/purchase", method={RequestMethod.POST})
	public String purchasePage(CartListVO clist, CartVO cvo, @SessionAttribute("login") LoginVO lvo, Model model) {
		List<CartVO> list = clist.getCartlist();
		
		if(list == null) {
			list = new ArrayList<>();
		}
		if(cvo != null && cvo.getPi_no() != 0) {
			clist.getCartlist().add(cvo);
		}
		
		if(list.get(0).getMem_no() == 0) {
			for (CartVO cartVO : list) {
				cartVO.setMem_no(lvo.getMem_no());
			}
		}
		
		Map<String, Object> result = ordersService.prodDataByCartList(list);
		
		model.addAttribute("items", result.get("success"));
		model.addAttribute("errors", result.get("failed"));
		
		return "client/orders/purchase";
	}
}
