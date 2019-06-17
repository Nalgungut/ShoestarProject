package com.shoestar.admin.prod.dao;

import java.util.List;

import com.shoestar.client.prod.vo.ProdColorVO;
import com.shoestar.client.prod.vo.ProdCtgVO;

public interface ProdCtgAdminDao {
	
	// ī�װ���
	public List<ProdCtgVO> ctgList();
	
	public int insertCtg(ProdCtgVO ctvo);
	
	public int updateCtg(ProdCtgVO ctvo);
	
	public int deleteCtg(ProdCtgVO ctvo);
	
	public int ctgDeletable(ProdCtgVO ctvo);
	
	// ����
	public List<ProdColorVO> colorList();
	
	public int insertColor(ProdColorVO clvo);
	
	public int updateColor(ProdColorVO clvo);
	
	public int deleteColor(ProdColorVO clvo);
	
	public int checkDuplicate(ProdColorVO clvo);
	
	public int checkDeletable(ProdColorVO clvo);
}