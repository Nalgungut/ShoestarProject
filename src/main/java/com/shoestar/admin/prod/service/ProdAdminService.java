package com.shoestar.admin.prod.service;

import java.util.List;

import com.shoestar.client.prod.vo.ProdVO;

public interface ProdAdminService {
	
	public List<ProdVO> prodlist(ProdVO pvo);
}