package com.shoestar.admin.cscenter.vo;

import lombok.Data;

@Data
public class AdminDeliveryVO {
	private int dm_no = 0;			//배송번호pk
	private int od_no = 0;			//주문번호fk
	private String dm_name = ""; 	//택배이름
	private String dm_number = "";	//운송장번호
	private String dm_status = "";	//배송상태
	private String dm_addr = "";	//배송지주소
	
	private String mem_name = "";	//주문자이름
	private String pd_name = "";	//물품이름
	
	private int dm_before = 0;		//배송준비중 카운트
	private int dm_ing = 0;			//배송중 카운트
	private int dm_end = 0;			//배송완료 카운트
}
