package com.shoestar.client.range_discount.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Range_DiscountVO {
	private int ev_no;	// �̺�Ʈ ��ȣ
	private int rd_no; // ���� ���� ��ȣ
	private int rd_title; // ���� ���� ����
	private String rd_content; // ���� ���� ����
	private int rd_discount; // ���� ���� (100 ���ϴ� %, 1000�̻��� ��)

	
}
