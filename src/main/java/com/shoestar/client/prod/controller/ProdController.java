package com.shoestar.client.prod.controller;

import java.util.List;

import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shoestar.client.prod.service.ProdService;
import com.shoestar.client.prod.vo.ProdVO;

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
	 * ��ǰ ������ �о���� �޼���
	 * @param pvo �˻� ���͸� ���� ProdVO ��ü
	 * @return �˻� ����� ���� List
	 */
	@RequestMapping(value="/list", method=RequestMethod.GET, produces={MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody
	public List<ProdVO> prodList(ProdVO pvo) {
		
		List<ProdVO> list = prodService.prodList(pvo);
		
		return list;
	}
}