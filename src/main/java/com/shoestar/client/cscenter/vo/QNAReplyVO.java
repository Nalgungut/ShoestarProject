package com.shoestar.client.cscenter.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class QNAReplyVO {
	private int qr_no = 0;
	private int qna_no = 0;
	private String qr_title = "";
	private String qr_content = "";
	private String qr_date = "";
	private int adm_no = 0;
	private int mem_no = 0;
}
