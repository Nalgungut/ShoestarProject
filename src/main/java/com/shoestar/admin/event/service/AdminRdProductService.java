package com.shoestar.admin.event.service;

import java.util.List;

import com.shoestar.client.event.vo.Rd_ProductVO;

public interface AdminRdProductService {
	public List<Rd_ProductVO> RdProductList(Rd_ProductVO pvo);
	//public List<Rd_ProductVO> RdProductInsert(List<Rd_ProductVO> pvo); 
}
