package com.shoestar.client.prod.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.exception.ResourceNotFoundException;

import lombok.AllArgsConstructor;

/**
 * ��ǰ ������ ó���ϴ� ��Ʈ�ѷ�
 * @author ������
 */
@Controller
@AllArgsConstructor
@RequestMapping("/product/*")
public class ProdController {
	
	private ProdService prodService;
	
	
	/**
	 * ��ǰ �˻� ������ �о���� �޼���
	 * @param pvo �˻� ���͸� ���� ProdVO ��ü
	 * @return �˻� ����� JSON ���·� ���� List
	 */
	@RequestMapping(value="/getList", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> getList(ProdVO pvo) {
		List<ProdVO> list = prodService.prodList(pvo);
		
		return list;
	}
	
	/**
	 * ��ǰ ����Ʈ ǥ�� ȭ��
	 * @return productList.jsp
	 */
	@GetMapping(value="/showList")
	public String showList() {
		return "client/product/productList";
	}
	
	
	/**
	 * ��ǰ ���� ������ �о���� �޼���
	 * @param pvo ��ǰ ��ȣ�� ���� ProdVO ��ü
	 * @return �˻� ����� "prodVO"�� ��� productDetail.jsp ��ȯ
	 * @throws �˻� ����� ���� ��� 404 ����
	 */
	@RequestMapping(value="/prod", method=RequestMethod.GET)
	public String showDetail(ProdVO pvo, String color, Model model) throws ResourceNotFoundException {
		ProdVO prodInfo = prodService.prodDetail(pvo);
		
		if(prodInfo == null) {
			throw new ResourceNotFoundException("�ش� ��ǰ�� ã�� �� �����ϴ�.");
		}
		
		ProdInsVO pivo = new ProdInsVO();
		pivo.setPd_no(pvo.getPd_no());
		if(color != null) {
			try {
				pivo.setPcl_no(Integer.parseInt(color));
			} catch (NumberFormatException e) {}
		}
		
		model.addAttribute("prod", prodInfo);
		
		return "client/product/productDetail";
	}
}