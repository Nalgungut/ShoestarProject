package com.shoestar.client.orders.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrdersInsVO extends PurchaseItemFilterVO {
	private int od_no;
	private int pi_no;
	private int oi_qty;
	private int oi_org_price; // �԰�
	private int oi_price;
	private int cp_no; // ���� ����
	private int rd_no; // ���� ����
	private int ps_size;
	private int oi_no;
}
