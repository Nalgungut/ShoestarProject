package com.shoestar.client.orders.vo;

import java.util.Date;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class OrdersVO extends CommonVO {
	private int od_no;
	private int mem_no;
	private Date od_date;
	private String od_prog;
}
