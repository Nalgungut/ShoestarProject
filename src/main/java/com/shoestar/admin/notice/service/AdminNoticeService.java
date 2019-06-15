package com.shoestar.admin.notice.service;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface AdminNoticeService {
	
	public List<NoticeVO> adminNoticeList(NoticeVO nvo); // 공지사항 목록보여주기
	
	public NoticeVO adminNoticeDetail(NoticeVO nvo); // 상세정보창 보여주기
	
	public int noticeInsert(NoticeVO nvo); // 공지사항 입력
	
	public int noticeUpdate(NoticeVO nvo);
	
	public int noticeDelete(int no_no);
	
	public int noticeListCnt(NoticeVO nvo);

	public NoticeVO updateForm(NoticeVO nvo);
	
	public int replyCnt(int no_no);

}
