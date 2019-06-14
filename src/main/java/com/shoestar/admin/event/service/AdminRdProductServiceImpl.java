package com.shoestar.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.admin.event.dao.AdminRdProductDAO;
import com.shoestar.client.event.vo.Rd_ProductVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminRdProductServiceImpl implements AdminRdProductService {


	@Setter(onMethod_ =@Autowired)
	private AdminRdProductDAO RPDao;
	
	/*@Override
	public List<Rd_ProductVO> RdProductInsert(List<Rd_ProductVO> pvo) {
		int result = 0;
		List<Rd_ProductVO> list = null;
		// 서비스구현클래스 list.size or list[].length 
		// >> 순번들을 가져와서 그걸로  dao 반복문써서 dao.~insert()
		
		for(int i = 0; i <=pvo.size(); i++) {
		result = RPDao.RdProductInsert(pvo.get(i));
		}
		return list;
	}
*/
	@Override
	public List<Rd_ProductVO> RdProductList(Rd_ProductVO pvo) {
		List<Rd_ProductVO> list = RPDao.RdProductList(pvo);
		return list;
	}
	

}
