package com.iyf.salesledger.common.batch.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IYSSalesEstimationBatchScheduler {

	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "ITO");
		if (log.isInfoEnabled()) {log.info("End IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "IDC");
		if (log.isInfoEnabled()) {log.info("End IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYSAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYS", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IYSSalesEstimationBatchScheduler.monthlySalesBatchByIYSAndCONVERSION");}
	}
}
