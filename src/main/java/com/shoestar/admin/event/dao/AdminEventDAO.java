package com.shoestar.admin.event.dao;


import java.util.List;

import com.shoestar.client.event.vo.EventVO;

public interface AdminEventDAO {
	public List<EventVO> eventList(EventVO evo); // �̺�Ʈ ����Ʈ (����� �̺�Ʈ�� �Ⱥ��δ�)
	public EventVO eventDetail(EventVO evo);	// �̺�Ʈ �� ����Ʈ (���� �̺�Ʈ ǥ��)
				   
	
	public List<EventVO> AdmineventList(EventVO evo); // ������ �̺�Ʈ ����Ʈ (����� �̺�Ʈ�� ǥ���Ѵ�.)
	public int eventUpdate(EventVO evo);
	public int eventInsert(EventVO evo);
	public int eventDelete(int ev_no);
}
