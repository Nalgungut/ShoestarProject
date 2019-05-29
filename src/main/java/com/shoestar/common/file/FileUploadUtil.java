package com.shoestar.common.file;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;

import org.imgscalr.Scalr;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j;

// 05 - 21
@Log4j
public class FileUploadUtil {
	// Update�� ���� ���� ���� �� �ٽ� ����
	
	/* ���� ���ε��� ���� ���� */
	public static void makeDir(String docRoot) {
		File fileDir = new File(docRoot); // ��� �޾ƿ��� �ν��Ͻ� ����
		if(fileDir.exists()) { // �����ϸ� 
			return; // ����
		}
		fileDir.mkdirs(); // mkdirs | + s : �� ���� ���� ��ε� ���� �����Ѵ�. 
	}
	
	/* ���� ���ε� �޼��� 
	 * ���ϸ��� �ߺ��� �ذ� ���
	 * System.currentTimeMillis()�� ����ϰų� UUID�� 128��Ʈ�� ���̴�.
	 * ǥ�� ���Ŀ��� UUID�� 32���� 16������ ǥ���Ǹ� �� 36�� ����(32�� ���ڿ� 4���� ������)�� 
	 * �� 8-4-4-4-12��� 5���� �׷��� ���������� �����Ѵ�. �̸��׸� ������ ����. 
	 * �̶� UUID.randomUUID().toString()�� �̿��ؼ� ��´�.
	 * 50e8400-e29b-41d4-a716-446655440000
	 */
	
	/* ���� ���ε� �޼��� */				// �� ������ ������ �������ִ�
	public static String fileUpload(MultipartFile file, String fileName) throws IOException {
		log.info("fileUpload ȣ�� ����");
		
		String real_name = null;
		// MultipartFile Ŭ������ getFile() �޼���� Ŭ���̾�Ʈ�� ���ε��� ����
		String org_name = file.getOriginalFilename(); // ���ε�Ǵ� ������ �̸�
		log.info("org_name : " + org_name);
		
		// ���ϸ� ����(�ߺ����� �ʱ�)
		if(org_name != null && (!org_name.equals(""))) {
						// ������_���� �ð�_������������ϸ�
			real_name = fileName + "_" + System.currentTimeMillis() + "_" + org_name; // ��
			
			String docRoot = "C://uploadStorage//" + fileName;
			makeDir(docRoot);
			
			File fileAdd = new File(docRoot + "/" + real_name); // ���� ������
			log.info("���ε��� ����(fileAdd) : " + fileAdd);
			
			file.transferTo(fileAdd);// ������ġ�� ���������� ��������ִ� �޼ҵ�
		}
		return real_name;
	}
	
	/* ���� ���� �޼��� */
	public static void fileDelete(String fileName) throws IOException{
		log.info("fileDelete ȣ�� ����");
		boolean result = false;							
		String startDirName = "", docRoot = "";
												// ù��° ��ġ�� _�� �ڸ���.
		String dirName = fileName.substring(0, fileName.indexOf("_")); // ������
		/*String docRoot = "C://uploadStorage//" + dirName;*/
		
		if(dirName.equals("thumbnail")) {
			startDirName = fileName.substring(
					dirName.length()+1, fileName.indexOf("_", dirName.length()+1));
			docRoot = "C://uploadStorage//" + startDirName + "//" + dirName;
		} else {
			docRoot = "C://uploadStorage//" + dirName;
		}
		
		File fileDelete = new File(docRoot + "/" + fileName); // ���� ������
		log.info("������ ����(fileDelete) : " + fileDelete);
		if(fileDelete.exists() && fileDelete.isFile()) {
			result = fileDelete.delete();
		}
		log.info("���� ���� ����(true/false) : " + result);
	}
	
	
	/* ���� Thumbnail ���� �޼��� */
	public static String makeThumbnail(String fileName) throws Exception{
		String dirName = fileName.substring(0, fileName.indexOf("_"));
		// �̹����� �����ϴ� ���� ����
		String imgPath = "C://uploadStorage//" + dirName;
		// ����� ������ ���� ���(������ ��ġ: C:\...)
		File fileAdd = new File(imgPath, fileName);
		log.info("���� �̹��� ����(fileAdd) : " + fileAdd);
		
		// ��
		BufferedImage sourceImg = ImageIO.read(fileAdd); 
		// ������ ����
		BufferedImage destImg 
		= Scalr.resize(sourceImg, Scalr.Method.AUTOMATIC, Scalr.Mode.FIT_TO_HEIGHT,200);
		// 		resize(���[BufferedImage Ÿ��], ��������,			���� �Ǵ� �ʺ�,			ũ��)
	
		String thumbnailName = "thumbnail_" + fileName; // �տ� thumbnail_
		String docRoot = imgPath+"/thumbnail"; // C://uploadStorage//������/thumbnail
		makeDir(docRoot);
		
		// ������� �����ϱ� ���� ���� ��ü
		File newFile = new File(docRoot, thumbnailName);
		log.info("���ε��� ����(newFile) : " + newFile);
		
		String formatName = fileName.substring(fileName.lastIndexOf(".")+1); // Ȯ���ڱ��� ���ؿ�
		log.info("Ȯ����(formatName) : " + formatName);
		
		// ���
		ImageIO.write(destImg, formatName, newFile); // ������, Ȯ����, ��� ��ġ�� ����
		return thumbnailName; // ���� �̸� return 
		
	}
}
