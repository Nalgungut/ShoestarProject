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
	 * 회원 번호로 주문 내역 가져오는 메서드
	 * @param mem_no 회원 번호
	 * @return 주문내역(OrdersVO)의 리스트
	 */
	public List<OrdersVO> ordersDataByMemNo(int mem_no);
	
	/**
	 * 주문 번호로 주문 상품 목록을 가져오는 메서드
	 * @param ovo 주문내역(OrdersVO) 객체. od_no만 필요.
	 * @return 주문 상품 목록(OrdersInsVO)
	 */
	public List<OrdersInsVO> ordersInsByOdNo(OrdersVO ovo);
	
	public int insertNewOrders(int mem_no, List<OrdersInsVO> oivo);
}
