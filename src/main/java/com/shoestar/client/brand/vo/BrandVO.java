package com.shoestar.client.brand.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper=false)

public class BrandVO {
	
	// �귣�� ���̺� (��� ���̺�)
	private int ar_no; // ����ȣ
	private String ar_subject; // �������
	private String ar_content; // ��系��
	private String ar_file; // ������(���ϸ�)
	private MultipartFile file;

}
