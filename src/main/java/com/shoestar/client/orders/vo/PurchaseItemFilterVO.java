package com.shoestar.client.orders.vo;

import com.shoestar.client.prod.vo.ProdVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class PurchaseItemFilterVO extends ProdVO {
	private String mainImage;
	private String pcl_name;
}
