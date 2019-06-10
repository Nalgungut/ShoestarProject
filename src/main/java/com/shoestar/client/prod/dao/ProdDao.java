package com.shoestar.client.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;

/**
 * Prod ���̺� ���� dao
 * @author ������
 */
public interface ProdDao {
	
	public List<ProdVO> prodList(ProdVO pvo);
	
	public ProdVO prodDetail(ProdVO pvo);
	
	public ProdVO prodDetailByIns(ProdInsVO pivo);
	
	public int countRecords(ProdVO pvo);
}