package com.iyf.salesledger.common.batch;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.iyf.salesledger.common.batch.service.SalesResultBatchService;

@Configuration
@EnableScheduling
public class IYCNCSalesResultBatchConfig {

	@Autowired
	private SalesResultBatchService salesResultBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndITO() {
		LocalDateTime now = LocalDateTime.now();
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
        String yyyymm = now.format(formatter);
		System.out.println(yyyymm + ": IYCNC ITO 매출실적 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "ITO");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndIDC() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = now.format(formatter);
		System.out.println(yyyymm + ": IYCNC IDC 매출실적 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "IDC");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndCONVERSION() {
		LocalDateTime now = LocalDateTime.now();
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = now.format(formatter);
		System.out.println(yyyymm + ": IYCNC CONVERSION 매출실적 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "CONVERSION");
	}
}
