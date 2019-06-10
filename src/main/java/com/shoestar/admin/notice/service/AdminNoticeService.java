package com.shoestar.admin.notice.service;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface AdminNoticeService {
	
	public List<NoticeVO> adminNoticeList(NoticeVO nvo); // �Խ��� ��Ϻ����ֱ�
	
	public NoticeVO adminNoticeDetail(NoticeVO nvo); // ������â �����ֱ�
	
	public int noticeInsert(NoticeVO nvo);
	
	public int noticeUpdate(NoticeVO nvo);
	
	public int noticeDelete(int no_no);
	
	public int noticeListCnt(NoticeVO nvo);

	public NoticeVO updateForm(NoticeVO nvo);

}
