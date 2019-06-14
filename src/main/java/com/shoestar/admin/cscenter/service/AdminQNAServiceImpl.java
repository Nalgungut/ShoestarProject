package com.shoestar.admin.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.cscenter.dao.AdminQNADao;
import com.shoestar.admin.cscenter.vo.AdminQNAVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminQNAServiceImpl implements AdminQNAService {
	
	private AdminQNADao qdao;
	
	@Override
	public List<AdminQNAVO> qnaList(AdminQNAVO qvo) {
		List<AdminQNAVO> list = null;
		list = qdao.qnaList(qvo);
		
		return list;
	}
	
	@Override
	public int qna_all(AdminQNAVO qvo) {
		int result = 0;
		result = qdao.qna_all(qvo);
		
		return result;
	}

	@Override
	public int qna_hold(AdminQNAVO qvo) {
		int result = 0;
		result = qdao.qna_hold(qvo);
		return result;
	}

	@Override
	public int qna_cancel(AdminQNAVO qvo) {
		int result = 0;
		result = qdao.qna_cancel(qvo);
		return result;
	}

	@Override
	public int qna_exchange(AdminQNAVO qvo) {
		int result = 0;
		result = qdao.qna_exchange(qvo);
		return result;
	}

	@Override
	public int qna_return(AdminQNAVO qvo) {
		int result = 0;
		result = qdao.qna_return(qvo);
		return result;
	}

	

}
