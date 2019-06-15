package com.shoestar.admin.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminQNAVO {
	private int mem_no = 0;
	private int od_no = 0;
	private int qna_no = 0;
	private String mem_name = "";
	private String qna_title = "";
	private String qna_content = "";
	private String qna_state = "";
	private String qna_ctgr = "";
	private Date qna_date = null;
	
	private int qna_all = 0;		//전체 1:1답변글 수
	private int qna_hold = 0;		//답변대기 1:1답변글 수
	private int qna_cancel = 0;		//취소문의 1:1 답변글 수
	private int qna_exchange = 0;	//교환문의 1:1 답변글 수
	private int qna_return = 0;		//반품문의 1:1 답변글 수
}
