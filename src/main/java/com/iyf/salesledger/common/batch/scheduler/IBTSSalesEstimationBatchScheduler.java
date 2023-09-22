package com.iyf.salesledger.common.batch.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IBTSSalesEstimationBatchScheduler {

	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "ITO");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "IDC");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIBTSAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IBTS", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IBTSSalesEstimationBatchScheduler.monthlySalesBatchByIBTSAndCONVERSION");}
	}
}
