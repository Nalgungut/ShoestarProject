package com.shoestar.client.notice.service;

import java.util.List;

import com.shoestar.client.notice.vo.NoticeVO;

public interface NoticeService {
	
	public List<NoticeVO> noticeList(NoticeVO nvo);
	
	public NoticeVO noticeDetail(NoticeVO nvo); // �� ��ȸ ����Ʈ

}
