package com.shoestar.admin.event.controller;


import java.util.List;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	/* �Ķ���͸� ���ε��� �� �ڵ����� ȣ��Ǵ� @InitBinder�� �̿��ؼ� ��ȯ�� ó���� �� �ִ�. */
	@InitBinder
	public void initBinder(WebDataBinder binder) {
								// ���, �ʵ��, ������
		binder.registerCustomEditor(MultipartFile.class, "file",
					new StringTrimmerEditor(true));
					// null�� �����ϱ� ���� Ŭ����
	}
	
	/***
	 * �̺�Ʈ ����Ʈ ������ �����ϱ�
	 * @param EventVO
	 * @return String
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		
		//log.info("keyword : "+evo.getKeyword());
		//log.info("search : "+evo.getSearch());
		
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		return "admin/event/eventList";
	
	}
	
	// �� ��� �����ϱ�(����¡ ó�� ��� ��ȸ)
/*	@RequestMapping(value="/list", method=RequestMethod.GET)
	public String eventList(@ModelAttribute("data") EventVO evo, Model model) {
		log.info("eventList ȣ�� ����");
		log.info("keyword : " + evo.getKeyword());
		log.info("search : " + evo.getSearch());
			
		model.addAttribute("AdmineventList", eventService.AdmineventList(evo));
		
		int total = eventService.AdmineventCnt(evo);
		
		model.addAttribute("pageMaker", new PageDTO(evo, total));
		
		return "admin/event/eventList";
	}*/
	
	
	//�۾��� �� ����ϱ�
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") EventVO evo) {
		log.info("writeForm ȣ�� ����");
		
		return "admin/event/eventWriteForm";
	}
	
	
	/**********************************************
	 * �۾��� �����ϱ�
	 * @param EventVO
	 * @return String
	 **********************************************/
	 @ResponseBody
	 @RequestMapping(value="/insert", method = RequestMethod.POST)
	 public String eventInsert(EventVO evo) {
		 log.info("eventInsert ȣ�� ����");
		 
		 log.info("img name : " + evo.getFiles().get(0).getOriginalFilename());
		 log.info("thumb name : " + evo.getFiles().get(1).getOriginalFilename());
		
		 
		 int result = 1;
		 String url ="";
		 
		 result = eventService.eventInsert(evo);
		 if(result == 1) {
			url ="/admin/event/list";
		 }
		return "redirect:"+url;
	 }
	
	
	/**
	 * ����
	 */
	@RequestMapping(value="/update",  method=RequestMethod.POST)
	public String eventUpdate(@ModelAttribute EventVO evo, RedirectAttributes rab) {
		log.info("eventList ȣ�� ����");
		
		String url = "";
		int result = 0;
		
		result = eventService.eventUpdate(evo);
		rab.addFlashAttribute("data", evo);
		
		if(result ==1) {
			url="/admin/event/list";
		}
		
		return url;
	
	}
	
}
