package com.shoestar.client.prod.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProdImageFilterVO {
	// ���� ���ε��
	private MultipartFile file;
	// ���� ���ε� �� ���� �̹����� ���� ������ ����
	private boolean updatePimMain;
}
