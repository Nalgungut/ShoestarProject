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
			// 捞抚 积己
			real_name = System.currentTimeMillis() + "_" + org_name;
			String thumbRoot = DIR_ROOT + "thumb/";
			String extension = org_name.substring(org_name.lastIndexOf(".") + 1);
			
			// 叼泛配府 积己
			makeDir(DIR_ROOT);
			makeDir(thumbRoot);
			
			// 颇老 积己
			File fileAdd = new File(DIR_ROOT + real_name);
			file.transferTo(fileAdd);
			
			// 级匙老 积己
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
			log.info(fileName + " 颇老 昏力 咯何 : " + fileDelete.delete());
		}
		File thumbDelete = new File(thumb);
		if(thumbDelete.exists() && thumbDelete.isFile()) {
			log.info(fileName + " 级匙老 昏力 咯何 : " + thumbDelete.delete());
		}
	}
}