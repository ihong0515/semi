package com.model.owner;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;

public class ImageZipControll {
	
	public boolean zipController(String zipPath, String zipFileName, String zipUnzipPath) throws IOException {
		// 파일 정상적으로 압축이 해제가 되어는가.
		boolean isChk = false;

		// zip 파일
		File zipFile = new File(zipPath + zipFileName);

		FileInputStream fis = null;
		ZipInputStream zis = null;
		ZipEntry zipentry = null;

		try {
			// zipFileName을 통해서 폴더 만들기
			if (makeFolder(zipUnzipPath)) {
				
			}

			// 파일 스트림
			fis = new FileInputStream(zipFile);

			// Zip 파일 스트림
			zis = new ZipInputStream(fis, Charset.forName("EUC-KR"));

			// 압축되어 있는 ZIP 파일의 목록 조회
			while ((zipentry = zis.getNextEntry()) != null) {
				String filename = zipentry.getName();
				
				File file = new File(zipUnzipPath, filename);

				// entiry가 폴더면 폴더 생성
				if (zipentry.isDirectory()) {
					
					file.mkdirs();
				} else {
					// 파일이면 파일 만들기
					
					try {
						createFile(file, zis);
					} catch (Throwable e) {
						e.printStackTrace();
					}
				}
			}
			isChk = true;
		} catch (Exception e) {
			isChk = false;
		} finally {
			if (zis != null) {
				try {
					zis.close();
				} catch (IOException e) {
				}
			}
			if (fis != null) {
				try {
					fis.close();
				} catch (IOException e) {
				}
			}
		}
		//압축 풀기 후 압집파일 삭제
		zipFile.delete();
		
		return isChk;
	}
	
	private boolean makeFolder(String folder) {
		if (folder.length() < 0) {
			return false;
		}

		String path = folder; // 폴더 경로
		File Folder = new File(path);

		// 해당 디렉토리가 없을경우 디렉토리를 생성합니다.
		if (!Folder.exists()) {
			try {
				Folder.mkdir(); // 폴더 생성합니다.
				
			} catch (Exception e) {
				e.getStackTrace();
			}
		} else {
			
		}
		return true;
	}
	
	private void createFile(File file, ZipInputStream zis) throws Throwable {
		// 디렉토리 확인
		File parentDir = new File(file.getParent());
		// 디렉토리가 없으면 생성하자
		if (!parentDir.exists()) {
			parentDir.mkdirs();
		}
		FileOutputStream fos = null;
		// 파일 스트림 선언
		try {

			fos = new FileOutputStream(file);
			byte[] buffer = new byte[256];
			int size = 0;
			// Zip스트림으로부터 byte뽑아내기
			while ((size = zis.read(buffer)) > 0) {
				// byte로 파일 만들기
				fos.write(buffer, 0, size);
			}
		} catch (Throwable e) {
			throw e;
		} finally {
			if (fos != null) {
				try {
					fos.close();
				} catch (IOException e) {
					throw e;
				}
			}
		}
	}
}
