package com.shoestar.client.brand.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class CollectionVO {
	// �÷��� ���̺� - �Ź��÷���
	private int co_no; // �÷��� ��ȣ
	private String co_name; // �÷��� ��
	private String co_feature; // �Ź� Ư¡
	private String co_function; // �Ź� ���
	private String co_year; // �÷��� ��ó⵵

}
