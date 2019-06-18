package com.shoestar.client;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoestar.admin.orders.dao.OrdersAdminDao;
import com.shoestar.admin.prod.dao.ProdAdminDao;
import com.shoestar.client.orders.vo.OrdersVO;
import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.dao.ProdInsDao;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@SuppressWarnings("unused")
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProdTest {
	
	@Setter(onMethod_ = @Autowired)
	private ProdDao prodDao;
	@Setter(onMethod_ = @Autowired)
	private ProdInsDao prodInsDao;
	@Setter(onMethod_ = @Autowired)
	private ProdAdminDao prodAdminDao;
	@Setter(onMethod_ = @Autowired)
	private OrdersAdminDao ordersAdminDao;
	
	@Test
	public void testThings() {
		log.info("테스트를 시작합니다");
		log.info("---------------------------------------------------------");
		
		OrdersVO ovo = new OrdersVO();
		List<OrdersVO> list = ordersAdminDao.getList(ovo);
		
		for (OrdersVO ordersVO : list) {
			log.info("결과 값은: " + ordersVO);
		}
		
	}
}
