package com.shoestar.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.imgscalr.Scalr.Method;
import org.imgscalr.Scalr.Mode;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

@Log4j
public class FileUploadForProd extends FileUploadUtil {
	private static final String DIR_ROOT = "c:/shoestarStorage/prod/";
	
	
	public static String fileUpload(MultipartFile file) throws IOException {
		String real_name = null;
		String org_name = file.getOriginalFilename();
		
		if(org_name != null && (!org_name.equals(""))) {
			// �̸� ����
			real_name = System.currentTimeMillis() + "_" + org_name;
			String thumbRoot = DIR_ROOT + "thumb/";
			String extension = org_name.substring(org_name.lastIndexOf(".") + 1);
			
			// ���丮 ����
			makeDir(DIR_ROOT);
			makeDir(thumbRoot);
			
			// ���� ����
			File fileAdd = new File(DIR_ROOT + real_name);
			file.transferTo(fileAdd);
			
			// ������ ����
			File thumbAdd = new File(thumbRoot + real_name);
			BufferedImage image = ImageIO.read(fileAdd);
			BufferedImage thumb = Scalr.resize(image, Method.AUTOMATIC, Mode.FIT_TO_HEIGHT, 150);
			ImageIO.write(thumb, extension, thumbAdd);
		}
		
		return real_name;
	}
	
	public static void fileDelete(String fileName) throws IOException {
		String file = DIR_ROOT + fileName;
		String thumb = DIR_ROOT + "thumb/" + fileName;
		
		File fileDelete = new File(file);
		if(fileDelete.exists() && fileDelete.isFile()) {
			log.info(fileName + " ���� ���� ���� : " + fileDelete.delete());
		}
		File thumbDelete = new File(thumb);
		if(thumbDelete.exists() && thumbDelete.isFile()) {
			log.info(fileName + " ������ ���� ���� : " + thumbDelete.delete());
		}
	}
}