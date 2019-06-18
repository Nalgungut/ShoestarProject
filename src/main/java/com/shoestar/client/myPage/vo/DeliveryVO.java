package com.shoestar.client.myPage.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	private int dm_no = 0;			//배송번호
	private String mem_name = "";	//주문자
	private int od_no = 0;			//주문번호
	private String dm_name = "";	//택배사이름
	private String dm_number = ""; 	//운송장번호
	private String pd_name = ""; 	//상품이름
	private Date od_date = null;	//주문날짜
	private String dm_status = "";	//택배상태
	private int mem_no = 0;			//회원번호
}
