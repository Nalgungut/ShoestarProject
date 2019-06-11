package com.shoestar.client.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.cscenter.dao.QNADao;
import com.shoestar.client.cscenter.vo.QNAVO;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class QNAServiceImpl implements QNAService {
	
	private QNADao qdao;
	
	@Override
	public List<QNAVO> qnaList(QNAVO qvo) {
		log.info("qnaList.......");
		List<QNAVO> list = null;
		list = qdao.qnaList(qvo);
		return list;
	}

	@Override
	public QNAVO qnaDetail(QNAVO qvo) {
		QNAVO detail = new QNAVO();
		detail = qdao.qnaDetail(qvo);
		if(detail != null) {
			detail.setQna_content(detail.getQna_content().toString().replaceAll("\n", "<br>"));
		}
		return detail;
	}

	

	@Override
	public List<OrdersVO> qnaOrders(int mem_no) {
		return qdao.qnaOrders(mem_no);
	}

	@Override
	public int qnaInsert(QNAVO qvo) {
		int result = 0;
		
		result = qdao.qnaInsert(qvo);
		return result;
	}
	
	@Override
	public int qnaUpdate(QNAVO qvo) {
		int result = 0;
		result = qdao.qnaUpdate(qvo);
		return result;
	}

}
