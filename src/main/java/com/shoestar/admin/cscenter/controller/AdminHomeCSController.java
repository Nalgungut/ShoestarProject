package com.shoestar.admin.cscenter.controller;

import org.springframework.stereotype.Controller;
//import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/cscenter/*")
//@AllArgsConstructor
public class AdminHomeCSController {
	
	
	//private 
	//���� ������ Ȩ��ũ
	@GetMapping("/admin")
	public String csAdminMain() {
		log.info("admin CS���� Ȩ ȣ��");
		return "admin/cscenter/csAdminMain";
	}
}
