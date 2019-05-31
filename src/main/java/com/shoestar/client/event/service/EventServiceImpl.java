package com.shoestar.client.event.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.client.event.vo.EventVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EventServiceImpl implements EventService {

	@Setter(onMethod_ = @Autowired)
	private EventDAO eventDao;

	@Setter(onMethod_ =@Autowired)
	private AdminEventDAO aEventDao;
	
	// �̺�Ʈ ��� ����
	@Override
	public List<EventVO> eventList(EventVO evo) {
		log.info("��� �ҷ�����");
		
		List<EventVO> list = null;
		

		list = aEventDao.eventList(evo);
		
		return list;
	
	}

	// �̺�Ʈ �� �� ����
	@Override
	public EventVO eventDetail(EventVO evo) {
		EventVO detail = new EventVO();
		detail = aEventDao.eventDetail(evo);
		
		return detail;
	}


}
