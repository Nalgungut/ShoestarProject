package com.shoestar.admin.adminLogin.service;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.adminLogin.dao.AdminLoginDao;
import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

import lombok.Setter;

@Service
public class AdminLoginServiceImpl implements AdminLoginService{
	
	@Setter(onMethod_=@Autowired)
	private AdminLoginDao adminLoginDao;
	
	@Override
	public AdminLoginVO adminUserIdSelect(String adm_id) {
		return adminLoginDao.adminUserIdSelect(adm_id);
	}

	@Override
	//로그인처리//
	public AdminLoginVO adminLoginSelect(String mem_id, String mem_pwd) {

		AdminLoginVO lvo = new AdminLoginVO();
		lvo.setAdm_id(mem_id);
		lvo.setAdm_pwd(mem_pwd);

		AdminLoginVO vo = adminLoginDao.adminLoginSelect(lvo);
		return vo;
	}

	/*@Override
	public AdminLoginVO find_adminId(HttpServletResponse response, String adm_email) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		LoginVO mem_id = loginDao.find_id(mem_email);
		
		if (mem_id == null) {
			out.println("<script>");
			out.println("alert('가입된 이메일이 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return mem_id;
		}
	}
	
	@Override
	public LoginVO find_pwd(HttpServletResponse response, String mem_id) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		PrintWriter out = response.getWriter();
		LoginVO mem_pwd = loginDao.find_pwd(mem_id);
		
		if (mem_pwd == null) {
			out.println("<script>");
			out.println("alert('가입된 아이디가 없습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
			return null;
		} else {
			return mem_pwd;
		}
	}*/
	
	

		
}
