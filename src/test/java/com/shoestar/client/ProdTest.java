package com.shoestar.client;

import java.util.Arrays;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.shoestar.admin.prod.dao.ProdAdminDao;
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
	
	@Test
	public void testThings() {
		log.info("�׽�Ʈ�� �����մϴ�");
		log.info("---------------------------------------------------------");
		
		ProdVO pvo = new ProdVO();
		pvo.setPd_name("test");
		pvo.setPd_age("a");
		pvo.setPd_sex("m");
		pvo.setPct_no(1);
		pvo.setPd_price(20000);
		pvo.setPd_fabric("õ 100%");
		pvo.setPd_country("��Ʈ��");
		pvo.setPd_year("2019");
		pvo.setPd_manu("����ȸ��");
		pvo.setPd_import("������");
		
		log.info("��� ����: " + prodAdminDao.insertProd(pvo));
	}
}
