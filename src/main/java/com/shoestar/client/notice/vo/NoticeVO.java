package com.shoestar.client.notice.vo;


import com.shoestar.admin.adminLogin.vo.AdminLoginVO;
import com.shoestar.client.brand.vo.CommonVO;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeVO extends CommonVO{
	// 공지사항 테이블
	private int no_no; // 공지사항 번호
	private String no_kind=""; // 공지사항 말머리(공지사항 종류)
	private String no_subject; // 공지사항 제목
	private String no_content; // 공지사항 내용
	private int adm_no; // 관리자 번호 (운석이형)
	private Date no_date; // 공지사항 작성일 
	
	private String adm_name;

}
