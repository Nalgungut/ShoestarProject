package com.shoestar.client.orders.vo;

import lombok.Data;

@Data
public class OrdersInsVO {
	private int od_no;
	private int pi_no;
	private int oi_qty;
	private int oi_purchase; // 입고가
	private int oi_price;
	private int cp_no; // 적용 쿠폰
	private int rd_no; // 적용 할인
	private int ps_size;
	private int oi_no;
}
