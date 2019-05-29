package com.shoestar.client.event.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.common.file.FileUploadUtil;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class EventServiceImpl implements EventService {

	@Setter(onMethod_ = @Autowired)
	private EventDAO eventDao;
	
	@Override
	public String eventList(EventVO evo) {
		int result = 0;
		// ���� ���ε� �ΰ� ó�� ��� ? : ���� 1 : �����+���� ���� > �̺�Ʈ �����  || ���� 2 : ������ ���� > �̺�Ʈ �����̹���  
		if(evo.getFile() != null) {
			/*String fileName = FileUploadUtil.fileUpload(evo.getEv_file(), "event");
			evo.setEv_file(fileName);
			
			String*/
			
		}
		return "";
	}

}
