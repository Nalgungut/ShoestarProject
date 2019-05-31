package com.shoestar.client.prod.vo;

import com.shoestar.common.vo.CommonVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class ProdFilterVO extends CommonVO {
	// �˻��� ���� ���Ͱ�
	private int size;
	private int color;
	private int priceBottom;
	private int priceTop;
	
	// �˻� �� ǥ���� ������
	private String pct_name; // �з� �̸�
	private int pd_discount; // ������
}
