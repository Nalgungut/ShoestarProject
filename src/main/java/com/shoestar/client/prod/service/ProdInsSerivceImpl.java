package com.shoestar.client.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.prod.dao.ProdInsDao;
import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.Setter;

@Service
public class ProdInsSerivceImpl implements ProdInsService {
	
	@Setter(onMethod_ = @Autowired)
	private ProdInsDao prodInsDao;
	
	@Override
	public List<ProdInsVO> pinsListByProd(ProdVO pvo) {
		List<ProdInsVO> result = prodInsDao.pinsListByProd(pvo);
		return result;
	}

	@Override
	public ProdInsVO pinsDetail(ProdInsVO pivo) {
		ProdInsVO result = prodInsDao.pinsDetail(pivo);
		return result;
	}

	@Override
	public ProdInsVO pinsDetailByProd(ProdVO pvo) {
		ProdInsVO result = prodInsDao.pinsDetailByProd(pvo);
		return result;
	}

	@Override
	public List<ProdStockVO> pstListByPins(ProdInsVO pivo) {
		List<ProdStockVO> result = prodInsDao.pstListByPins(pivo);
		return result;
	}

	@Override
	public List<ProdImageVO> pimListByPins(ProdInsVO pivo) {
		List<ProdImageVO> result = prodInsDao.pimListByPins(pivo);
		return result;
	}

}
