package com.shoestar.admin.cscenter.service;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminFAQVO;

public interface AdminFAQService {

	public List<AdminFAQVO> faqList(AdminFAQVO fvo);

	public int faqDelete(int faq_no);

}
