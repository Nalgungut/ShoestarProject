package com.shoestar.client.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;

public interface ProdInsService {
	
	public List<ProdInsVO> pinsListByProd(ProdVO pvo);
	
	public ProdInsVO pinsDetail(ProdInsVO pivo);
	
	public ProdInsVO pinsDetailByProd(ProdVO pvo);
	
	public List<ProdStockVO> pstListByPins(ProdInsVO pivo);
	
	public List<ProdImageVO> pimListByPins(ProdInsVO pivo);
}
