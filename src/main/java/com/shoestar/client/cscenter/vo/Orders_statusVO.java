package com.shoestar.client.cscenter.vo;

import java.util.Date;

import lombok.Data;

@Data
public class Orders_statusVO {
	private int os_no = 0;	//ó����ȣ
	private String os_status = "";//ó������
	private Date os_date = null;	//ó���߻���
	private int od_no = 0;	//�ֹ���ȣ
	private String mem_name = "";	//�ֹ���
	private int oi_qty = 0;			//����
	private String pd_name = "";	//��ǰ��
	private int od_qty = 0;			//����
}
