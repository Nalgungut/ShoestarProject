package com.shoestar.client.brand.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@EqualsAndHashCode(callSuper=false)

public class BrandVO {
	
	// 브랜드 테이블 (기사 테이블)
	private int ar_no; // 기사번호
	private String ar_subject; // 기사제목
	private String ar_content; // 기사내용
	private String ar_file; // 기사사진(파일명)
	private MultipartFile file;

}
