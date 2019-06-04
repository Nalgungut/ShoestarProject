package com.shoestar.client.brand.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.client.brand.vo.BrandVO;
import com.shoestar.client.brand.vo.CollectionVO;
import com.shoestar.client.notice.service.NoticeService;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/brand/*")
@AllArgsConstructor

public class brandController {
	private NoticeService noticeService;
	
	// �귣�� ù������ ����
	@RequestMapping(value="/brandMain", method = RequestMethod.GET)
	public String brandMain(@ModelAttribute("data") BrandVO bvo, Model model ){
		log.info("brandMain ȣ��");
		
		return "client/brand/brandMain";
	}
	
	// �������� ����Ʈ ����
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeList ȣ��Ϸ�");
		
		List<NoticeVO> notice = noticeService.noticeList(nvo);
		model.addAttribute("notice", notice);
		
		return "client/brand/noticeList";
	}
	
	// �÷��� ������ ����
	@RequestMapping(value="/collectionIntro", method = RequestMethod.GET)
	public String collection(@ModelAttribute("data") CollectionVO cvo, Model model){
		return "client/brand/collectionIntro";
	}
	
	// �������� ������ ������ ����
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	// @getMapping("/noticeDetail");
	public String boardDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeDetail ȣ��");
		log.info("no_no = "+nvo.getNo_no());
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "client/brand/noticeDetail";
	}
	
}
