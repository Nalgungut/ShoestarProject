package com.shoestar.common.controller;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;

import org.mybatis.spring.MyBatisSystemException;
import org.springframework.dao.DataAccessException;
import org.springframework.http.HttpStatus;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.NoHandlerFoundException;

import com.shoestar.common.exception.RequiresAdminLogin;
import com.shoestar.common.exception.RequiresLoginException;
import com.shoestar.common.exception.ResourceNotFoundException;

import lombok.extern.log4j.Log4j;

/**
 * 예외 처리를 위한 컨트롤러
 */
@ControllerAdvice
@Log4j
public class ExceptionController {
	
	/**
	 * 페이지를 찾을 수 없는 경우
	 */
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ExceptionHandler(value={NoHandlerFoundException.class, ResourceNotFoundException.class})
	public String pageNotFound(HttpServletRequest request, Model model) {
		log.info("주소를 찾을 수 없습니다. 요청 된 주소 : " + request.getRequestURL());
		
		model.addAttribute("errorCode", "404");
		
		return "client/exception/error";
	}
	
	/**
	 * db 관련 작업으로 에러가 발생할 경우
	 */
	@ExceptionHandler(value=
		{SQLException.class, DataAccessException.class, MyBatisSystemException.class})
	public String dbError(HttpServletRequest request, Model model, Exception e) {
		model.addAttribute("errorCode", "db");

		e.printStackTrace();
		
		return "client/exception/error";
	}
	
	/**
	 * 로그인 관련 에러가 발생할 경우
	 */
	@ExceptionHandler(value={RequiresLoginException.class})
	public String loginError(HttpServletRequest request, Model model) {
		model.addAttribute("errorCode", "login");
		
		return "client/exception/error";
	}
	
	/**
	 * 관리자 로그인이 필요한 경우
	 */
	@ExceptionHandler(value={RequiresAdminLogin.class})
	public String adminLogin() {
		return "admin/adminMember/adminLogin";
	}
	
	/**
	 * 기타 에러 캐치
	 */
	@ExceptionHandler(value={Exception.class})
	public String allErrors(HttpServletRequest request, Model model, Exception e) {
		model.addAttribute("errorCode", "other");

		e.printStackTrace();
		
		return "client/exception/error";
	}
}
