package com.shoestar.admin.adminMember.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.admin.adminLogin.service.AdminLoginService;
import com.shoestar.admin.adminLogin.vo.AdminLoginVO;
import com.shoestar.admin.adminMember.service.AdminMemberService;
import com.shoestar.admin.adminMember.vo.AdminMemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/adminMember/*")
@Log4j
@AllArgsConstructor

	public class AdminMemberController{
		private AdminMemberService adminMemberService;
		private AdminLoginService adminLoginService;
		
		
			//////////////////////[ȸ������ �� ó��]////////////////////////
			@RequestMapping(value="/adminJoin", method = RequestMethod.GET)
			public String adminJoinForm(Model model){
				log.info("join get��Ŀ� ���� �޼��� ȣ�� ����");
				return "admin/adminMember/adminJoin";
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
				ModelAndView mavv = new ModelAndView();
				
				int result = 0;
				result = adminMemberService.adminMemberInsert(mvo);
			
			switch(result){
			case 1:
				mavv.addObject("codeNumber", 1); //������ ���̵� �̹� ������
				mavv.setViewName("admin/adminMember/adminJoin");
					break;
			case 3:
				mavv.addObject("codeNumber", 3);
				mavv.setViewName("admin/adminMember/adminJoin_success"); //���ο� ������ID �߰���, �α��������� �̵�
					break;
			default:
				mavv.addObject("codeNumber", 2); //�ɹ��߰� ����
				mavv.setViewName("admin/adminMember/adminJoin");
					break;
			}
			return mavv;
		}
			
			///////////////////////[������ ���� ������]/////////////////////////////
			//@SessionAttribute �޼ҵ忡 @SessionAttribute�� ������� �Ķ���ͷ� ������ �̸����� ��ϵ� ���������� �о�ͼ� ������ �Ҵ��Ѵ�
			@RequestMapping(value="/adminModify", method = RequestMethod.GET)
			public ModelAndView adminMemberModify(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("modify get ��Ŀ� ���� �޼��� ȣ�� ����");
				ModelAndView mavv = new ModelAndView();
				
				
				if(adminLogin==null){
					mavv.setViewName("admin/adminMember/adminLogin");
					return mavv;
				}
				
				AdminMemberVO vo = adminMemberService.adminMemberSelect(adminLogin.getAdm_id());
				mavv.addObject("adminMember", vo);
				mavv.setViewName("admin/adminMember/adminModify");
				return mavv;
			}
			
			//////////////////////[ȸ������ó�� AOP ���� ó�� ��]/////////////////////////////
			@RequestMapping(value="/adminModify", method = RequestMethod.POST)
			public ModelAndView adminMemberModifyProcess(AdminMemberVO mvo, @SessionAttribute("adminLogin") AdminLoginVO adminLogin, ModelAndView mavv){
				log.info("modify post��Ŀ� ���� �޼��� ȣ�� ����");
				log.info("mvo" + mvo);
				log.info("login" + adminLogin);
				if(adminLogin==null){ 
					mavv.setViewName("admin/adminMember/adminLogin");
					return mavv;
				}
				mvo.setAdm_id(adminLogin.getAdm_id());
				AdminMemberVO vo = adminMemberService.adminMemberSelect(mvo.getAdm_id());
				
				if(adminLoginService.adminLoginSelect(mvo.getAdm_id(), mvo.getAdm_oldUserPwd()) == null){
					mavv.addObject("codeNumber", 1);
					mavv.addObject("adminMember", vo);
					mavv.setViewName("admin/adminMember/adminModify");
					return mavv;
				}
				
				adminMemberService.adminMemberUpdate(mvo);
				mavv.setViewName("redirect:/adminMember/adminLogout");
				return mavv;
			}
			
			/////////////////////[ȸ�� Ż��ó�� AOP ���� ó�� ��]/////////////////////////
			@RequestMapping("/adminDelete")
			public ModelAndView adminMemberDelete(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("delete.do get��Ŀ� ���� �޼��� ȣ�� ����");
				
				ModelAndView mavv = new ModelAndView();
				
				if(adminLogin==null){
					mavv.setViewName("admin/adminMember/adminLogin");
					return mavv;
				}
				
				int errCode = adminMemberService.adminMemberDelete(adminLogin.getAdm_id());
				switch(errCode){
				case 2:
					
					mavv.setViewName("redirect:/adminMember/adminLogout");
						break;
				case 3:
					mavv.addObject("codeNumber", 3);
					mavv.setViewName("client/adminMember/adminLogin");
						break;
				}
				return mavv;
			}
			
			// ���������� �̵�
			/*@RequestMapping(value = "/mypage")
			public String mypage() throws Exception{
				return "client/member/mypage";
			}*/
			
			
		
	}