package com.shoestar.admin.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminOsVO {
	private int mem_no = 0;
	private String mem_name = "";
	private int oi_no = 0;
	private int os_qty = 0;
	private String pd_name = "";
	private Date od_date = null;
	private int od_no = 0;
	private String qna_ctgr = "";	
	private int os_no = 0;
	private String os_status = "";
}
