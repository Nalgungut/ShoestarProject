package com.shoestar.common.exception;

public class RequiresLoginException extends RuntimeException {
	private static final long serialVersionUID = -7075316498502022782L;
	
	public RequiresLoginException() {
		super("�α����� �ʿ��մϴ�.");
	}
	
	public RequiresLoginException(String msg) {
		super(msg);
	}
}
