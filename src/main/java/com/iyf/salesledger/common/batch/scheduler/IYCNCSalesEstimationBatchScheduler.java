package com.iyf.salesledger.common.batch.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IYCNCSalesEstimationBatchScheduler {

	@Autowired
	private SalesEstimationBatchService salesEstimationBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByIYCNCAndITO");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "ITO");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByIYCNCAndITO");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "IDC");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesEstimationBatchService.monthlySalesBatchByIYCNCAndITO");}
		salesEstimationBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesEstimationBatchScheduler.monthlySalesBatchByIYCNCAndCONVERSION");}
	}
}
