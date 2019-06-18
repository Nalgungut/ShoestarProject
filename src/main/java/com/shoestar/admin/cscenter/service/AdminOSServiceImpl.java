package com.shoestar.admin.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.cscenter.dao.AdminOSDao;
import com.shoestar.admin.cscenter.vo.AdminOsVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminOSServiceImpl implements AdminOSService {
	
	private AdminOSDao odao;
	@Override
	public List<AdminOsVO> osList(AdminOsVO osvo) {
		List<AdminOsVO> list = null;
		list = odao.osList(osvo);
		
		return list;
	}
	@Override
	public List<AdminOsVO> osListEnd(AdminOsVO osvo) {
		List<AdminOsVO> list = null;
		list = odao.osListEnd(osvo);
		
		return list;
	}
	@Override
	public int osUpdate(AdminOsVO osvo) {
		int result = 0;
		result = odao.osUpdate(osvo);
		
		return result;
	}
	@Override
	public List<AdminOsVO> order_status_search(AdminOsVO osvo) {
		List<AdminOsVO> list = null;
		list = odao.orders_status_search(osvo);
		
		return list;
	}

}
