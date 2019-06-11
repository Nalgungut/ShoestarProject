package com.shoestar.admin.event.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.event.service.AdminRange_DiscountService;
import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/event/rds/*")
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountController {

	private AdminRange_DiscountService ARDService;
	
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String AdminRDiscountList(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("AdminRDiscountList 호출 성공");
/*		log.info("keyword : " + rvo.getKeyword());
		log.info("search : " + rvo.getSearch());*/
			
		model.addAttribute("ARDList", ARDService.AdminRDiscountList(rvo));
		
		//int total = ARDService.AdmineventCnt(rvo);
		
		//model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "admin/event/Range_DiscountList";
	}
}
