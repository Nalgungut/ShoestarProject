package com.shoestar.client.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Orders_statusVO {
	private int os_no = 0;	//처리번호
	private String os_status = "";//처리상태
	private Date os_date = null;	//처리발생일
	private int od_no = 0;	//주문번호
	private String mem_name = "";	//주문자
	private int oi_qty = 0;			//수량
	private String pd_name = "";	//상품명
	private int od_qty = 0;			//수량
}
