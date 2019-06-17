package com.shoestar.admin.prod.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.prod.dao.ProdCtgAdminDao;
import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class ProdCtgAdminServiceImpl implements ProdCtgAdminService {
	
	private ProdCtgAdminDao prodCtgAdminDao;
	
	@Override
	public List<ProdCtgVO> ctgList() {
		return prodCtgAdminDao.ctgList();
	}

	@Override
	public int insertCtg(ProdCtgVO ctvo) {
		return prodCtgAdminDao.insertCtg(ctvo);
	}

	@Override
	public int updateCtg(ProdCtgVO ctvo) {
		return prodCtgAdminDao.updateCtg(ctvo);
	}

	@Override
	public int deleteCtg(ProdCtgVO ctvo) {
		return prodCtgAdminDao.deleteCtg(ctvo);
	}

	@Override
	public List<ProdColorVO> colorList() {
		return prodCtgAdminDao.colorList();
	}

	@Override
	public int insertColor(ProdColorVO clvo) {
		return prodCtgAdminDao.insertColor(clvo);
	}

	@Override
	public int updateColor(ProdColorVO clvo) {
		return prodCtgAdminDao.updateColor(clvo);
	}

	@Override
	public int deleteColor(ProdColorVO clvo) {
		return prodCtgAdminDao.deleteColor(clvo);
	}
}
