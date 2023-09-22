package com.iyf.salesledger.common.batch.scheduler;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesResultBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IYSSalesResultBatchScheduler {

	@Autowired
	private SalesResultBatchService salesResultBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "ITO");
		if (log.isInfoEnabled()) {log.info("End IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "IDC");
		if (log.isInfoEnabled()) {log.info("End IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IYSSalesResultBatchScheduler.monthlySalesBatchByIYSAndCONVERSION");}
	}
}
