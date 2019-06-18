package com.shoestar.client.notice.vo;


import com.shoestar.admin.adminLogin.vo.AdminLoginVO;
import com.shoestar.client.brand.vo.CommonVO;
import java.util.Date;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeVO extends CommonVO{
	// �������� ���̺�
	private int no_no; // �������� ��ȣ
	private String no_kind=""; // �������� ���Ӹ�(�������� ����)
	private String no_subject; // �������� ����
	private String no_content; // �������� ����
	private int adm_no; // ������ ��ȣ (�����)
	private Date no_date; // �������� �ۼ��� 
	
	private String adm_name;

}
