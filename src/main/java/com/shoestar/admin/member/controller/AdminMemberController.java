package com.shoestar.admin.member.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.admin.login.service.AdminLoginService;
import com.shoestar.admin.login.vo.AdminLoginVO;
import com.shoestar.admin.member.service.AdminMemberService;
import com.shoestar.admin.member.vo.AdminMemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/member/*")
@Log4j
@AllArgsConstructor

	public class AdminMemberController{
		private AdminMemberService adminMemberService;
		private AdminLoginService adminLoginService;
		
		
			//////////////////////[ȸ������ �� ó��]////////////////////////
			@RequestMapping(value="/adminJoin", method = RequestMethod.GET)
			public String adminJoinForm(Model model){
				log.info("join get��Ŀ� ���� �޼��� ȣ�� ����");
				return "admin/member/adminJoin";
			}
			
	/*
	 * //ȸ������ �� (�ӽ�)
	 * 
	 * @RequestMapping(value="/modify", method = RequestMethod.GET) public String
	 * modifyForm(){ log.info("modify ȣ�� ����"); return "client/member/modify"; }
	 */
			
			
			
		/////////////////////[������ ���̵� �ߺ� üũ �޼���]///////////////
			@ResponseBody
			@RequestMapping(value="/adminUserIdConfirm", method=RequestMethod.POST)
			public String  adminUserIdConfirm(@RequestParam("adm_id")String adm_id){
				int result = adminMemberService.adminUserIdConfirm(adm_id);
		
				return String.valueOf(result);
			}
			
		//////////////////////[������ ���� ó��]//////////////////////////
			@RequestMapping(value="/adminJoin", method = RequestMethod.POST)
			public ModelAndView adminMemberInsert(@ModelAttribute AdminMemberVO mvo){
				
				log.info("admin join post��Ŀ� ���� �޼��� ȣ�� ����");
				ModelAndView mav = new ModelAndView();
				
				int result = 0;
				result = adminMemberService.adminMemberInsert(mvo);
			
			switch(result){
			case 1:
					mav.addObject("codeNumber", 1); //������ ���̵� �̹� ������
					mav.setViewName("admin/member/adminJoin");
					break;
			case 3:
					mav.addObject("codeNumber", 3);
					mav.setViewName("admin/member/adminJoin_success"); //���ο� ������ID �߰���, �α��������� �̵�
					break;
			default:
					mav.addObject("codeNumber", 2); //�ɹ��߰� ����
					mav.setViewName("admin/member/adminJoin");
					break;
			}
			return mav;
		}
			
			///////////////////////[������ ���� ������]/////////////////////////////
			//@SessionAttribute �޼ҵ忡 @SessionAttribute�� ������� �Ķ���ͷ� ������ �̸����� ��ϵ� ���������� �о�ͼ� ������ �Ҵ��Ѵ�
			@RequestMapping(value="/adminModify", method = RequestMethod.GET)
			public ModelAndView adminMemberModify(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("modify get ��Ŀ� ���� �޼��� ȣ�� ����");
				ModelAndView mav = new ModelAndView();
				
				
				if(adminLogin==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				
				AdminMemberVO vo = adminMemberService.adminMemberSelect(adminLogin.getAdm_id());
				mav.addObject("adminMember", vo);
				mav.setViewName("admin/member/adminModify");
				return mav;
			}
			
			//////////////////////[ȸ������ó�� AOP ���� ó�� ��]/////////////////////////////
			@RequestMapping(value="/modify", method = RequestMethod.POST)
			public ModelAndView adminMemberModifyProcess(AdminMemberVO mvo, @SessionAttribute("adminLogin") AdminLoginVO adminLogin, ModelAndView mav){
				log.info("modify post��Ŀ� ���� �޼��� ȣ�� ����");
				log.info("mvo" + mvo);
				log.info("login" + adminLogin);
				if(adminLogin==null){ 
					mav.setViewName("admin/member/adminLogin");
					return mav;
				}
				mvo.setAdm_id(adminLogin.getAdm_id());
				AdminMemberVO vo = adminMemberService.adminMemberSelect(mvo.getAdm_id());
				
				if(adminLoginService.adminLoginSelect(mvo.getAdm_id(), mvo.getAdm_oldUserPwd()) == null){
					mav.addObject("codeNumber", 1);
					mav.addObject("adminMember", vo);
					mav.setViewName("admin/member/adminModify");
					return mav;
				}
				
				adminMemberService.adminMemberUpdate(mvo);
				mav.setViewName("redirect:/member/logout");
				return mav;
			}
			
			/////////////////////[ȸ�� Ż��ó�� AOP ���� ó�� ��]/////////////////////////
			@RequestMapping("/delete")
			public ModelAndView adminMemberDelete(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("delete.do get��Ŀ� ���� �޼��� ȣ�� ����");
				
				ModelAndView mav = new ModelAndView();
				
				if(adminLogin==null){
					mav.setViewName("admin/member/adminLogin");
					return mav;
				}
				
				int errCode = adminMemberService.adminMemberDelete(adminLogin.getAdm_id());
				switch(errCode){
				case 2:
					
						mav.setViewName("redirect:/member/adminLogout");
						break;
				case 3:
						mav.addObject("codeNumber", 3);
						mav.setViewName("client/member/adminLogin");
						break;
				}
				return mav;
			}
			
			// ���������� �̵�
			/*@RequestMapping(value = "/mypage")
			public String mypage() throws Exception{
				return "client/member/mypage";
			}*/
			
			
		
	}