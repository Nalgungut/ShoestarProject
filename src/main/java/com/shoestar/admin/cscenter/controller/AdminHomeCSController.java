package com.shoestar.admin.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.cscenter.service.AdminFAQService;
import com.shoestar.admin.cscenter.vo.AdminFAQVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/cscenter/*")
@AllArgsConstructor
public class AdminHomeCSController {
	
	
	private AdminFAQService faqService;
	
	/*
	 * @GetMapping("/") public String csAdminMain() { log.info("admin CS센터 홈 호출");
	 * return "admin/cscenter/csAdminMain"; }
	 */
	
	//어드민 고객센터 홈링크
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data")AdminFAQVO fvo, Model model) {
		List<AdminFAQVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "admin/cscenter/csAdminMain";
	}
	
}
