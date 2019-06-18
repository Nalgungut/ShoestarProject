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
	
	// ���̺� ��üȭ�� ȣ��
	
	@Override
	public List<NoticeVO> adminNoticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;
		myList = noticeDao.adminNoticeList(nvo);
		return myList;
	}
	
	// �������� �󼼺���
	@Override
	public NoticeVO adminNoticeDetail(NoticeVO nvo) {
		log.info("noticeDetail ���� ȣ��");
		
		NoticeVO detail = null;
		detail = noticeDao.adminNoticeDetail(nvo);
		if(detail!=null){
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n","<br>"));
			
		}
		return detail;
	}

	// �������� �Է��ϱ�
	@Override
	public int noticeInsert(NoticeVO nvo) {
		int result = 0;
			result = noticeDao.noticeInsert(nvo);
		return result;
	}

	// �������� �����ϱ�
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

	// �������� �����ϱ�
	@Override
	public int noticeDelete(int no_no) {
		int result = 0;
		result = noticeDao.noticeDelete(no_no);
		return result;
	}

	// �������� �Խñ� ����
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
