package com.shoestar.client.event.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class Coupon_InsVO {
	private int ci_no; // �������� ��ȣ
	private String ci_use; // ��� ����
	private int cp_no; // ���� ��ȣ
	private int mem_no; // ȸ�� ��ȣ
}
