package com.shoestar.admin.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdVO;

public interface ProdAdminService {
	
	public List<ProdVO> prodlist(ProdVO pvo);
	
	public ProdVO prodDetail(Integer pd_no);
	
	public int updateMultiple(List<Integer> pdnos, ProdVO pvo);
	
	public int deleteMultiple(List<Integer> pdnos);
	
	public int updateProd(ProdVO pvo);
	
	public int insertProd(ProdVO pvo);
	
	public int countRecords(ProdVO pvo);
}