package com.shoestar.client.notice.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.notice.dao.NoticeDao;
import com.shoestar.client.notice.vo.NoticeVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor

public class NoticeServiceImpl implements NoticeService {
	
	@Setter(onMethod_ = @Autowired)
	private NoticeDao noticeDao;
	
	
	// ���̺� ��üȭ�� ȣ��
	
	@Override
	public List<NoticeVO> noticeList(NoticeVO nvo) {
		List<NoticeVO> myList = null;
		myList = noticeDao.noticeList(nvo);
		return myList;
	}
	
	
	@Override
	public NoticeVO noticeDetail(NoticeVO nvo) {
		log.info("noticeDetail ���� ȣ��");
		
		NoticeVO detail = null;
		detail = noticeDao.noticeDetail(nvo);
		if(detail!=null){
			detail.setNo_content(detail.getNo_content().toString().replaceAll("\n","<br>"));
			
		}
		return detail;
	}


	




}
