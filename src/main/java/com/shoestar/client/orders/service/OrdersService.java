package com.shoestar.client.orders.service;

import java.util.List;
import java.util.Map;

import com.shoestar.client.orders.vo.CartVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

public interface OrdersService {
	
	public List<CartVO> cartListByMemNo(int mem_no);
	
	public Map<String, Object> prodDataByCartList(List<CartVO> cvo);
	
	public String addToCart(CartVO cvo);
	
	public int removeFromCart(List<CartVO> cvo);
	
	public boolean checkStock(CartVO cvo);
	
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
	
	public int insertNewOrders(int mem_no, List<OrdersInsVO> oivo);
}
