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
	@Inject // 서비스 객체 주입
	AdminNoticeService noticeService;
	
	// 공지사항 리스트 매핑
		@RequestMapping(value="/adminNoticeList", method = RequestMethod.GET)
		public String adminNoticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
			log.info("adminNoticeList 호출완료");
			
			List<NoticeVO> adminNoticeList = noticeService.adminNoticeList(nvo);
			model.addAttribute("adminNoticeList", adminNoticeList);
			
			return "admin/brand/adminNoticeList";
		}
	
	// 공지사항 글쓰기 폼 들어가기
	@RequestMapping(value="/noticeWriteForm")
	public String noticeWriteForm(@ModelAttribute("data") NoticeVO nvo){
		log.info("공지사항 글쓰기 페이지 호출");
		
		return "admin/brand/noticeWriteForm";
	}
	
	// 공지사항 글쓰기
	@RequestMapping(value="/noticeInsert", method=RequestMethod.POST)
	//@PostMapping("/noticeInsert")
	public String noticeInsert(@ModelAttribute NoticeVO nvo, Model model){
		log.info("boardInsert 호출");
		
		int result = 0;
		String url = "";
		
		result = noticeService.noticeInsert(nvo);
		if(result == 1){
			url = "/admin/brand/adminNoticeList";
		}
		return "redirect:"+url;
	}
	
	// 공지사항 상세보기
	@RequestMapping(value="/adminNoticeDetail", method=RequestMethod.GET)
	//@GetMapping("/adminNoticeDetail")
	public String adminNoticeDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("adminNoticeDetail 호출");
		log.info("no_no"+nvo.getNo_no());
		
		NoticeVO adminDetail = noticeService.adminNoticeDetail(nvo);
		model.addAttribute("adminDetail",adminDetail);
		
		return "admin/brand/adminNoticeDetail";
		
	}
	
	// 공지사항 수정페이지 매핑
	@RequestMapping(value="/updateForm")
	public String updateForm(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("updateForm 호출");
		
		log.info("no_no : "+nvo.getNo_no());
		
		NoticeVO updateData = noticeService.updateForm(nvo);
		
		model.addAttribute("updateData", updateData);
		return "admin/brand/updateForm";
	}
	
	// 공지사항 수정
	@RequestMapping(value="/noticeUpdate", method=RequestMethod.POST)
	public String noticeUpdate(@ModelAttribute NoticeVO nvo, RedirectAttributes ras){
		
		log.info("noticeUpdate 호출");
		
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
	
	// 공지사항 삭제
	@RequestMapping(value="/noticeDelete")
	public String noticeDelete(@ModelAttribute NoticeVO nvo){
		log.info("noticeDelete 호출");
		
		int result = 0;
		
		
		result = noticeService.noticeDelete(nvo.getNo_no());
		
		return "redirect:/admin/brand/adminNoticeList";
	}

}
