package com.shoestar.admin.cscenter.service;

import java.util.List;

import com.shoestar.admin.cscenter.vo.AdminDeliveryVO;

public interface AdminDeliveryService {

	public List<AdminDeliveryVO> dmList(AdminDeliveryVO dvo);

	public int dm_ing(AdminDeliveryVO dvo);

	public List<AdminDeliveryVO> dmList2(AdminDeliveryVO dvo);

	public List<AdminDeliveryVO> dmList3(AdminDeliveryVO dvo);

	public int dm_end(AdminDeliveryVO dvo);

	public List<AdminDeliveryVO> dm_before_search(AdminDeliveryVO dvo);

	public List<AdminDeliveryVO> dm_ing_search(AdminDeliveryVO dvo);

	public List<AdminDeliveryVO> dm_end_search(AdminDeliveryVO dvo);



}
