package com.shoestar.admin.event.controller;


import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoestar.admin.event.service.AdminEventService;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/event/*")
@Log4j
@AllArgsConstructor
public class AdminEventController {
	
	private AdminEventService eventService;
	
	/***
	 * 이벤트 리스트 페이지 구현하기
	 * @param EventVO
	 * @return String
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		return "admin/event/eventList";
	
	}
	
	// 글 목록 구현하기(페이징 처리 목록 조회)
/*	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		log.info("keyword : " + evo.getKeyword());
		log.info("search : " + evo.getSearch());
			
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		int total = eventService.AdmineventCnt(evo);
		
		model.addAttribute("pageMaker", new PageDTO(evo, total));
		
		return "admin/event/eventList";
	}*/
	
	
	//글쓰기 폼 출력하기
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") EventVO evo) {
		log.info("writeForm 호출 성공");
		
		return "admin/event/eventWriteForm";
	}
	
	
	/**********************************************
	 * 글쓰기 구현하기
	 * @param EventVO
	 * @return String
	 **********************************************/
	 @ResponseBody
	 @RequestMapping(value="/insert", method=RequestMethod.POST)
	 public String eventInsert(@ModelAttribute EventVO evo) {
		 log.info("eventInsert 호출 성공");
		 
		/* log.info("file name : " + evo.getFile().getOriginalFilename());*/
		
		 int result = 0;
		 String url ="";
			
			result = eventService.eventInsert(evo);

			if(result == 1) {
				url ="admin/event/eventList";
			}
			//redirect: 를 쓰면 스프링 내부에서 자동적으로 response.sendRedirect(url)를 호출해준다.
			return "redirect:"+url;
	 }
	
	
	/**
	 * 수정
	 */
	@RequestMapping(value="/update",  method=RequestMethod.POST)
	public String eventUpdate(@ModelAttribute EventVO evo, RedirectAttributes rab) {
		log.info("eventList 호출 성공");
		
		String url = "";
		int result = 0;
		
		result = eventService.eventUpdate(evo);
		rab.addFlashAttribute("data", evo);
		
		if(result ==1) {
			//url="/admin/event/list";
		}
		
		return url;
	
	}
	
}
