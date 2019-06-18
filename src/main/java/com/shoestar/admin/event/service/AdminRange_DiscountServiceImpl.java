package com.shoestar.admin.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.admin.event.dao.AdminRange_DiscountDAO;
import com.shoestar.admin.event.dao.AdminRdProductDAO;
import com.shoestar.admin.event.dao.adminRdTypeDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.client.event.vo.Range_DiscountVO;
import com.shoestar.client.event.vo.Rd_ProductVO;
import com.shoestar.client.event.vo.Rd_TypeVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminRange_DiscountServiceImpl implements AdminRange_DiscountService {

	@Setter(onMethod_ =@Autowired)
	private AdminRange_DiscountDAO ARDao;
	
	private adminRdTypeDAO rTDao;
	
	
	// ��� ����
	@Override
	public List<Range_DiscountVO> AdminRDiscountList(Range_DiscountVO rvo) {
		log.info("��� �ҷ�����");
		
		List<Range_DiscountVO> list = null;
		list = ARDao.AdminRDiscountList(rvo);
		
		return list;
	}

	// ��� ��
	@Override
	public int adminRdisCnt(Range_DiscountVO rvo) {
		return ARDao.adminRdisCnt(rvo);
	}

	// ������
	@Override
	public Range_DiscountVO AdminRDiscountDetail(Range_DiscountVO rvo) {
		Range_DiscountVO detail = null;//new Range_DiscountVO();
		
		detail = ARDao.AdminRDiscountDetail(rvo);
		
		return detail;
	}

	// ���� ��� ��
	@Override
	public List<Range_DiscountVO> AdminDetail(Range_DiscountVO rvo) {
		List<Range_DiscountVO> detail = null;
		
		detail = ARDao.AdminDetail(rvo);
		
		return detail;
	}

	// �Է�
	@Override
	public int AdminRDisInsert(Range_DiscountVO rvo) {
		int  rd_no = 0, result = 0;
		
		rd_no = ARDao.rdNo();
		rvo.setRd_no(rd_no);
		
		// rd_no
		
		result = ARDao.AdminRDisInsert(rvo);
		
	/*	
		for(int i = 0; i < rvo.getList().size(); i++) {
			rvo.getList().get(i).setRd_no(rd_no); // rd_no�� �� ����
			Rd_TypeVO rdvo = rvo.getList().get(i); // >> list.size for��
			rTDao.rdTypeInsert(rdvo);
		}
	 */	
		return result;
	}
	
	// â �̵��� �� ���ÿ� update
	/*@Override
	public Range_DiscountVO updateForm(Range_DiscountVO rvo) {
		Range_DiscountVO detail = null;
		detail = ARDao.ridsDetail(rvo);
		return detail;
	}*/

	// ����
	@Override
	public int rdisUpdate(Range_DiscountVO rvo) {
		int  result = 0;
		
		log.info(rvo);
		
		result = ARDao.adminRdisUpdate(rvo);
		
		return result;
	}


	// ���� ���� ����
	@Override
	public int rdisDelete(Range_DiscountVO rvo) {
		int result = 0;
		
		
		rTDao.rdTypeDelete(rvo.getRd_no());
		result = ARDao.rdisDelete(rvo.getRd_no());
		
		return result;
		
	}
	
	
	// ���� ���� ��� ���
	@Override
	public int rtInsert(/*Rd_TypeVO*/Range_DiscountVO rvo) {
		int result = 0;
		
		log.info(rvo);
		
		log.info(rvo.getRd_no());
		log.info(rvo.getPct_no());
		
		
		result = rTDao.rdTypeInsert(rvo);	
		
		
		return result;
	}
	
	
	// ���� ���� ��� ����
	@Override
	public int rtDelete(Range_DiscountVO rvo) {
		int result = 0;
		
		result = rTDao.rdTypePctDelete(rvo.getPct_no());
		log.info(rvo);
		log.info(rvo.getRd_no());
		log.info(rvo.getPct_no());
		return result;
	}


	
}
