package com.shoestar.client.orders.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CartVO extends PurchaseItemFilterVO {
	private int pi_no;
	private int mem_no;
	private int ps_size;
	private int cart_qty;
}
