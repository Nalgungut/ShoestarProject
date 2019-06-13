package com.shoestar.client.prod.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProdImageFilterVO {
	// 파일 업로드용
	private MultipartFile file;
	// 파일 업로드 시 메인 이미지로 만들 것인지 여부
	private boolean updatePimMain;
}
