package com.shoestar.admin.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminFAQVO {
	private int faq_no = 0;
	private String faq_title = "";
	private String faq_content = "";
	
	private Date faq_date =null;
	private int fc_no = 0;
	private String fc_name = "";
}
