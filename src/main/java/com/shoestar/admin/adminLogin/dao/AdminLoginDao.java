package com.shoestar.admin.adminLogin.dao;

import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

public interface AdminLoginDao {

	public AdminLoginVO adminLoginSelect(AdminLoginVO lvo);

	public AdminLoginVO adminUserIdSelect(String adm_id);
	


}
