package com.shoestar.common.file;


import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

// 05 - 21
@Log4j
//1번 이벤트 이미지 : 원본만 앞에 경로_ 붙여서 저장
public class EventFileUploadUtil {
	// Update는 기존 파일 삭제 후 다시 생성
	
	/* 파일 업로드할 폴더 생성 */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) { 
			return;
		}
		fileDir.mkdirs();
	}

	/* 파일 업로드 메서드 */				
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload 호출 성공");
		
		String real_name = null;
		
		String org_name = file.getOriginalFilename(); 
		log.info("org_name : " + org_name);
		
		// 파일명 변경(중복되지 않기)
		if(org_name != null && (!org_name.equals(""))) {
						
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			String docRoot = "C://shoestarStorage//" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("업로드할 파일(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/* 파일 삭제 메서드 */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete 호출 성공");
		boolean result = false;							
		String docRoot = "";
												
		String dirName = fileName.substring(0, fileName.indexOf("_"));

		docRoot = "C://shoestarStorage//" + dirName;
	
		
		File fileDelete = new File(docRoot + "/" + fileName);
		log.info("삭제할 파일(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("파일 삭제 여부(true/false) : " + result);
	}
	
}
