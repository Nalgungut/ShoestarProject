package com.shoestar.admin.event.dao;

import java.util.List;

import com.shoestar.client.event.vo.Range_DiscountVO;

public interface AdminRange_DiscountDAO {
	
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo);
	
	public Range_DiscountVO AdminRDiscountDetail(Range_DiscountVO rvo);
}
