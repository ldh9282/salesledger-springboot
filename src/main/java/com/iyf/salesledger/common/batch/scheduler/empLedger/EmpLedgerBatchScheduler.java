package com.iyf.salesledger.common.batch.scheduler.empLedger;

import java.text.ParseException;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.batch.service.SalesEstimationBatchService;
import com.iyf.salesledger.common.batch.service.empLedger.EmpLedgerBatchService;
import com.iyf.salesledger.common.utils.DateUtils;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class EmpLedgerBatchScheduler {

	@Autowired
	private EmpLedgerBatchService empLedgerBatchService;
	
	@Scheduled(cron = "0 0 6 1 * *") // 매월 1일 6시 0분 0초
//	@Scheduled(cron = "1 * * * * *") // 개발용 테스트 ::: 매분마다
	public void monthlyUpdateMM() throws ParseException {
		Map<String, Object> requsetMap = new HashMap<>();
		requsetMap.put("batch_month", DateUtils.formatObject(new Date(), "yyyyMM"));
		empLedgerBatchService.updateMonthlyMM(requsetMap);
	}
}
