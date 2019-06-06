package com.shoestar.common.file;


import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

// 05 - 21
@Log4j
//1�� �̺�Ʈ �̹��� : ������ �տ� ���_ �ٿ��� ����
public class EventFileUploadUtil {
	// Update�� ���� ���� ���� �� �ٽ� ����
	
	/* ���� ���ε��� ���� ���� */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot);
		if(fileDir.exists()) { 
			return;
		}
		fileDir.mkdirs();
	}

	/* ���� ���ε� �޼��� */				
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload ȣ�� ����");
		
		String real_name = null;
		
		String org_name = file.getOriginalFilename(); 
		log.info("org_name : " + org_name);
		
		// ���ϸ� ����(�ߺ����� �ʱ�)
		if(org_name != null && (!org_name.equals(""))) {
						
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name;
			
			String docRoot = "C://shoestarStorage//" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name);
			log.info("���ε��� ����(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);
		}
		return real_name;
	}
	
	/* ���� ���� �޼��� */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete ȣ�� ����");
		boolean result = false;							
		String docRoot = "";
												
		String dirName = fileName.substring(0, fileName.indexOf("_"));

		docRoot = "C://shoestarStorage//" + dirName;
	
		
		File fileDelete = new File(docRoot + "/" + fileName);
		log.info("������ ����(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("���� ���� ����(true/false) : " + result);
	}
	
}
