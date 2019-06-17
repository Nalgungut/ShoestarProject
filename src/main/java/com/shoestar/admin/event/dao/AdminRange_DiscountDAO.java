package com.shoestar.admin.event.dao;

import java.util.List;

import com.shoestar.client.event.vo.Range_DiscountVO;

public interface AdminRange_DiscountDAO {
	
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo);
	
	public int adminRdisCnt(Range_DiscountVO rvo);
	
	public Range_DiscountVO AdminRDiscountDetail(Range_DiscountVO rvo);
	
	public List<Range_DiscountVO> AdminDetail(Range_DiscountVO rvo);
	
	public int AdminRDisInsert(Range_DiscountVO rvo);
	
	/*public */
	
	public int adminRdisUpdate(Range_DiscountVO rvo);
	
	public int rdisDelete(int rd_vo);
	
	public int rdNo();
}
