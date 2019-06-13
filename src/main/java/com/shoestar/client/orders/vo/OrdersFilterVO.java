package com.shoestar.client.orders.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrdersFilterVO extends CommonVO {
	private int totalPrice;
	private int numberOfProds;
}
