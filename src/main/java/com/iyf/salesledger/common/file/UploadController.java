package com.iyf.salesledger.common.file;

import java.io.IOException;
import java.util.Map;

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
    public ResponseEntity<Map<String, Object>> uploadFile(@RequestParam("file") MultipartFile file) {
    	if (log.isInfoEnabled()) {log.info("Start ::: UploadController.uploadFile");}
    	if (log.isInfoEnabled()) {log.info("do ::: uploadUtils.uploadFile");}
    	ResponseEntity<Map<String, Object>> uploadResult = uploadUtils.uploadFile(file, "");
    	HttpStatus statusCode = uploadResult.getStatusCode();
    	Map<String, Object> resultMap = uploadResult.getBody();
    	
		if (HttpStatus.OK.equals(statusCode)) {
        	resultMap.put("message", "파일 업로드가 성공적으로 수행되었습니다.");
        } else if (HttpStatus.BAD_REQUEST.equals(statusCode)) {
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
        	resultMap.put("message", "파일 업로드에 실패하였습니다. 올바른 파일은 선택해주세요.");
        } else {
        	statusCode = HttpStatus.INTERNAL_SERVER_ERROR;
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
        	resultMap.put("message", "내부 서버 오류입니다. 잠시 후 시도해주세요.");
        }
		
		if (log.isInfoEnabled()) {log.info("uploadResult ::: " + uploadResult);}
		if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
		return ResponseEntity.status(statusCode).body(resultMap);
    }
    /***
     * @기능 파일업로드. 업로드 경로는 application.properties 의 upload-dir
     * @param file
     * @return ResponseEntity<String>
     */
    @PostMapping("/upload/{subDir}")
    public ResponseEntity<Map<String, Object>> uploadFile(@RequestParam("file") MultipartFile file, @PathVariable String subDir) {
    	if (log.isInfoEnabled()) {log.info("Start ::: UploadController.uploadFile");}
    	if (log.isInfoEnabled()) {log.info("do ::: uploadUtils.uploadFile");}
    	ResponseEntity<Map<String, Object>> uploadResult = uploadUtils.uploadFile(file, subDir + "/");
    	HttpStatus statusCode = uploadResult.getStatusCode();
    	Map<String, Object> resultMap = uploadResult.getBody();
    	
		if (HttpStatus.OK.equals(statusCode)) {
        	resultMap.put("message", "파일 업로드가 성공적으로 수행되었습니다.");
        } else if (HttpStatus.BAD_REQUEST.equals(statusCode)) {
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
        	resultMap.put("message", "파일 업로드에 실패하였습니다. 올바른 파일은 선택해주세요.");
        } else {
        	statusCode = HttpStatus.INTERNAL_SERVER_ERROR;
        	if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
        	resultMap.put("message", "내부 서버 오류입니다. 잠시 후 시도해주세요.");
        }
		
		if (log.isInfoEnabled()) {log.info("uploadResult ::: " + uploadResult);}
		if (log.isInfoEnabled()) {log.info("End ::: UploadController.uploadFile");}
		return ResponseEntity.status(statusCode).body(resultMap);
    }
    
    /**
     * @기능 파일명으로 파일다운로드. 업로드 경로는 application.properties 의 upload-dir
     * @param fileName
     * @return ResponseEntity<Resource>
     * @throws IOException
     */
    @GetMapping("/download")
    public ResponseEntity<Resource> downloadFile(@RequestParam String fileName) throws IOException {
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
