package com.shoestar.client.brand.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.brand.Service.BrandNewsService;
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
	private BrandNewsService brandNewsService;
	
	// 브랜드 첫페이지 매핑
	@RequestMapping(value="/brandMain", method = RequestMethod.GET)
	public String brandMain(@ModelAttribute("data") BrandVO bvo, Model model ){
		log.info("brandMain 호출");
		
		return "client/brand/brandMain";
	}
	
	// 공지사항 리스트 매핑
	@RequestMapping(value="/noticeList", method = RequestMethod.GET)
	public String noticeList(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeList 호출완료");
		
		List<NoticeVO> notice = noticeService.noticeList(nvo);
		model.addAttribute("notice", notice);
		
		return "client/brand/noticeList";
	}
	
	// 컬렉션 페이지 매핑
	@RequestMapping(value="/collectionIntro", method = RequestMethod.GET)
	public String collection(@ModelAttribute("data") CollectionVO cvo, Model model){
		return "client/brand/collectionIntro";
	}
	
	// 공지사항 디테일 페이지 실행
	@RequestMapping(value="/noticeDetail", method=RequestMethod.GET)
	// @getMapping("/noticeDetail");
	public String boardDetail(@ModelAttribute("data") NoticeVO nvo, Model model){
		log.info("noticeDetail 호출");
		log.info("no_no = "+nvo.getNo_no());
		
		NoticeVO detail = noticeService.noticeDetail(nvo);
		model.addAttribute("detail", detail);
		
		return "client/brand/noticeDetail";
	}
	
	//브랜드 뉴스 리스트
	@RequestMapping(value="/brandNewslist", method=RequestMethod.GET)
	public String brandNewsList(@ModelAttribute("data") BrandVO bvo, Model model){
		log.info("브랜드 뉴스리스트 호출");
		
		
		return "client/brand/brandNewsList";
	}
	
	@ResponseBody
	@RequestMapping(value="/brandNewsData", method=RequestMethod.GET ,produces = "text/plain; charset=UTF-8")
	public String brandNewsData(@ModelAttribute("data") BrandVO bvo){
		//log.info("브랜드 뉴스리스트 호출");
		
		String brandNewsList = brandNewsService.brandNewsData(bvo);
		
		
		return brandNewsList;
	}
	
	//브랜드 뉴스 상세정보
	@RequestMapping(value="/brandNewsDetail", method=RequestMethod.GET)
	public String brandNewsDetail(@ModelAttribute("data") BrandVO bvo,Model model){
		log.info("브랜드 뉴스 상세정보보기");
		
		BrandVO detail = brandNewsService.brandNewsDetail(bvo);
		model.addAttribute("detail", detail);
		
		return "client/brand/brandNewsDetail";
	}
	
	
	
}
