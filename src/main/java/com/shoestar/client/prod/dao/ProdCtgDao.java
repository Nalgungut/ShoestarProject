package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;

public interface ProdCtgDao {
	
	public List<ProdCtgVO> getProdCtgList(ProdCtgVO pcvo);
	
	public List<Integer> getAvailableSize(ProdCtgVO pvo);
	
	public List<ProdColorVO> getAvailableColor(ProdCtgVO pcvo);
}