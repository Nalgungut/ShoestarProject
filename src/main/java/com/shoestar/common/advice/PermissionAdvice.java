package com.shoestar.common.advice;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.shoestar.client.login.vo.LoginVO;
import com.shoestar.common.exception.RequiresLoginException;

@Component
@Aspect
public class PermissionAdvice {
	
	/**
	 * 로그인 처리
	 */
	@Around(value="execution(* com.shoestar..*Controller.*(..,com.shoestar.client.login.vo.LoginVO,..))"
			+ "&& !execution(* com.shoestar.client.login.controller.LoginController.loginInsert(..))"
			+ "&& !@annotation(org.springframework.web.bind.annotation.ResponseBody)")
	public Object requireLogin(ProceedingJoinPoint pjp) throws Throwable {
		LoginVO lvo = null;
		for (Object obj : pjp.getArgs()) {
			if(obj instanceof LoginVO) {
				lvo = (LoginVO) obj;
				break;
			}
		}
		
		if(lvo == null || lvo.getMem_no() == 0) {
			throw new RequiresLoginException();
		} else {
			return pjp.proceed();
		}
	}

	@Around(value="execution(java.lang.String com.shoestar..*Controller.*(..,com.shoestar.client.login.vo.LoginVO,..))"
			+ "&& @annotation(org.springframework.web.bind.annotation.ResponseBody)")
	public Object requireLoginResponseBody(ProceedingJoinPoint pjp) throws Throwable {
		LoginVO lvo = null;
		for (Object obj : pjp.getArgs()) {
			if(obj instanceof LoginVO) {
				lvo = (LoginVO) obj;
				break;
			}
		}
		
		if(lvo == null || lvo.getMem_no() == 0) {
			return "login";
		} else {
			return pjp.proceed();
		}
	}
}