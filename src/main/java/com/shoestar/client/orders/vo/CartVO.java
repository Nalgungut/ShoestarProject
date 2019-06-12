package com.shoestar.client.orders.vo;

import com.shoestar.client.prod.vo.ProdVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CartVO extends ProdVO {
	private int pi_no;
	private int mem_no;
	private int ps_size;
	private int cart_qty;
}
