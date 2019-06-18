package com.shoestar.client.orders.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrdersFilterVO extends CommonVO {
	// ���� �ʵ尪
	private int totalPriceOrg;
	private int totalPrice;
	private int numberOfProds;
	private String mem_name;
	
	
	// �˻��� ����
	private String dateBegin;
	private String dateEnd;
}
