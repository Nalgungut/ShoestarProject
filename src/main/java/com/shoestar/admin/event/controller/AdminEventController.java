package com.shoestar.admin.event.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

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
	public String eventList(/*@ModelAttribute("data")*/ EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		return "admin/event/eventList";
	
	}
	
	
	//�۾��� �� ����ϱ�
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") EventVO evo) {
		log.info("writeForm ȣ�� ����");
		
		return "admin/event/eventWriteForm";
	}
	
	
	/**********************************************
	 * �۾��� �����ϱ�
	 * @param galleryVO
	 * @return String
	 **********************************************/
	 @ResponseBody
	 @RequestMapping(value="/insert", method=RequestMethod.POST)
	 public String eventInsert(@ModelAttribute EventVO evo) {
		 log.info("eventInsert ȣ�� ����");
		 
		/* log.info("file name : " + evo.getFile().getOriginalFilename());*/
		
		 int result = 0;
		 String url ="";
			
			result = eventService.eventInsert(evo);

			if(result == 1) {
				url ="/event/eventList";
			}
			//redirect: �� ���� ������ ���ο��� �ڵ������� response.sendRedirect(url)�� ȣ�����ش�.
			return "redirect:"+url;
	 }
	
	
	/**
	 * ����
	 */
	@RequestMapping(value="/update",  method=RequestMethod.GET)
	public String eventUpdate(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("eventUpdate", eventService.eventUpdate(evo));
		
		return "admin/event/eventUpdate";
	
	}
	
}
