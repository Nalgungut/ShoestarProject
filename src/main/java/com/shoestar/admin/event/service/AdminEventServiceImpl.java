package com.shoestar.admin.event.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

//import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoestar.client.event.dao.EventDAO;
import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.client.event.vo.EventVO;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminEventServiceImpl implements AdminEventService {

	@Setter(onMethod_ =@Autowired)
	private AdminEventDAO aEventDao;
	
	// �̺�Ʈ ��� ����
	@Override
	public List<EventVO> AdmineventList(EventVO evo) {
		log.info("��� �ҷ�����");
		
		List<EventVO> list = null;
		

		list = aEventDao.AdmineventList(evo);
		
		return list;
	
	}
	
	// �̺�Ʈ �� �Է� ����
	/*
	@Override
	public String eventInsert(EventVO evo) {
		String result = "";
		
		List<MultipartFile> list= evo.getFile();
		
		
		try {
			
		// ���� ó��
		// ���� ���ε� �ΰ� ó�� ��� 
		//   get(0) ev_img : ������ ���� > �̺�Ʈ �����̹���  || get(1) ev_thumb : �����+���� ���� > �̺�Ʈ �����
		if(!list.isEmpty()) { // �� ��� ������
		
			log.info("������� ����");
			
			int z = 0;
			int o = 1;
			
			if(list.get(z) != null ) {
				String fileName1 = FileUploadUtil.fileUpload(evo.getFile().get(z), "eventImage");
				evo.setEv_img(fileName1);
			} else if (list.get(o) != null) {
				String fileName2 = FileUploadUtil.fileUpload(evo.getFile().get(o), "eventThumb");
				evo.setEv_thumb(fileName2);
			}

		}
		
		result = eventDao.eventList(evo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}*/



}
