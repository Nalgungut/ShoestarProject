package com.shoestar.client.prod.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.prod.service.ProdInsService;
import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;
import com.shoestar.common.exception.BadRequestException;
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
	private ProdInsService prodInsService;
	
	
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
	 * @return �˻� ����� "prodVO"�� ��� productDetail.jsp ��ȯ
	 * @throws �˻� ����� ���� ��� 404 ����
	 */
	@RequestMapping(value="/prod", method=RequestMethod.GET)
	public String showDetail(Integer pi_no, Integer pd_no, Integer color, Model model) throws ResourceNotFoundException, BadRequestException {
		ProdVO pvo = new ProdVO();
		ProdInsVO pivo = new ProdInsVO();
		
		ProdVO prodInfo = null;
		ProdInsVO pinsInfo = null;
		
		if(pi_no != null) {
			pivo.setPi_no(pi_no);
			prodInfo = prodService.prodDetailByIns(pivo);
			pinsInfo = prodInsService.pinsDetail(pivo);
		} else if(pd_no != null) {
			pvo.setPd_no(pd_no);
			if(color != null)
				pvo.setColor(color);
			prodInfo = prodService.prodDetail(pvo);
			pinsInfo = prodInsService.pinsDetailByColor(pvo);
		} else {
			throw new BadRequestException("�߸� �� ��û�Դϴ�.");
		}
		
		if(pinsInfo == null || prodInfo == null) {
			throw new ResourceNotFoundException("�ش� ��ǰ�� ã�� �� �����ϴ�.");
		}
		
		model.addAttribute("prod", prodInfo);
		model.addAttribute("pins", pinsInfo);
		
		return "client/product/productDetail";
	}
	
	
	@RequestMapping(value="/pinsList", method={RequestMethod.GET}, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdInsVO> pinsList(ProdVO pvo) {
		List<ProdInsVO> result = prodInsService.pinsListByProd(pvo);
		return result;
	}
}