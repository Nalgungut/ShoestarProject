package com.shoestar.admin.cscenter.dao;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminOsVO;

public interface AdminOSDao {

	public List<AdminOsVO> osList(AdminOsVO osvo);

	public List<AdminOsVO> osListEnd(AdminOsVO osvo);

	public int osUpdate(AdminOsVO osvo);

	public List<AdminOsVO> orders_status_search(AdminOsVO osvo);

	public List<AdminOsVO> orders_status_search_end(AdminOsVO osvo);
	
}
