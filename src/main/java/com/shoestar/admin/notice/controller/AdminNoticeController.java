package com.shoestar.admin.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.notice.service.AdminNoticeService;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor

public class AdminNoticeController {
	@Inject // ���� ��ü ����
	AdminNoticeService noticeService;
	
	// �������� ����Ʈ ����
		@RequestMapping(value="/adminNoticeList", method = RequestMethod.GET)
		public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
			log.info("noticeList ȣ��Ϸ�");
			
			List<NoticeVO> noticeList = noticeService.noticeList(nvo);
			model.addAttribute("notice", noticeList);
			
			return "client/brand/noticeList";
		}
	
	// �������� ����ȸ
	/*@RequestMapping(value="/client/noticeDetail", method=RequestMethod.GET)
	
	public String NoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeDetail ȣ��");
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "client/notice/noticeDetail";
	}*/
	
	// �������� �۾��� �� ����
	@RequestMapping(value="/writeForm")
	public String writeForm(@ModelAttribute("data") NoticeVO nvo){
		log.info("�������� �۾��� ������ ȣ��");
		
		return "admin/brand/noticeWriteForm";
	}
	
	// �������� �۾���
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	//@PostMapping("/noticeInsert")
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model){
		log.info("boardInsert ȣ��");
		
		int result = 0;
		String url = "";
		
		result = noticeService.noticeInsert(nvo);
		if(result == 1){
			url = "admin/brand/adminNoticeList";
		}
		return null;
	}
	
	// �������� �󼼺���
	@RequestMapping(value="/adminNoticeDetail", method=RequestMethod.GET)
	//@GetMapping("/adminNoticeDetail")
	public String adminNoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("adminNoticeDetail ȣ��");
		log.info("no_no"+nvo.getNo_no());
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail",detail);
		
		return "admin/board/adminNoticeDetail";
		
	}

}
