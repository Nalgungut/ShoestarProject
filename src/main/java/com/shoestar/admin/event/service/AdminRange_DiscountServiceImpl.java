package com.shoestar.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.admin.event.dao.AdminRange_DiscountDAO;
import com.shoestar.admin.event.dao.AdminRdProductDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.client.event.vo.Rd_ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountServiceImpl implements AdminRange_DiscountService {

	@Setter(onMethod_ =@Autowired)
	private AdminRange_DiscountDAO ARDao;
	
	private AdminRdProductDAO RPDao;
	
	
	// 목록 구현
	@Override
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo) {
		log.info("목록 불러오기");
		
		List<Range_DiscountVO> list = null;
		list = ARDao.AdminRDiscountList(rvo);
		
		return list;
	}


	// 상세정보
	@Override
	public Range_DiscountVO AdminRDiscountDetail(Range_DiscountVO rvo) {
		Range_DiscountVO detail = new Range_DiscountVO();
		
		detail = ARDao.AdminRDiscountDetail(rvo);
		
		return detail;
	}

	// 범위 대상 상세
	@Override
	public List<Range_DiscountVO> AdminDetail(Range_DiscountVO rvo) {
		List<Range_DiscountVO> detail = null;
		
		detail = ARDao.AdminDetail(rvo);
		
		return detail;
	}

	// 입력
	@Override
	public int AdminRDisInsert(Range_DiscountVO rvo) {
		int  rd_no = 0, result = 0;
		
		rd_no = ARDao.rdNo();
		rvo.setRd_no(rd_no);
		
		// rd_no
		
		result = ARDao.AdminRDisInsert(rvo);
		
		
		for(int i = 0; i < rvo.getList().size(); i++) {
			rvo.getList().get(i).setRd_no(rd_no); // rd_no의 값 설정
			Rd_ProductVO rdvo = rvo.getList().get(i); // >> list.size for문
			RPDao.RdProductInsert(rdvo);
		}
		
		return result;
	}
	
}
