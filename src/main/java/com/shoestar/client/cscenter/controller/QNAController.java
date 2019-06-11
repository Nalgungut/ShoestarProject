package com.shoestar.client.cscenter.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.Errors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shoestar.client.cscenter.service.QNAService;
import com.shoestar.client.cscenter.vo.FAQ_ctgVO;
import com.shoestar.client.cscenter.vo.QNAVO;
import com.shoestar.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/cscenter/*")
@Log4j
@AllArgsConstructor
public class QNAController {
		
		private QNAService qnaService;
		
		//1:1문의게시판
		@RequestMapping(value="/qnaBoard", method=RequestMethod.GET)
		public String qnaList(@ModelAttribute("data") QNAVO qvo, @SessionAttribute("login") LoginVO lvo , Model model) {
			log.info("qnaList..호출");
			
			qvo.setMem_no(lvo.getMem_no());
			log.info(qvo.getMem_no());
			List<QNAVO> qnaList = qnaService.qnaList(qvo); 
			model.addAttribute("qnaList", qnaList);
			
			
			return "client/cscenter/qnaBoard"; 
		}
		
		@RequestMapping(value="/writeForm")
		public String writeForm() {
			return "client/cscenter/writeForm";
		}
		
		//1:1문의 상세내역
		@RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
		public String qnaDetail(@ModelAttribute("data") QNAVO qvo, Model model) {
			
			QNAVO detail = qnaService.qnaDetail(qvo);
			model.addAttribute("detail", detail);
			
			return "client/cscenter/qnaDetail";
		}
		
		@RequestMapping(value="/qnaUpdateForm")
		public String updateForm(QNAVO qvo, Model model) {
			QNAVO updateData = qnaService.qnaUpdateForm(qvo);
			
			model.addAttribute("updateData", updateData);
			return "client/cscenter/qnaUpdateForm";
		}
}
