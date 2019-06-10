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
	
	// 이벤트 목록 구현
	@Override
	public List<EventVO> AdmineventList(EventVO evo) {
		log.info("목록 불러오기");
		
		List<EventVO> list = null;
		

		list = aEventDao.AdmineventList(evo);
		
		return list;
	
	}

	// 이벤트 글 입력 구현
	
	@Override
	public int eventInsert(EventVO evo) {
		int result = 0;
		
		List<MultipartFile> list= evo.getFiles();
		
		/*
		 * 1번은 광고 이미지 : 원본만 앞에 경로_ 붙여서 저장
		 * 2번은 썸네일 이미지 : 원본 + 썸네일 이미지 저장 
		 */
		
		try {
			
		// 다중 처리
		// 사진 업로드 두개 처리 방법 
		//   get(0) ev_img : 원본만 저장 > 이벤트 내용이미지   get(1) ev_thumb : 썸네일+원본 저장 > 이벤트 썸네일
		if(!list.isEmpty()) { // 안 비어 있으면
		
			log.info("비어있지 않음");
			
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
	
	// 창 이동시 값 세팅용 update
	@Override
	public EventVO updateForm(EventVO evo) {
		EventVO detail = null;
		detail = aEventDao.eventDetail(evo);
		return detail;
	}
	
	//글 수정 DAO 접속
	@Override
	public int eventUpdate(EventVO evo) {
		int result = 0;
		
		List<MultipartFile> list= evo.getFiles();

		try {
						
			if(!list.isEmpty()) { // 안 비어 있으면
			
			// 삭제
			for(int i = 0; i <=1; i++) {
				if(i == 0) {
					if(list.get(i) != null ) {
						FileUploadUtil.fileDelete(evo.getEv_img());			
					}
				} else if( i == 1 ) {
					if (list.get(i) != null) {
						FileUploadUtil.fileDelete(evo.getEv_thumb());	
						// 썸네일의 썸네일 이미지 삭제하기 (완)
						FileUploadUtil.fileDelete("thumbnail_"+evo.getEv_thumb());
					}
				}
			} // for
			
			// 다시 입력
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
			
		} else { // 변경이 아니면
			log.info("첨부파일 없음");
			evo.setEv_img("");
			evo.setEv_thumb("");
		}
		
		result = aEventDao.eventUpdate(evo);
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
		
	}
	
	// 글 삭제 
	@Override
	public  int eventDelete(EventVO evo) {
		int result = 0;
		
		try {
			EventVO vo = aEventDao.eventDetail(evo);
			
			FileUploadUtil.fileDelete(vo.getEv_img());
			FileUploadUtil.fileDelete(vo.getEv_thumb());
			
			// 썸네일의 썸네일 이미지 삭제하기 (완)
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
