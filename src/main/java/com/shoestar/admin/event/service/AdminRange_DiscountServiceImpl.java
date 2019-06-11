package com.shoestar.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.admin.event.dao.AdminRange_DiscountDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.client.event.vo.Range_DiscountVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountServiceImpl implements AdminRange_DiscountService {

	@Setter(onMethod_ =@Autowired)
	private AdminRange_DiscountDAO ARDao;
	
	@Override
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo) {
		log.info("목록 불러오기");
		
		List<Range_DiscountVO> list = null;
		list = ARDao.AdminRDiscountList(rvo);
		
		return list;
	}

}
