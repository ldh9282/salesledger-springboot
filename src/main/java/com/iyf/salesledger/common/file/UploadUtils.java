package com.iyf.salesledger.common.file;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class UploadUtils {


	@Value("${upload-dir}")
    private String uploadDir;
    
	/***
	 * @기능 파일업로드. 업로드 경로는 application.properties 의 upload-dir
	 * @param file
	 * @return HttpStatus
	 */
    public HttpStatus uploadFile(MultipartFile file) {
    	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: uploadDir ::: " + uploadDir);}
    	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file.getOriginalFilename ::: " + file.getOriginalFilename());}
    	
        if (file.isEmpty()) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: file.isEmpty");}
            return HttpStatus.BAD_REQUEST; // File is empty, upload failed
        }

        try {
            // 디렉토리 없으면 생성
            File directory = new File(uploadDir);
            if (!directory.exists()) {
                if (directory.mkdirs()) {
                    if (log.isInfoEnabled()) {log.info("Directory created: " + directory.getAbsolutePath());}
                } else {
                    if (log.isInfoEnabled()) {log.info("Failed to create directory: " + directory.getAbsolutePath());}
                }
            }
            
            String uploadedFilePath = uploadDir + file.getOriginalFilename();
            file.transferTo(new File(uploadedFilePath));
            if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: transferTo ::: uploadedFilePath ::: " + uploadedFilePath);}
            return HttpStatus.OK; // File uploaded successfully
        } catch (IOException e) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: IOException ::: " + e);}
            e.printStackTrace();
            return HttpStatus.INTERNAL_SERVER_ERROR; // File upload failed
        } catch (Exception e) {
        	if (log.isInfoEnabled()) {log.info("UploadUtils.uploadFile ::: Exception ::: " + e);}
        	e.printStackTrace();
        	return HttpStatus.INTERNAL_SERVER_ERROR; // File upload failed
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
    
}
