package com.shoestar.client.brand.Service;

import java.util.List;

import com.shoestar.client.brand.vo.BrandVO;

public interface BrandNewsService {
	
	public List<BrandVO> brandNewsList(BrandVO bvo);
	
	public BrandVO brandNewsDetail(BrandVO bvo);

}
