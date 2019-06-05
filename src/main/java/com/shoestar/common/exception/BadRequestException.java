package com.shoestar.common.exception;

import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.ResponseStatus;

/**
 * ��û�� �߸����� ��� ������ 400 ����
 * @author ������
 */
@ResponseStatus(value=HttpStatus.BAD_REQUEST)
public class BadRequestException extends RuntimeException {
	private static final long serialVersionUID = 8402159583774555884L;

	public BadRequestException() {
		super();
	}
	
	public BadRequestException(String msg) {
		super(msg);
	}
}
