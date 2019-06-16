package com.shoestar.admin.cscenter.controller;

import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.admin.cscenter.service.AdminFAQService;
import com.shoestar.admin.cscenter.service.AdminQNAService;
import com.shoestar.admin.cscenter.vo.AdminFAQVO;
import com.shoestar.admin.cscenter.vo.AdminQNAReplyVO;
import com.shoestar.admin.cscenter.vo.AdminQNAVO;
import com.shoestar.client.cscenter.vo.QNAReplyVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/cscenter/*")
@AllArgsConstructor
public class AdminHomeCSController {
	
	
	private AdminFAQService faqService;
	private AdminQNAService qnaService;
	
	//어드민 고객센터 홈링크
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data")AdminFAQVO fvo, Model model, AdminQNAVO qvo) {
		List<AdminFAQVO> faqList = faqService.faqList(fvo);
		model.addAttribute("faqList", faqList);
		
		int qna_all = qnaService.qna_all(qvo);
		int qna_hold = qnaService.qna_hold(qvo);
		int qna_cancel = qnaService.qna_cancel(qvo);
		int qna_exchange = qnaService.qna_exchange(qvo);
		int qna_return = qnaService.qna_return(qvo);
		
		model.addAttribute("qna_all", qna_all);
		model.addAttribute("qna_hold", qna_hold);
		model.addAttribute("qna_cancel", qna_cancel);
		model.addAttribute("qna_exchange", qna_exchange);
		model.addAttribute("qna_return", qna_return);
		
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
		
		url = "/admin/cscenter/";
		
		
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
	
	@RequestMapping(value="/csAdminQna", method=RequestMethod.GET)
	public String qnaList(@ModelAttribute("data")AdminQNAVO qvo, Model model) {
		List<AdminQNAVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "admin/cscenter/csAdminQna";
	}
	
	@ResponseBody
	@RequestMapping(value="/qnaDetail", method=RequestMethod.POST, produces = {MediaType.APPLICATION_XML_VALUE,
			  MediaType.APPLICATION_JSON_VALUE})
	public AdminQNAVO qnaDetail(@ModelAttribute("data")AdminQNAVO qvo) {
		log.info("디테일"+ qvo);
		AdminQNAVO result = qnaService.qnaDetail(qvo);
		
		return result;
	}
	
	@RequestMapping(value="/replyInsert", method=RequestMethod.POST)
	public String replyInsert(@ModelAttribute AdminQNAReplyVO qrvo, Model model) {
		log.info("replyInsert호출");
		int result = 0;
		String url = "";
		result = qnaService.replyInsert(qrvo);
		
		int result2 = 0;
		AdminQNAVO qvo = new AdminQNAVO();
		qvo.setMem_no(qrvo.getMem_no());
		qvo.setQna_no(qrvo.getQna_no());
		result2 = qnaService.replyUpdate(qvo);
		log.info(result+","+result2);
		if(result == 1 && result2 == 1) {
			url = "/admin/cscenter/csAdminQna";
		}
		return "redirect:" + url;
		
	}
	
}
