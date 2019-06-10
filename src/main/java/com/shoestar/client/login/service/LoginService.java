package com.shoestar.client.login.service;



import javax.servlet.http.HttpServletResponse;

import com.shoestar.client.login.vo.LoginVO;

public interface LoginService {
	
	public LoginVO userIdSelect(String mem_id);

	public LoginVO loginSelect(String mem_id, String mem_pwd);

	public LoginVO find_id(HttpServletResponse response, String mem_email) throws Exception;

	public LoginVO find_pwd(HttpServletResponse response, String mem_id) throws Exception;

		
}
