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
import com.shoestar.common.file.FileUploadUtil;

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

	// �̺�Ʈ �� �Է� ����
	
	@Override
	public int eventInsert(EventVO evo) {
		int result = 0;
		
		List<MultipartFile> list= evo.getFiles();
		
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
						String fileName1 = FileUploadUtil.fileUpload(evo.getFiles().get(i), "event");
						evo.setEv_img(fileName1);
					}
				} else if( i == 1 ) {
					if (list.get(i) != null) {
						String fileName2 = FileUploadUtil.fileUpload(evo.getFiles().get(i), "eventThumb");
						//evo.setEv_img(fileName2);
						evo.setEv_thumb(fileName2);
						
						String thumbName = FileUploadUtil.makeThumbnail(fileName2);
//						evo.setEv_thumb(thumbName);
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
	
	// â �̵��� �� ���ÿ� update
	@Override
	public EventVO updateForm(EventVO evo) {
		EventVO detail = null;
		detail = aEventDao.eventDetail(evo);
		return detail;
	}
	
	//�� ���� DAO ����
	@Override
	public int eventUpdate(EventVO evo) {
		int result = 0;
		
		List<MultipartFile> list= evo.getFiles();

		try {
						
			if(!list.isEmpty()) { // �� ��� ������
			
			// ����
			for(int i = 0; i <=1; i++) {
				if(i == 0) {
					if(list.get(i) != null ) {
						FileUploadUtil.fileDelete(evo.getEv_img());			
					}
				} else if( i == 1 ) {
					if (list.get(i) != null) {
						FileUploadUtil.fileDelete(evo.getEv_thumb());	
						// ������� ����� �̹��� �����ϱ� (��)
						FileUploadUtil.fileDelete("thumbnail_"+evo.getEv_thumb());
					}
				}
			} // for
			
			// �ٽ� �Է�
			for(int i = 0; i <=1; i++) {
				if(i == 0) {
						String fileName1 = FileUploadUtil.fileUpload(evo.getFiles().get(i), "event");
						evo.setEv_img(fileName1);
				} else if( i == 1 ) {
						String fileName2 = FileUploadUtil.fileUpload(evo.getFiles().get(i), "eventThumb");
						evo.setEv_thumb(fileName2);
						
						String thumbName = FileUploadUtil.makeThumbnail(fileName2);
				}
			} // for
			
		} else { // ������ �ƴϸ�
			log.info("÷������ ����");
			evo.setEv_img("");
			evo.setEv_thumb("");
		}
		
		result = aEventDao.eventUpdate(evo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// �� ���� 
	@Override
	public  int eventDelete(EventVO evo) {
		int result = 0;
		
		try {
			EventVO vo = aEventDao.eventDetail(evo);
			
			FileUploadUtil.fileDelete(vo.getEv_img());
			FileUploadUtil.fileDelete(vo.getEv_thumb());
			
			// ������� ����� �̹��� �����ϱ� (��)
			FileUploadUtil.fileDelete("thumbnail_"+vo.getEv_thumb());
			
			result = aEventDao.eventDelete(evo.getEv_no());
		}catch(Exception e) {
			e.printStackTrace();
			result = 0;
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
