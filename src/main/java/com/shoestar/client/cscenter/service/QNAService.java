package com.shoestar.client.cscenter.service;

import java.util.List;

import com.shoestar.client.cscenter.vo.QNAVO;

public interface QNAService {

	public List<QNAVO> qnaList(QNAVO qvo);

	public QNAVO qnaDetail(QNAVO qvo);

	public QNAVO qnaUpdateForm(QNAVO qvo);

	

	
	
}
