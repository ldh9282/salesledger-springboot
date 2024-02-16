package com.iyf.salesledger.common.file;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class UploadUtils {


	@Value("${upload-dir}")
    private String uploadDir;
    
	/***
	 * @기능 파일업로드. 업로드 경로는 application.properties 의 upload-dir
	 * @param file
	 * @param subDir upload-dir 이후 하위 폴더 경로 /{subDir}/
	 * @return HttpStatus
	 */
    public ResponseEntity<Map<String, Object>> uploadFile(MultipartFile file, String subDir) {
    	Map<String, Object> resultMap = new HashMap<>();
    	
    	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: uploadDir ::: " + uploadDir);}
    	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file.getOriginalFilename ::: " + file.getOriginalFilename());}
    	
        if (file.isEmpty()) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file.isEmpty");}
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(resultMap); // File is empty, upload failed
        }

        try {
            // 디렉토리 없으면 생성
            File directory = new File(uploadDir + subDir);
            if (!directory.exists()) {
                if (directory.mkdirs()) {
                    if (log.isInfoEnabled()) {log.info("Directory created: " + directory.getAbsolutePath());}
                } else {
                    if (log.isInfoEnabled()) {log.info("Failed to create directory: " + directory.getAbsolutePath());}
                }
            }
            
            String uploadedFilePath = getUniqueFileName(subDir + file.getOriginalFilename());
            
            file.transferTo(new File(uploadDir + uploadedFilePath));
            resultMap.put("file_name", file.getOriginalFilename());
            resultMap.put("file_path", uploadedFilePath);
            if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file_name ::: " + resultMap.get("file_name"));}
            if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file_path ::: " + resultMap.get("file_path"));}
            return ResponseEntity.status(HttpStatus.OK).body(resultMap); // File uploaded successfully
        } catch (IOException e) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: IOException ::: " + e);}
            e.printStackTrace();
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(resultMap); // File upload failed
        } catch (Exception e) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: Exception ::: " + e);}
        	e.printStackTrace();
        	return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body(resultMap); // File upload failed
		}
    }
    
    /***
     * @기능 파일명으로 파일다운로드. 업로드 경로는 application.properties 의 upload-dir
     * @param fileName
     * @return Resource
     * @throws IOException
     */
    public Resource downloadFile(String fileName) throws IOException {
    	if (log.isInfoEnabled()) {log.info("UploadUtils.downloadFile ::: uploadDir ::: " + uploadDir);}
    	if (log.isInfoEnabled()) {log.info("UploadUtils.downloadFile ::: fileName ::: " + fileName);}
    	
    	
        String filePath = uploadDir + fileName;
        File file = new File(filePath);

        if (!file.exists()) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.downloadFile ::: file.exists ::: " + file.exists());}
            throw new FileNotFoundException("File not found: " + fileName);
        }
        if (log.isInfoEnabled()) {log.info("UploadUtils.downloadFile ::: filePath ::: " + filePath);}
        return new FileSystemResource(file);
    }
    
    /***
     * @기능 파일 확장자 문자열 반환
     * @param filename
     * @return
     */
    private String getFileExtension(String filename) {
        String extension = "";
        int dotIndex = filename.lastIndexOf('.');
        if (dotIndex > 0) {
            extension = filename.substring(dotIndex + 1);
        }
        return extension;
    }

    /***
     * @기능 동일한 파일명 존재시 {파일명}_{현재시간}.{확장자} 반환, 없으면 원래 파일명 {파일명}.{확장자} 반환
     * @param filename
     * @return
     */
    private String getUniqueFileName(String filename) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
        String timestamp = sdf.format(new Date()); // 현재시간

        String extension = getFileExtension(filename); // 확장자
        
        String baseName = filename.substring(0, filename.length() - extension.length() - 1); // 확장자 제외한 파일명
        
        if (new File(uploadDir + filename).exists()) {
        	filename = baseName + "_" + timestamp + "." + extension; // {파일명}_{현재시간}.{확장자}
        	return filename;
        } else {
        	return filename; // 원래 파일명 {파일명}.{확장자}
		}
    }
    
}
