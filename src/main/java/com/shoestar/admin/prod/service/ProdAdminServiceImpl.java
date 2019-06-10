package com.shoestar.admin.prod.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProdAdminServiceImpl implements ProdAdminService {
	
	private ProdDao prodDao;
	
	@Override
	public List<ProdVO> prodlist(ProdVO pvo) {
		
		pvo.setIncludeItemless(true);
		if(pvo.getPd_age() == null) {
			pvo.setPd_age("all");
		}
		
		List<ProdVO> result = prodDao.prodList(pvo);
		
		return result;
	}
}
