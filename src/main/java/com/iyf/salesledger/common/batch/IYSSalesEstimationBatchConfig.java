package com.iyf.salesledger.common.batch;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.annotation.EnableScheduling;
import org.springframework.scheduling.annotation.Scheduled;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;

@Configuration
@EnableScheduling
public class IYSSalesEstimationBatchConfig {

	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndITO() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
        String yyyymm = nextMonth.format(formatter);
		System.out.println(yyyymm + ": IYS ITO 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "ITO");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndIDC() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = nextMonth.format(formatter);
		System.out.println(yyyymm + ": IYS IDC 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "IDC");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndCONVERSION() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = nextMonth.format(formatter);
		System.out.println(yyyymm + ": IYS CONVERSION 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "CONVERSION");
	}
}
