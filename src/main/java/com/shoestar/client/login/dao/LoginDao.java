package com.shoestar.client.login.dao;

import com.shoestar.client.login.vo.LoginVO;

public interface LoginDao {
	
	public LoginVO userIdSelect(String mem_id);

	public LoginVO loginSelect(LoginVO lvo);

	public LoginVO find_id(String mem_email);

	public LoginVO find_pwd(String mem_id);

	



}
