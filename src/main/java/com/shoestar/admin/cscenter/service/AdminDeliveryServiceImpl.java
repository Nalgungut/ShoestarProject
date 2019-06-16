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
	
	
}
