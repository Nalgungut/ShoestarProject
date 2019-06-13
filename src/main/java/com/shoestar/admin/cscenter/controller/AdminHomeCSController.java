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
	 * @GetMapping("/") public String csAdminMain() { log.info("admin CS���� Ȩ ȣ��");
	 * return "admin/cscenter/csAdminMain"; }
	 */
	
	//���� ������ Ȩ��ũ
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data")AdminFAQVO fvo, Model model) {
		List<AdminFAQVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		return "admin/cscenter/csAdminMain";
	}
	
	@RequestMapping(value="/faqDelete")
	public String faqDelete(@ModelAttribute AdminFAQVO fvo) {
		int result = 0;
		String url = "";
		
		result = faqService.faqDelete(fvo.getFaq_no());
		
		url = "/admin/cscenter/";
		
		
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/faqInsert")
	public String faqInsert(@ModelAttribute AdminFAQVO fvo, Model model) {
		int result = 0;
		String url = "";
		log.info(fvo.toString());
		result = faqService.faqInsert(fvo);
		if(result == 1) {
			url = "/admin/cscenter/";
		}else {
			url = "/admin/cscenter/";
		}
		
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/faqUpdate", method = RequestMethod.POST)
	public String faqUpdate(@ModelAttribute AdminFAQVO fvo, Model model) {
		int result = 0; 
		String url = "";
		log.info(fvo.toString());
		
		result = faqService.faqUpdate(fvo);
		
		url = "/admin/cscenter/";
		
		return "redirect:" + url;
	}
	
}
