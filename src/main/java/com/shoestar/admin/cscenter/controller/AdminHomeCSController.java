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

import com.shoestar.admin.cscenter.service.AdminDeliveryService;
import com.shoestar.admin.cscenter.service.AdminFAQService;
import com.shoestar.admin.cscenter.service.AdminOSService;
import com.shoestar.admin.cscenter.service.AdminQNAService;
import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;
import com.shoestar.admin.cscenter.vo.AdminFAQVO;
import com.shoestar.admin.cscenter.vo.AdminOsVO;
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
	private AdminDeliveryService dmService;
	private AdminOSService osService;
	
	//어드민 고객센터 홈링크
	@RequestMapping(value="/", method=RequestMethod.GET)
	public String faqList(@ModelAttribute("data")AdminFAQVO fvo, Model model, AdminQNAVO qvo, AdminDeliveryVO dvo) {
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
		
		int dm_before = qnaService.dm_before(dvo);
		int dm_ing = qnaService.dm_ing(dvo);
		model.addAttribute("dm_before", dm_before);
		model.addAttribute("dm_ing", dm_ing);
		
		return "admin/cscenter/csAdminMain";
	}
	@RequestMapping(value="/csAdminDm_before")
	public String dmList(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dmList = dmService.dmList(dvo);
		model.addAttribute("dmList", dmList);
		
		return "admin/cscenter/csAdminDm_before";
	}
	
	@RequestMapping(value="/csAdminDm_ing")
	public String dmList2(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dmList2 = dmService.dmList2(dvo);
		model.addAttribute("dmList", dmList2);
		
		return "admin/cscenter/csAdminDm_ing";
	}
	
	@RequestMapping(value="/dm_before_search")
	public String dm_before_search(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dm_before_search = dmService.dm_before_search(dvo);
		model.addAttribute("dmList", dm_before_search);
		
		return "admin/cscenter/dm_before_search";
	}
	
	@RequestMapping(value="/orders_status_search")
	public String orders_status_search(@ModelAttribute("data")AdminOsVO osvo, Model model) {
		List<AdminOsVO> orders_status_search = osService.order_status_search(osvo);
		model.addAttribute("osList", orders_status_search);
		
		return "admin/cscenter/orders_status_search";
	}
	
	@RequestMapping(value="/orders_status_search_end")
	public String csAdminOrder_status_end(@ModelAttribute("data")AdminOsVO osvo, Model model) {
		List<AdminOsVO> orders_status_end_search = osService.orders_status_end_search(osvo);
		model.addAttribute("osList", orders_status_end_search);
		
		return "admin/cscenter/orders_status_end_search";
	}
	
	@RequestMapping(value="/dm_end_search")
	public String dm_end_search(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dm_end_search = dmService.dm_end_search(dvo);
		model.addAttribute("dmList", dm_end_search);
		
		return "admin/cscenter/dm_end_search";
	}
	
	@RequestMapping(value="/dm_ing_search")
	public String dm_ing_search(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dm_ing_search = dmService.dm_ing_search(dvo);
		model.addAttribute("dmList", dm_ing_search);
		
		return "admin/cscenter/dm_ing_search";
	}
	
	@RequestMapping(value= "/qnaSearch")
	public String qnaSearch(@ModelAttribute("data")AdminQNAVO qvo, Model model) {
		List<AdminQNAVO> qnaList = qnaService.qnaSearch(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "admin/cscenter/qnaSearch";
	}
	
	@RequestMapping(value="/csAdminDm_end")
	public String dmList3(@ModelAttribute("data")AdminDeliveryVO dvo, Model model) {
		List<AdminDeliveryVO> dmList3 = dmService.dmList3(dvo);
		model.addAttribute("dmList", dmList3);
		
		return "admin/cscenter/csAdminDm_end";
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
	
	@RequestMapping(value="/osUpdate",method= RequestMethod.POST)
	public String osUpdate(@ModelAttribute AdminOsVO osvo, Model model) {
		int result = 0;
		String url = "";
		
		result = osService.osUpdate(osvo);
		url = "/admin/cscenter/csAdminOrder_status";
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/dm_ing", method=RequestMethod.POST)
	public String dm_ing(@ModelAttribute AdminDeliveryVO dvo, Model model) {
		int result = 0;
		String url = "";
		
		result = dmService.dm_ing(dvo);
		url = "/admin/cscenter/csAdminDm_before";
		
		return "redirect:"+url;
	}
	
	@RequestMapping(value="/dm_end", method = RequestMethod.POST)
	public String dm_end(@ModelAttribute AdminDeliveryVO dvo, Model model) {
		int result = 0;
		String url = "";
		
		result = dmService.dm_end(dvo);
		url = "/admin/cscenter/csAdminDm_ing";
		
		return "redirect:" + url;
	}
	
	@RequestMapping(value="/csAdminQna", method=RequestMethod.GET)
	public String qnaList(@ModelAttribute("data")AdminQNAVO qvo, Model model) {
		List<AdminQNAVO> qnaList = qnaService.qnaList(qvo);
		model.addAttribute("qnaList", qnaList);
		
		return "admin/cscenter/csAdminQna";
	}
	
	@RequestMapping(value = "/csAdminOrder_status")
	public String osList(@ModelAttribute("data") AdminOsVO osvo, Model model) {
		List<AdminOsVO> osList = osService.osList(osvo);
		model.addAttribute("osList", osList);
		
		return "admin/cscenter/csAdminOrder_status";
	}
	
	@RequestMapping(value = "/csAdminOrder_status_end")
	public String osListEnd(@ModelAttribute("data") AdminOsVO osvo, Model model) {
		List<AdminOsVO> osList = osService.osListEnd(osvo);
		model.addAttribute("osList", osList);
		
		return "admin/cscenter/csAdminOrder_status_end";
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
		qvo.setQna_no(qrvo.getQna_no());
		result2 = qnaService.replyUpdate(qvo);
		
		log.info(result+","+result2);
		
		if(result == 1 && result2 == 1) {
			url = "/admin/cscenter/csAdminQna";
		}
		url = "/admin/cscenter/csAdminQna";
		return "redirect:"+ url;
	}
	
	
}
