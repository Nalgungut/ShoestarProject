package com.shoestar.client;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class ProdTest {
	
	@Setter(onMethod_ = @Autowired)
	private ProdDao prodDao;
	
	@Test
	public void testThings() {
		log.info("�׽�Ʈ�� �����մϴ�");
		log.info("---------------------------------------------------------");
		log.info("prodDao : " + prodDao.getClass().getName());
		
		ProdVO pvo = new ProdVO();
		
		pvo.setPriceBottom(5000);
		
		log.info("prodVO : " + pvo);
		log.info(prodDao.prodList(pvo));
	}
}
