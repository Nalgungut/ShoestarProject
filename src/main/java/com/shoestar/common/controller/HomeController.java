package com.shoestar.common.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.shoestar.client.login.vo.LoginVO;

import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@Log4j
public class HomeController {
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		return "client/home";
	}
	
	/**
	 * �� login ������ �����ϰų�
	 * ���� ��Ű�� ���� �ڵ� �α��� ����� �߰��ϴ� ��Ʈ�ѷ�
	 */
	@RequestMapping(value = "/checkLogin", method={RequestMethod.POST})
	@ResponseBody
	public String checkLogin(HttpServletRequest request) {
		boolean result = true;
		
		try {
			Object obj = request.getSession().getAttribute("login");
			if(obj == null) {
				LoginVO lvo = new LoginVO();
				request.getSession().setAttribute("login", lvo);
			}
		} catch (Exception e) {
			log.error(e.getMessage());
			result = false;
		}
		
		return String.valueOf(result);
	}
}
