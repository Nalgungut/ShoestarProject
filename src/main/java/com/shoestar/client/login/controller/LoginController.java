package com.shoestar.client.login.controller;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	@ModelAttribute("login") //@SessionAttributes와 @ModelAttribute 같은값인 경우 클라이언트로 전송받은 값을 설정한다
	public LoginVO login(){
		return new LoginVO();
	}
	
	//////////////////////[로그인 폼 처리]////////////////////////
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String loginForm(){
		log.info("login 호출 성공");
		return "client/member/login";
	} 
	

	
	/////////////////////[로그인 처리 (실패 횟수 제한 X)]//////////////////////////
	@RequestMapping(value="/login", method = RequestMethod.POST)
	public ModelAndView loginInsert(@ModelAttribute LoginVO lvo, ModelAndView mav){
		log.info("login post 호출 성공");
		String mem_id = lvo.getMem_id();
		String mem_pwd = lvo.getMem_pwd();
		log.info(mem_id + " / " + mem_pwd);
		LoginVO loginCheckResult = loginService.loginSelect(mem_id, mem_pwd);
		
		//입력받은 아이디와 비밀번호로 DB확인 시, 일치 데이터가 존재하지 않으면
		if(loginCheckResult == null){
			mav.addObject("codeNumber", 1); //없을시 '1'
			mav.setViewName("client/member/login");
			return mav;
		}else{ //일치할 시
			mav.addObject("login", loginCheckResult);
			log.info("loginCheckResult"+loginCheckResult);
			mav.setViewName("client/member/login_success");
			return mav;
		}
	}
	
	@RequestMapping(value="loginPostNaver", method=RequestMethod.GET)
	public String loginPOSTNaver(HttpSession session) {
		
		return "client/member/loginPostNaver";
	}

	
	///////////////////////[로그아웃 처리]///////////////////////////////////////
	@RequestMapping("/logout")
	public String logout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
			return "redirect:/";
	}
	
		/////////////////// [아이디 찾기 폼]////////////////////////////
		@RequestMapping(value = "/find_id_form")
		public String find_id(HttpServletResponse response, String mem_email) throws Exception{
			return "client/member/find_id_form";
		}
		
		///////////////////// [비밀번호 찾기 폼]///////////////////////////
		@RequestMapping(value = "/find_pwd_form")
		public String find_pwd() {
		return "client/member/find_pwd_form";
		}
		
		// 아이디 찾기
		@RequestMapping(value = "/find_id", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String mem_email, Model md) throws Exception{
			LoginVO vo = loginService.find_id(response, mem_email);
			md.addAttribute("mem_id", vo.getMem_id());
			return "client/member/find_id";
		}
		
		// 비밀번호
		
		@RequestMapping(value = "/find_pwd", method = RequestMethod.POST)
		public String find_pwd(String mem_id, String mem_email, String mem_name, Model model) {
			LoginVO lvo = new LoginVO();
			lvo.setMem_id(mem_id);
			lvo.setMem_email(mem_email);
			lvo.setMem_name(mem_name);
			LoginVO vo2 = loginService.find_pwd(lvo);
			model.addAttribute("mem_pwd", vo2.getMem_pwd());
			return "client/member/find_pwd";
		}
	
}
