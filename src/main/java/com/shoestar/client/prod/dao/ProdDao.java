package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdVO;

/**
 * Prod 테이블 전담 dao
 * @author 배정훈
 */
public interface ProdDao {
	
	public List<ProdVO> prodList(ProdVO pvo);
}
