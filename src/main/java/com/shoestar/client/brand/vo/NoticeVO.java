package com.shoestar.client.brand.vo;

import java.sql.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeVO {
	// �������� ���̺�
	private int no_no; // �������� ��ȣ
	private String no_kind; // �������� ���Ӹ�(�������� ����)
	private String no_subject; // �������� ����
	private String no_content; // �������� ����
	/*private int adm_no; // ������ ��ȣ (�����)*/
	private Date no_date; // �������� �ۼ��� 

}
