package com.shoestar.admin.cscenter.dao;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;

public interface AdminDeliveryDao {

	public List<AdminDeliveryVO> dmList(AdminDeliveryVO dvo);

	public int dm_ing(AdminDeliveryVO dvo);

}
