package com.shoestar.client.myPage.vo;

import java.util.Date;

import lombok.Data;

@Data
public class DeliveryVO {
	private int dm_no = 0;			//��۹�ȣ
	private String mem_name = "";	//�ֹ���
	private int od_no = 0;			//�ֹ���ȣ
	private String dm_name = "";	//�ù���̸�
	private String dm_number = ""; 	//������ȣ
	private String pd_name = ""; 	//��ǰ�̸�
	private Date od_date = null;	//�ֹ���¥
	private String dm_status = "";	//�ù����
	private int mem_no = 0;			//ȸ����ȣ
}
