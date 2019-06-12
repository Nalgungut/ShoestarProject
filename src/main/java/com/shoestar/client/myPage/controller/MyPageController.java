package com.shoestar.client.myPage.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.myPage.service.MyPageService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/myPage/*")
@Log4j
@AllArgsConstructor
public class MyPageController {
	private MyPageService myPageService;
	
	//마이페이지 메인화면 구현
	@RequestMapping(value="/main", method = RequestMethod.GET)
	public String mainForm(){
		log.info("mainpage 호출 성공");
		return "client/myPage/main";
	}
	
	
	
}
