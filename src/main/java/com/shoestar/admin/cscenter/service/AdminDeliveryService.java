package com.shoestar.admin.cscenter.service;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;

public interface AdminDeliveryService {

	public List<AdminDeliveryVO> dmList(AdminDeliveryVO dvo);

	public int dm_ing(AdminDeliveryVO dvo);

}
