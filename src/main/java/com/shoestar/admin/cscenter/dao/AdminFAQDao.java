package com.shoestar.admin.cscenter.dao;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminFAQVO;

public interface AdminFAQDao {

	public List<AdminFAQVO> faqList(AdminFAQVO fvo);

	public int faqDelete(int faq_no);

}
