package com.shoestar.admin.event.dao;

import java.util.List;

import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.client.event.vo.Rd_TypeVO;


public interface adminRdTypeDAO {
	public List<Rd_TypeVO> rdTypeList(Rd_TypeVO tvo);
	
	
	public Rd_TypeVO rdTypeDetail(int rd_no);
	public int rdTypeInsert(Range_DiscountVO tvo);

	public int rdTypeDelete(int rd_no);
	
	public int rdTypePctDelete(int pct_no);
	
}
