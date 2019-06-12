package com.shoestar.admin.event.controller;

import java.util.List;

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
@RequestMapping("/admin/event/*")
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountController {

	private AdminRange_DiscountService ARDService;
	
	// �˻� �������� ���߿�~
	// ��ȸ
	@RequestMapping(value="/rds/list", method=RequestMethod.GET)
	public String AdminRDiscountList(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("AdminRDiscountList ȣ�� ����");
/*		log.info("keyword : " + rvo.getKeyword());
		log.info("search : " + rvo.getSearch());*/
			
		model.addAttribute("ARDList", ARDService.AdminRDiscountList(rvo));
		
		//int total = ARDService.AdmineventCnt(rvo);
		
		//model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "admin/event/Range_DiscountList";
	}
	
	// ������ ��ȸ
	@RequestMapping(value="/rds/detail", method=RequestMethod.GET)
	public String rdisDetail(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("rdisDetail ȣ�� ����");
		log.info("rvo = " + rvo);
		log.info(ARDService.AdminDetail(rvo));
		
		Range_DiscountVO detail = ARDService.AdminRDiscountDetail(rvo);
		
		List<Range_DiscountVO> Alldetail = ARDService.AdminDetail(rvo);
		
		model.addAttribute("detail", detail);
		
		model.addAttribute("Alldetail", Alldetail);
		
		return "admin/event/rdisDetail";
	}
	
	// �Է���
	@RequestMapping(value="/rds/writeForm")
	public String writeForm(@ModelAttribute("data") Range_DiscountVO rvo) {
		
		log.info("writeForm ȣ�� ����");
		
		return "/admin/event/rdisWriteForm";
	}
	
	
}
