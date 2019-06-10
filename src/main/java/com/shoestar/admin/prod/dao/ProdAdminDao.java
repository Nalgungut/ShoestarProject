package com.shoestar.admin.prod.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.shoestar.client.prod.vo.ProdVO;

public interface ProdAdminDao {
	public int updateMultiple(@Param("pdnos") List<Integer> pdnos, @Param("pvo") ProdVO pvo);
	
	public int deleteMultiple(@Param("pdnos") List<Integer> pdnos);
	
	public int updateProd(ProdVO pvo);
	
	public int insertProd(ProdVO pvo);
}