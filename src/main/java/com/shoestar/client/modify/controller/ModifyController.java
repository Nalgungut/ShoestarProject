package com.shoestar.client.modify.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/modify/*")
@Log4j
@AllArgsConstructor
public class ModifyController {

	
	//ȸ������ �� (�ӽ�)
	@RequestMapping(value="/modify", method = RequestMethod.GET)
	public String modifyForm(){
		log.info("modify ȣ�� ����");
		return "client/member/modify";
	}
}
