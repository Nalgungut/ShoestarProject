package com.shoestar.client.event.vo;


import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.EqualsAndHashCode;

@Data
@EqualsAndHashCode(callSuper=false)
public class EventVO {
	private int ev_no; // �̺�Ʈ ��ȣ
	private String ev_title; // �̺�Ʈ ����
	private String ev_content; // �̺�Ʈ ����
	private List<MultipartFile> file; // ������ �ϳ� �̻��϶��� �迭 �Ǵ� list�� 
	private String ev_img; // �̺�Ʈ �̹���
	private String ev_thumb; // �̺�Ʈ �����
	private Date ev_date; // �̺�Ʈ �����
	private Date ev_edate; // �̺�Ʈ ������
	
	
	
}
