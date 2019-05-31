package com.shoestar.client.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.event.service.EventService;
import com.shoestar.client.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/event/*")	//    /client/event/* ���� ���ο��� Ŭ���̾�Ʈ �����Ϸ��� client�ٿ��� �ϴµ� ���ΰ���..
@Log4j
@AllArgsConstructor
public class EventController {
	
	private EventService eventService;
	
	/***
	 * �̺�Ʈ ����Ʈ ������ �����ϱ�
	 * @param evo
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		
		model.addAttribute("eventList", eventService.eventList(evo));
		
		
		return "client/event/eventList";
	
	}
	
	/** 
	 * �̺�Ʈ �������� ����
	 * @param EventVO
	  * @return String
	 */
//	 @ResponseBody
	 @GetMapping(value="/detail")
	 public String eventDetail(@ModelAttribute("data") EventVO evo, Model model) {
		 log.info("eventDetail ȣ�� ����");
		 log.info("evo = " + evo);
		 
		 EventVO detail = eventService.eventDetail(evo);
		 model.addAttribute("detail", detail);
		 
		 return "client/event/eventDetail";
	 }
	
	
	
	
	
}
