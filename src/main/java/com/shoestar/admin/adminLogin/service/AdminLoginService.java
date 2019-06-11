package com.shoestar.admin.adminLogin.service;


import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

public interface AdminLoginService {

	public AdminLoginVO adminLoginSelect(String adm_id, String adm_pwd);

	public AdminLoginVO adminUserIdSelect(String adm_id);

	/*public AdminLoginVO find_adminId(HttpServletResponse response, String adm_email);

	public AdminLoginVO find_adminPwd(HttpServletResponse response, String adm_id);*/


	
	
}
