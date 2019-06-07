package com.shoestar.admin.prod.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.admin.prod.service.ProdAdminService;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;

@Controller
@AllArgsConstructor
@RequestMapping("/admin/product/*")
public class ProdAdminController {
	
	private ProdAdminService prodAdminService;
	
	@RequestMapping(value="/getList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> prodList(ProdVO pvo) {
		List<ProdVO> result = prodAdminService.prodlist(pvo);
		return result;
	}
}
