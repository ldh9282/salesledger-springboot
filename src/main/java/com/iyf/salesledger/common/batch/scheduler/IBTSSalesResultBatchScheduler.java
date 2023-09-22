package com.iyf.salesledger.common.batch.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesResultBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IBTSSalesResultBatchScheduler {

	@Autowired
	private SalesResultBatchService salesResultBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "ITO");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "IDC");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesResultBatchScheduler.monthlySalesBatchByIBTSAndCONVERSION");}
	}
}
