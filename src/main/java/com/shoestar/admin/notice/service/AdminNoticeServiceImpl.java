package com.shoestar.admin.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.admin.notice.dao.AdminNoticeDao;
import com.shoestar.client.brand.dao.NoticeReplyDao;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class AdminNoticeServiceImpl implements AdminNoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminNoticeDao noticeDao;
	
	@Setter(onMethod_ = @Autowired)
	private NoticeReplyDao replyDao;
	
	// 테이블 전체화면 호출
	
	@Override
	public List<NoticeVO> adminNoticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;
		myList = noticeDao.adminNoticeList(nvo);
		return myList;
	}
	
	// 공지사항 상세보기
	@Override
	public NoticeVO adminNoticeDetail(NoticeVO nvo) {
		log.info("noticeDetail 서비스 호출");
		
		NoticeVO detail = null;
		detail = noticeDao.adminNoticeDetail(nvo);
		if(detail!=null){
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n","<br>"));
			
		}
		return detail;
	}

	// 공지사항 입력하기
	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
			result = noticeDao.noticeInsert(nvo);
		return result;
	}

	// 공지사항 수정하기
	@Override
	public int noticeUpdate(NoticeVO nvo) {
		int result = 0;
		result = noticeDao.noticeUpdate(nvo);
		return result;
	}
	
	@Override
	public NoticeVO updateForm(NoticeVO nvo){
		NoticeVO detail = null;
		detail = noticeDao.adminNoticeDetail(nvo);
		return detail;
	}

	// 공지사항 수정하기
	@Override
	public int noticeDelete(int no_no) {
		int result = 0;
		result = noticeDao.noticeDelete(no_no);
		return result;
	}

	// 공지사항 게시글 세기
	@Override
	public int noticeListCnt(NoticeVO nvo) {
		return noticeDao.noticeListCnt(nvo);
	}

	@Override
	public int replyCnt(int no_no) {
		int result = 0;
		/*List<ReplyVO>list = replyDao.replyList(b_num);
		if(!list.isEmpty()) {
			result = list.size();
		}else {
			result = 0;
		}*/
		result = replyDao.replyCnt(no_no);
		return result;
	}


	




}
