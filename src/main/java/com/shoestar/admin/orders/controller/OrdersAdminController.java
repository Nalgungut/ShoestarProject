package com.shoestar.admin.orders.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.shoestar.admin.orders.service.OrdersAdminService;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;
import com.shoestar.common.vo.PageDTO;

import lombok.AllArgsConstructor;

@Controller
@RequestMapping("/admin/orders/*")
@AllArgsConstructor
public class OrdersAdminController {
	
	private OrdersAdminService ordersAdminService;
	
	@GetMapping("/list")
	public String showList(OrdersVO ovo, Model model) {
		List<OrdersVO> list = ordersAdminService.getList(ovo);
		PageDTO paginate = new PageDTO(ovo, ordersAdminService.countRecords(ovo));
		
		// 날짜 작업
		HashMap<String, String> dateFormat = new HashMap<>();
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDate today = LocalDate.now();
		dateFormat.put("today", today.format(format));
		dateFormat.put("day", today.minusDays(1).format(format));
		dateFormat.put("week", today.minusWeeks(1).format(format));
		dateFormat.put("month", today.minusMonths(1).format(format));
		dateFormat.put("year", today.minusYears(1).format(format));
		
		model.addAttribute("orderslist", list);
		model.addAttribute("dtft", dateFormat);
		model.addAttribute("pageinfo", paginate);
		
		return "admin/orders/list";
	}
	
	@GetMapping("/detail")
	public String showDetail(OrdersVO ovo, Model model) {
		OrdersVO detail = ordersAdminService.getDetail(ovo);
		List<OrdersInsVO> oilist = ordersAdminService.getInsList(ovo);
		
		model.addAttribute("detail", detail);
		model.addAttribute("oilist", oilist);
		
		return "admin/orders/detail";
	}
}
