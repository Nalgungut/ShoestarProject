package com.shoestar.client.orders.vo;

import lombok.Data;

@Data
public class OrdersInsVO {
	private int od_no;
	private int pi_no;
	private int oi_qty;
	private int oi_purchase; // �԰�
	private int oi_price;
	private int cp_no; // ���� ����
	private int rd_no; // ���� ����
	private int ps_size;
	private int oi_no;
}
