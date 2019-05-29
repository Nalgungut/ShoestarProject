package com.shoestar.client.login.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.client.login.service.LoginService;
import com.shoestar.client.login.vo.LoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@SessionAttributes("login")
@RequestMapping("/member/*")
@Log4j
@AllArgsConstructor

public class LoginController {
	private LoginService loginService;
	
	@ModelAttribute("login") //@SessionAttributes�� @ModelAttribute �������� ��� Ŭ���̾�Ʈ�� ���۹��� ���� �����Ѵ�
	public LoginVO login(){
		return new LoginVO();
	}
	
	//////////////////////[�α��� �� ó��]////////////////////////
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginForm(){
		log.info("login ȣ�� ����");
		return "member/login";
	}
	
	/////////////////////[�α��� ó�� (���� Ƚ�� ���� X)]//////////////////////////
	@RequestMapping(value="login", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav){
		log.info("login.do post ȣ�� ����");
		
		String mem_id = lvo.getMem_id();
		String mem_pwd = lvo.getMem_pwd();
		LoginVO loginCheckResult = loginService.loginSelect(mem_id, mem_pwd);
		
		//�Է¹��� ���̵�� ��й�ȣ�� DBȮ�� ��, ��ġ �����Ͱ� �������� ������
		if(loginCheckResult == null){
			mav.addObject("codeNumber", 1); //������ '1'
			mav.setViewName("member/login");
			return mav;
		}else{ //��ġ�� ��
			mav.addObject("login", loginCheckResult);
			mav.setViewName("member/login");
			return mav;
		}
	}
	
	///////////////////////[�α׾ƿ� ó��]///////////////////////////////////////
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
			return "redirect:/";
	}
	

}
