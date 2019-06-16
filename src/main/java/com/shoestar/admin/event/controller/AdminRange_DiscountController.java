package com.shoestar.admin.event.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.admin.event.service.AdminRange_DiscountService;
import com.shoestar.admin.event.service.AdminRdProductService;
import com.shoestar.admin.prod.service.ProdAdminService;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.client.event.vo.Rd_ProductVO;
import com.shoestar.client.prod.service.ProdCtgService;
import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdCtgVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/admin/event/*")
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountController {

	private AdminRange_DiscountService ARDService;
	
	private ProdCtgService prodCtgService;
	
	private ProdService prodService;
	
	private ProdAdminService prodAdminService;
	
	private AdminRdProductService adminproductService;
	
	
	
	// 검색 페이지는 나중에~
	// 조회
	@RequestMapping(value="/rds/list", method=RequestMethod.GET)
	public String AdminRDiscountList(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("AdminRDiscountList 호출 성공");
/*		log.info("keyword : " + rvo.getKeyword());
		log.info("search : " + rvo.getSearch());*/
			
		model.addAttribute("ARDList", ARDService.AdminRDiscountList(rvo));
		
		//int total = ARDService.AdmineventCnt(rvo);
		
		//model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "admin/event/Range_DiscountList";
	}
	
	// 상세정보 조회
	@RequestMapping(value="/rds/detail", method=RequestMethod.GET)
	public String rdisDetail(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("rdisDetail 호출 성공");
		log.info("rvo = " + rvo);
		log.info(ARDService.AdminDetail(rvo));
		
		Range_DiscountVO detail = ARDService.AdminRDiscountDetail(rvo);
		
		List<Range_DiscountVO> Alldetail = ARDService.AdminDetail(rvo);
		
		model.addAttribute("detail", detail);
		
		model.addAttribute("Alldetail", Alldetail);
		
		return "admin/event/rdisDetail";
	}
	
	// 입력폼
	@RequestMapping(value="/rds/writeForm")
	public String writeForm(@ModelAttribute("data") Range_DiscountVO rvo) {
		
		log.info("writeForm 호출 성공");
		
		return "admin/event/rdisWriteForm";
	}
	
	
	//vo 두개 맞게 바인딩 매개변수에다가 // pd_no ajax로 받아온걸... 쿼리서 반복 insert..
	/**********************************************
	 * 글쓰기 구현하기 "/admin/event/rds/insert"
	 **********************************************/
	 @RequestMapping(value="/rds/insert", method = RequestMethod.POST)
	 public String AdminRDisInsert(Range_DiscountVO rvo) {
		 log.info("AdminRDisInsert 호출 성공");
		 
		 log.info("rvo : " + rvo);
		 //log.info("pvo : " + pvo);
		 
		 int result = 1;
		 String url ="";
		 
		 result = ARDService.AdminRDisInsert(rvo);
		 // insert를 ajax서 가져온 갯수만큼 해야하는데 여기서 for문?
		
		 //adminproductService.RdProductInsert(pvo); xxxx
		 
		 if(result == 1) {
			url ="/admin/event/rds/list";
		 }
		return "redirect:"+url;
	 }
	 
	 
	 /**
	  * 수정 폼 화면
	  * @param rvo
	  * @param model
	  * @return
	  */
/*	 @RequestMapping(value="/rds/updateForm", method = RequestMethod.POST)
	 public String updateForm(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		 log.info("updateForm 호출 성공");
		 log.info(rvo);
		 
		 Range_DiscountVO up = ARDService.updateForm(rvo);
		 
		 model.addAttribute("up", up);
		 
		 return "admin/event/rdisUpdate";
	 }
	 
	 */

	
	/// 카테고리 불러오기
	@ResponseBody
	@RequestMapping(value="/rds/pctList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo) {
		List<ProdCtgVO> result = prodCtgService.getProdCtgList(pcvo);
		log.info(result);
		return result;
	}
	
	// 상품 정보 담아오는
	/**
	 * 상품 검색 정보를 읽어오는 메서드
	 * @param pvo 검색 필터를 담은 ProdVO 객체
	 * @return 검색 결과를 JSON 형태로 담은 List
	 */
/*	@RequestMapping(value="/prodList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> getList(ProdVO pvo) {
		List<ProdVO> list = prodService.prodList(pvo);
		log.info(list);
		return list;
	}*/
	
	// 상품 불러오기
	@ResponseBody
	@RequestMapping(value="/rds/prodlist", method={RequestMethod.GET, RequestMethod.POST})
	public String prodList(ProdVO pvo, Model model) {
		List<ProdVO> result = prodAdminService.prodlist(pvo);
		PageDTO paginate = new PageDTO(pvo, prodAdminService.countRecords(pvo));
		
		model.addAttribute("prodlist", result);
		model.addAttribute("pageinfo", paginate);
		
		return "admin/event/rds/rdisWriteForm";
	}

	
	
}
