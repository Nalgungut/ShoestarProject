package com.shoestar.admin.prod.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.prod.dao.ProdAdminDao;
import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.dao.ProdInsDao;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProdAdminServiceImpl implements ProdAdminService {
	
	private ProdDao prodDao;
	private ProdAdminDao prodAdminDao;
	private ProdInsDao prodInsDao;
	
	@Override
	public List<ProdVO> prodlist(ProdVO pvo) {
		
		pvo.setIncludeItemless(true);
		if(pvo.getPd_age() == null) {
			pvo.setPd_age("all");
		}
		
		List<ProdVO> result = prodDao.prodList(pvo);
		
		return result;
	}

	@Override
	public int countRecords(ProdVO pvo) {
		
		pvo.setIncludeItemless(true);
		if(pvo.getPd_age() == null) {
			pvo.setPd_age("all");
		}
		
		int result = prodDao.countRecords(pvo);
		
		return result;
	}

	@Override
	public ProdVO prodDetail(Integer pd_no) {
		if(pd_no == null || pd_no == 0) {
			return null;
		}
		
		ProdVO pvo = new ProdVO();
		pvo.setPd_no(pd_no);
		
		ProdVO result = prodDao.prodDetail(pvo);
		
		return result;
	}

	@Override
	public int updateMultiple(List<Integer> pdnos, ProdVO pvo) {
		int result = prodAdminDao.updateMultiple(pdnos, pvo);
		return result;
	}

	@Override
	public int deleteMultiple(List<Integer> pdnos) {
		int result = prodAdminDao.deleteMultiple(pdnos);
		return result;
	}

	@Override
	public int updateProd(ProdVO pvo) {
		int result = prodAdminDao.updateProd(pvo);
		return result;
	}

	@Override
	public int insertProd(ProdVO pvo) {
		int result = prodAdminDao.insertProd(pvo);
		
		return result == 1 ? pvo.getPd_no() : result;
	}

	@Override
	public List<ProdInsVO> prodInsList(ProdVO pvo) {
		List<ProdInsVO> result = prodInsDao.pinsListByProd(pvo);
		return result;
	}
}
