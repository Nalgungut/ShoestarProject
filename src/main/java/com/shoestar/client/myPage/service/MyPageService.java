package com.shoestar.client.myPage.service;

import java.util.List;

import com.shoestar.client.myPage.vo.DeliveryVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface MyPageService {

	
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


	
	//ȸ����ȣ�� ��ۻ��� �������� �޼���
	public List<DeliveryVO> deliveryList(DeliveryVO dvo);

	


}
