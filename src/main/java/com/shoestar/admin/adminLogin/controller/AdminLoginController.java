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
	
	@ModelAttribute("adminLogin") //@SessionAttributes�� @ModelAttribute �������� ��� Ŭ���̾�Ʈ�� ���۹��� ���� �����Ѵ�
	
	public AdminLoginVO adminLogin(){
		return new AdminLoginVO();
	}
	
	//////////////////////[�α��� �� ó��]////////////////////////
	@RequestMapping(value="/adminLogin", method = RequestMethod.GET)
	public String adminLoginForm(){
		log.info("adminLogin ȣ�� ����");
		return "admin/adminMember/adminLogin";
	} 
	

	/////////////////////[�α��� ó�� (���� Ƚ�� ���� X)]//////////////////////////
	@RequestMapping(value="/adminLogin", method = RequestMethod.POST)
	public ModelAndView adminLoginInsert(@ModelAttribute AdminLoginVO lvo, ModelAndView mav){
		log.info("adminLogin post ȣ�� ����");
		
		String adm_id = lvo.getAdm_id();
		String adm_pwd = lvo.getAdm_pwd();
		log.info(adm_id + " / " + adm_pwd);
		AdminLoginVO adminLoginCheckResult = adminLoginService.adminLoginSelect(adm_id, adm_pwd);
		
		//�Է¹��� ���̵�� ��й�ȣ�� DBȮ�� ��, ��ġ �����Ͱ� �������� ������
		if(adminLoginCheckResult == null){
			mav.addObject("codeNumber", 1); //������ '1'
			mav.setViewName("admin/adminMember/adminLogin");
			return mav;
		}else{ //��ġ�� ��
			mav.addObject("adminLogin", adminLoginCheckResult);
			log.info("adminLoginCheckResult"+adminLoginCheckResult);
			mav.setViewName("admin/adminMember/adminLogin_success");
			return mav;
		}
	}
	
	///////////////////////[�α׾ƿ� ó��]///////////////////////////////////////
	@RequestMapping("/adminLogout")
	public String adminLogout(SessionStatus sessionStatus){
		sessionStatus.setComplete();
			return "redirect:/";
	}
	
		/*/////////////////// [���̵� ã�� ��]////////////////////////////
		@RequestMapping(value = "/find_adminId_form")
		public String find_adminId(HttpServletResponse response, String adm_email) throws Exception{
			return "admin/adminMember/find_adminId_form";
		}
		
		///////////////////// [��й�ȣ ã�� ��]///////////////////////////
		@RequestMapping(value = "/find_adminPwd_form")
		public String find_adminPwd() throws Exception{
		return "admin/adminMember/find_adminPwd_form";
		}
		
		// ���̵� ã��
		@RequestMapping(value = "/find_id", method = RequestMethod.POST)
		public String find_id(HttpServletResponse response, @RequestParam("email") String adm_email, Model md) throws Exception{
			AdminLoginVO vvo = adminLoginService.find_adminId(response, adm_email);
			md.addAttribute("mem_id", vvo.getAdm_id());
			return "client/member/find_id";
		}
		
		// ��й�ȣ
		@RequestMapping(value = "/find_pwd", method = RequestMethod.POST)
		public String find_pwd(HttpServletResponse response, @RequestParam("mem_id") String adm_id, Model md) throws Exception{
			AdminLoginVO vvo = adminLoginService.find_adminPwd(response, adm_id);
			md.addAttribute("mem_pwd", vvo.getAdm_pwd());
			return "client/member/find_pwd";
		}*/
	
}
