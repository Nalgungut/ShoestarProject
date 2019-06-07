package com.shoestar.admin.prod.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.shoestar.admin.prod.service.ProdAdminService;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/product/*")
public class ProdAdminController {
	
	private ProdAdminService prodAdminService;
	
	@RequestMapping(value="/list", method={RequestMethod.GET, RequestMethod.POST})
	public String prodList(ProdVO pvo, Model model) {
		List<ProdVO> result = prodAdminService.prodlist(pvo);
		
		model.addAttribute("prodlist", result);
		
		return "admin/product/prodList";
	}
}