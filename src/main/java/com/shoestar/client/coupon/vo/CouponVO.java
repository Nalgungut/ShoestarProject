package com.shoestar.client.coupon.vo;

import java.sql.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class CouponVO {
	private int cp_no; // ���� ��ȣ
	private String cp_title; // ���� ����
	private String cp_content; // ���� ����
	private int cp_discount; // ���� ����
	private Date cp_date; // ���� �����
	private Date cp_edate; // ���� ������
	private int ev_no; // �̺�Ʈ ��ȣ
}
