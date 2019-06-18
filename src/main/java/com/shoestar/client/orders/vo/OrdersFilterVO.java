package com.shoestar.client.orders.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrdersFilterVO extends CommonVO {
	// 조인 필드값
	private int totalPriceOrg;
	private int totalPrice;
	private int numberOfProds;
	private String mem_name;
	
	
	// 검색용 필터
	private String dateBegin;
	private String dateEnd;
}
