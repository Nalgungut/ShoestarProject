package com.shoestar.admin.event.dao;

import java.util.List;

import com.shoestar.client.event.vo.Rd_TypeVO;

public interface AdminRdTypeDAO {
	public List<Rd_TypeVO> RdTypeList(Rd_TypeVO tvo);
	public int RdTypeInsert(Rd_TypeVO tvo);
	
}
