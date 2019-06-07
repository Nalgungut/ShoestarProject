package com.shoestar.client.brand.dao;

import java.util.List;

import com.shoestar.client.brand.vo.BrandVO;

public interface BrandNewsDao {
	
	public List<BrandVO> brandNewsList(BrandVO bvo);
	
	public BrandVO brandNewsDetail(BrandVO bvo);

}
