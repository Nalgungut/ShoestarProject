package com.shoestar.admin.cscenter.vo;

import lombok.Data;

@Data
public class AdminDeliveryVO {
	private int dm_no = 0;			//��۹�ȣpk
	private int od_no = 0;			//�ֹ���ȣfk
	private String dm_name = ""; 	//�ù��̸�
	private String dm_number = "";	//������ȣ
	private String dm_status = "";	//��ۻ���
	private String dm_addr = "";	//������ּ�
	
	private String mem_name = "";	//�ֹ����̸�
	private String pd_name = "";	//��ǰ�̸�;
}