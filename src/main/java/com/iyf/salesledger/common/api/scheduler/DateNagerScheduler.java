package com.iyf.salesledger.common.api.scheduler;

import java.text.ParseException;
import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.Date;
import java.util.List;
import java.util.Set;
import java.util.TreeSet;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.iyf.salesledger.common.api.service.DateNagerService;
import com.iyf.salesledger.common.model.CustomMap;
import com.iyf.salesledger.common.utils.DateUtils;

import lombok.extern.log4j.Log4j2;

@Component @Log4j2
public class DateNagerScheduler {

	@Autowired
	private DateNagerService dateNagerService;
	
//	@Scheduled(cron = "0 0 5 1 * *") // 매월 1일 5시 0분 0초
	@Scheduled(cron = "1 * * * * *") // 개발용 테스트 ::: 매분마다
	public void executeInsertHolidays() throws ParseException {
		dateNagerService.executeInsertHolidays();
	}
	

}
