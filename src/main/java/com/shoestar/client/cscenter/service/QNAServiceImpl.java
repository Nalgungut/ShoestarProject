package com.shoestar.client.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.client.cscenter.dao.QNADao;
import com.shoestar.client.cscenter.vo.QNAVO;

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
	public QNAVO qnaUpdateForm(QNAVO qvo) {
		QNAVO detail = null;
		detail = qdao.qnaDetail(qvo);
		return detail;
	}
	
	

}
