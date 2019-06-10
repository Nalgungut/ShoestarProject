package com.shoestar.admin.login.dao;

import com.shoestar.admin.login.vo.AdminLoginVO;

public interface AdminLoginDao {

	public AdminLoginVO adminLoginSelect(AdminLoginVO lvo);

	public AdminLoginVO adminUserIdSelect(String adm_id);
	


}
