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
		
		
			//////////////////////[회원가입 폼 처리]////////////////////////
			@RequestMapping(value="/adminJoin", method = RequestMethod.GET)
			public String adminJoinForm(Model model){
				log.info("join get방식에 의한 메서드 호출 성공");
				return "admin/adminMember/adminJoin";
			}
			
	/*
	 * //회원수정 폼 (임시)
	 * 
	 * @RequestMapping(value="/modify", method = RequestMethod.GET) public String
	 * modifyForm(){ log.info("modify 호출 성공"); return "client/member/modify"; }
	 */
			
			
			
		/////////////////////[관리자 아이디 중복 체크 메서드]///////////////
			@ResponseBody
			@RequestMapping(value="/adminUserIdConfirm", method=RequestMethod.POST)
			public String  adminUserIdConfirm(@RequestParam("adm_id")String adm_id){
				int result = adminMemberService.adminUserIdConfirm(adm_id);
		
				return String.valueOf(result);
			}
			
		//////////////////////[관리자 가입 처리]//////////////////////////
			@RequestMapping(value="/adminJoin", method = RequestMethod.POST)
			public ModelAndView adminMemberInsert(@ModelAttribute AdminMemberVO mvo){
				
				log.info("admin join post방식에 의한 메서드 호출 성공");
				ModelAndView mavv = new ModelAndView();
				
				int result = 0;
				result = adminMemberService.adminMemberInsert(mvo);
			
			switch(result){
			case 1:
				mavv.addObject("codeNumber", 1); //관리자 아이디가 이미 존재함
				mavv.setViewName("admin/adminMember/adminJoin");
					break;
			case 3:
				mavv.addObject("codeNumber", 3);
				mavv.setViewName("admin/adminMember/adminJoin_success"); //새로운 관리자ID 추가시, 로그인페이지 이동
					break;
			default:
				mavv.addObject("codeNumber", 2); //맴버추가 실패
				mavv.setViewName("admin/adminMember/adminJoin");
					break;
			}
			return mavv;
		}
			
			///////////////////////[관리자 정보 수정폼]/////////////////////////////
			//@SessionAttribute 메소드에 @SessionAttribute가 있을경우 파라미터로 지정된 이름으로 등록된 세션정보를 읽어와서 변수에 할당한다
			@RequestMapping(value="/adminModify", method = RequestMethod.GET)
			public ModelAndView adminMemberModify(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("modify get 방식에 의한 메서드 호출 성공");
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
			
			//////////////////////[회원수정처리 AOP 예외 처리 전]/////////////////////////////
			@RequestMapping(value="/adminModify", method = RequestMethod.POST)
			public ModelAndView adminMemberModifyProcess(AdminMemberVO mvo, @SessionAttribute("adminLogin") AdminLoginVO adminLogin, ModelAndView mavv){
				log.info("modify post방식에 의한 메서드 호출 성공");
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
			
			/////////////////////[회원 탈퇴처리 AOP 예외 처리 전]/////////////////////////
			@RequestMapping("/adminDelete")
			public ModelAndView adminMemberDelete(@SessionAttribute("adminLogin") AdminLoginVO adminLogin){
				log.info("delete.do get방식에 의한 메서드 호출 성공");
				
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
			
			// 마이페이지 이동
			/*@RequestMapping(value = "/mypage")
			public String mypage() throws Exception{
				return "client/member/mypage";
			}*/
			
			
		
	}