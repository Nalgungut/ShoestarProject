package com.shoestar.admin.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdImageVO;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdStockVO;
import com.shoestar.client.prod.vo.ProdVO;

public interface ProdAdminDao {
	public int updateMultiple(@Param("pdnos") List<Integer> pdnos, @Param("pvo") ProdVO pvo);
	
	public int deleteMultiple(@Param("pdnos") List<Integer> pdnos);
	
	public int updateProd(ProdVO pvo);
	
	public int insertProd(ProdVO pvo);
	
	
	// prodimage
	public int pimInsert(ProdImageVO pimvo);
	
	public int pimUpdate(ProdImageVO pimvo);
	
	public int pimDelete(ProdImageVO pimvo);
	
	public ProdImageVO pimSelect(ProdImageVO pimvo);

	public ProdVO prodDetailByImage(ProdImageVO pimvo);
	
	public int updateMainImage(ProdImageVO pimvo);
	
	// prodins
	public int insertProdins(ProdInsVO pivo);
	
	public int deleteProdins(ProdInsVO pivo);
	
	public int isProdinsDeletable(ProdInsVO pivo);
	
	public List<ProdColorVO> unoccupiedColors(ProdVO pvo);
	
	public int deletePiMain(ProdInsVO pivo);
	
	// prodstock
	public int insertProdStock(ProdStockVO psvo);
	
	public int updateProdStock(ProdStockVO psvo);
	
	public int deleteProdStock(ProdStockVO psvo);
	
	public int isProdStockDeletable(ProdStockVO psvo);
	
	public int isSafeSize(ProdStockVO psvo);
}