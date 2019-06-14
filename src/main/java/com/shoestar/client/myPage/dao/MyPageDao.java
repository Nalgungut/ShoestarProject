package com.shoestar.client.myPage.dao;

import java.util.List;

import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface MyPageDao {

	
	/**
	 * ȸ�� ��ȣ�� �ֹ� ���� �������� �޼���
	 * @param mem_no ȸ�� ��ȣ
	 * @return �ֹ�����(OrdersVO)�� ����Ʈ
	 */
	public List<OrdersVO> ordersDataByMemNo(int mem_no);
	
	
	/**
	 * �ֹ� ��ȣ�� �ֹ� ��ǰ ����� �������� �޼���
	 * @param ovo �ֹ�����(OrdersVO) ��ü. od_no�� �ʿ�.
	 * @return �ֹ� ��ǰ ���(OrdersInsVO)
	 */
	public List<OrdersInsVO> ordersInsByOdNo(OrdersVO ovo);
	
}
