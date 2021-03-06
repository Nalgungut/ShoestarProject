package com.shoestar.admin.event.controller;


import java.util.List;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody; // ajax 요청때 씀.문자 출력때
import org.springframework.web.multipart.MultipartFile;
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
	
	/* 파라미터를 바인딩할 때 자동으로 호출되는 @InitBinder를 이용해서 변환을 처리할 수 있다. */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
								// 대상, 필드명, 설정값
		binder.registerCustomEditor(MultipartFile.class, "file",
					new StringTrimmerEditor(true));
					// null을 설정하기 위한 클래스
	}
	
	// 이벤트 리스트 페이지 구현하기	
	// 글 목록 구현하기(페이징 처리 목록 조회)
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList 호출 성공");
		log.info("keyword : " + evo.getKeyword());
		log.info("search : " + evo.getSearch());
			
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		int total = eventService.AdmineventCnt(evo);
		/*evo.setPageNum(1);
		evo.setAmount(5);*/
		model.addAttribute("pageMaker", new PageDTO(evo, total));
		
		return "admin/event/eventList";
	}
	
	
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
	 @RequestMapping(value="/insert", method = RequestMethod.POST)
	 public String eventInsert(EventVO evo) {
		 log.info("eventInsert 호출 성공");
		 
		 log.info("img name : " + evo.getFiles().get(0).getOriginalFilename());
		 log.info("thumb name : " + evo.getFiles().get(1).getOriginalFilename());
		 log.info("evo : " + evo);
		 
		 int result = 1;
		 String url ="";
		 
		 result = eventService.eventInsert(evo);
		 if(result == 1) {
			url ="/admin/event/list";
		 }
		return "redirect:"+url;
	 }
	
	
	 // 글수정 폼 출력
	 @RequestMapping(value="/updateForm")
	 public String updateForm(@ModelAttribute("data") EventVO evo, Model model) {
		 log.info("updateForm 호출 성공");
		 //log.info("ev_no = " + evo.getEv_no());
		 log.info("evo.getEv_content = " + evo.getEv_content());
		 log.info(evo);
		 
		 EventVO up = eventService.updateForm(evo);
		 
		 model.addAttribute("up", up);
		 
		 return "admin/event/eventUpdate";
	 }
	 
	 
	 
	/**
	 * 글 수정 구현
	 */
	@RequestMapping(value="/update",  method=RequestMethod.POST)
	public String eventUpdate(@ModelAttribute EventVO evo, RedirectAttributes rab) {
		log.info("eventList 호출 성공");
		
		log.info(evo);
		
		String url = "";
		int result = 1;
		
		result = eventService.eventUpdate(evo);
		rab.addFlashAttribute("data", evo);
		
		if(result ==1) {
			url="/admin/event/list";
		}
		
		return "redirect:"+url;
	
	}
	
	/**
	 * 글 삭제 
	 */
	@RequestMapping(value="/delete")
	public String eventDelete(@ModelAttribute EventVO evo) {
		log.info("eventDelete 호출 성공");
		int result = 1;
		String url = "";
		
		result = eventService.eventDelete(evo);
		
		if(result == 1) {
			url="/admin/event/list";
		}
		
		return "redirect:"+url;
		
	}
	
	
	// 게시글 
	
}
