package com.shoestar.admin.event.service;

//import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.forwardedUrl;

//import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

//import com.fasterxml.jackson.core.JsonProcessingException;
//import com.fasterxml.jackson.databind.ObjectMapper;
import com.shoestar.admin.event.dao.AdminEventDAO;
import com.shoestar.client.event.vo.EventVO;
import com.shoestar.common.file.EventFileUploadUtil;
import com.shoestar.common.file.EventThumbUploadUtil;


import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Service
@Log4j
@AllArgsConstructor
public class AdminEventServiceImpl implements AdminEventService {

	@Setter(onMethod_ = @Autowired)
	private AdminEventDAO aEventDao;
	
	// �̺�Ʈ ��� ����
	@Override
	public List<EventVO> AdmineventList(EventVO evo) {
		log.info("��� �ҷ�����");
		
		List<EventVO> list = null;
		

		list = aEventDao.AdmineventList(evo);
		
		return list;
	
	}
	//�� ���� DAO ����
	@Override
	public int eventUpdate(EventVO evo) {
			int result = 0;
			result = aEventDao.eventUpdate(evo);
			return result;
		
	}
	
	// �̺�Ʈ �� �Է� ����
	
	@Override
	public int eventInsert(EventVO evo) {
		int result = 0;
		
		List<MultipartFile> list= evo.getFile();
		
		/*
		 * 1���� ���� �̹��� : ������ �տ� ���_ �ٿ��� ����
		 * 2���� ����� �̹��� : ���� + ����� �̹��� ���� 
		 */
		
		try {
			
		// ���� ó��
		// ���� ���ε� �ΰ� ó�� ��� 
		//   get(0) ev_img : ������ ���� > �̺�Ʈ �����̹���   get(1) ev_thumb : �����+���� ���� > �̺�Ʈ �����
		if(!list.isEmpty()) { // �� ��� ������
		
			log.info("������� ����");
			
			for(int i = 0; i <=1; i++) {
				if(i == 0) {
					if(list.get(i) != null ) {
						String fileName1 = EventFileUploadUtil.fileUpload(evo.getFile().get(i), "eventImage");
						evo.setEv_img(fileName1);
					}
				} else if( i == 1 ) {
					if (list.get(i) != null) {
						String fileName2 = EventThumbUploadUtil.fileUpload(evo.getFile().get(i), "eventThumb");
						evo.setEv_thumb(fileName2);
					}
				}
			} // for
		}
		
		result = aEventDao.eventInsert(evo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	// 
	@Override
	public int AdmineventCnt(EventVO evo) {
		// TODO Auto-generated method stub
		return 0;
	}



}
