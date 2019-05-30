package com.shoestar.common.vo;

import lombok.Data;

@Data
public class CommonVO {
	/** ������ ��ȣ */
	private int pageNum;
	/** �� ���������� ������ ���ڵ� �� */
	private int amount;
	/** �˻� �ܾ� */
	private String keyword;
	/** �˻� Ÿ�� */
	private String search;
	
	/** �⺻ ������. ������ ��ȣ�� ���ڵ� ���� ���� 1, 20���� �ڵ� �����ȴ�. */
	public CommonVO() {
		this.pageNum = 1;
		this.amount = 20;
	}
	
	/**
	 * ������ ��ȣ�� ������ ���ڵ� ���� �����ϴ� ������
	 * @param pageNum ������ ��ȣ
	 * @param amount ������ ���ڵ� ��
	 */
	public CommonVO(int pageNum, int amount) {
		this.pageNum = pageNum;
		this.amount = amount;
	}
}
