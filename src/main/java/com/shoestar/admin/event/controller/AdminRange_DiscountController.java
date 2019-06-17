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
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.shoestar.admin.event.service.AdminRange_DiscountService;
import com.shoestar.admin.event.service.AdminRdProductService;
import com.shoestar.admin.event.service.adminRdTypeService;
import com.shoestar.admin.prod.service.ProdAdminService;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.client.event.vo.Rd_ProductVO;
import com.shoestar.client.event.vo.Rd_TypeVO;
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
	
	private adminRdTypeService rdTypeService;
	
	
	private ProdCtgService prodCtgService;
	
	private ProdService prodService;
	
	private ProdAdminService prodAdminService;
	
//	private AdminRdProductService adminproductService;
	
	
	
	// �˻� �������� ���߿�~
	// ��ȸ
	@RequestMapping(value="/rds/list", method=RequestMethod.GET)
	public String AdminRDiscountList(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("AdminRDiscountList ȣ�� ����");
		log.info("keyword : " + rvo.getKeyword());
		log.info("search : " + rvo.getSearch());
			
		model.addAttribute("ARDList", ARDService.AdminRDiscountList(rvo));
		
		int total = ARDService.adminRdisCnt(rvo);
		
		model.addAttribute("pageMaker", new PageDTO(rvo, total));
		
		return "admin/event/Range_DiscountList";
	}
	
	// ������ ��ȸ
	@RequestMapping(value="/rds/detail", method=RequestMethod.GET)
	public String rdisDetail(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		log.info("rdisDetail ȣ�� ����");
		log.info("rvo = " + rvo);
		log.info(ARDService.AdminDetail(rvo));
		
		
		Range_DiscountVO detail = ARDService.AdminRDiscountDetail(rvo);
		
		List<Range_DiscountVO> Alldetail = ARDService.AdminDetail(rvo);
		
//		List<Rd_TypeVO> rtdetail = rdTypeService.rdTypeList(rvo);
		
				
		model.addAttribute("detail", detail);
		
		model.addAttribute("Alldetail", Alldetail);
		
//		model.addAttribute();
		
		
		return "admin/event/rdisDetail";
	}
	
	// �Է���
	@RequestMapping(value="/rds/writeForm")
	public String writeForm(@ModelAttribute("data") Range_DiscountVO rvo) {
		
		log.info("writeForm ȣ�� ����");
		
		
		
		return "admin/event/rdisWriteForm";
	}
	
	
	//vo �ΰ� �°� ���ε� �Ű��������ٰ� // pd_no ajax�� �޾ƿ°�... ������ �ݺ� insert..
	/**********************************************
	 * �۾��� �����ϱ� "/admin/event/rds/insert"
	 **********************************************/
	 @RequestMapping(value="/rds/insert", method = RequestMethod.POST)
	 public String AdminRDisInsert(Range_DiscountVO rvo) {
		 log.info("AdminRDisInsert ȣ�� ����");
		 
		 log.info("rvo : " + rvo);
		 //log.info("pvo : " + pvo);
		 
		 int result = 1;
		 String url ="";
		 
		 result = ARDService.AdminRDisInsert(rvo);
		 // insert�� ajax�� ������ ������ŭ �ؾ��ϴµ� ���⼭ for��?
		
		 //adminproductService.RdProductInsert(pvo); xxxx
		 
		 if(result == 1) {
			url ="/admin/event/rds/list";
		 }
		return "redirect:"+url;
	 }
	 
	 
	 /**
	  * ���� �� ȭ��
	  * @param rvo
	  * @param model
	  * @return
	  */
	 @RequestMapping(value="/rds/updateForm"/*, method = RequestMethod.POST*/)
	 public String updateForm(@ModelAttribute("data") Range_DiscountVO rvo, Model model) {
		 log.info("updateForm ȣ�� ����");
		 log.info(rvo);
		 
		 Range_DiscountVO up = ARDService.AdminRDiscountDetail(rvo);
		 
		 model.addAttribute("up", up);
		 
		 return "admin/event/rdisUpdate";
	 }
	 
		/**
		 * �� ���� ����
		 */
	 // /admin/event/rds/update
		@RequestMapping(value="/rds/rdsUpdate",  method=RequestMethod.POST)
		public String rdisUpdate(@ModelAttribute Range_DiscountVO rvo, RedirectAttributes rab) {
			log.info("rdisUpdate ȣ�� ����");
			
			log.info(rvo);
			
			String url = "";
			int result = 1;
			
			result = ARDService.rdisUpdate(rvo);
			rab.addFlashAttribute("data", rvo);
			
			if(result ==1) {
				url ="/admin/event/rds/list";
			}
			
			return "redirect:"+url;
		} 
		
	/**
	 * ����
	 */
	@RequestMapping(value="/rds/delete")
	public String rdisDelete(@ModelAttribute Range_DiscountVO rvo) {
		log.info("rdisDelete ȣ�� ����");
		int result = 1;
		String url = "";
		
		result = ARDService.rdisDelete(rvo);
		
		if(result ==1) {
			url="/admin/event/rds/list";
		}
		
		return "redirect:"+url;
	}
	
	/**
	 * ���� ��� ���
	 */
	@RequestMapping(value="/rt/insertForm",  method=RequestMethod.POST)
	public String rtWriteForm(@ModelAttribute("data") Range_DiscountVO rvo,RedirectAttributes rab ) {
		
		log.info("rtWriteForm ȣ�� ����");
		
		log.info(rvo);
		rab.addFlashAttribute("data", rvo);
		
		
		List<Range_DiscountVO> de = ARDService.AdminDetail(rvo);
		rab.addFlashAttribute("de", de);
		log.info("de = " +de);
		
		
		return "admin/event/rtWriteForm";
	}
	
	/**********************************************
	 * ��з� �Է� �����ϱ� "/admin/event/rds/insert" >> ����ؾ��ϴµ� rd_no ���� �ȵ���..
	 **********************************************/
	 @RequestMapping(value="/rt/insert", method = RequestMethod.POST)
	 public String rtInsert(Range_DiscountVO rvo) {
		 log.info("rtInsert ȣ�� ����");
		 
		 log.info("rvo : " + rvo);
		 //log.info("pvo : " + pvo);
		 
		 int result = 1;
		 String url ="";
		 
		 try {
		 result = ARDService.rtInsert(rvo);
		
			log.info("result - "+result);
		 
		// if(result == 1) {
			url = "/admin/event/rds/detail?rd_no="+rvo.getRd_no();
		// }
		 
		 } catch(Exception e) {
			log.info("����");
			url = "/admin/event/rds/detail?rd_no="+rvo.getRd_no();
		 }
		return "redirect:"+url;
	 }
	
	/**
	 * ���� ��� ����  >>> ������ ���� �ǰ� list �������� �Ȱ���..
	 */
	@RequestMapping(value="/rt/delete")
	public String rtDelete(@ModelAttribute Range_DiscountVO rvo) {
		log.info("rtDelete ȣ�� ����");
		int result = 1;
		String url = "";
		
		log.info(rvo);
		
		 try {	
			result = ARDService.rtDelete(rvo);
			
			log.info("result - "+result);
			
			//if(result == 1) {
				url= "/admin/event/rds/detail?rd_no="+rvo.getRd_no();
			//}
		
		 } catch(Exception e) {
			 log.info("����");
			 url= "/admin/event/rds/detail?rd_no="+rvo.getRd_no();
		 }
		return "redirect:"+url;
		
	}
		
	/// ī�װ� �ҷ�����
	@ResponseBody
	@RequestMapping(value="/rt/pctList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo) {
		List<ProdCtgVO> result = prodCtgService.getProdCtgList(pcvo);
		log.info(result);
		return result;
	}
	
	// ��ǰ ���� ��ƿ���
	/**
	 * ��ǰ �˻� ������ �о���� �޼���
	 * @param pvo �˻� ���͸� ���� ProdVO ��ü
	 * @return �˻� ����� JSON ���·� ���� List
	 */
/*	@RequestMapping(value="/prodList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> getList(ProdVO pvo) {
		List<ProdVO> list = prodService.prodList(pvo);
		log.info(list);
		return list;
	}*/
	
	// ��ǰ �ҷ�����
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
