package com.shoestar.admin.cscenter.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.shoestar.admin.cscenter.dao.AdminFAQDao;
import com.shoestar.admin.cscenter.vo.AdminFAQVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class AdminFAQServiceImpl implements AdminFAQService {
	private AdminFAQDao fdao;
	
	@Override
	public List<AdminFAQVO> faqList(AdminFAQVO fvo){
		List<AdminFAQVO> list = null;
		list = fdao.faqList(fvo);
		
		return list;
	}
	
	@Override
	public int faqDelete(int faq_no) {
		int result = 0;
		result = fdao.faqDelete(faq_no);
		return result;		
	}
}
