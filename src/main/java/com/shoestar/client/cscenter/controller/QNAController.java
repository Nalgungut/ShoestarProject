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
import com.shoestar.client.cscenter.vo.Orders_statusVO;
import com.shoestar.client.cscenter.vo.QNAReplyVO;
import com.shoestar.client.cscenter.vo.QNAVO;
import com.shoestar.client.login.vo.LoginVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

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
		
		//1:1문의 상세내역
		@RequestMapping(value="/qnaDetail", method=RequestMethod.GET)
		public String qnaDetail(@ModelAttribute("data") QNAVO qvo,QNAReplyVO qrvo, Model model) {
			
			QNAVO detail = qnaService.qnaDetail(qvo);
			
			qrvo.setQna_no(qvo.getQna_no());
			log.info("detail"+qrvo.getQna_no());
			List<QNAReplyVO> qna_replyList = qnaService.qna_replyList(qrvo);
			model.addAttribute("qna_replyList", qna_replyList);
			model.addAttribute("detail", detail);
			
			
			return "client/cscenter/qnaDetail";
		}
		
		@RequestMapping(value="/qnaUpdateForm")
		public String updateForm(@SessionAttribute("login") LoginVO lvo, QNAVO qvo, Model model) {
			int mem_no = lvo.getMem_no();
			List<OrdersInsVO> result = qnaService.qnaOrders(mem_no);
			
			model.addAttribute("orders", result);
			model.addAttribute("qvo",qvo);
			return "client/cscenter/qnaUpdateForm";
		}
		
		@RequestMapping(value="/qnaUpdate", method=RequestMethod.POST)
		public String qnaUpdate(@ModelAttribute QNAVO qvo, Model model) {
			int result = 0;
			String url = "";
			
			result = qnaService.qnaUpdate(qvo);
			if(result == 1) {
				url = "/cscenter/qnaBoard";
			}
			return "redirect:" + url;
		}
		

		@RequestMapping(value="/writeForm")
		public String writeForm(@SessionAttribute("login") LoginVO lvo, QNAVO qvo, Model model) {
			int mem_no = lvo.getMem_no();
			List<OrdersInsVO> result = qnaService.qnaOrders(mem_no);
			
			model.addAttribute("orders", result);
			
			return "client/cscenter/writeForm";
		}
		
		@RequestMapping(value="/qnaInsert", method=RequestMethod.POST)
		public String qnaInsert(@ModelAttribute QNAVO qvo, Model model, Orders_statusVO ovo) {
			log.info(qvo);
			log.info(ovo);
			int result = 0;
			String url = "";
			
			result = qnaService.qnaInsert(qvo, ovo);
			int result2 = 0;
			result2 = qnaService.orders_statusInsert(ovo);
			if (result == 1  && result2 == 1) {
				url = "/cscenter/qnaBoard";
			}
			return "redirect:" + url;
		}
		
		@RequestMapping(value="/qnaDelete")
		public String qnaDelete(@ModelAttribute QNAVO qvo) {
			int result = 0;
			String url = "";
			result = qnaService.qnaDelete(qvo.getQna_no());
			
			
			if(result == 1) {
				url = "/cscenter/qnaBoard";
			}else {
				url = "/cscenter/qnaDetail?qna_no="+qvo.getQna_no();
			}
			
			return "redirect:"+url;
		}
		
}
