package com.shoestar.admin.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;

public interface ProdAdminService {
	
	public List<ProdVO> prodlist(ProdVO pvo);
	
	public ProdVO prodDetail(Integer pd_no);
	
	public int updateMultiple(List<Integer> pdnos, ProdVO pvo);
	
	public int deleteMultiple(List<Integer> pdnos);
	
	public int updateProd(ProdVO pvo);
	
	public int insertProd(ProdVO pvo);
	
	public int countRecords(ProdVO pvo);
	
	public List<ProdInsVO> prodInsList(ProdVO pvo);
	
	public int pimInsert(ProdImageVO pvo);
	
	public int pimUpdate(ProdImageVO pvo);
	
	public int pimDelete(ProdImageVO pvo);
	
	// prodins
	public int insertProdins(ProdInsVO pivo);
	
	public int deleteProdins(ProdInsVO pivo);
	
	public boolean isProdinsDeletable(ProdInsVO pivo);
	
	public List<ProdColorVO> unoccupiedColors(ProdVO pvo);
	
	// prodstock
	public int insertProdStock(ProdStockVO psvo);
	
	public int updateProdStock(ProdStockVO psvo);
	
	public int deleteProdStock(ProdStockVO psvo);
	
	public boolean isProdStockDeletable(ProdStockVO psvo);
	
	public boolean isSafeSize(ProdStockVO psvo);
}