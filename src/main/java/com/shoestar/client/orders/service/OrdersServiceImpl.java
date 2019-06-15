package com.shoestar.client.orders.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;
import com.shoestar.client.orders.dao.OrdersDao;
import com.shoestar.client.orders.vo.CartVO;
import com.shoestar.client.orders.vo.OrdersInsVO;
import com.shoestar.client.orders.vo.OrdersVO;

import lombok.AllArgsConstructor;

@Service
@AllArgsConstructor
public class OrdersServiceImpl implements OrdersService {
	
	private OrdersDao ordersDao;
	
	public static boolean isEqual(OrdersInsVO ovo, CartVO cvo) {
		return cvo.getPi_no() == ovo.getPi_no() && cvo.getPs_size() == ovo.getPs_size();
	}
	
	public static int calcDiscount(int originalPrice, int dcrate) {
		return (int) (Math.floor(originalPrice * (100 - dcrate) / 1000.0) * 10);
	}
	
	/* ============================================================================================== */
	
	@Override
	public List<CartVO> cartListByMemNo(int mem_no) {
		List<CartVO> result = ordersDao.cartListByMemNo(mem_no);
		return result;
	}

	@Override
	public Map<String, Object> prodDataByCartList(List<CartVO> cvo) {
		// 상품 수량 / 가격 정보 가져오기
		List<OrdersInsVO> list = ordersDao.prodDataByCartList(cvo);
		
		// 분류별로 상품 정보 나눠 담기
		Map<String, Object> result = new HashMap<>();
		List<OrdersInsVO> success = new ArrayList<>();
		List<OrdersInsVO> error = new ArrayList<>();
		
		// 분류를 위한 반복문
		for (int i = 0; i < list.size(); i++) {
			OrdersInsVO newData = list.get(i);
			
			int k = i;
			for (int j = 0; j < cvo.size(); j++) {
				CartVO compData = cvo.get(k++);
				if(isEqual(newData, compData)) {
					if(newData.getOi_qty() >= compData.getCart_qty()) {
						newData.setOi_price(calcDiscount(newData.getOi_org_price(), newData.getPd_discount()));
						newData.setOi_qty(compData.getCart_qty());
						success.add(newData);
					} else {
						error.add(newData);
					}
					break;
				}
				if(k >= cvo.size())
					k = 0;
			}
		}
		
		result.put("success", success);
		result.put("failed", error);
		
		return result;
	}

	@Override
	public String addToCart(CartVO cvo) {
		String result = "";
		
		if(ordersDao.duplicateCheck(cvo) == 1) {
			result = "duplicate";
		} else {
			if(!checkStock(cvo)) {
				result = "outofstock";
			} else {
				int insertResult = ordersDao.addToCart(cvo);
				result = insertResult == 1 ? "success" : "failure";
			}
		}
		
		return result;
	}

	@Override
	public int removeFromCart(List<CartVO> cvo) {
		int result = ordersDao.removeFromCart(cvo);
		return result;
	}


	@Override
	public boolean checkStock(CartVO cvo) {
		Integer stock = ordersDao.checkStock(cvo);
		stock = stock == null ? 0 : stock;
		return stock >= cvo.getCart_qty();
	}
	
	@Override
	public List<OrdersVO> ordersDataByMemNo(int mem_no) {
		return ordersDao.ordersDataByMemNo(mem_no);
	}

	@Override
	public List<OrdersInsVO> ordersInsByOdNo(OrdersVO ovo) {
		return ordersDao.ordersInsByOdNo(ovo);
	}
	
	@Transactional
	@Override
	public int insertNewOrders(int mem_no, List<OrdersInsVO> oivo, String addr) {
		int result = 0;
		
		OrdersVO ovo = new OrdersVO();
		ovo.setMem_no(mem_no);
		List<CartVO> cvo = new ArrayList<>();
		
		// 주문 생성
		ordersDao.insertNewOrders(ovo);
		int od_no = ovo.getOd_no();
		
		// 주문 상품 생성
		for (OrdersInsVO ordersInsVO : oivo) {
			ordersInsVO.setOd_no(od_no);
			ordersDao.insertOrderIns(ordersInsVO);
			ordersDao.updateStock(ordersInsVO);
			
			// 카트 정보 생성
			CartVO ctvo = new CartVO();
			ctvo.setMem_no(mem_no);
			ctvo.setPi_no(ordersInsVO.getPi_no());
			ctvo.setPs_size(ordersInsVO.getSize());
			cvo.add(ctvo);
			
			result++;
		}
		
		// 주소 정보 생성
		AdminDeliveryVO dvo = new AdminDeliveryVO();
		dvo.setDm_addr(addr);
		dvo.setOd_no(od_no);
		
		ordersDao.insertDeliveryInfo(dvo);
		
		// 카트에서 상품 삭제
		removeFromCart(cvo);
		
		return result;
	}
}
