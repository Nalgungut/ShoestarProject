package com.shoestar.client.login.service;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.login.dao.LoginDao;
import com.shoestar.client.login.vo.LoginVO;

import lombok.Setter;

@Service
public class LoginServiceImpl implements LoginService{
	
	@Setter(onMethod_=@Autowired)
	private LoginDao loginDao;
	
	@Override
	public LoginVO userIdSelect(String mem_id) {
		return loginDao.userIdSelect(mem_id);
	}

	@Override
	//로그인처리//
	public LoginVO loginSelect(String mem_id, String mem_pwd) {

		LoginVO lvo = new LoginVO();
		lvo.setMem_id(mem_id);
		lvo.setMem_pwd(mem_pwd);

		LoginVO vo = loginDao.loginSelect(lvo);
		return vo;
	}

	// 아이디 찾기
	@Override
	public String find_id(HttpServletResponse response, String mem_email) throws Exception {
	PrintWriter out = response.getWriter();
	String mem_id = loginDao.find_id(mem_email);
					
	if (mem_id == null) {
		out.println("<script>");
		out.println("alert('가입된 아이디가 없습니다.');");
		out.println("history.go(-1);");
		out.println("</script>");
		out.close();
			return null;
		} else {
			return mem_id;
		}
	}
		
}
