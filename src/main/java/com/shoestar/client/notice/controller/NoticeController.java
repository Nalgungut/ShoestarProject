package com.shoestar.client.notice.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.notice.service.NoticeService;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brand/*")
@AllArgsConstructor

public class NoticeController {
	private NoticeService noticeService;
	
	// �������� ��ü ��ȸ
	@RequestMapping(value="/brandMain", method = RequestMethod.GET)
	
	public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeList ȣ��Ϸ�");
		
		List<NoticeVO> noticeList = noticeService.noticeList(nvo);
		model.addAttribute("noticeList", noticeList);
		
		return "client/brand/brandMain";
	}
	
	// �������� ����ȸ
	/*@RequestMapping(value="/client/noticeDetail", method=RequestMethod.GET)
	
	public String NoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeDetail ȣ��");
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "notice/noticeDetail";
	}*/
	
	

}
