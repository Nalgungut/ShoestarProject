package com.shoestar.admin.adminLogin.controller;



import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.admin.adminLogin.service.AdminLoginService;
import com.shoestar.admin.adminLogin.vo.AdminLoginVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;


@Controller
@SessionAttributes("adminLogin")
@RequestMapping("/adminMember/*")
@Log4j
@AllArgsConstructor

public class AdminLoginController {
	private AdminLoginService adminLoginService;
	
	@ModelAttribute("adminLogin") //@SessionAttributes와 @ModelAttribute 같은값인 경우 클라이언트로 전송받은 값을 설정한다
	
	public AdminLoginVO adminLogin(){
		return new AdminLoginVO();
	}
	
	//////////////////////[로그인 폼 처리]////////////////////////
	@RequestMapping(value="/adminLogin", method = RequestMethod.GET)
	public String adminLoginForm(){
		log.info("adminLogin 호출 성공");
		return "admin/adminMember/adminLogin";
	} 
	

	/////////////////////[로그인 처리 (실패 횟수 제한 X)]//////////////////////////
	@RequestMapping(value="/adminLogin", method = RequestMethod.POST)
	public ModelAndView adminLoginInsert(@ModelAttribute AdminLoginVO lvo, ModelAndView mav){
		log.info("adminLogin post 호출 성공");
		
		String adm_id = lvo.getAdm_id();
		String adm_pwd = lvo.getAdm_pwd();
		log.info(adm_id + " / " + adm_pwd);
		AdminLoginVO adminLoginCheckResult = adminLoginService.adminLoginSelect(adm_id, adm_pwd);
		
		//입력받은 아이디와 비밀번호로 DB확인 시, 일치 데이터가 존재하지 않으면
		if(adminLoginCheckResult == null){
			mav.addObject("codeNumber", 1); //없을시 '1'
			mav.setViewName("admin/adminMember/adminLogin");
			return mav;
		}else{ //일치할 시
			mav.addObject("adminLogin", adminLoginCheckResult);
			log.info("adminLoginCheckResult"+adminLoginCheckResult);
			mav.setViewName("admin/adminMember/adminLogin_success");
			return mav;
		}
	}
	
	///////////////////////[로그아웃 처리]///////////////////////////////////////
	@RequestMapping("/adminLogout")
	public String adminLogout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
			return "redirect:/";
	}
	
		/*/////////////////// [아이디 찾기 폼]////////////////////////////
		@RequestMapping(value = "/find_adminId_form")
		public String find_adminId(HttpServletResponse response, String adm_email) throws Exception{
			return "admin/adminMember/find_adminId_form";
		}
		
		///////////////////// [비밀번호 찾기 폼]///////////////////////////
		@RequestMapping(value = "/find_adminPwd_form")
		public String find_adminPwd() throws Exception{
		return "admin/adminMember/find_adminPwd_form";
		}
		
		// 아이디 찾기
		@RequestMapping(value = "/find_id", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String adm_email, Model md) throws Exception{
			AdminLoginVO vvo = adminLoginService.find_adminId(response, adm_email);
			md.addAttribute("mem_id", vvo.getAdm_id());
			return "client/member/find_id";
		}
		
		// 비밀번호
		@RequestMapping(value = "/find_pwd", method = RequestMethod.POST)
		public String find_pwd(HttpServletResponse response, @RequestParam("mem_id") String adm_id, Model md) throws Exception{
			AdminLoginVO vvo = adminLoginService.find_adminPwd(response, adm_id);
			md.addAttribute("mem_pwd", vvo.getAdm_pwd());
			return "client/member/find_pwd";
		}*/
	
}
