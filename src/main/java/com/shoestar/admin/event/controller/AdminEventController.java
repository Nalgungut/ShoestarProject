package com.shoestar.admin.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.event.service.AdminEventService;
import com.shoestar.client.event.vo.EventVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/event/*")
@Log4j
@AllArgsConstructor
public class AdminEventController {
	
	private AdminEventService eventService;
	
	/***
	 * �̺�Ʈ ����Ʈ ������ �����ϱ�
	 * @param evo
	 * @return
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		return "admin/event/eventList";
	
	}
	
}
