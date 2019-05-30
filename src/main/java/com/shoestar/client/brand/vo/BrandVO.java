package com.shoestar.client.brand.vo;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class BrandVO {
	
	// �귣�� ���̺� (��� ���̺�)
	private int ar_no; // ����ȣ
	private String ar_subject; // �������
	private String ar_content; // ��系��
	private String ar_file; // ������(���ϸ�)

}
