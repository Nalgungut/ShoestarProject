package com.shoestar.admin.cscenter.service;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;
import com.shoestar.admin.cscenter.vo.AdminQNAReplyVO;
import com.shoestar.admin.cscenter.vo.AdminQNAVO;

public interface AdminQNAService {

	public int qna_all(AdminQNAVO qvo);
	
	public int qna_hold(AdminQNAVO qvo);

	public int qna_cancel(AdminQNAVO qvo);

	public int qna_exchange(AdminQNAVO qvo);

	public int qna_return(AdminQNAVO qvo);

	public List<AdminQNAVO> qnaList(AdminQNAVO qvo);

	public AdminQNAVO qnaDetail(AdminQNAVO qvo);

	public int replyInsert(AdminQNAReplyVO qrvo);

	public int replyUpdate(AdminQNAVO qvo);

	public int dm_before(AdminDeliveryVO dvo);

	public int dm_ing(AdminDeliveryVO dvo);
	
}
