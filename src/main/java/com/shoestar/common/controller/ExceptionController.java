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
 * ���� ó���� ���� ��Ʈ�ѷ�
 */
@ControllerAdvice
@Log4j
public class ExceptionController {
	
	/**
	 * �������� ã�� �� ���� ���
	 */
	@ResponseStatus(value=HttpStatus.NOT_FOUND)
	@ExceptionHandler(value={NoHandlerFoundException.class, ResourceNotFoundException.class})
	public String pageNotFound(HttpServletRequest request, Model model) {
		log.info("�ּҸ� ã�� �� �����ϴ�. ��û �� �ּ� : " + request.getRequestURL());
		
		model.addAttribute("errorCode", "404");
		
		return "client/exception/error";
	}
	
	/**
	 * db ���� �۾����� ������ �߻��� ���
	 */
	@ExceptionHandler(value=
		{SQLException.class, DataAccessException.class, MyBatisSystemException.class})
	public String dbError(HttpServletRequest request, Model model, Exception e) {
		model.addAttribute("errorCode", "db");

		e.printStackTrace();
		
		return "client/exception/error";
	}
	
	/**
	 * �α��� ���� ������ �߻��� ���
	 */
	@ExceptionHandler(value={RequiresLoginException.class})
	public String loginError(HttpServletRequest request, Model model) {
		model.addAttribute("errorCode", "login");
		
		return "client/exception/error";
	}
	
	/**
	 * ������ �α����� �ʿ��� ���
	 */
	@ExceptionHandler(value={RequiresAdminLogin.class})
	public String adminLogin() {
		return "admin/adminMember/adminLogin";
	}
	
	/**
	 * ��Ÿ ���� ĳġ
	 */
	@ExceptionHandler(value={Exception.class})
	public String allErrors(HttpServletRequest request, Model model, Exception e) {
		model.addAttribute("errorCode", "other");

		e.printStackTrace();
		
		return "client/exception/error";
	}
}
