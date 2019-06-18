package com.shoestar.admin.cscenter.service;

import java.util.List;


import com.shoestar.admin.cscenter.vo.AdminOsVO;



public interface AdminOSService {
	
	public List<AdminOsVO> osList(AdminOsVO osvo);

	public List<AdminOsVO> osListEnd(AdminOsVO osvo);

	public int osUpdate(AdminOsVO osvo);

	public List<AdminOsVO> order_status_search(AdminOsVO osvo);
	
}
