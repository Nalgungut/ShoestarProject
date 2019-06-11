package com.shoestar.admin.event.dao;

import java.util.List;

import com.shoestar.client.event.vo.Rd_ProductVO;

public interface AdminRdProductDAO {
	public List<Rd_ProductVO> RdProductList(Rd_ProductVO pvo);
	
	public int RdProductInsert(Rd_ProductVO pvo);
}
