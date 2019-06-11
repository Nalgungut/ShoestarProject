package com.shoestar.client.brand.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.brand.dao.BrandNewsDao;
import com.shoestar.client.brand.vo.BrandVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor

public class BrandNewsServiceImpl implements BrandNewsService {

	@Setter(onMethod_=@Autowired)
	private BrandNewsDao brandNewsDao;
	
	@Override
	public List<BrandVO> brandNewsList(BrandVO bvo) {
		List<BrandVO> list = null;
		list = brandNewsDao.brandNewsList(bvo);
		
		return list;
	}

	@Override
	public BrandVO brandNewsDetail(BrandVO bvo) {
		log.info("브랜드 뉴스 디테일 페이지 호출 serviceimpl");
		
		BrandVO detail = null;
		detail = brandNewsDao.brandNewsDetail(bvo);
		if(detail!=null){
			detail.setAr_content(detail.getAr_content().toString().replaceAll("\n","<br>"));
		}
		return detail;
	}

}
