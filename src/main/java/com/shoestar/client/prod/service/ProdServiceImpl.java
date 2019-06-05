package com.shoestar.client.prod.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.prod.dao.ProdDao;
import com.shoestar.client.prod.dao.ProdInsDao;
import com.shoestar.client.prod.vo.ProdInsVO;
import com.shoestar.client.prod.vo.ProdVO;

import lombok.Setter;

/**
 * Prod ���� ����
 * @author ������
 */
@Service
public class ProdServiceImpl implements ProdService {
	
	@Setter(onMethod_ = @Autowired)
	private ProdDao prodDao;
	
	@Setter(onMethod_ = @Autowired)
	private ProdInsDao prodInsDao;
	
	/**
	 * ��ü �˻� �޼���
	 */
	@Override
	public List<ProdVO> prodList(ProdVO pvo) {
		List<ProdVO> list = prodDao.prodList(pvo);
		return list;
	}
	
	/**
	 * ���� ��ü �˻� �޼���
	 */
	@Override
	public ProdVO prodDetail(ProdVO pvo) {
		ProdVO result = prodDao.prodDetail(pvo);
		return result;
	}

	@Override
	public ProdVO prodDetailByIns(ProdInsVO pivo) {
		ProdVO result = prodDao.prodDetailByIns(pivo);
		return result;
	}
}
