package com.shoestar.admin.event.service;

import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface AdminEventService {
	public List<EventVO> eventList(EventVO evo);
}