package com.shoestar.admin.notice.controller;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoestar.admin.notice.service.AdminNoticeService;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/brand/*")
@AllArgsConstructor

public class AdminNoticeController {
	@Inject // ���� ��ü ����
	AdminNoticeService noticeService;
	
	// �������� ����Ʈ ����
		@RequestMapping(value="/adminNoticeList", method = RequestMethod.GET)
		public String adminNoticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
			log.info("adminNoticeList ȣ��Ϸ�");
			
			List<NoticeVO> adminNoticeList = noticeService.adminNoticeList(nvo);
			model.addAttribute("adminNoticeList", adminNoticeList);
			
			return "admin/brand/adminNoticeList";
		}
	
	// �������� �۾��� �� ����
	@RequestMapping(value="/noticeWriteForm")
	public String noticeWriteForm(@ModelAttribute("data") NoticeVO nvo){
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
			url = "/admin/brand/adminNoticeList";
		}
		return "redirect:"+url;
	}
	
	// �������� �󼼺���
	@RequestMapping(value="/adminNoticeDetail", method=RequestMethod.GET)
	//@GetMapping("/adminNoticeDetail")
	public String adminNoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("adminNoticeDetail ȣ��");
		log.info("no_no"+nvo.getNo_no());
		
		NoticeVO adminDetail = noticeService.adminNoticeDetail(nvo);
		model.addAttribute("adminDetail",adminDetail);
		
		return "admin/brand/adminNoticeDetail";
		
	}
	
	// �������� ���������� ����
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("updateForm ȣ��");
		
		log.info("no_no : "+nvo.getNo_no());
		
		NoticeVO updateData = noticeService.updateForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "admin/brand/updateForm";
	}
	
	// �������� ����
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras){
		
		log.info("noticeUpdate ȣ��");
		
		int result = 0;
		String url="";
		
			result = noticeService.noticeUpdate(nvo);
			ras.addFlashAttribute("data", nvo);
			
		if(result ==1){
			url="/admin/brand/adminNoticeDetail";
		}else{
			url="/admin/brand/updateForm";
		}
		return "redirect:"+url;
	}
	
	// �������� ����
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo){
		log.info("noticeDelete ȣ��");
		
		int result = 0;
		
		
		result = noticeService.noticeDelete(nvo.getNo_no());
		
		return "redirect:/admin/brand/adminNoticeList";
	}

}
