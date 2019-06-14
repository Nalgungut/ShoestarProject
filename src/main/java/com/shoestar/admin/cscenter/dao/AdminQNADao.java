package com.shoestar.admin.cscenter.dao;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminQNAVO;

public interface AdminQNADao {

	public int qna_all(AdminQNAVO qvo);
	public int qna_hold(AdminQNAVO qvo);
	public int qna_cancel(AdminQNAVO qvo);
	public int qna_exchange(AdminQNAVO qvo);
	public int qna_return(AdminQNAVO qvo);
	public List<AdminQNAVO> qnaList(AdminQNAVO qvo);
	
}
