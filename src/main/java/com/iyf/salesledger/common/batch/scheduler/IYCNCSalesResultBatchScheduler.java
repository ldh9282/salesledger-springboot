package com.iyf.salesledger.common.batch.scheduler;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesResultBatchService;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class IYCNCSalesResultBatchScheduler {

	@Autowired
	private SalesResultBatchService salesResultBatchService;
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndITO() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndITO");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "ITO");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndITO");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndIDC() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndIDC");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "IDC");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndIDC");}
	}
	
	@Scheduled(cron = "0 0 20 * * *")
//	@Scheduled(cron = "0 * * * * *")
	public void monthlySalesBatchByIYCNCAndCONVERSION() {
		if (log.isInfoEnabled()) {log.info("Start IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndCONVERSION");}
		if (log.isInfoEnabled()) {log.info("do service ::: salesResultBatchService.monthlySalesBatchByCompanyAndDepartment");}
		salesResultBatchService.monthlySalesBatchByCompanyAndDepartment("IYCNC", "CONVERSION");
		if (log.isInfoEnabled()) {log.info("End IYCNCSalesResultBatchScheduler.monthlySalesBatchByIYCNCAndCONVERSION");}
	}
}
