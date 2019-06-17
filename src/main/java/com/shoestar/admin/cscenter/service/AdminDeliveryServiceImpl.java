package com.shoestar.admin.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.cscenter.dao.AdminDeliveryDao;
import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminDeliveryServiceImpl implements AdminDeliveryService {
	
	private AdminDeliveryDao mdao;

	@Override
	public List<AdminDeliveryVO> dmList(AdminDeliveryVO dvo) {
		List<AdminDeliveryVO> list = null;
		list = mdao.dmList(dvo);
		
		return list;
	}

	@Override
	public int dm_ing(AdminDeliveryVO dvo) {
		int result = 0;
		result = mdao.dm_ing(dvo);
		return result;
	}

	@Override
	public List<AdminDeliveryVO> dmList2(AdminDeliveryVO dvo) {
		List<AdminDeliveryVO> list = null;
		list = mdao.dmList2(dvo);
		return list;
	}
	
	@Override
	public List<AdminDeliveryVO> dmList3(AdminDeliveryVO dvo){
		List<AdminDeliveryVO> list = null;
		list = mdao.dmList3(dvo);
		return list;
	}

	@Override
	public int dm_end(AdminDeliveryVO dvo) {
		int result = 0;
		result = mdao.dm_end(dvo);
		return result;
	}

	@Override
	public List<AdminDeliveryVO> dm_before_search(AdminDeliveryVO dvo) {
		List<AdminDeliveryVO> list = null;
		list = mdao.dm_before_search(dvo);
		
		return list;
	}

	@Override
	public List<AdminDeliveryVO> dm_ing_search(AdminDeliveryVO dvo) {
		List<AdminDeliveryVO> list = null;
		list = mdao.dm_ing_search(dvo);
		
		return list;
	}
	
	@Override
	public List<AdminDeliveryVO> dm_end_search(AdminDeliveryVO dvo){
		List<AdminDeliveryVO> list = null;
		list = mdao.dm_end_search(dvo);
		
		return list;
	}
	
}
