package com.shoestar.client.cscenter.dao;

import java.util.List;

import com.shoestar.client.cscenter.vo.Orders_statusVO;
import com.shoestar.client.cscenter.vo.QNAReplyVO;
import com.shoestar.client.cscenter.vo.QNAVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface QNADao {

	public List<QNAVO> qnaList(QNAVO qvo);

	public QNAVO qnaDetail(QNAVO qvo);

	public List<OrdersInsVO> qnaOrders(int mem_no);

	public int qnaInsert(QNAVO qvo);

	public int qnaUpdate(QNAVO qvo);

	public int qnaDelete(int qna_no);
	
	public List<QNAReplyVO> qna_replyList(QNAReplyVO qrvo);

	public int orders_statusInsert(Orders_statusVO ovo);

	
}
