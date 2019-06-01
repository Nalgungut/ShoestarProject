package com.shoestar.client.prod.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

/**
 * Prod ī�װ� ���� VO
 * @author ������
 */
@Data
@EqualsAndHashCode(callSuper=false)
public class ProdCtgVO extends ProdCtgFilterVO {
	private int pct_no;
	private String pct_name;
}
