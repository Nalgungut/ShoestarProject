package com.shoestar.admin.prod.controller;

import java.util.List;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shoestar.admin.prod.service.ProdAdminService;
import com.shoestar.admin.prod.service.ProdCtgAdminService;
import com.shoestar.client.prod.service.ProdInsService;
import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;
import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.exception.BadRequestException;
import com.shoestar.common.exception.ResourceNotFoundException;
import com.shoestar.common.vo.PageDTO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/product/*")
public class ProdAdminController {
	
	private ProdAdminService prodAdminService;
	private ProdCtgAdminService prodCtgAdminService;
	
	private ProdInsService pinsService;
	
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		binder.registerCustomEditor(MultipartFile.class, "file", new StringTrimmerEditor(true));
	}
	

	/* ====================================== 상품 ====================================== */
	
	
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String prodList(ProdVO pvo, Model model) {
		List<ProdVO> result = prodAdminService.prodlist(pvo);
		PageDTO paginate = new PageDTO(pvo, prodAdminService.countRecords(pvo));
		
		model.addAttribute("prodlist", result);
		model.addAttribute("pageinfo", paginate);
		
		return "admin/product/prodList";
	}
	
	@RequestMapping(value="/detail/{pd_no}", method={RequestMethod.GET})
	public String prodDetail(@PathVariable("pd_no") Integer pd_no, Integer pi_no, Model model) {
		if(pd_no == null) {
			throw new BadRequestException("잘못 된 요청");
		}
		
		ProdVO pvo = prodAdminService.prodDetail(pd_no);
		if(pvo == null) {
			throw new ResourceNotFoundException("대상 제품을 찾을 수 없습니다.");
		}
		List<ProdInsVO> pinslist = pinsService.pinsListByProd(pvo);
		
		Integer pinoToShow = 0;
		if(!pinslist.isEmpty()) {
			if(pi_no == null) {
				pinoToShow = pinslist.get(0).getPi_no();
			} else {
				pinoToShow = pi_no;
			}
		}
		
		List<ProdStockVO> pstlist = null;
		if(pinoToShow != 0) {
			ProdInsVO pivo = new ProdInsVO();
			pivo.setPi_no(pinoToShow);
			pstlist = pinsService.pstListByPins(pivo);
		}
		
		model.addAttribute("prodVO", pvo);
		model.addAttribute("pinslist", pinslist);
		model.addAttribute("pi_no", pinoToShow);
		model.addAttribute("pstlist", pstlist);
		
		return "admin/product/prodDetail";
	}
	
	@RequestMapping(value="/updateAll", method={RequestMethod.POST})
	@ResponseBody
	public String updateMultipleProd(@RequestParam("pdnos") List<Integer> pdnos, ProdVO pvo) {
		int total = pdnos.size();
		int result = prodAdminService.updateMultiple(pdnos, pvo);
		
		return result + "/" + total;
	}
	
	@RequestMapping(value="/deleteAll", method={RequestMethod.POST})
	@ResponseBody
	public String deleteMultipleProd(@RequestParam("pdnos") List<Integer> pdnos) {
		int total = pdnos.size();
		int result = prodAdminService.deleteMultiple(pdnos);
		
		return result + "/" + total;
	}
	
	@RequestMapping(value="/update", method={RequestMethod.POST})
	@ResponseBody
	public String updateProd(ProdVO pvo) {
		int result = prodAdminService.updateProd(pvo);
		return result == 1 ? "true" : "false";
	}
	
	@RequestMapping(value="/insert", method={RequestMethod.POST})
	@ResponseBody
	public String insertProd(ProdVO pvo) {
		int result = prodAdminService.insertProd(pvo);
		return String.valueOf(result);
	}
	
	
	/* ====================================== 상품 컬러 ====================================== */
	
	@PostMapping("/insertProdins")
	@ResponseBody
	public String insertProdins(ProdInsVO pivo) {
		int result = prodAdminService.insertProdins(pivo);
		return result >= 1 ? String.valueOf(result) : "false";
	}

	@PostMapping("/deleteProdins")
	@ResponseBody
	public String deleteProdins(ProdInsVO pivo) {
		String result = "";
		if(prodAdminService.isProdinsDeletable(pivo)) {
			try {
				result = String.valueOf(prodAdminService.deleteProdins(pivo) == 1);
			} catch (Exception e) {
				result = "referenceError";
			}
		} else {
			result = "referenceError";
		}
		return result;
	}
	
	@RequestMapping(value="/unoccupiedColors", method={RequestMethod.GET, RequestMethod.POST}, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdColorVO> unoccupiedColors(ProdVO pvo) {
		return prodAdminService.unoccupiedColors(pvo);
	}
	
	/* ====================================== 상품 사이즈 및 수량 ====================================== */
	
	@PostMapping("/insertProdStock")
	@ResponseBody
	public String insertProdStock(ProdStockVO psvo) {
		return String.valueOf(prodAdminService.insertProdStock(psvo) == 1);
	}

	@PostMapping("/updateProdStock")
	@ResponseBody
	public String updateProdStock(ProdStockVO psvo) {
		return String.valueOf(prodAdminService.updateProdStock(psvo) == 1);
	}

	@PostMapping("/deleteProdStock")
	@ResponseBody
	public String deleteProdStock(ProdStockVO psvo) {
		String result = "";
		if(prodAdminService.isProdStockDeletable(psvo)) {
			try {
				result = String.valueOf(prodAdminService.deleteProdStock(psvo) == 1);
			} catch (Exception e) {
				result = "referenceError";
			}
		}
		return result;
	}
	
	@PostMapping("/isSafeSize")
	@ResponseBody
	public String isSafeSize(ProdStockVO psvo) {
		return String.valueOf(prodAdminService.isSafeSize(psvo));
	}
	
	/* ====================================== 상품 이미지 ====================================== */
	
	@GetMapping("/new")
	public String insertForm() {
		return "admin/product/prodInsert";
	}
	
	@PostMapping(value="/pimInsert", produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String pimInsert(ProdImageVO pimvo) {
		int result = prodAdminService.pimInsert(pimvo);
		return String.valueOf(result >= 1);
	}
	
	@PostMapping(value="/pimUpdate", produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String pimUpdate(ProdImageVO pimvo) {
		int result = prodAdminService.pimUpdate(pimvo);
		return String.valueOf(result == 1);
	}
	
	@PostMapping(value="/pimDelete", produces={MediaType.TEXT_PLAIN_VALUE})
	@ResponseBody
	public String pimDelete(ProdImageVO pimvo) {
		int result = prodAdminService.pimDelete(pimvo);
		return String.valueOf(result == 1);
	}
	
	
	/* ====================================== 카테고리 ====================================== */
	
	@GetMapping("/ctg")
	public void categoryManage(Model model) {
		List<ProdCtgVO> ctglist = prodCtgAdminService.ctgList();
		List<ProdColorVO> colorlist = prodCtgAdminService.colorList();
		
		model.addAttribute("ctglist", ctglist);
		model.addAttribute("colorlist", colorlist);
	}
	
	@PostMapping("/insertCtg")
	@ResponseBody
	public String insertCtg(ProdCtgVO ctvo) {
		String result = null;
		result = String.valueOf(prodCtgAdminService.insertCtg(ctvo) == 1);
		return result;
	}

	@PostMapping("/updateCtg")
	@ResponseBody
	public String updateCtg(ProdCtgVO ctvo) {
		String result = null;
		result = String.valueOf(prodCtgAdminService.updateCtg(ctvo) == 1);
		return result;
	}

	@PostMapping("/deleteCtg")
	@ResponseBody
	public String deleteCtg(ProdCtgVO ctvo) {
		String result = null;
		try {
			if(prodCtgAdminService.ctgDeletable(ctvo)) {
				result = String.valueOf(prodCtgAdminService.deleteCtg(ctvo) == 1);
			} else {
				result = "referenceError";
			}
		} catch (Exception e) {
			result = "referenceError";
		}
		return result;
	}

	@PostMapping("/insertColor")
	@ResponseBody
	public String insertColor(ProdColorVO clvo) {
		String result = null;
		result = String.valueOf(prodCtgAdminService.insertColor(clvo) == 1);
		return result;
	}

	@PostMapping("/updateColor")
	@ResponseBody
	public String updateColor(ProdColorVO clvo) {
		String result = null;
		result = String.valueOf(prodCtgAdminService.updateColor(clvo) == 1);
		return result;
	}

	@PostMapping("/deleteColor")
	@ResponseBody
	public String deleteColor(ProdColorVO clvo) {
		String result = null;
		try {
			if(prodCtgAdminService.checkDeletable(clvo)) {
				result = String.valueOf(prodCtgAdminService.deleteColor(clvo) == 1);
			} else {
				result = "referenceError";
			}
		} catch (Exception e) {
			result = "referenceError";
		}
		return result;
	}
	
	@PostMapping("/checkColor")
	@ResponseBody
	public String checkColor(ProdColorVO clvo) {
		return String.valueOf(!prodCtgAdminService.checkDuplicate(clvo));
	}
	
	
}