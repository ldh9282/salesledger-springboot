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
public class IBTSSalesEstimationBatchConfig {

	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndITO() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
        String yyyymm = nextMonth.format(formatter);
        
		System.out.println(yyyymm + ": IBTS ITO 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "ITO");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndIDC() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = nextMonth.format(formatter);
		System.out.println(yyyymm + ": IBTS IDC 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "IDC");
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndCONVERSION() {
		LocalDateTime now = LocalDateTime.now();
		LocalDateTime nextMonth = now.plusMonths(1);
		DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyyMM");
		String yyyymm = nextMonth.format(formatter);
		System.out.println(yyyymm + ": IBTS CONVERSION 매출추정 배치 작업" + " [실행시간: " + now.format(DateTimeFormatter.ofPattern("yy/MM/dd HH:mm")) + "]");
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "CONVERSION");
	}
}
