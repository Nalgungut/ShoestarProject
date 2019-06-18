package com.shoestar.admin.event.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.event.dao.AdminRange_DiscountDAO;
import com.shoestar.admin.event.dao.adminRdTypeDAO;
import com.shoestar.client.event.vo.Rd_TypeVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class adminRdTypeServiceImpl implements adminRdTypeService {

	private adminRdTypeDAO rTDao;
	
	@Override
	public int rdisDelete(Rd_TypeVO tvo) {
		// TODO Auto-generated method stub
		return 0;
	}

/*	@Override
	public int rdTypeDetail(Rd_TypeVO tvo) {
		int list = null;
		
		list = rTDao.rdTypeDetail(rd_no);
		
		return list;
	}*/

}
