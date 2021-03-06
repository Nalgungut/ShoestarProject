package com.shoestar.admin.event.dao;


import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface AdminEventDAO {
	public List<EventVO> eventList(EventVO evo); // 이벤트 리스트 (만료된 이벤트는 안보인다)
	public EventVO eventDetail(EventVO evo);	// 이벤트 상세 리스트 (상세한 이벤트 표시)
				   
	
	public List<EventVO> AdmineventList(EventVO evo); // 관리자 이벤트 리스트 (만료된 이벤트도 표시한다.)
	public int eventUpdate(EventVO evo);
	public int eventInsert(EventVO evo);
	public int eventDelete(int ev_no);
	
	public int AdmineventCnt(EventVO evo);
}
