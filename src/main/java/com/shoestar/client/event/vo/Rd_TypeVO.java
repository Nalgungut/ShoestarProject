package com.shoestar.client.event.vo;

import com.shoestar.client.prod.vo.ProdVO;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Rd_TypeVO extends ProdVO {
	private int rd_no; // ���� ���� ��ȣ
	private int pct_no; // �Ź� ī�װ� ��ȣ
}
