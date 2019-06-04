package com.shoestar.client.brand.vo;



import java.util.Date;

import com.shoestar.client.notice.vo.NoticeVO;

import lombok.Data;
import lombok.EqualsAndHashCode;
import com.shoestar.client.member.vo.MemberVO;
@Data
@EqualsAndHashCode(callSuper=false)

public class NoticeReplyVO {
	private int re_no; // ��� ��ȣ
	private MemberVO mem_no; // ȸ����ȣ(����)
	private String re_content; // ��� ����
	private Date re_date; // ��� �ۼ���
	private NoticeVO no_no; // �������׹�ȣ - NoticeVO
}
