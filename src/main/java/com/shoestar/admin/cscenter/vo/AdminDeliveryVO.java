package com.shoestar.admin.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class AdminDeliveryVO {
	private int dm_no = 0;			//��۹�ȣpk
	private int od_no = 0;			//�ֹ���ȣfk
	private String dm_name = ""; 	//�ù��̸�
	private String dm_number = "";	//������ȣ
	private String dm_status = "";	//��ۻ���
	private String dm_addr = "";	//������ּ�
	private Date od_date = null;
	private String mem_name = "";	//�ֹ����̸�
	private String pd_name = "";	//��ǰ�̸�
	
	private int odno = 0;
	
	private int dm_before = 0;		//����غ��� ī��Ʈ
	private int dm_ing = 0;			//����� ī��Ʈ
	private int dm_end = 0;			//��ۿϷ� ī��Ʈ
}
