package com.shoestar.admin.notice.dao;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface AdminNoticeDao {
	
	public List<NoticeVO> adminNoticeList(NoticeVO nvo); // �Խ��� ��Ϻ����ֱ�
	
	public NoticeVO adminNoticeDetail(NoticeVO nvo); // ������â �����ֱ�
	
	public int noticeInsert(NoticeVO nvo); // �Է��ϱ�
	
	public int noticeUpdate(NoticeVO nvo); // �����ϱ�
	 
	public int noticeDelete(int no_no); // �����ϱ�
	
	public int noticeListCnt(NoticeVO nvo); // �Խñ� ����

}
