package com.shoestar.admin.event.service;

import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface AdminEventService {
	public List<EventVO> AdmineventList(EventVO evo);
	public int eventInsert(EventVO evo);
	public EventVO updateForm(EventVO evo);
	public int eventUpdate(EventVO evo);
	
	public int eventDelete(EventVO evo);
	
	public int AdmineventCnt(EventVO evo);
}
