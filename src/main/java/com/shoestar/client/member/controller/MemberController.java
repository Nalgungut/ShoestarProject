package com.shoestar.client.member.controller;



import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.shoestar.client.login.service.LoginService;
import com.shoestar.client.login.vo.LoginVO;
import com.shoestar.client.member.service.MemberService;
import com.shoestar.client.member.vo.MemberVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping(value="/member/*")
@Log4j
@AllArgsConstructor

	public class MemberController{
		private MemberService memberService;
		private LoginService loginService;
		
		
			//////////////////////[ȸ������ �� ó��]////////////////////////
			@RequestMapping(value="/join", method = RequestMethod.GET)
			public String joinForm(Model model){
				log.info("join get��Ŀ� ���� �޼��� ȣ�� ����");
				return "client/member/join";
			}
			
	/*
	 * //ȸ������ �� (�ӽ�)
	 * 
	 * @RequestMapping(value="/modify", method = RequestMethod.GET) public String
	 * modifyForm(){ log.info("modify ȣ�� ����"); return "client/member/modify"; }
	 */
			
			
			
			/////////////////////[����� ���̵� �ߺ� üũ �޼���]///////////////
			@ResponseBody
			@RequestMapping(value="/userIdConfirm", method=RequestMethod.POST)
			public String  userIdConfirm(@RequestParam("mem_id")String mem_id){
				int result = memberService.userIdConfirm(mem_id);
		
				return String.valueOf(result);
			}
			
			//////////////////////[ȸ������ ó��]//////////////////////////
			@RequestMapping(value="/join", method = RequestMethod.POST)
			public ModelAndView memberInsert(@ModelAttribute MemberVO mvo){
				
				log.info("join post��Ŀ� ���� �޼��� ȣ�� ����");
				ModelAndView mav = new ModelAndView();
				
			int result = 0;
			result = memberService.memberInsert(mvo);
			
			switch(result){
			case 1:
					mav.addObject("codeNumber", 1); //���� ���̵� �̹� ������
					mav.setViewName("client/member/join");
					break;
			case 3:
					mav.addObject("codeNumber", 3);
					mav.setViewName("client/member/join_success"); //���ο� �ɹ� �߰���, �α��������� �̵�
					break;
			default:
					mav.addObject("codeNumber", 2); //�ɹ��߰� ����
					mav.setViewName("client/member/join");
					break;
			}
			return mav;
		}
			
			///////////////////////[ȸ�� ������]/////////////////////////////
			//@SessionAttribute �޼ҵ忡 @SessionAttribute�� ������� �Ķ���ͷ� ������ �̸����� ��ϵ� ���������� �о�ͼ� ������ �Ҵ��Ѵ�
			@RequestMapping(value="/modify", method = RequestMethod.GET)
			public ModelAndView memberModify(@SessionAttribute("login") LoginVO login){
				log.info("modify get ��Ŀ� ���� �޼��� ȣ�� ����");
				ModelAndView mav = new ModelAndView();
				
				
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				
				MemberVO vo = memberService.memberSelect(login.getMem_id());
				mav.addObject("member", vo);
				mav.setViewName("client/member/modify");
				return mav;
			}
			
			//////////////////////[ȸ������ó�� AOP ���� ó�� ��]/////////////////////////////
			@RequestMapping(value="/modify", method = RequestMethod.POST)
			public ModelAndView memberModifyProcess(MemberVO mvo, @SessionAttribute("login") LoginVO login, ModelAndView mav){
				log.info("modify post��Ŀ� ���� �޼��� ȣ�� ����");
				log.info("mvo" + mvo);
				log.info("login" + login);
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				mvo.setMem_id(login.getMem_id());
				MemberVO vo = memberService.memberSelect(mvo.getMem_id());
				
				if(loginService.loginSelect(mvo.getMem_id(), mvo.getOldUserPwd()) == null){
					mav.addObject("codeNumber", 1);
					mav.addObject("member", vo);
					mav.setViewName("client/member/modify");
					return mav;
				}
				
				memberService.memberUpdate(mvo);
				mav.setViewName("redirect:/member/logout");
				return mav;
			}
			
			/////////////////////[ȸ�� Ż��ó�� AOP ���� ó�� ��]/////////////////////////
			@RequestMapping("/delete")
			public ModelAndView memberDelete(@SessionAttribute("login") LoginVO login){
				log.info("delete.do get��Ŀ� ���� �޼��� ȣ�� ����");
				
				ModelAndView mav = new ModelAndView();
				
				if(login==null){
					mav.setViewName("client/member/login");
					return mav;
				}
				
				int errCode = memberService.memberDelete(login.getMem_id());
				switch(errCode){
				case 2:
						mav.setViewName("redirect:/member/logout");
						break;
				case 3:
						mav.addObject("codeNumber", 3);
						mav.setViewName("client/member/login");
						break;
				}
				return mav;
			}
			
			// ���������� �̵�
			@RequestMapping(value = "/mypage")
			public String mypage() throws Exception{
				return "client/member/mypage";
			}
			
			
		
	}