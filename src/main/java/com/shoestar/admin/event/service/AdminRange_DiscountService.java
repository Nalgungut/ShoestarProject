package com.shoestar.admin.event.service;

import java.util.List;

import com.shoestar.client.event.vo.Range_DiscountVO;


public interface AdminRange_DiscountService {
	
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo);
	
	public Range_DiscountVO AdminRDiscountDetail(Range_DiscountVO rvo);
	public List<Range_DiscountVO> AdminDetail(Range_DiscountVO rvo);
	
	public int AdminRDisInsert(Range_DiscountVO rvo);
	public int rdisUpdate(Range_DiscountVO rvo);
	public int rdisDelete(Range_DiscountVO rvo);
	public int adminRdisCnt(Range_DiscountVO rvo);
	
	
	// rd_type
	public int rtInsert(Range_DiscountVO rvo);
	public int rtDelete(Range_DiscountVO rvo);
}
