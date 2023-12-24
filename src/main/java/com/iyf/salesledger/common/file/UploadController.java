package com.iyf.salesledger.common.file;

import java.io.IOException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import lombok.extern.log4j.Log4j2;

@Controller @Log4j2
public class UploadController {


	@Autowired
	private UploadUtils uploadUtils;
	
    /***
     * @기능 파일업로드. 업로드 경로는 application.properties 의 upload-dir
     * @param file
     * @return ResponseEntity<String>
     */
    @PostMapping("/upload")
    public ResponseEntity<String> uploadFile(@RequestParam("file") MultipartFile file) {
    	if (log.isInfoEnabled()) {log.info("Start ::: UploadController.uploadFile");}
    	if (log.isInfoEnabled()) {log.info("do ::: uploadUtils.uploadFile");}
    	HttpStatus uploadResult = uploadUtils.uploadFile(file);
        if (log.isInfoEnabled()) {log.info("uploadResult ::: " + uploadResult);}
        if (HttpStatus.OK.equals(uploadResult)) {
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
            return ResponseEntity.status(HttpStatus.OK).body("파일 업로드가 성공적으로 수행되었습니다.");
        } else if (HttpStatus.BAD_REQUEST.equals(uploadResult)) {
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("파일 업로드에 실패하였습니다. 올바른 파일은 선택해주세요.");
        } else {
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("내부 서버 오류입니다. 잠시 후 시도해주세요.");
        }
    }
    
    /**
     * @기능 파일명으로 파일다운로드. 업로드 경로는 application.properties 의 upload-dir
     * @param fileName
     * @return ResponseEntity<Resource>
     * @throws IOException
     */
    @GetMapping("/download/{fileName}")
    public ResponseEntity<Resource> downloadFile(@PathVariable String fileName) throws IOException {
        if (log.isInfoEnabled()) {log.info("Start ::: UploadController.downloadFile");}
        if (log.isInfoEnabled()) {log.info("do ::: uploadUtils.downloadFile");}
        Resource resource = uploadUtils.downloadFile(fileName);

        HttpHeaders headers = new HttpHeaders();
        headers.add(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName);
        headers.add(HttpHeaders.CONTENT_TYPE, MediaType.APPLICATION_OCTET_STREAM_VALUE);

        if (log.isInfoEnabled()) {log.info("headers ::: " + headers);}
        if (log.isInfoEnabled()) {log.info("resource ::: " + resource);}
        if (log.isInfoEnabled()) {log.info("End ::: UploadController.downloadFile");}

        return ResponseEntity.ok()
                .headers(headers)
                .body(resource);
    }
}
