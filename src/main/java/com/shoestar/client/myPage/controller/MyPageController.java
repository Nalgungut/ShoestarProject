package com.shoestar.client.myPage.controller;

import java.util.List;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;


import com.shoestar.client.login.vo.LoginVO;

import com.shoestar.client.myPage.service.MyPageService;

import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
@AllArgsConstructor
public class MyPageController {
	private MyPageService myPageService;
	/*@Autowired
	MyPageService myPageService;
	@Autowired
	MemberVO memberVO;*/
	
	//마이페이지 메인화면 구현
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String mainForm( @SessionAttribute("login") LoginVO login, Model model){
		
		int mem_no = login.getMem_no();
		List<OrdersVO> myOrder = myPageService.ordersDataByMemNo(mem_no);
		model.addAttribute("myOrderList", myOrder);
		log.info("myorder = "+myOrder);
		
		log.info("mainpage 호출 성공");
		return "client/myPage/main";
	}
	
	@RequestMapping(value="/myOrder", method = RequestMethod.GET)
	public String myOrder( @SessionAttribute("login") LoginVO login, Model model, OrdersVO ovo){
		
		List<OrdersInsVO> detailOrder = myPageService.ordersInsByOdNo(ovo);
		model.addAttribute("detailList", detailOrder);
		
		return "client/myPage/myOrder";
		
	}
	
	}
	

